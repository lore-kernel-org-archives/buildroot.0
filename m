From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Apr 2018 21:01:30 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] patch: add upstream
 security fix
Message-ID: <20180409190836.AE551881E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3e1d9849a72495f799b007260bbcdc61fc78da3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-1000156: arbitrary command execution in ed-style patches.

Depend on MMU for now, because the patch adds a fork() call. Upstream
later switched to gnulib provided execute(), so this dependency can be
dropped on the next version bump.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f4a4df2084b923f29eca2130976ca10a7aa6b719)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-files-to-be-missing-for-ed-style-patches.patch |  37 +++++
 ...ry-command-execution-in-ed-style-patches-.patch | 157 +++++++++++++++++++++
 package/patch/Config.in                            |   2 +
 3 files changed, 196 insertions(+)

diff --git a/package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch b/package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
new file mode 100644
index 0000000000..7d5757d1af
--- /dev/null
+++ b/package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
@@ -0,0 +1,37 @@
+From b5a91a01e5d0897facdd0f49d64b76b0f02b43e1 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 6 Apr 2018 11:34:51 +0200
+Subject: [PATCH] Allow input files to be missing for ed-style patches
+
+* src/pch.c (do_ed_script): Allow input files to be missing so that new
+files will be created as with non-ed-style patches.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit b5a91a01e5d0
+
+ src/pch.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index bc6278c4032c..0c5cc2623079 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2394,9 +2394,11 @@ do_ed_script (char const *inname, char const *outname,
+ 
+     if (! dry_run && ! skip_rest_of_patch) {
+ 	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
+-	assert (! inerrno);
+-	*outname_needs_removal = true;
+-	copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
++	if (inerrno != ENOENT)
++	  {
++	    *outname_needs_removal = true;
++	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
++	  }
+ 	sprintf (buf, "%s %s%s", editor_program,
+ 		 verbosity == VERBOSE ? "" : "- ",
+ 		 outname);
+-- 
+2.16.3
+
diff --git a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
new file mode 100644
index 0000000000..b44bdd0fac
--- /dev/null
+++ b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
@@ -0,0 +1,157 @@
+From 123eaff0d5d1aebe128295959435b9ca5909c26d Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 6 Apr 2018 12:14:49 +0200
+Subject: [PATCH] Fix arbitrary command execution in ed-style patches
+ (CVE-2018-1000156)
+
+* src/pch.c (do_ed_script): Write ed script to a temporary file instead
+of piping it to ed: this will cause ed to abort on invalid commands
+instead of rejecting them and carrying on.
+* tests/ed-style: New test case.
+* tests/Makefile.am (TESTS): Add test case.
+
+[baruch: drop test hunks to avoid autoreconf]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 123eaff0d5d1
+
+ src/pch.c         | 91 ++++++++++++++++++++++++++++++++++++++++---------------
+ tests/Makefile.am |  1 +
+ tests/ed-style    | 41 +++++++++++++++++++++++++
+ 3 files changed, 108 insertions(+), 25 deletions(-)
+ create mode 100644 tests/ed-style
+
+diff --git a/src/pch.c b/src/pch.c
+index 0c5cc2623079..4fd5a05a6f5c 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -33,6 +33,7 @@
+ # include <io.h>
+ #endif
+ #include <safe.h>
++#include <sys/wait.h>
+ 
+ #define INITHUNKMAX 125			/* initial dynamic allocation size */
+ 
+@@ -2389,24 +2390,28 @@ do_ed_script (char const *inname, char const *outname,
+     static char const editor_program[] = EDITOR_PROGRAM;
+ 
+     file_offset beginning_of_this_line;
+-    FILE *pipefp = 0;
+     size_t chars_read;
++    FILE *tmpfp = 0;
++    char const *tmpname;
++    int tmpfd;
++    pid_t pid;
++
++    if (! dry_run && ! skip_rest_of_patch)
++      {
++	/* Write ed script to a temporary file.  This causes ed to abort on
++	   invalid commands such as when line numbers or ranges exceed the
++	   number of available lines.  When ed reads from a pipe, it rejects
++	   invalid commands and treats the next line as a new command, which
++	   can lead to arbitrary command execution.  */
++
++	tmpfd = make_tempfile (&tmpname, 'e', NULL, O_RDWR | O_BINARY, 0);
++	if (tmpfd == -1)
++	  pfatal ("Can't create temporary file %s", quotearg (tmpname));
++	tmpfp = fdopen (tmpfd, "w+b");
++	if (! tmpfp)
++	  pfatal ("Can't open stream for file %s", quotearg (tmpname));
++      }
+ 
+-    if (! dry_run && ! skip_rest_of_patch) {
+-	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
+-	if (inerrno != ENOENT)
+-	  {
+-	    *outname_needs_removal = true;
+-	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
+-	  }
+-	sprintf (buf, "%s %s%s", editor_program,
+-		 verbosity == VERBOSE ? "" : "- ",
+-		 outname);
+-	fflush (stdout);
+-	pipefp = popen(buf, binary_transput ? "wb" : "w");
+-	if (!pipefp)
+-	  pfatal ("Can't open pipe to %s", quotearg (buf));
+-    }
+     for (;;) {
+ 	char ed_command_letter;
+ 	beginning_of_this_line = file_tell (pfp);
+@@ -2417,14 +2422,14 @@ do_ed_script (char const *inname, char const *outname,
+ 	}
+ 	ed_command_letter = get_ed_command_letter (buf);
+ 	if (ed_command_letter) {
+-	    if (pipefp)
+-		if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
++	    if (tmpfp)
++		if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
+ 		    write_fatal ();
+ 	    if (ed_command_letter != 'd' && ed_command_letter != 's') {
+ 	        p_pass_comments_through = true;
+ 		while ((chars_read = get_line ()) != 0) {
+-		    if (pipefp)
+-			if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
++		    if (tmpfp)
++			if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
+ 			    write_fatal ();
+ 		    if (chars_read == 2  &&  strEQ (buf, ".\n"))
+ 			break;
+@@ -2437,13 +2442,49 @@ do_ed_script (char const *inname, char const *outname,
+ 	    break;
+ 	}
+     }
+-    if (!pipefp)
++    if (!tmpfp)
+       return;
+-    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, pipefp) == 0
+-	|| fflush (pipefp) != 0)
++    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, tmpfp) == 0
++	|| fflush (tmpfp) != 0)
+       write_fatal ();
+-    if (pclose (pipefp) != 0)
+-      fatal ("%s FAILED", editor_program);
++
++    if (lseek (tmpfd, 0, SEEK_SET) == -1)
++      pfatal ("Can't rewind to the beginning of file %s", quotearg (tmpname));
++
++    if (! dry_run && ! skip_rest_of_patch) {
++	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
++	*outname_needs_removal = true;
++	if (inerrno != ENOENT)
++	  {
++	    *outname_needs_removal = true;
++	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
++	  }
++	sprintf (buf, "%s %s%s", editor_program,
++		 verbosity == VERBOSE ? "" : "- ",
++		 outname);
++	fflush (stdout);
++
++	pid = fork();
++	if (pid == -1)
++	  pfatal ("Can't fork");
++	else if (pid == 0)
++	  {
++	    dup2 (tmpfd, 0);
++	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
++	    _exit (2);
++	  }
++	else
++	  {
++	    int wstatus;
++	    if (waitpid (pid, &wstatus, 0) == -1
++	        || ! WIFEXITED (wstatus)
++		|| WEXITSTATUS (wstatus) != 0)
++	      fatal ("%s FAILED", editor_program);
++	  }
++    }
++
++    fclose (tmpfp);
++    safe_unlink (tmpname);
+ 
+     if (ofp)
+       {
+-- 
+2.16.3
+
diff --git a/package/patch/Config.in b/package/patch/Config.in
index 0c2425823a..13fa7bfc52 100644
--- a/package/patch/Config.in
+++ b/package/patch/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PATCH
 	bool "patch"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
@@ -10,4 +11,5 @@ config BR2_PACKAGE_PATCH
 
 comment "patch needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
