From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Sep 2020 22:11:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb: fix build of gdbserver-only on
 the ARC gdb version
Message-ID: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GDB version used on ARC is based on a recent gdb code base, post
gdb 9.2. This recent gdb code base, which pre-figures what will be in
gdb 10, has a significant change: gdbserver is not longer in
gdb/gdbserver, but at the top-level, and the mechanism to build
gdbserver only has changed. Due to this change, a build of ARC GDB for
gdbserver only fails with:

/bin/bash: line 0: cd: /opt/output/build/gdb-arc-2020.03-release-gdb/gdb/gdbserver: No such file or directory

This commit adjusts gdb.mk to support four cases:

 - "old" gdb, gdbserver only
 - "old" gdb, with the gdb debugger (and optionally gdbserver as well)
 - "new" gdb, gdbserver only
 - "new" gdb, with the gdb debugger (and optionally gdbserver as well)

A boolean GDB_GDBSERVER_TOPLEVEL is introduced to differentiate
between the old and new gdb, it is set to "y" for gdb versions that
have the gdbserver code at the top-level. For now, only the ARC
version sets it, but in the future, upstream gdb version 10 will also
have to set it.

Here is the behavior, for each case:

 (1) "old" gdb, gdbserver only

     We set GDB_SUBDIR to gdb/gdbserver, so only the configure script
     in this folder gets called.

     --enable-gdbserver --disable-gdb are passed in CONF_OPTS.

 (2) "old" gdb, with the gdb debugger (and optionally gdbserver as well)

     We set GDB_SUBDIR to build/, an empty directory which allows to
     do an out of tree build, which is mandatory for a full gdb build
     since gdb 9.x.

     --enable-gdb is passed in CONF_OPTS as well as --enable-gdbserver
     or --disable-gdbserver depending on whether gdbserver is enabled
     as well.

 (3) "new" gdb, gdbserver only

     We set GDB_SUBDIR to build/, an empty directory which allows to
     do an out of tree build, which is mandatory for a full gdb build
     since gdb 9.x.

     --enable-gdbserver --disable-gdb are passed in CONF_OPTS.

 (4) "new" gdb, with the gdb debugger (and optionally gdbserver as well)

     We set GDB_SUBDIR to build/, an empty directory which allows to
     do an out of tree build, which is mandatory for a full gdb build
     since gdb 9.x.

     --enable-gdb is passed in CONF_OPTS as well as --enable-gdbserver
     or --disable-gdbserver depending on whether gdbserver is enabled
     as well.

In addition to these changes, some related changes are done as well:

 - We re-enable building both gdb and gdbserver on ARC, as it works
   again.

 - We only pass --with-curses when curses is really provided, i.e when
   the full debugger is being built.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in |  5 -----
 package/gdb/gdb.mk    | 40 +++++++++++++++++++++++++++++-----------
 2 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 4c787d49a1..48ec3e0202 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -49,11 +49,6 @@ config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	depends on !BR2_riscv
-	# Simultaneous build of gdbserver and full gdb is not possible
-	# with arc-2019.09. This bug comes from upstream GDB. So
-	# simultaneous usage of full gdb and gdbserver is temporaly
-	# disabled for ARC until a fix becomes available.
-	depends on !(BR2_arc && BR2_PACKAGE_GDB_DEBUGGER)
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 6b63a6214b..2e5588bfbc 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -12,6 +12,9 @@ ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
+# recent gdb versions (>= 10) have gdbserver moved at the top-level,
+# which requires a different build logic.
+GDB_GDBSERVER_TOPLEVEL = y
 endif
 
 ifeq ($(BR2_csky),y)
@@ -23,23 +26,22 @@ endif
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
-# We only want gdbserver and not the entire debugger.
-ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
+# On gdb < 10, if you want to build only gdbserver, you need to
+# configure only gdb/gdbserver.
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(GDB_GDBSERVER_TOPLEVEL),)
 GDB_SUBDIR = gdb/gdbserver
+
+# When we want to build the full gdb, or for very recent versions of
+# gdb with gdbserver at the top-level, out of tree build is mandatory,
+# so we create a 'build' subdirectory in the gdb sources, and build
+# from there.
 else
-GDB_DEPENDENCIES = ncurses \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GDB_SUBDIR = build
-
-# Since gdb 9, in-tree builds for GDB are not allowed anymore,
-# so we create a 'build' subdirectory in the gdb sources, and
-# build from there.
 define GDB_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/$(GDB_SUBDIR)
 	ln -sf ../configure $(@D)/$(GDB_SUBDIR)/configure
 endef
 GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
-
 endif
 
 # For the host variant, we really want to build with XML support,
@@ -137,13 +139,29 @@ GDB_CONF_OPTS = \
 	--without-x \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
-	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver,--disable-gdbserver) \
-	--with-curses \
 	--without-included-gettext \
 	--disable-werror \
 	--enable-static \
 	--without-mpfr
 
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
+GDB_CONF_OPTS += \
+	--enable-gdb \
+	--with-curses
+GDB_DEPENDENCIES = ncurses \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+else
+GDB_CONF_OPTS += \
+	--disable-gdb \
+	--without-curses
+endif
+
+ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
+GDB_CONF_OPTS += --enable-gdbserver
+else
+GDB_CONF_OPTS += --disable-gdbserver
+endif
+
 # When gdb is built as C++ application for ARC it segfaults@runtime
 # So we pass --disable-build-with-cxx config option to force gdb not to
 # be built as C++ app.
-- 
2.26.2
