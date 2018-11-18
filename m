From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 21:15:18 +0100
Subject: [Buildroot] [git commit] binutils: Get rid of obsolete patches
Message-ID: <20181202071556.466AA8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfb6d66483814703239de2149dd3daf80de1129a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some patches for Binutils seems to not be really needed.
Moreover for some of them I was not able to find any justification
for their introduction.

1. 0002-ld-makefile.patch

   This one I may track down to at least 2.15.92.0.2 here [1].
   Commit message just says: "Integrate some debian patches,
   extracted from binutils_2.15-4.diff"

   But in OpenEmbedded they got rid of it long ago on switch to 2.26, see [2].

2. 0003-check-ldrunpath-length.patch

   The same story here.

3. 0004-add-sysroot-fix-from-bug-3049.patch

   Bug mentioned in this patch was marked as "fixed" in 2012, see [3].

[1] https://git.buildroot.org/buildroot/commit/?id=ce2722a8f2abee5b60862bc896333b77a7502c82
[2] https://github.com/openembedded/openembedded-core/commit/3c7fe424f850af70989ad682dd9c5be70cd02ca5
[3]https://sourceware.org/bugzilla/show_bug.cgi?id=10340

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/2.31.1/0002-ld-makefile.patch     | 41 -----------------
 .../2.31.1/0003-check-ldrunpath-length.patch       | 36 ---------------
 .../0004-add-sysroot-fix-from-bug-3049.patch       | 51 ----------------------
 3 files changed, 128 deletions(-)

diff --git a/package/binutils/2.31.1/0002-ld-makefile.patch b/package/binutils/2.31.1/0002-ld-makefile.patch
deleted file mode 100644
index 6893d65aa0..0000000000
--- a/package/binutils/2.31.1/0002-ld-makefile.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ae435bc27e1eb59e4ad571a37a144bf99dc68f55 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:40:53 +0100
-Subject: [PATCH] ld-makefile
-
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- ld/Makefile.am | 2 +-
- ld/Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ld/Makefile.am b/ld/Makefile.am
-index d86ad0940c9..c95b0ef0252 100644
---- a/ld/Makefile.am
-+++ b/ld/Makefile.am
-@@ -57,7 +57,7 @@ endif
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
-diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 4792b2b013c..789df2d01b9 100644
---- a/ld/Makefile.in
-+++ b/ld/Makefile.in
-@@ -563,7 +563,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
--- 
-2.14.4
-
diff --git a/package/binutils/2.31.1/0003-check-ldrunpath-length.patch b/package/binutils/2.31.1/0003-check-ldrunpath-length.patch
deleted file mode 100644
index 6cdf085422..0000000000
--- a/package/binutils/2.31.1/0003-check-ldrunpath-length.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a216bfcd91363a8e8c14db320a2870fff2985d78 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:41:47 +0100
-Subject: [PATCH] check-ldrunpath-length
-
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- ld/emultempl/elf32.em | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 1ad9d6b6fa8..637a5d5d585 100644
---- a/ld/emultempl/elf32.em
-+++ b/ld/emultempl/elf32.em
-@@ -1471,6 +1471,8 @@ fragment <<EOF
- 	      && command_line.rpath == NULL)
- 	    {
- 	      path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((path) && (strlen (path) == 0))
-+	        path = NULL;
- 	      if (path
- 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
- 		break;
-@@ -1751,6 +1753,8 @@ gld${EMULATION_NAME}_before_allocation (void)
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+    rpath = NULL;
- 
-   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
-     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
--- 
-2.14.4
-
diff --git a/package/binutils/2.31.1/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.31.1/0004-add-sysroot-fix-from-bug-3049.patch
deleted file mode 100644
index 1ef1385062..0000000000
--- a/package/binutils/2.31.1/0004-add-sysroot-fix-from-bug-3049.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 73ecf6f6a1f327c9fa3af1fc924d152321aac801 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 25 Dec 2015 11:42:48 +0100
-Subject: [PATCH] add sysroot fix from bug #3049
-
-Always try to prepend the sysroot prefix to absolute filenames first.
-
-http://bugs.gentoo.org/275666
-http://sourceware.org/bugzilla/show_bug.cgi?id=10340
-
-Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
-[Romain: rebase on top of 2.26]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- ld/ldfile.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index a72ff135264..b3d166cbd60 100644
---- a/ld/ldfile.c
-+++ b/ld/ldfile.c
-@@ -338,18 +338,24 @@ ldfile_open_file_search (const char *arch,
-      directory first.  */
-   if (!entry->flags.maybe_archive)
-     {
--      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
-+     /* For absolute pathnames, try to always open the file in the
-+	 sysroot first. If this fails, try to open the file at the
-+	 given location.  */
-+     entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
-+     if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
-+     && ld_sysroot)
- 	{
- 	  char *name = concat (ld_sysroot, entry->filename,
- 			       (const char *) NULL);
- 	  if (ldfile_try_open_bfd (name, entry))
- 	    {
- 	      entry->filename = name;
-+	      entry->flags.sysrooted = TRUE;
- 	      return TRUE;
- 	    }
- 	  free (name);
- 	}
--      else if (ldfile_try_open_bfd (entry->filename, entry))
-+      if (ldfile_try_open_bfd (entry->filename, entry))
- 	return TRUE;
- 
-       if (IS_ABSOLUTE_PATH (entry->filename))
--- 
-2.14.4
-
