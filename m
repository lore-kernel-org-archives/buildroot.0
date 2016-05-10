From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 11 May 2016 00:05:04 +0300
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2016.03-rc2
Message-ID: <1462914304-24813-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change switches ARC tools to RC2 of the most recent arc-2016.03
version.

Essentially once final release is ready version will be bumped again.

ARC GNU tools of version arc-2016.03 bring some quite significant
changes like:
 * Binutils v2.26+ (upstream commit id 202ac19 with additional ARC patches)
 * GCC v4.8.5
 * GDB 7.10

More about changes, improvements and fixes could be found here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03-rc2

Also in this change we realign custom Buildroot patches for binutils and
gcc for ARC tools. Looks like earlier most of arch-independent patches
for binutils and gcc were either unintentionally removed or not even
added in patch folders for ARC's binutils and gcc. Now arch-independent
patches for binutils-2.26 and gcc-4.8.5 were added in
package/{binutils|gcc}/arc-2016.03-rc2 folders.

Build and run-tested in nSIM for both ARC700 and ARC HS38.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../binutils/arc-2015.12/0001-PR-other-56780.patch | 236 ---------------------
 .../arc-2016.03-rc2/0300-ld-makefile.patch         |  41 ++++
 .../0301-check-ldrunpath-length.patch              |  36 ++++
 .../0500-add-sysroot-fix-from-bug-3049.patch       |  52 +++++
 .../0600-poison-system-directories.patch}          | 217 ++++++++++---------
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 ...900-UPDATE-Fix-handling-complex-PIC-moves.patch | 103 ---------
 ...01-UPDATE1-Fix-handling-complex-PIC-moves.patch |  83 --------
 ...950-Don-t-allow-mcompact-casesi-for-ARCv2.patch | 100 ---------
 package/gcc/arc-2016.03-rc2/130-pr43538.patch      |  25 +++
 .../arc-2016.03-rc2/301-missing-execinfo_h.patch   |  13 ++
 .../305-libmudflap-susv3-legacy.patch              |  49 +++++
 package/gcc/arc-2016.03-rc2/842-PR60155.patch      | 111 ++++++++++
 .../850-libstdcxx-uclibc-c99.patch}                |   4 +-
 .../851-PR-other-56780.patch                       |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 ++
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 22 files changed, 472 insertions(+), 626 deletions(-)
 delete mode 100644 package/binutils/arc-2015.12/0001-PR-other-56780.patch
 create mode 100644 package/binutils/arc-2016.03-rc2/0300-ld-makefile.patch
 create mode 100644 package/binutils/arc-2016.03-rc2/0301-check-ldrunpath-length.patch
 create mode 100644 package/binutils/arc-2016.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch
 rename package/binutils/{arc-2015.12/600-poison-system-directories.patch => arc-2016.03-rc2/0600-poison-system-directories.patch} (70%)
 delete mode 100644 package/gcc/arc-2015.12/900-UPDATE-Fix-handling-complex-PIC-moves.patch
 delete mode 100644 package/gcc/arc-2015.12/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
 delete mode 100644 package/gcc/arc-2015.12/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
 create mode 100644 package/gcc/arc-2016.03-rc2/130-pr43538.patch
 create mode 100644 package/gcc/arc-2016.03-rc2/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/arc-2016.03-rc2/305-libmudflap-susv3-legacy.patch
 create mode 100644 package/gcc/arc-2016.03-rc2/842-PR60155.patch
 rename package/gcc/{arc-2015.12/100-libstdcxx-uclibc-c99.patch => arc-2016.03-rc2/850-libstdcxx-uclibc-c99.patch} (99%)
 rename package/gcc/{arc-2015.12 => arc-2016.03-rc2}/851-PR-other-56780.patch (100%)
 create mode 100644 package/gcc/arc-2016.03-rc2/930-libgcc-disable-split-stack-nothreads.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index e42918e..6c72fa3 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -35,7 +35,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2015.12"	if BR2_arc
+	default "arc-2016.03-rc2"	if BR2_arc
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/binutils/arc-2015.12/0001-PR-other-56780.patch b/package/binutils/arc-2015.12/0001-PR-other-56780.patch
deleted file mode 100644
index b418a2f..0000000
--- a/package/binutils/arc-2015.12/0001-PR-other-56780.patch
+++ /dev/null
@@ -1,236 +0,0 @@
-From 7827cdf59a1894abe18aa20043a63c8c875c3fce Mon Sep 17 00:00:00 2001
-From: DJ Delorie <dj@redhat.com>
-Date: Sat, 1 Jun 2013 01:01:44 +0000
-Subject: [PATCH] PR other/56780 merge from gcc
-
-binutils-gdb upstream a4818a052efb4cea976a03a2f7cb0b38b23d12d0
-
-libiberty: fix --enable-install-libiberty flag [PR 56780]
-
-Commit 199570 fixed the --disable-install-libiberty behavior, but it also
-added a bug where the enable path never works because the initial clear
-of target_header_dir wasn't deleted.  So we end up initializing properly
-at the top only to reset it at the end all the time.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 206367 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Romain
-  rename patch name
-  squash the two upstream commits
-  Remove the ChangeLog]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- libiberty/Makefile.in  | 24 ++++++++++-----------
- libiberty/configure    | 57 +++++++++++++++++++++++++++-----------------------
- libiberty/configure.ac | 47 ++++++++++++++++++++++-------------------
- 3 files changed, 68 insertions(+), 60 deletions(-)
-
-diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index 0a5da31..4f40c72 100644
---- a/libiberty/Makefile.in
-+++ b/libiberty/Makefile.in
-@@ -354,19 +354,19 @@ install-strip: install
- # since it will be passed the multilib flags.
- MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
- install_to_libdir: all
--	${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR)
--	$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n
--	( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n )
--	mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)
- 	if test -n "${target_header_dir}"; then \
--	  case "${target_header_dir}" in \
--	    /*)    thd=${target_header_dir};; \
--	    *)     thd=${includedir}/${target_header_dir};; \
--	  esac; \
--	  ${mkinstalldirs} $(DESTDIR)$${thd}; \
--	  for h in ${INSTALLED_HEADERS}; do \
--	    ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
--	  done; \
-+		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
-+		$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n; \
-+		( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n ); \
-+		mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB); \
-+		case "${target_header_dir}" in \
-+		  /*)    thd=${target_header_dir};; \
-+		  *)     thd=${includedir}/${target_header_dir};; \
-+		esac; \
-+		${mkinstalldirs} $(DESTDIR)$${thd}; \
-+		for h in ${INSTALLED_HEADERS}; do \
-+		  ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
-+		done; \
- 	fi
- 	@$(MULTIDO) $(FLAGS_TO_PASS) multi-do DO=install
- 
-diff --git a/libiberty/configure b/libiberty/configure
-index 6e98352..44d1f78 100755
---- a/libiberty/configure
-+++ b/libiberty/configure
-@@ -675,8 +675,8 @@ with_cross_host
- with_newlib
- enable_maintainer_mode
- enable_multilib
--enable_largefile
- enable_install_libiberty
-+enable_largefile
- '
-       ac_precious_vars='build_alias
- host_alias
-@@ -1303,8 +1303,8 @@ Optional Features:
-                           enable make rules and dependencies not useful
-                           (and sometimes confusing) to the casual installer
-   --enable-multilib       build many library versions (default)
-+  --enable-install-libiberty       Install headers and library for end users
-   --disable-largefile     omit support for large files
--  --enable-install-libiberty       Install headers for end users
- 
- Optional Packages:
-   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
-@@ -2784,6 +2784,35 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether to install libiberty headers and static library" >&5
-+$as_echo_n "checking whether to install libiberty headers and static library... " >&6; }
-+
-+# Check whether --enable-install-libiberty was given.
-+if test "${enable_install_libiberty+set}" = set; then :
-+  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
-+else
-+  enable_install_libiberty=no
-+fi
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)
-+    target_header_dir=
-+    ;;
-+  *)
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $enable_install_libiberty" >&5
-+$as_echo "$enable_install_libiberty" >&6; }
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: target_header_dir = $target_header_dir" >&5
-+$as_echo "$as_me: target_header_dir = $target_header_dir" >&6;}
-+
- 
- ac_ext=c
- ac_cpp='$CPP $CPPFLAGS'
-@@ -5475,7 +5504,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -5752,29 +5780,6 @@ _ACEOF
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  # Check whether --enable-install-libiberty was given.
--if test "${enable_install_libiberty+set}" = set; then :
--  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
--else
--  enable_install_libiberty=no
--fi
--
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)
--      target_header_dir=
--      ;;
--    *)
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
-diff --git a/libiberty/configure.ac b/libiberty/configure.ac
-index 754b66a..04260ec 100644
---- a/libiberty/configure.ac
-+++ b/libiberty/configure.ac
-@@ -128,6 +128,31 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+AC_MSG_CHECKING([whether to install libiberty headers and static library])
-+dnl install-libiberty is disabled by default
-+
-+AC_ARG_ENABLE(install-libiberty,
-+[  --enable-install-libiberty       Install headers and library for end users],
-+enable_install_libiberty=$enableval,
-+enable_install_libiberty=no)dnl
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)   
-+    target_header_dir=
-+    ;;
-+  *) 
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+AC_MSG_RESULT($enable_install_libiberty)
-+AC_MSG_NOTICE([target_header_dir = $target_header_dir])
-+
- GCC_NO_EXECUTABLES
- AC_PROG_CC
- AC_SYS_LARGEFILE
-@@ -379,7 +404,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -490,27 +514,6 @@ if test -n "${with_target_subdir}"; then
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  AC_ARG_ENABLE(install-libiberty,
--  [  --enable-install-libiberty       Install headers for end users],
--  enable_install_libiberty=$enableval,
--  enable_install_libiberty=no)dnl
--  
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)   
--      target_header_dir=
--      ;;
--    *) 
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
--- 
-1.9.3
-
diff --git a/package/binutils/arc-2016.03-rc2/0300-ld-makefile.patch b/package/binutils/arc-2016.03-rc2/0300-ld-makefile.patch
new file mode 100644
index 0000000..73cc098
--- /dev/null
+++ b/package/binutils/arc-2016.03-rc2/0300-ld-makefile.patch
@@ -0,0 +1,41 @@
+From d76a7549b43974fe8564971a3f40459bc495a8a7 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:40:53 +0100
+Subject: [PATCH] ld-makefile
+
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ ld/Makefile.am | 2 +-
+ ld/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ld/Makefile.am b/ld/Makefile.am
+index 0b3b049..3871c74 100644
+--- a/ld/Makefile.am
++++ b/ld/Makefile.am
+@@ -57,7 +57,7 @@ endif
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ 
+ EMUL = @EMUL@
+ EMULATION_OFILES = @EMULATION_OFILES@
+diff --git a/ld/Makefile.in b/ld/Makefile.in
+index ed98f87..530e4c9 100644
+--- a/ld/Makefile.in
++++ b/ld/Makefile.in
+@@ -413,7 +413,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+ # We put the scripts in the directory $(scriptdir)/ldscripts.
+ # We can't put the scripts in $(datadir) because the SEARCH_DIR
+ # directives need to be different for native and cross linkers.
+-scriptdir = $(tooldir)/lib
++scriptdir = $(libdir)
+ BASEDIR = $(srcdir)/..
+ BFDDIR = $(BASEDIR)/bfd
+ INCDIR = $(BASEDIR)/include
+-- 
+2.4.3
+
diff --git a/package/binutils/arc-2016.03-rc2/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.03-rc2/0301-check-ldrunpath-length.patch
new file mode 100644
index 0000000..3b4c204
--- /dev/null
+++ b/package/binutils/arc-2016.03-rc2/0301-check-ldrunpath-length.patch
@@ -0,0 +1,36 @@
+From ebe1cba46df52d7bf86def3d681271fd05fb453b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:41:47 +0100
+Subject: [PATCH] check-ldrunpath-length
+
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ ld/emultempl/elf32.em | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
+index 0405d4f..efd3300 100644
+--- a/ld/emultempl/elf32.em
++++ b/ld/emultempl/elf32.em
+@@ -1242,6 +1242,8 @@ fragment <<EOF
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++	      	lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1523,6 +1525,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++  	rpath = NULL;
+ 
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
+-- 
+2.4.3
+
diff --git a/package/binutils/arc-2016.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch
new file mode 100644
index 0000000..f67a43e
--- /dev/null
+++ b/package/binutils/arc-2016.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch
@@ -0,0 +1,52 @@
+From 30628870e583375f8927c04398c7219c6e9f703c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:42:48 +0100
+Subject: [PATCH] add sysroot fix from bug #3049
+
+Always try to prepend the sysroot prefix to absolute filenames first.
+
+http://bugs.gentoo.org/275666
+http://sourceware.org/bugzilla/show_bug.cgi?id=10340
+
+Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ ld/ldfile.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 96f9ecc..1439309 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -335,18 +335,25 @@ ldfile_open_file_search (const char *arch,
+      directory first.  */
+   if (! entry->flags.maybe_archive)
+     {
+-      if (entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename))
++      /* For absolute pathnames, try to always open the file in the
++	 sysroot first. If this fails, try to open the file at the
++	 given location.  */
++      entry->flags.sysrooted = is_sysrooted_pathname (entry->filename);
++      if (!entry->flags.sysrooted && IS_ABSOLUTE_PATH (entry->filename)
++	  && ld_sysroot)
+ 	{
+ 	  char *name = concat (ld_sysroot, entry->filename,
+ 			       (const char *) NULL);
+ 	  if (ldfile_try_open_bfd (name, entry))
+ 	    {
+ 	      entry->filename = name;
++	      entry->flags.sysrooted = TRUE;
+ 	      return TRUE;
+ 	    }
+ 	  free (name);
+ 	}
+-      else if (ldfile_try_open_bfd (entry->filename, entry))
++
++      if (ldfile_try_open_bfd (entry->filename, entry))
+ 	return TRUE;
+ 
+       if (IS_ABSOLUTE_PATH (entry->filename))
+-- 
+2.4.3
+
diff --git a/package/binutils/arc-2015.12/600-poison-system-directories.patch b/package/binutils/arc-2016.03-rc2/0600-poison-system-directories.patch
similarity index 70%
rename from package/binutils/arc-2015.12/600-poison-system-directories.patch
rename to package/binutils/arc-2016.03-rc2/0600-poison-system-directories.patch
index 8a3bdc6..d16994e 100644
--- a/package/binutils/arc-2015.12/600-poison-system-directories.patch
+++ b/package/binutils/arc-2016.03-rc2/0600-poison-system-directories.patch
@@ -1,7 +1,16 @@
-Patch adapted to binutils arc-4.8-R3 and extended to use
+From be366461dd49e760440fb28eaee5164eb281adcc Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 25 Dec 2015 11:45:38 +0100
+Subject: [PATCH] poison-system-directories
+
+Patch adapted to binutils 2.23.2 and extended to use
 BR_COMPILER_PARANOID_UNSAFE_PATH by Thomas Petazzoni.
 
+[Romain: rebase on top of 2.26]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Gustavo: adapt to binutils 2.25]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
 Upstream-Status: Inappropriate [distribution: codesourcery]
 
@@ -48,7 +57,7 @@ Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
     2007-03-20  Joseph Myers  <joseph@codesourcery.com>
     Based on patch by Mark Hatle <mark.hatle@windriver.com>.
     ld/
-    * configure.in (--enable-poison-system-directories): New option.
+    * configure.ac (--enable-poison-system-directories): New option.
     * configure, config.in: Regenerate.
     * ldfile.c (ldfile_add_library_path): If
     ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
@@ -56,12 +65,23 @@ Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+ ld/config.in    |  3 +++
+ ld/configure    | 14 ++++++++++++++
+ ld/configure.ac | 10 ++++++++++
+ ld/ld.h         |  8 ++++++++
+ ld/ld.texinfo   | 12 ++++++++++++
+ ld/ldfile.c     | 17 +++++++++++++++++
+ ld/ldlex.h      |  2 ++
+ ld/ldmain.c     |  2 ++
+ ld/lexsup.c     | 21 +++++++++++++++++++++
+ 9 files changed, 89 insertions(+)
 
-Index: b/ld/config.in
-===================================================================
+diff --git a/ld/config.in b/ld/config.in
+index 276fb77..35c58eb 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -11,6 +11,9 @@
+@@ -14,6 +14,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -71,20 +91,20 @@ Index: b/ld/config.in
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
-Index: b/ld/configure
-===================================================================
+diff --git a/ld/configure b/ld/configure
+index a446283..d1f9504 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -773,6 +773,7 @@
+@@ -786,6 +786,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
 +enable_poison_system_directories
  enable_gold
  enable_got
- enable_werror
-@@ -1428,6 +1429,8 @@
- 			  (and sometimes confusing) to the casual installer
+ enable_compressed_debug_sections
+@@ -1442,6 +1443,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
 +  --enable-poison-system-directories
@@ -92,7 +112,7 @@ Index: b/ld/configure
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -4338,7 +4341,18 @@
+@@ -15491,7 +15494,18 @@ else
  fi
  
  
@@ -111,11 +131,11 @@ Index: b/ld/configure
  
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
-Index: b/ld/configure.in
-===================================================================
---- a/ld/configure.in
-+++ b/ld/configure.in
-@@ -70,6 +70,16 @@
+diff --git a/ld/configure.ac b/ld/configure.ac
+index 188172d..2cd8443 100644
+--- a/ld/configure.ac
++++ b/ld/configure.ac
+@@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -132,11 +152,53 @@ Index: b/ld/configure.in
  dnl Use --enable-gold to decide if this linker should be the default.
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
-Index: b/ld/ldfile.c
-===================================================================
+diff --git a/ld/ld.h b/ld/ld.h
+index d84ec4e..3476b26 100644
+--- a/ld/ld.h
++++ b/ld/ld.h
+@@ -164,6 +164,14 @@ typedef struct {
+   /* If set, display the target memory usage (per memory region).  */
+   bfd_boolean print_memory_usage;
+ 
++  /* If TRUE (the default) warn for uses of system directories when
++     cross linking.  */
++  bfd_boolean poison_system_directories;
++
++  /* If TRUE (default FALSE) give an error for uses of system
++     directories when cross linking instead of a warning.  */
++  bfd_boolean error_poison_system_directories;
++
+   /* Big or little endian as set on command line.  */
+   enum endian_enum endian;
+ 
+diff --git a/ld/ld.texinfo b/ld/ld.texinfo
+index 1dd7492..fb1438e 100644
+--- a/ld/ld.texinfo
++++ b/ld/ld.texinfo
+@@ -2332,6 +2332,18 @@ string identifying the original linked file does not change.
+ 
+ Passing @code{none} for @var{style} disables the setting from any
+ @code{--build-id} options earlier on the command line.
++
++ at kindex --no-poison-system-directories
++ at item --no-poison-system-directories
++Do not warn for @option{-L} options using system directories such as
++ at file{/usr/lib} when cross linking.  This option is intended for use
++in chroot environments when such directories contain the correct
++libraries for the target system rather than the host.
++
++ at kindex --error-poison-system-directories
++ at item --error-poison-system-directories
++Give an error instead of a warning for @option{-L} options using
++system directories when cross linking.
+ @end table
+ 
+ @c man end
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 1439309..086b354 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -116,6 +116,23 @@
+@@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
      new_dirs->name = concat (ld_sysroot, name + 1, (const char *) NULL);
    else
      new_dirs->name = xstrdup (name);
@@ -160,81 +222,52 @@ Index: b/ld/ldfile.c
  }
  
  /* Try to open a BFD for a lang_input_statement.  */
-Index: b/ld/ld.h
-===================================================================
---- a/ld/ld.h
-+++ b/ld/ld.h
-@@ -203,6 +203,14 @@
-   /* If TRUE we'll just print the default output on stdout.  */
-   bfd_boolean print_output_format;
- 
-+  /* If TRUE (the default) warn for uses of system directories when
-+     cross linking.  */
-+  bfd_boolean poison_system_directories;
-+
-+  /* If TRUE (default FALSE) give an error for uses of system
-+     directories when cross linking instead of a warning.  */
-+  bfd_boolean error_poison_system_directories;
-+
-   /* Big or little endian as set on command line.  */
-   enum endian_enum endian;
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index 6f11e7b..0ca3110 100644
+--- a/ld/ldlex.h
++++ b/ld/ldlex.h
+@@ -144,6 +144,8 @@ enum option_values
+   OPTION_PRINT_MEMORY_USAGE,
+   OPTION_REQUIRE_DEFINED_SYMBOL,
+   OPTION_ORPHAN_HANDLING,
++  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
+ };
  
-Index: b/ld/ldmain.c
-===================================================================
+ /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index bb0b9cc..a23c56c 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -265,6 +265,8 @@
+@@ -257,6 +257,8 @@ main (int argc, char **argv)
+   command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
-   command_line.disable_target_specific_optimizations = -1;
 +  command_line.poison_system_directories = TRUE;
 +  command_line.error_poison_system_directories = FALSE;
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-Index: b/ld/ld.texinfo
-===================================================================
---- a/ld/ld.texinfo
-+++ b/ld/ld.texinfo
-@@ -2156,6 +2156,18 @@
- 
- Passing @code{none} for @var{style} disables the setting from any
- @code{--build-id} options earlier on the command line.
-+
-+ at kindex --no-poison-system-directories
-+ at item --no-poison-system-directories
-+Do not warn for @option{-L} options using system directories such as
-+ at file{/usr/lib} when cross linking.  This option is intended for use
-+in chroot environments when such directories contain the correct
-+libraries for the target system rather than the host.
-+
-+ at kindex --error-poison-system-directories
-+ at item --error-poison-system-directories
-+Give an error instead of a warning for @option{-L} options using
-+system directories when cross linking.
- @end table
- 
- @c man end
-Index: b/ld/lexsup.c
-===================================================================
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 4cad209..be7d584 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -498,6 +498,14 @@
+@@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
+   { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
+     '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
-   { {"wrap", required_argument, NULL, OPTION_WRAP},
-     '\0', N_("SYMBOL"), N_("Use wrapper functions for SYMBOL"), TWO_DASHES },
 +  { {"no-poison-system-directories", no_argument, NULL,
-+     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
++    OPTION_NO_POISON_SYSTEM_DIRECTORIES},
 +    '\0', NULL, N_("Do not warn for -L options using system directories"),
 +    TWO_DASHES },
 +  { {"error-poison-system-directories", no_argument, NULL,
-+     OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
 +    '\0', NULL, N_("Give an error for -L options using system directories"),
 +    TWO_DASHES },
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -510,6 +518,7 @@
+@@ -542,6 +550,7 @@ parse_args (unsigned argc, char **argv)
    int ingroup = 0;
    char *default_dirlist = NULL;
    char *shortopts;
@@ -242,19 +275,23 @@ Index: b/ld/lexsup.c
    struct option *longopts;
    struct option *really_longopts;
    int last_optind;
-@@ -1427,9 +1436,21 @@
-               einfo (_("%P%X: --hash-size needs a numeric argument\n"));
+@@ -1516,6 +1525,14 @@ parse_args (unsigned argc, char **argv)
            }
            break;
+ 
++	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
++	  command_line.poison_system_directories = FALSE;
++	  break;
 +
-+   case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
-+     command_line.poison_system_directories = FALSE;
-+     break;
++	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
++	  command_line.error_poison_system_directories = TRUE;
++	  break;
 +
-+   case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
-+     command_line.error_poison_system_directories = TRUE;
-+     break;
- 	}
+ 	case OPTION_PUSH_STATE:
+ 	  input_flags.pushed = xmemdup (&input_flags,
+ 					sizeof (input_flags),
+@@ -1559,6 +1576,10 @@ parse_args (unsigned argc, char **argv)
+       command_line.soname = NULL;
      }
  
 +  BR_paranoid_env = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
@@ -264,16 +301,6 @@ Index: b/ld/lexsup.c
    while (ingroup)
      {
        lang_leave_group ();
-Index: b/ld/ldlex.h
-===================================================================
---- a/ld/ldlex.h
-+++ b/ld/ldlex.h
-@@ -136,6 +136,8 @@
- #endif /* ENABLE_PLUGINS */
-   OPTION_DEFAULT_SCRIPT,
-   OPTION_PRINT_OUTPUT_FORMAT,
-+  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
- };
- 
- /* The initial parser states.  */
+-- 
+2.4.3
+
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 916b68c..15e7f19 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fb
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 sha512  e77e1b8dbbcbaf9ac2fae95c4403615808af3be03b2e1d32448cd3a7d32c43273f8bcace3f2de84ec120a982879295673029da306e2885dbf5f990584932cfc7  binutils-2.26.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none   xxx  binutils-arc-2015.12.tar.gz
+none   xxx  binutils-arc-2016.03-rc2.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ca39f0b..340846d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2015.12
+BINUTILS_VERSION = arc-2016.03-rc2
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8cf2d56..6b2d046 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -100,7 +100,7 @@ config BR2_GCC_VERSION
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
-	default "arc-2015.12" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.03-rc2" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2015.12/900-UPDATE-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12/900-UPDATE-Fix-handling-complex-PIC-moves.patch
deleted file mode 100644
index 48228dc..0000000
--- a/package/gcc/arc-2015.12/900-UPDATE-Fix-handling-complex-PIC-moves.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From b55922d45fd16f5e8fc7c3885da42b2b9b37754d Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Mon, 18 Jan 2016 16:43:18 +0100
-Subject: [PATCH] UPDATE: Fix handling complex PIC moves.
-
-fwprop is putting in the REG_EQUIV notes which are involving the
-constant pic unspecs.  Then, loop may use those notes for
-optimizations rezulting in complex patterns that are not supported by
-the current implementation. The following piece of code tries to
-convert the complex instruction in simpler ones.
-
-The fix is done in development tree: [arc-4.8-dev b55922d] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-
-gcc/
-2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
-	operations when doing PIC moves. Make this function static.
-	(arc_legitimate_pc_offset_p): Use
-	arc_raw_symbolic_reference_mentioned_p.
-	* config/arc/arc-protos.h (arc_legitimize_pic_address): Remove.
-
- gcc/config/arc/arc-protos.h |  1 -
- gcc/config/arc/arc.c        | 33 +++++++++++++++++++--------------
- 2 files changed, 19 insertions(+), 15 deletions(-)
-
- 	* config/arc/arc.c (arc_legitimize_pic_address): Handle complex
-diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
-index 464e0ab..5986e06 100644
---- a/gcc/config/arc/arc-protos.h
-+++ b/gcc/config/arc/arc-protos.h
-@@ -53,7 +53,6 @@ extern unsigned int arc_compute_frame_size ();
- extern bool arc_ccfsm_branch_deleted_p (void);
- extern void arc_ccfsm_record_branch_deleted (void);
- 
--extern rtx arc_legitimize_pic_address (rtx, rtx);
- void arc_asm_output_aligned_decl_local (FILE *, tree, const char *,
- 					unsigned HOST_WIDE_INT,
- 					unsigned HOST_WIDE_INT,
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index a89c8ee..f7cae9f 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5243,19 +5243,7 @@ arc_legitimate_pc_offset_p (rtx addr)
-   if (GET_CODE (addr) != CONST)
-     return false;
-   addr = XEXP (addr, 0);
--  if (GET_CODE (addr) == PLUS)
--    {
--      if (GET_CODE (XEXP (addr, 1)) != CONST_INT)
--	return false;
--      addr = XEXP (addr, 0);
--    }
--  return (GET_CODE (addr) == UNSPEC
--	  && XVECLEN (addr, 0) == 1
--	  && (XINT (addr, 1) == ARC_UNSPEC_GOT
--	      || XINT (addr, 1) == ARC_UNSPEC_GOTOFFPC
--	      || XINT (addr, 1) == UNSPEC_TLS_GD
--	      || XINT (addr, 1) == UNSPEC_TLS_IE)
--	  && GET_CODE (XVECEXP (addr, 0, 0)) == SYMBOL_REF);
-+  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
- }
- 
- /* Return true if ADDR is a valid pic address.
-@@ -5522,7 +5510,7 @@ arc_legitimize_tls_address (rtx addr, enum tls_model model)
-    The return value is the legitimated address.
-    If OLDX is non-zero, it is the target to assign the address to first.  */
- 
--rtx
-+static rtx
- arc_legitimize_pic_address (rtx orig, rtx oldx)
- {
-   rtx addr = orig;
-@@ -5569,6 +5557,23 @@ arc_legitimize_pic_address (rtx orig, rtx oldx)
- 	      /* Check that the unspec is one of the ones we generate?  */
- 	      return orig;
- 	    }
-+	  else if (GET_CODE (addr) == MINUS)
-+	    {
-+	      /* The same story with fwprop.  */
-+	      rtx op0 = XEXP (addr, 0);
-+	      rtx op1 = XEXP (addr, 1);
-+	      gcc_assert (oldx);
-+	      gcc_assert (GET_CODE (op1) == UNSPEC);
-+
-+	      emit_move_insn (oldx,
-+			      gen_rtx_CONST (SImode,
-+					     arc_legitimize_pic_address (op1,
-+									 NULL_RTX)));
-+	      emit_insn (gen_rtx_SET (VOIDmode, oldx,
-+				      gen_rtx_MINUS (SImode, op0, oldx)));
-+	      return oldx;
-+
-+	    }
- 	  else if (GET_CODE (addr) != PLUS)
- 	    {
- 	      /* fwprop is putting in the REG_EQUIV notes which are
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12/901-UPDATE1-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
deleted file mode 100644
index 28cb7c1..0000000
--- a/package/gcc/arc-2015.12/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From f00b0f17d6889d811468c2c77508fbea8bfc377d Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Tue, 19 Jan 2016 14:40:16 +0100
-Subject: [PATCH] UPDATE1: Fix handling complex PIC moves.
-
-The arc_legitimate_pc_offset_p condition is too lax. Updated it.
-
-The fix is done in development tree: [arc-4.8-dev f00b0f1] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-gcc/
-2016-01-18  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (arc_needs_pcl_p ): New function
-	(arc_legitimate_pc_offset_p): Use arc_needs_pcl_p.
----
- gcc/config/arc/arc.c | 42 ++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 40 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index f7cae9f..18d88a3 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5234,6 +5234,45 @@ arc_rtx_costs (rtx x, int code, int outer_code, int opno ATTRIBUTE_UNUSED,
-     }
- }
- 
-+/* Helper used by arc_legitimate_pc_offset_p.  */
-+
-+static bool
-+arc_needs_pcl_p (rtx x)
-+{
-+  register const char *fmt;
-+  register int i, j;
-+
-+  if ((GET_CODE (x) == UNSPEC)
-+      && (XVECLEN (x, 0) == 1)
-+      && (GET_CODE (XVECEXP (x, 0, 0)) == SYMBOL_REF))
-+    switch (XINT (x, 1))
-+      {
-+      case ARC_UNSPEC_GOT:
-+      case ARC_UNSPEC_GOTOFFPC:
-+      case UNSPEC_TLS_GD:
-+      case UNSPEC_TLS_IE:
-+	return true;
-+      default:
-+	break;
-+      }
-+
-+  fmt = GET_RTX_FORMAT (GET_CODE (x));
-+  for (i = GET_RTX_LENGTH (GET_CODE (x)) - 1; i >= 0; i--)
-+    {
-+      if (fmt[i] == 'e')
-+	{
-+	  if (arc_needs_pcl_p (XEXP (x, i)))
-+	    return true;
-+	}
-+      else if (fmt[i] == 'E')
-+	for (j = XVECLEN (x, i) - 1; j >= 0; j--)
-+	  if (arc_needs_pcl_p (XVECEXP (x, i, j)))
-+	    return true;
-+    }
-+
-+  return false;
-+}
-+
- /* Return true if ADDR is an address that needs to be expressed as an
-    explicit sum of pcl + offset.  */
- 
-@@ -5242,8 +5281,7 @@ arc_legitimate_pc_offset_p (rtx addr)
- {
-   if (GET_CODE (addr) != CONST)
-     return false;
--  addr = XEXP (addr, 0);
--  return flag_pic && !arc_raw_symbolic_reference_mentioned_p (addr, false);
-+  return arc_needs_pcl_p (addr);
- }
- 
- /* Return true if ADDR is a valid pic address.
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2015.12/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch b/package/gcc/arc-2015.12/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
deleted file mode 100644
index dc03a02..0000000
--- a/package/gcc/arc-2015.12/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 09463827001a7b8094f4b9460514370a1876d908 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 20 Jan 2016 16:32:40 +0100
-Subject: [PATCH] Don't allow mcompact-casesi for ARCv2
-
-The compact casesi is not working for arcv2 processors family as it
-makes use of the add_s rx,rx,pcl instruction which is only valid for
-arc6xx and arc700 processors. Also not having this instruction makes
-no much sens to change the compact-casesi pattern to use normal add
-instructions as it nullifies the advantage of short instruction use.
-The default casesi pattern betters suits the arcv2 architecture.
-
-The fix is done in development tree: [arc-4.8-dev 0946382] 
-and will be a part of the next release of ARC GNU tools.
-Once that new release happens this patch must be removed.
-
-gcc/
-2016-01-20  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* common/config/arc/arc-common.c (arc_option_optimization_table):
-	Remove mcompact-casesi option.
-	* config/arc/arc.c (arc_override_options): Use compact-casesi only
-	for arcv1.
-	* config/arc/arc.md (casesi_load): Use short instructions.
----
- gcc/common/config/arc/arc-common.c |  1 -
- gcc/config/arc/arc.c               |  9 +++++----
- gcc/config/arc/arc.md              | 10 ++++++++--
- 3 files changed, 13 insertions(+), 7 deletions(-)
- 
- 	* config/arc/arc.c (arc_legitimize_pic_address): Handle MINUS
-diff --git a/gcc/common/config/arc/arc-common.c b/gcc/common/config/arc/arc-common.c
-index e2e36fa..310bc80 100644
---- a/gcc/common/config/arc/arc-common.c
-+++ b/gcc/common/config/arc/arc-common.c
-@@ -58,7 +58,6 @@ static const struct default_options arc_option_optimization_table[] =
-     { OPT_LEVELS_ALL, OPT_mbbit_peephole, NULL, 1 },
-     { OPT_LEVELS_SIZE, OPT_mq_class, NULL, 1 },
-     { OPT_LEVELS_SIZE, OPT_mcase_vector_pcrel, NULL, 1 },
--    { OPT_LEVELS_SIZE, OPT_mcompact_casesi, NULL, 1 },
-     { OPT_LEVELS_NONE, 0, NULL, 0 }
-   };
- 
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 18d88a3..f828398 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -1151,6 +1151,11 @@ arc_override_options (void)
-   if (arc_size_opt_level == 3)
-     optimize_size = 1;
- 
-+  if (TARGET_V2)
-+    TARGET_COMPACT_CASESI = 0;
-+  else if (optimize_size == 1)
-+    TARGET_COMPACT_CASESI = 1;
-+
-   if (flag_pic)
-     target_flags |= MASK_NO_SDATA_SET;
- 
-@@ -1163,10 +1168,6 @@ arc_override_options (void)
-   if (!TARGET_Q_CLASS)
-     TARGET_COMPACT_CASESI = 0;
- 
--  /* For the time being don't support COMPACT_CASESI for ARCv2. */
--  if (TARGET_V2)
--    TARGET_COMPACT_CASESI = 0;
--
-   if (TARGET_COMPACT_CASESI)
-     TARGET_CASE_VECTOR_PC_RELATIVE = 1;
- 
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index bc4ac38..ba7c8bc 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -3837,14 +3837,20 @@
-   switch (GET_MODE (diff_vec))
-     {
-     case SImode:
--      return \"ld.as %0,[%1,%2]%&\";
-+      if ((which_alternative == 0) && TARGET_CODE_DENSITY)
-+       return \"ld_s.as %0,[%1,%2]%&\";
-+      else
-+       return \"ld.as %0,[%1,%2]%&\";
-     case HImode:
-       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
- 	return \"ldw.as %0,[%1,%2]\";
-       return \"ldw.x.as %0,[%1,%2]\";
-     case QImode:
-       if (ADDR_DIFF_VEC_FLAGS (diff_vec).offset_unsigned)
--	return \"ldb%? %0,[%1,%2]%&\";
-+        if (which_alternative == 0)
-+	 return \"ldb_s %0,[%1,%2]%&\";
-+        else
-+	 return \"ldb %0,[%1,%2]%&\";
-       return \"ldb.x %0,[%1,%2]\";
-     default:
-       gcc_unreachable ();
--- 
-2.5.0
-
diff --git a/package/gcc/arc-2016.03-rc2/130-pr43538.patch b/package/gcc/arc-2016.03-rc2/130-pr43538.patch
new file mode 100644
index 0000000..19e57bb
--- /dev/null
+++ b/package/gcc/arc-2016.03-rc2/130-pr43538.patch
@@ -0,0 +1,25 @@
+From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
+From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 25 Apr 2014 08:03:08 +0000
+Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
+
+	PR target/43538
+	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ config/mt-gnu    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/mt-gnu b/config/mt-gnu
+index 15bf417..5c696f5 100644
+--- a/config/mt-gnu
++++ b/config/mt-gnu
+@@ -1 +1 @@
+-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
++CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
+-- 
+2.1.4
+
diff --git a/package/gcc/arc-2016.03-rc2/301-missing-execinfo_h.patch b/package/gcc/arc-2016.03-rc2/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..00efda2
--- /dev/null
+++ b/package/gcc/arc-2016.03-rc2/301-missing-execinfo_h.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.8.0/boehm-gc/include/gc.h
+===================================================================
+--- gcc-4.8.0.orig/boehm-gc/include/gc.h	2007-04-23 23:10:09.000000000 +0200
++++ gcc-4.8.0/boehm-gc/include/gc.h	2013-03-23 17:39:20.000000000 +0100
+@@ -503,7 +503,7 @@
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/package/gcc/arc-2016.03-rc2/305-libmudflap-susv3-legacy.patch b/package/gcc/arc-2016.03-rc2/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..35d5f50
--- /dev/null
+++ b/package/gcc/arc-2016.03-rc2/305-libmudflap-susv3-legacy.patch
@@ -0,0 +1,49 @@
+Index: gcc-4.8.0/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4.8.0.orig/libmudflap/mf-hooks2.c	2013-02-03 18:48:05.000000000 +0100
++++ gcc-4.8.0/libmudflap/mf-hooks2.c	2013-03-23 17:39:43.000000000 +0100
+@@ -424,7 +424,7 @@
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -434,7 +434,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -444,7 +444,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -453,7 +453,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -462,7 +462,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */
diff --git a/package/gcc/arc-2016.03-rc2/842-PR60155.patch b/package/gcc/arc-2016.03-rc2/842-PR60155.patch
new file mode 100644
index 0000000..7bc2122
--- /dev/null
+++ b/package/gcc/arc-2016.03-rc2/842-PR60155.patch
@@ -0,0 +1,111 @@
+From gcc bugzilla https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60155
+Upstream status: in trunk.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- trunk/gcc/gcse.c	2014/02/12 14:50:06	207726
++++ trunk/gcc/gcse.c	2014/04/04 22:25:51	209134
+@@ -2502,6 +2502,65 @@
+       }
+ }
+ 
++struct set_data
++{
++  rtx insn;
++  const_rtx set;
++  int nsets;
++};
++
++/* Increment number of sets and record set in DATA.  */
++
++static void
++record_set_data (rtx dest, const_rtx set, void *data)
++{
++  struct set_data *s = (struct set_data *)data;
++
++  if (GET_CODE (set) == SET)
++    {
++      /* We allow insns having multiple sets, where all but one are
++	 dead as single set insns.  In the common case only a single
++	 set is present, so we want to avoid checking for REG_UNUSED
++	 notes unless necessary.  */
++      if (s->nsets == 1
++	  && find_reg_note (s->insn, REG_UNUSED, SET_DEST (s->set))
++	  && !side_effects_p (s->set))
++	s->nsets = 0;
++
++      if (!s->nsets)
++	{
++	  /* Record this set.  */
++	  s->nsets += 1;
++	  s->set = set;
++	}
++      else if (!find_reg_note (s->insn, REG_UNUSED, dest)
++	       || side_effects_p (set))
++	s->nsets += 1;
++    }
++}
++
++static const_rtx
++single_set_gcse (rtx insn)
++{
++  struct set_data s;
++  rtx pattern;
++  
++  gcc_assert (INSN_P (insn));
++
++  /* Optimize common case.  */
++  pattern = PATTERN (insn);
++  if (GET_CODE (pattern) == SET)
++    return pattern;
++
++  s.insn = insn;
++  s.nsets = 0;
++  note_stores (pattern, record_set_data, &s);
++
++  /* Considered invariant insns have exactly one set.  */
++  gcc_assert (s.nsets == 1);
++  return s.set;
++}
++
+ /* Emit move from SRC to DEST noting the equivalence with expression computed
+    in INSN.  */
+ 
+@@ -2509,7 +2568,8 @@
+ gcse_emit_move_after (rtx dest, rtx src, rtx insn)
+ {
+   rtx new_rtx;
+-  rtx set = single_set (insn), set2;
++  const_rtx set = single_set_gcse (insn);
++  rtx set2;
+   rtx note;
+   rtx eqv = NULL_RTX;
+ 
+@@ -3369,13 +3429,12 @@
+ 	      FOR_EACH_VEC_ELT (occrs_to_hoist, j, occr)
+ 		{
+ 		  rtx insn;
+-		  rtx set;
++		  const_rtx set;
+ 
+ 		  gcc_assert (!occr->deleted_p);
+ 
+ 		  insn = occr->insn;
+-		  set = single_set (insn);
+-		  gcc_assert (set);
++		  set = single_set_gcse (insn);
+ 
+ 		  /* Create a pseudo-reg to store the result of reaching
+ 		     expressions into.  Get the mode for the new pseudo
+@@ -3456,10 +3515,8 @@
+ {
+   rtx reg;
+   enum reg_class pressure_class;
+-  rtx set = single_set (insn);
++  const_rtx set = single_set_gcse (insn);
+ 
+-  /* Considered invariant insns have only one set.  */
+-  gcc_assert (set != NULL_RTX);
+   reg = SET_DEST (set);
+   if (GET_CODE (reg) == SUBREG)
+     reg = SUBREG_REG (reg);
diff --git a/package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2016.03-rc2/850-libstdcxx-uclibc-c99.patch
similarity index 99%
rename from package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2016.03-rc2/850-libstdcxx-uclibc-c99.patch
index 0d02ef0..792976f 100644
--- a/package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
+++ b/package/gcc/arc-2016.03-rc2/850-libstdcxx-uclibc-c99.patch
@@ -45,7 +45,7 @@ Index: b/libstdc++-v3/include/bits/basic_string.h
 ===================================================================
 --- a/libstdc++-v3/include/bits/basic_string.h
 +++ b/libstdc++-v3/include/bits/basic_string.h
-@@ -2811,7 +2811,7 @@
+@@ -2809,7 +2809,7 @@
  _GLIBCXX_END_NAMESPACE_VERSION
  } // namespace
  
@@ -262,7 +262,7 @@ Index: b/libstdc++-v3/include/c_global/cstdio
 ===================================================================
 --- a/libstdc++-v3/include/c_global/cstdio
 +++ b/libstdc++-v3/include/c_global/cstdio
-@@ -138,7 +138,7 @@
+@@ -139,7 +139,7 @@
    using ::vsprintf;
  } // namespace
  
diff --git a/package/gcc/arc-2015.12/851-PR-other-56780.patch b/package/gcc/arc-2016.03-rc2/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2015.12/851-PR-other-56780.patch
rename to package/gcc/arc-2016.03-rc2/851-PR-other-56780.patch
diff --git a/package/gcc/arc-2016.03-rc2/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/arc-2016.03-rc2/930-libgcc-disable-split-stack-nothreads.patch
new file mode 100644
index 0000000..7799c12
--- /dev/null
+++ b/package/gcc/arc-2016.03-rc2/930-libgcc-disable-split-stack-nothreads.patch
@@ -0,0 +1,14 @@
+disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.8.5.orig/libgcc/config/t-stack gcc-4.8.5/libgcc/config/t-stack
+--- gcc-4.8.5.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
++++ gcc-4.8.5/libgcc/config/t-stack	2016-03-07 05:28:12.000000000 +0100
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 8d2feaf..61c8993 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -11,4 +11,4 @@ sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab50
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.1.0/sha512.sum
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2015.12.tar.gz
+none  xxx  gcc-arc-2016.03-rc2.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b213901..cc1dc40 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -48,7 +48,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2015.12-gdb" if BR2_arc
+	default "arc-2016.03-rc2-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
 	default "7.9.1"    if BR2_GDB_VERSION_7_9 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index caf1ef1..ee0ec73 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,5 +3,5 @@ sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2015.12-gdb.tar.gz
+none	xxx	gdb-arc-2016.03-rc2-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.5.5
