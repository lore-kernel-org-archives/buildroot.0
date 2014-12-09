From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:19:49 +0100
Subject: [Buildroot] [git commit] slang: add adapted upstream patches for
	static builds
Message-ID: <20141209193410.1399A7FD31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41d6f177d226b9014f5a14d0d05ca843f482d94f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are adapted upstream patches to make them apply on the version we
are using in Buildroot, and also taking into account that we already
have another patch which modifies the same file, so these patches would
not apply as they are. Unnecessary parts of the upstream patches have
been ingnored, such as changelogs or version changes.
The purpose of these patches are allowing the static library and a
static version of slsh be built without building any dynamic bit.
These patches will be included in the next release, so we can remove
them when we do the next version bump.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nable-a-statically-linked-version-of-slsh.patch |  120 ++++++++++++++++++++
 ...-in-the-statically-linked-version-of-slsh.patch |  114 +++++++++++++++++++
 2 files changed, 234 insertions(+), 0 deletions(-)

diff --git a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
new file mode 100644
index 0000000..ee306a1
--- /dev/null
+++ b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
@@ -0,0 +1,120 @@
+Enable a statically-linked version of slsh to be built and installed
+
+Adapt an upstream patch to make it apply on 2.3.0. Unnecessary changes
+have been ignored.
+
+Repository: git://git.jedsoft.org/git/slang.git
+Commit ID: 3796db6fb94a2fc7fe2fb0b6918501b69a4d3a02
+Author: John E. Davis <jed@jedsoft.org>
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+diff -rup a/autoconf/Makefile.in b/autoconf/Makefile.in
+--- a/autoconf/Makefile.in	2014-09-18 04:02:24.000000000 +0100
++++ b/autoconf/Makefile.in	2014-12-08 11:59:30.879313080 +0000
+@@ -41,16 +41,19 @@ src/Makefile: configure src/Makefile.in 
+ #
+ makefiles: Makefile slsh/Makefile modules/Makefile src/Makefile
+ help:
+-	@echo "make install : install a shared version of the library"
+-	@echo "make install-static : install a static version"
+-	@echo "make install-all : install both shared and static versions"
+-	@echo "make check : Build the library and run the regression tests"
++	@echo "make install ==> shared version of the library, slsh and modules"
++	@echo "make install-static ==> static version of the library and slsh; no modules"
++	@echo "make install-all ==> shared/static versions of the library/modules + shared slsh."
++	@echo "make install-modules ==> install the modules"
++	@echo "make check ==> Build the library and run the regression tests"
+ slang.pc: configure autoconf/slangpc.in
+ 	@echo "slang.pc needs to be updated -- rerun configure"
+ 	@exit 1
+ static: makefiles slang.pc
+ 	cd src; $(MAKE) static
+-	cd slsh; $(MAKE) all
++	cd slsh; $(MAKE) static
++modules:
++	cd modules; $(MAKE) all
+ elf: makefiles slang.pc
+ 	cd src; $(MAKE) elf
+ 	cd slsh; $(MAKE) all
+@@ -73,10 +76,11 @@ clean:
+ 	cd demo; $(MAKE) clean
+ install-static:
+ 	cd src; $(MAKE) install-static
++	cd slsh; $(MAKE) install-static
+ install-pkgconfig: slang.pc
+ 	$(MKINSDIR) $(DEST_PKGCONFIGDIR)
+ 	$(INSTALL_DATA) slang.pc $(DEST_PKGCONFIGDIR)/
+-install-elf:
++install-elf: install-pkgconfig
+ 	cd src; $(MAKE) install-elf
+ 	@echo Now installing slsh
+ 	cd slsh; $(MAKE) install
+@@ -86,7 +90,10 @@ install-elf:
+ 	@echo "On some systems, e.g., linux, you may also have to run ldconfig."
+ 	@echo ""
+ install: install-elf install-pkgconfig
+-install-all: install-elf install-static install-pkgconfig
++install-all: install-elf
++	cd src; $(MAKE) install-static
++install-modules:
++	cd modules; $(MAKE) install
+ install-links:
+ 	cd src; $(MAKE) install-links
+ #
+diff -rup a/slsh/Makefile.in b/slsh/Makefile.in
+--- a/slsh/Makefile.in	2014-12-08 11:52:51.303284637 +0000
++++ b/slsh/Makefile.in	2014-12-08 12:06:44.811939732 +0000
+@@ -16,7 +16,8 @@ SLANG_INST_INC	= -I at includedir@
+ SLANG_INST_LIB	= -L$(INST_LIB_DIR)
+ #---------------------------------------------------------------------------
+ SLANG_SRCINC	= -I at SRCDIR@
+-SLANG_SRCLIB	= -L at ELFDIR@
++SLANG_ELFLIB	= -L at ELFDIR@#  for dynamically linked
++SLANG_OBJLIB	= -L at OBJDIR@#  for statically linked
+ #---------------------------------------------------------------------------
+ OTHER_LIBS	= @TERMCAP@ @DYNAMIC_LINK_LIB@ @LIBS@ @M_LIB@
+ RPATH		= @RPATH@
+@@ -73,10 +74,12 @@ INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(S
+ DEFS = -DSLSH_CONF_DIR='"$(SLSH_CONF_DIR)"' -DSLSH_PATH='"$(SLSH_LIB_DIR)"' \
+  -DSLSH_CONF_DIR_ENV='$(SLSH_CONF_DIR_ENV)' -DSLSH_LIB_DIR_ENV='$(SLSH_LIB_DIR_ENV)' \
+  -DSLSH_PATH_ENV='$(SLSH_PATH_ENV)'
+-SRC_LIBS = $(SLANG_SRCLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
++SRC_LIBS = $(SLANG_ELFLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
++STATIC_SRC_LIBS = $(SLANG_OBJLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
+ #
+ all: $(OBJDIR)/slsh_exe
+ slsh: $(OBJDIR)/slsh
++static: $(OBJDIR)/slsh_static
+ $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
+ 	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(SRC_LIBS)
+ $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
+@@ -85,6 +88,8 @@ $(OBJDIR)/slsh.o: $(OBJDIR) slsh.c slsh.
+ 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
+ $(OBJDIR)/readline.o: $(OBJDIR) readline.c slsh.h config.h Makefile
+ 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) -DUSE_GNU_READLINE=$(GNU_READLINE) $(SRCDIR)/readline.c
++$(OBJDIR)/slsh_static: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
++	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_static $(LDFLAGS) $(STATIC_SRC_LIBS)
+ $(OBJDIR):
+ 	-$(MKINSDIR) $(OBJDIR)
+ config.h: ../src/config.h
+@@ -151,6 +156,12 @@ install: slsh install_directories instal
+ 	$(INSTALL_DATA) etc/slsh.rc $(DEST_SLSH_CONF_DIR)/
+ 	echo 'prepend_to_slang_load_path("$(SLSH_LOCALLIB_DIR)");' >> $(DEST_SLSH_CONF_DIR)/slsh.rc
+ 	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
++install-static: static install_directories install_lib_files install_rline_files \
++ install_scripts install_help install_docs
++	$(INSTALL) $(OBJDIR)/slsh_static $(DEST_BIN_DIR)/slsh
++	$(INSTALL_DATA) etc/slsh.rc $(DEST_SLSH_CONF_DIR)/
++	echo 'prepend_to_slang_load_path("$(SLSH_LOCALLIB_DIR)");' >> $(DEST_SLSH_CONF_DIR)/slsh.rc
++	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
+ #---------------------------------------------------------------------------
+ # Housekeeping
+ #---------------------------------------------------------------------------
+@@ -161,5 +172,5 @@ distclean: clean
+ #
+ .PHONY: all clean distclean symlinks slsh install install_directories \
+   install_lib_files install_rline_files install_scripts install_help \
+-  install_docs
++  install_docs install-static static
+ 
diff --git a/package/slang/0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch b/package/slang/0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch
new file mode 100644
index 0000000..4bc8f76
--- /dev/null
+++ b/package/slang/0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch
@@ -0,0 +1,114 @@
+Disable module support in the statically linked version of slsh
+
+Adapt an upstream patch to make it apply on 2.3.0. Unnecessary changes
+have been ignored.
+
+Repository: git://git.jedsoft.org/git/slang.git
+Commit ID: 997c85f5cdb19802a5c97afe44e366a60f94a069
+Author: John E. Davis <jed@jedsoft.org>
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+diff -rup a/slsh/Makefile.in b/slsh/Makefile.in
+--- a/slsh/Makefile.in	2014-12-09 10:04:44.084899944 +0000
++++ b/slsh/Makefile.in	2014-12-09 10:16:11.545897275 +0000
+@@ -1,9 +1,11 @@
+ #-*-sh-*-
+ CC		= @CC@
+ CFLAGS		= @CFLAGS@ @SLANG_DLL_CFLAGS@
+-LDFLAGS		= @LDFLAGS@ @DYNAMIC_LINK_FLAGS@
++LDFLAGS		= @LDFLAGS@
++DLINK_FLAGS	= @DYNAMIC_LINK_FLAGS@
+ CONFIG_DIR	= @CONFIG_DIR@
+ OBJDIR		= $(ARCH)objs
++SOBJDIR		= static_objs
+ SRCDIR		= $(CONFIG_DIR)/slsh
+ #---------------------------------------------------------------------------
+ # Installation location of the slang library
+@@ -19,7 +21,8 @@ SLANG_SRCINC	= -I at SRCDIR@
+ SLANG_ELFLIB	= -L at ELFDIR@#  for dynamically linked
+ SLANG_OBJLIB	= -L at OBJDIR@#  for statically linked
+ #---------------------------------------------------------------------------
+-OTHER_LIBS	= @TERMCAP@ @DYNAMIC_LINK_LIB@ @LIBS@ @M_LIB@
++DYNAMIC_LIBS	= @TERMCAP@ @DYNAMIC_LINK_LIB@ @LIBS@ @M_LIB@
++STATIC_LIBS	= @TERMCAP@ @LIBS@ @M_LIB@
+ RPATH		= @RPATH@
+ #----------------------------------------------------------------------------
+ INSTALL		= @INSTALL@
+@@ -69,29 +72,37 @@ DEST_SLSH_DOC_DIR= $(DESTDIR)$(SLSH_DOC_
+ #----------------------------------------------------------------------------
+ @SET_MAKE@
+ SHELL = /bin/sh
+-#INST_LIBS = $(RPATH) $(SLANG_INST_LIB) $(DEST_LIB_DIR) -lslang $(READLINE_LIB) $(OTHER_LIBS)
+-INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(SLANG_INST_LIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
++INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(SLANG_INST_LIB) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
+ DEFS = -DSLSH_CONF_DIR='"$(SLSH_CONF_DIR)"' -DSLSH_PATH='"$(SLSH_LIB_DIR)"' \
+  -DSLSH_CONF_DIR_ENV='$(SLSH_CONF_DIR_ENV)' -DSLSH_LIB_DIR_ENV='$(SLSH_LIB_DIR_ENV)' \
+  -DSLSH_PATH_ENV='$(SLSH_PATH_ENV)'
+-SRC_LIBS = $(SLANG_ELFLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
+-STATIC_SRC_LIBS = $(SLANG_OBJLIB) -lslang $(READLINE_LIB) $(OTHER_LIBS)
++SDEFS = $(DEFS) -DSLSH_STATIC
++SRC_LIBS = $(SLANG_ELFLIB) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
++STATIC_SRC_LIBS = $(SLANG_OBJLIB) -lslang $(READLINE_LIB) $(STATIC_LIBS)
+ #
+ all: $(OBJDIR)/slsh_exe
+ slsh: $(OBJDIR)/slsh
+-static: $(OBJDIR)/slsh_static
+ $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
+-	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(SRC_LIBS)
++	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
+ $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
+-	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(SRC_LIBS)
++	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
+ $(OBJDIR)/slsh.o: $(OBJDIR) slsh.c slsh.h config.h Makefile
+ 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
+ $(OBJDIR)/readline.o: $(OBJDIR) readline.c slsh.h config.h Makefile
+ 	cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) -DUSE_GNU_READLINE=$(GNU_READLINE) $(SRCDIR)/readline.c
+-$(OBJDIR)/slsh_static: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
+-	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_static $(LDFLAGS) $(STATIC_SRC_LIBS)
+ $(OBJDIR):
+ 	-$(MKINSDIR) $(OBJDIR)
++#
++static: $(SOBJDIR)/slsh
++$(SOBJDIR)/slsh: $(SOBJDIR)/slsh.o $(SOBJDIR)/readline.o
++	$(CC) $(CFLAGS) $(SOBJDIR)/slsh.o $(SOBJDIR)/readline.o -o $(SOBJDIR)/slsh $(LDFLAGS) $(STATIC_SRC_LIBS)
++$(SOBJDIR)/slsh.o: $(SOBJDIR) slsh.c slsh.h config.h Makefile
++	cd $(SOBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(SDEFS) $(SRCDIR)/slsh.c
++$(SOBJDIR)/readline.o: $(SOBJDIR) readline.c slsh.h config.h Makefile
++	cd $(SOBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(SDEFS) -DUSE_GNU_READLINE=$(GNU_READLINE) $(SRCDIR)/readline.c
++$(SOBJDIR):
++	-$(MKINSDIR) $(SOBJDIR)
++#
+ config.h: ../src/config.h
+ 	cp ../src/config.h .
+ install_directories:
+@@ -158,7 +169,7 @@ install: slsh install_directories instal
+ 	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
+ install-static: static install_directories install_lib_files install_rline_files \
+  install_scripts install_help install_docs
+-	$(INSTALL) $(OBJDIR)/slsh_static $(DEST_BIN_DIR)/slsh
++	$(INSTALL) $(SOBJDIR)/slsh $(DEST_BIN_DIR)/
+ 	$(INSTALL_DATA) etc/slsh.rc $(DEST_SLSH_CONF_DIR)/
+ 	echo 'prepend_to_slang_load_path("$(SLSH_LOCALLIB_DIR)");' >> $(DEST_SLSH_CONF_DIR)/slsh.rc
+ 	$(INSTALL_DATA) doc/man/slsh.1 $(DEST_MAN_DIR)/
+@@ -167,6 +178,7 @@ install-static: static install_directori
+ #---------------------------------------------------------------------------
+ clean:
+ 	-/bin/rm -f *~ $(OBJDIR)/slsh.o $(OBJDIR)/readline.o $(OBJDIR)/slsh $(OBJDIR)/slsh_exe scripts/*~ lib/*~
++	-/bin/rm -f $(SOBJDIR)/slsh.o $(SOBJDIR)/readline.o $(SOBJDIR)/slsh $(SOBJDIR)/slsh_exe
+ distclean: clean
+ 	-/bin/rm -f Makefile config.h
+ #
+diff -rup a/slsh/slsh.c b/slsh/slsh.c
+--- a/slsh/slsh.c	2014-09-18 04:02:24.000000000 +0100
++++ b/slsh/slsh.c	2014-12-09 10:17:04.602824146 +0000
+@@ -514,7 +514,9 @@ int main (int argc, char **argv)
+ 
+    if ((-1 == SLang_init_all ())
+        || (-1 == SLang_init_array_extra ())
++#ifndef SLSH_STATIC
+        || (-1 == SLang_init_import ()) /* dynamic linking */
++#endif
+        || (-1 == SLadd_intrin_fun_table (Intrinsics, NULL))
+        || (-1 == slsh_init_readline_intrinsics ()))
+      {
