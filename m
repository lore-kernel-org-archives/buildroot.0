From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Mar 2020 20:47:01 +0100
Subject: [Buildroot] [PATCH 3/5] package/patch: fix CVE-2018-20969
In-Reply-To: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
References: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
Message-ID: <20200303194703.242362-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

do_ed_script in pch.c in GNU patch through 2.7.6 does not block strings
beginning with a ! character. NOTE: this is the same commit as for
CVE-2019-13638, but the ! syntax is specific to ed, and is unrelated to
a shell metacharacter.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-directly-instead-of-using-the-shell.patch | 41 +++++++++++++++++++
 package/patch/patch.mk                        |  3 ++
 2 files changed, 44 insertions(+)
 create mode 100644 package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch

diff --git a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
new file mode 100644
index 0000000000..ae64d58b93
--- /dev/null
+++ b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
@@ -0,0 +1,41 @@
+From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 6 Apr 2018 19:36:15 +0200
+Subject: Invoke ed directly instead of using the shell
+
+* src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
+command to avoid quoting vulnerabilities.
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/pch.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index 4fd5a05..16e001a 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char const *outname,
+ 	    *outname_needs_removal = true;
+ 	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
+ 	  }
+-	sprintf (buf, "%s %s%s", editor_program,
+-		 verbosity == VERBOSE ? "" : "- ",
+-		 outname);
+ 	fflush (stdout);
+ 
+ 	pid = fork();
+@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char const *outname,
+ 	else if (pid == 0)
+ 	  {
+ 	    dup2 (tmpfd, 0);
+-	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
++	    assert (outname[0] != '!' && outname[0] != '-');
++	    execlp (editor_program, editor_program, "-", outname, (char  *) NULL);
+ 	    _exit (2);
+ 	  }
+ 	else
+-- 
+cgit v1.2.1
+
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 483e2791a3..a4f593f3b5 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -16,6 +16,9 @@ PATCH_IGNORE_CVES += CVE-2018-6951
 # 0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
 PATCH_IGNORE_CVES += CVE-2018-1000156
 
+# 0004-Invoke-ed-directly-instead-of-using-the-shell.patch
+PATCH_IGNORE_CVES += CVE-2018-20969
+
 ifeq ($(BR2_PACKAGE_ATTR),y)
 PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
-- 
2.25.0
