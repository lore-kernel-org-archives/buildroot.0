From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:19:01 +0200
Subject: [Buildroot] [git commit] package/slang: bump version to 2.3.1a
Message-ID: <20170924111225.D30CF7FB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2588aa8527fabe2c6ff2c2b9690d651453d5df7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched to bz2 tarball, upstream does not provide a gz tarball anymore.

Rebased 0001-slsh-libs.patch according to
https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/slang/files/slang-2.3.1-slsh-libs.patch

Removed patches applied upstream:
0002-Enable-a-statically-linked-version-of-slsh.patch
0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch
0005-make-install-static-do-install-pkgconfig-as-install-.patch

Removed 0004-Rename-posix_close-function-to-posix_close_slfile.patch
after upstream committed a different solution, Alpine Linux did the
same when bumping to 2.3.1:
https://git.alpinelinux.org/cgit/aports/commit/main/slang?id=d4d252e4dea77c868259b0ef1f3d9cfbe6dc2152

Added sha256 hash and license file hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: Added sha256 hash and license file hash.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/slang/0001-slsh-libs.patch                 |  16 +--
 ...nable-a-statically-linked-version-of-slsh.patch | 120 ---------------------
 ...-in-the-statically-linked-version-of-slsh.patch | 114 --------------------
 ...osix_close-function-to-posix_close_slfile.patch |  47 --------
 ...l-static-do-install-pkgconfig-as-install-.patch |  31 ------
 package/slang/slang.hash                           |   8 +-
 package/slang/slang.mk                             |   3 +-
 7 files changed, 17 insertions(+), 322 deletions(-)

diff --git a/package/slang/0001-slsh-libs.patch b/package/slang/0001-slsh-libs.patch
index e8b6e6d..211cb4a 100644
--- a/package/slang/0001-slsh-libs.patch
+++ b/package/slang/0001-slsh-libs.patch
@@ -3,15 +3,17 @@ Patch taken from gentoo portage, upstream status unknown, author
 probably Diego Petten??.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased against 2.3.1a]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 --- a/slsh/Makefile.in
 +++ b/slsh/Makefile.in
-@@ -80,7 +80,7 @@
+@@ -92,7 +92,7 @@
  $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
- 	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(SRC_LIBS)
+    $(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
  $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
--	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(INST_LIBS)
-+	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(SRC_LIBS)
- $(OBJDIR)/slsh.o: $(OBJDIR) slsh.c slsh.h config.h Makefile
- 	cd $(OBJDIR) && $(CC) -c $(CFLAGS) $(SLANG_SRCINC) $(DEFS) $(SRCDIR)/slsh.c
- $(OBJDIR)/readline.o: $(OBJDIR) readline.c slsh.h config.h Makefile
+-	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)
++	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
+ $(OBJDIR)/slsh.o: $(OBJDIR_TSTAMP) slsh.c slsh.h config.h Makefile
+    cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
+ $(OBJDIR)/readline.o: $(OBJDIR_TSTAMP) readline.c slsh.h config.h Makefile
diff --git a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
deleted file mode 100644
index ee306a1..0000000
--- a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-Enable a statically-linked version of slsh to be built and installed
-
-Adapt an upstream patch to make it apply on 2.3.0. Unnecessary changes
-have been ignored.
-
-Repository: git://git.jedsoft.org/git/slang.git
-Commit ID: 3796db6fb94a2fc7fe2fb0b6918501b69a4d3a02
-Author: John E. Davis <jed@jedsoft.org>
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
-diff -rup a/autoconf/Makefile.in b/autoconf/Makefile.in
---- a/autoconf/Makefile.in	2014-09-18 04:02:24.000000000 +0100
-+++ b/autoconf/Makefile.in	2014-12-08 11:59:30.879313080 +0000
-@@ -41,16 +41,19 @@ src/Makefile: configure src/Makefile.in 
- #
- makefiles: Makefile slsh/Makefile modules/Makefile src/Makefile
- help:
--	@echo "make install : install a shared version of the library"
--	@echo "make install-static : install a static version"
--	@echo "make install-all : install both shared and static versions"
--	@echo "make check : Build the library and run the regression tests"
-+	@echo "make install ==> shared version of the library, slsh and modules"
-+	@echo "make install-static ==> static version of the library and slsh; no modules"
-+	@echo "make install-all ==> shared/static versions of the library/modules + shared slsh."
-+	@echo "make install-modules ==> install the modules"
-+	@echo "make check ==> Build the library and run the regression tests"
- slang.pc: configure autoconf/slangpc.in
- 	@echo "slang.pc needs to be updated -- rerun configure"
- 	@exit 1
- static: makefiles slang.pc
- 	cd src; $(MAKE) static
--	cd slsh; $(MAKE) all
-+	cd slsh; $(MAKE) static
-+modules:
-+	cd modules; $(MAKE) all
- elf: makefiles slang.pc
- 	cd src; $(MAKE) elf
- 	cd slsh; $(MAKE) all
-@@ -73,10 +76,11 @@ clean:
- 	cd demo; $(MAKE) clean
- install-static:
- 	cd src; $(MAKE) install-static
-+	cd slsh; $(MAKE) install-static
- install-pkgconfig: slang.pc
- 	$(MKINSDIR) $(DEST_PKGCONFIGDIR)
- 	$(INSTALL_DATA) slang.pc $(DEST_PKGCONFIGDIR)/
--install-elf:
-+install-elf: install-pkgconfig
- 	cd src; $(MAKE) install-elf
- 	@echo Now installing slsh
- 	cd slsh; $(MAKE) install
-@@ -86,7 +90,10 @@ install-elf:
- 	@echo "On some systems, e.g., linux, you may also have to run ldconfig."
- 	@echo ""
- install: install-elf install-pkgconfig
--install-all: install-elf install-static install-pkgconfig
-+install-all: install-elf
-+	cd src; $(MAKE) install-static
-+install-modules:
-+	cd modules; $(MAKE) install
- install-links:
- 	cd src; $(MAKE) install-links
- #
-diff -rup a/slsh/Makefile.in b/slsh/Makefile.in
---- a/slsh/Makefile.in	2014-12-08 11:52:51.303284637 +0000
-+++ b/slsh/Makefile.in	2014-12-08 12:06:44.811939732 +0000
-@@ -16,7 +16,8 @@ SLANG_INST_INC	= -I at includedir@
- SLANG_INST_LIB	= -L$(INST_LIB_DIR)
- #---------------------------------------------------------------------------
- SLANG_SRCINC	= -I at SRCDIR@
--SLANG_SRCLIB	= -L at ELFDIR@
-+SLANG_ELFLIB	= -L at ELFDIR@#  for dynamically linked
-+SLANG_OBJLIB	= -L at OBJDIR@#  for statically linked
- #---------------------------------------------------------------------------
- OTHER_LIBS	= @TERMCAP@ @DYNAMIC_LINK_LIB@ @LIBS@ @M_LIB@
- RPATH		= @RPATH@
-@@ -73,10 +74,12 @@ INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(S
- DEFS = -DSLSH_CONF_DIR='"$(SLSH_CONF_DIR)"' -DSLSH_PATH='"$(SLSH_LIB_DIR)"' \
-  -DSLSH_CONF_DIR_ENV='$(SLSH_CONF_DIR_ENV)' -DSLSH_LIB_DIR_ENV='$(SLSH_LIB_DIR_ENV)' \
-  -DSLSH_PATH_ENV='$(SLSH_PATH_ENV)'
--SRC_LIBS = $(SLANG_SRCLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
-+SRC_LIBS = $(SLANG_ELFLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
-+STATIC_SRC_LIBS = $(SLANG_OBJLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
- #
- all: $(OBJDIR)/slsh_exe
- slsh: $(OBJDIR)/slsh
-+static: $(OBJDIR)/slsh_static
- $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
- 	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(SRC_LIBS)
- $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
-@@ -85,6 +88,8 @@ $(OBJDIR)/slsh.o: $(OBJDIR) slsh.c slsh.
- 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
- $(OBJDIR)/readline.o: $(OBJDIR) readline.c slsh.h config.h Makefile
- 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) -DUSE_GNU_READLINE=$(GNU_READLINE) $(SRCDIR)/readline.c
-+$(OBJDIR)/slsh_static: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
-+	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_static $(LDFLAGS) $(STATIC_SRC_LIBS)
- $(OBJDIR):
- 	-$(MKINSDIR) $(OBJDIR)
- config.h: ../src/config.h
-@@ -151,6 +156,12 @@ install: slsh install_directories instal
- 	$(INSTALL_DATA) etc/slsh.rc $(DEST_SLSH_CONF_DIR)/
- 	echo 'prepend_to_slang_load_path("$(SLSH_LOCALLIB_DIR)");' >> $(DEST_SLSH_CONF_DIR)/slsh.rc
- 	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
-+install-static: static install_directories install_lib_files install_rline_files \
-+ install_scripts install_help install_docs
-+	$(INSTALL) $(OBJDIR)/slsh_static $(DEST_BIN_DIR)/slsh
-+	$(INSTALL_DATA) etc/slsh.rc $(DEST_SLSH_CONF_DIR)/
-+	echo 'prepend_to_slang_load_path("$(SLSH_LOCALLIB_DIR)");' >> $(DEST_SLSH_CONF_DIR)/slsh.rc
-+	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
- #---------------------------------------------------------------------------
- # Housekeeping
- #---------------------------------------------------------------------------
-@@ -161,5 +172,5 @@ distclean: clean
- #
- .PHONY: all clean distclean symlinks slsh install install_directories \
-   install_lib_files install_rline_files install_scripts install_help \
--  install_docs
-+  install_docs install-static static
- 
diff --git a/package/slang/0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch b/package/slang/0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch
deleted file mode 100644
index 4bc8f76..0000000
--- a/package/slang/0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-Disable module support in the statically linked version of slsh
-
-Adapt an upstream patch to make it apply on 2.3.0. Unnecessary changes
-have been ignored.
-
-Repository: git://git.jedsoft.org/git/slang.git
-Commit ID: 997c85f5cdb19802a5c97afe44e366a60f94a069
-Author: John E. Davis <jed@jedsoft.org>
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
-diff -rup a/slsh/Makefile.in b/slsh/Makefile.in
---- a/slsh/Makefile.in	2014-12-09 10:04:44.084899944 +0000
-+++ b/slsh/Makefile.in	2014-12-09 10:16:11.545897275 +0000
-@@ -1,9 +1,11 @@
- #-*-sh-*-
- CC		= @CC@
- CFLAGS		= @CFLAGS@ @SLANG_DLL_CFLAGS@
--LDFLAGS		= @LDFLAGS@ @DYNAMIC_LINK_FLAGS@
-+LDFLAGS		= @LDFLAGS@
-+DLINK_FLAGS	= @DYNAMIC_LINK_FLAGS@
- CONFIG_DIR	= @CONFIG_DIR@
- OBJDIR		= $(ARCH)objs
-+SOBJDIR		= static_objs
- SRCDIR		= $(CONFIG_DIR)/slsh
- #---------------------------------------------------------------------------
- # Installation location of the slang library
-@@ -19,7 +21,8 @@ SLANG_SRCINC	= -I at SRCDIR@
- SLANG_ELFLIB	= -L at ELFDIR@#  for dynamically linked
- SLANG_OBJLIB	= -L at OBJDIR@#  for statically linked
- #---------------------------------------------------------------------------
--OTHER_LIBS	= @TERMCAP@ @DYNAMIC_LINK_LIB@ @LIBS@ @M_LIB@
-+DYNAMIC_LIBS	= @TERMCAP@ @DYNAMIC_LINK_LIB@ @LIBS@ @M_LIB@
-+STATIC_LIBS	= @TERMCAP@ @LIBS@ @M_LIB@
- RPATH		= @RPATH@
- #----------------------------------------------------------------------------
- INSTALL		= @INSTALL@
-@@ -69,29 +72,37 @@ DEST_SLSH_DOC_DIR= $(DESTDIR)$(SLSH_DOC_
- #----------------------------------------------------------------------------
- @SET_MAKE@
- SHELL = /bin/sh
--#INST_LIBS = $(RPATH) $(SLANG_INST_LIB) $(DEST_LIB_DIR) -lslang $(READLINE_LIB) $(OTHER_LIBS)
--INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(SLANG_INST_LIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
-+INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(SLANG_INST_LIB) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
- DEFS = -DSLSH_CONF_DIR='"$(SLSH_CONF_DIR)"' -DSLSH_PATH='"$(SLSH_LIB_DIR)"' \
-  -DSLSH_CONF_DIR_ENV='$(SLSH_CONF_DIR_ENV)' -DSLSH_LIB_DIR_ENV='$(SLSH_LIB_DIR_ENV)' \
-  -DSLSH_PATH_ENV='$(SLSH_PATH_ENV)'
--SRC_LIBS = $(SLANG_ELFLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
--STATIC_SRC_LIBS = $(SLANG_OBJLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
-+SDEFS = $(DEFS) -DSLSH_STATIC
-+SRC_LIBS = $(SLANG_ELFLIB) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
-+STATIC_SRC_LIBS = $(SLANG_OBJLIB) -lslang $(READLINE_LIB) $(STATIC_LIBS)
- #
- all: $(OBJDIR)/slsh_exe
- slsh: $(OBJDIR)/slsh
--static: $(OBJDIR)/slsh_static
- $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
--	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(SRC_LIBS)
-+	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
- $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
--	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(SRC_LIBS)
-+	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
- $(OBJDIR)/slsh.o: $(OBJDIR) slsh.c slsh.h config.h Makefile
- 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
- $(OBJDIR)/readline.o: $(OBJDIR) readline.c slsh.h config.h Makefile
- 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) -DUSE_GNU_READLINE=$(GNU_READLINE) $(SRCDIR)/readline.c
--$(OBJDIR)/slsh_static: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
--	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_static $(LDFLAGS) $(STATIC_SRC_LIBS)
- $(OBJDIR):
- 	-$(MKINSDIR) $(OBJDIR)
-+#
-+static: $(SOBJDIR)/slsh
-+$(SOBJDIR)/slsh: $(SOBJDIR)/slsh.o $(SOBJDIR)/readline.o
-+	$(CC) $(CFLAGS) $(SOBJDIR)/slsh.o $(SOBJDIR)/readline.o -o $(SOBJDIR)/slsh $(LDFLAGS) $(STATIC_SRC_LIBS)
-+$(SOBJDIR)/slsh.o: $(SOBJDIR) slsh.c slsh.h config.h Makefile
-+	cd $(SOBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(SDEFS) $(SRCDIR)/slsh.c
-+$(SOBJDIR)/readline.o: $(SOBJDIR) readline.c slsh.h config.h Makefile
-+	cd $(SOBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(SDEFS) -DUSE_GNU_READLINE=$(GNU_READLINE) $(SRCDIR)/readline.c
-+$(SOBJDIR):
-+	-$(MKINSDIR) $(SOBJDIR)
-+#
- config.h: ../src/config.h
- 	cp ../src/config.h .
- install_directories:
-@@ -158,7 +169,7 @@ install: slsh install_directories instal
- 	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
- install-static: static install_directories install_lib_files install_rline_files \
-  install_scripts install_help install_docs
--	$(INSTALL) $(OBJDIR)/slsh_static $(DEST_BIN_DIR)/slsh
-+	$(INSTALL) $(SOBJDIR)/slsh $(DEST_BIN_DIR)/
- 	$(INSTALL_DATA) etc/slsh.rc $(DEST_SLSH_CONF_DIR)/
- 	echo 'prepend_to_slang_load_path("$(SLSH_LOCALLIB_DIR)");' >> $(DEST_SLSH_CONF_DIR)/slsh.rc
- 	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
-@@ -167,6 +178,7 @@ install-static: static install_directori
- #---------------------------------------------------------------------------
- clean:
- 	-/bin/rm -f *~ $(OBJDIR)/slsh.o $(OBJDIR)/readline.o $(OBJDIR)/slsh $(OBJDIR)/slsh_exe scripts/*~ lib/*~
-+	-/bin/rm -f $(SOBJDIR)/slsh.o $(SOBJDIR)/readline.o $(SOBJDIR)/slsh $(SOBJDIR)/slsh_exe
- distclean: clean
- 	-/bin/rm -f Makefile config.h
- #
-diff -rup a/slsh/slsh.c b/slsh/slsh.c
---- a/slsh/slsh.c	2014-09-18 04:02:24.000000000 +0100
-+++ b/slsh/slsh.c	2014-12-09 10:17:04.602824146 +0000
-@@ -514,7 +514,9 @@ int main (int argc, char **argv)
- 
-    if ((-1 == SLang_init_all ())
-        || (-1 == SLang_init_array_extra ())
-+#ifndef SLSH_STATIC
-        || (-1 == SLang_init_import ()) /* dynamic linking */
-+#endif
-        || (-1 == SLadd_intrin_fun_table (Intrinsics, NULL))
-        || (-1 == slsh_init_readline_intrinsics ()))
-      {
diff --git a/package/slang/0004-Rename-posix_close-function-to-posix_close_slfile.patch b/package/slang/0004-Rename-posix_close-function-to-posix_close_slfile.patch
deleted file mode 100644
index 4b3c869..0000000
--- a/package/slang/0004-Rename-posix_close-function-to-posix_close_slfile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 055b02cf98ab9b7301988c3be2d277f262f0957e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 18 Nov 2015 23:12:15 +0100
-Subject: [PATCH] Rename posix_close() function to posix_close_slfile()
-
-posix_close() is a function that will be implemented as part of an
-upcoming of the POSIX standard. For this reason, the musl C library
-has already started implementing this function call. Unfortunately,
-since slang already defines a function with the same name, it cannot
-build properly with the musl C library.
-
-This commit fixes that by renaming the slang function to
-posix_close_slfile().
-
-This patch has been taken from the Alpine Linux repository, at
-http://git.alpinelinux.org/cgit/aports/plain/main/slang/musl-fix-posix_close-clash.patch.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/slposio.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/slposio.c b/src/slposio.c
-index 94f20dd..475e2c9 100644
---- a/src/slposio.c
-+++ b/src/slposio.c
-@@ -372,7 +372,7 @@ static int posix_close_fd (int *fd)
-    return 0;
- }
- 
--static int posix_close (SLFile_FD_Type *f)
-+static int posix_close_slfile (SLFile_FD_Type *f)
- {
-    int status = do_close (f);
- 
-@@ -1011,7 +1011,7 @@ static SLang_Intrin_Fun_Type Fd_Name_Table [] =
-    MAKE_INTRINSIC_2("write", posix_write, V, F, B),
-    MAKE_INTRINSIC_1("dup_fd", posix_dup, V, F),
-    MAKE_INTRINSIC_2("dup2_fd", posix_dup2, I, F, I),
--   MAKE_INTRINSIC_1("close", posix_close, I, F),
-+   MAKE_INTRINSIC_1("close", posix_close_slfile, I, F),
-    MAKE_INTRINSIC_1("_close", posix_close_fd, I, I),
- #if defined(TTYNAME_R)
-    MAKE_INTRINSIC_0("ttyname", posix_ttyname, V),
--- 
-2.6.3
-
diff --git a/package/slang/0005-make-install-static-do-install-pkgconfig-as-install-.patch b/package/slang/0005-make-install-static-do-install-pkgconfig-as-install-.patch
deleted file mode 100644
index 1572e09..0000000
--- a/package/slang/0005-make-install-static-do-install-pkgconfig-as-install-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 294bcde1afa0b3866f339f82709e867d827cea6c Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Mon, 14 Mar 2016 07:28:56 +0300
-Subject: [PATCH] make install-static do install-pkgconfig as install-elf does
-
-...so that install-static installs everything needed for linking with
-slang. This fixes e.g. the following mc build:
-
-  http://autobuild.buildroot.net/results/085/085194f18bc7db1e801d98e6620e3a75fd988cc5/build-end.log
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- autoconf/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/autoconf/Makefile.in b/autoconf/Makefile.in
-index a6defa6..ca1ffb2 100644
---- a/autoconf/Makefile.in
-+++ b/autoconf/Makefile.in
-@@ -74,7 +74,7 @@ clean:
- 	cd modules; $(MAKE) clean
- 	cd slsh; $(MAKE) clean
- 	cd demo; $(MAKE) clean
--install-static:
-+install-static: install-pkgconfig
- 	cd src; $(MAKE) install-static
- 	cd slsh; $(MAKE) install-static
- install-pkgconfig: slang.pc
--- 
-2.1.4
-
diff --git a/package/slang/slang.hash b/package/slang/slang.hash
index 000ac11..bd806e8 100644
--- a/package/slang/slang.hash
+++ b/package/slang/slang.hash
@@ -1,2 +1,6 @@
-# From http://www.jedsoft.org/releases/slang/
-sha1	c3270b58a58e6cbfd47f0a6e3d2194dd9e7c7d14	slang-2.3.0.tar.gz
+# sha1 from http://www.jedsoft.org/releases/slang/, sha256 locally computed
+sha1 a8ea7f1b5736160a94efb67b137a0f5b9916bdf2  slang-2.3.1a.tar.bz2
+sha256 54f0c3007fde918039c058965dffdfd6c5aec0bad0f4227192cc486021f08c36  slang-2.3.1a.tar.bz2
+
+# License file, locally computed
+sha256 ff05a90962e7773f8bdc47b2a9585130526039102759b524c1dffbd57cfe469b  COPYING
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 7feaeb4..d0c0e76 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SLANG_VERSION = 2.3.0
+SLANG_VERSION = 2.3.1a
+SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
 SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPL-2.0+
 SLANG_LICENSE_FILES = COPYING
