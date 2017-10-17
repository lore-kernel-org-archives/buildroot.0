From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 17 Oct 2017 20:59:36 +0200
Subject: [Buildroot] [PATCH v4] libostree: new package
Message-ID: <20171017185936.1449-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OSTree is an upgrade system for Linux-based operating systems

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

v4:
- bump version to 2017.12

v3:
- move with the package within Config.in to match the chronological order
  (the former name was just 'ostree')

v2:
- add e2fsprogs as dependency

 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 ...Use-autoreconf-from-the-build-environment.patch | 42 ++++++++++++++++++++++
 package/libostree/Config.in                        | 12 +++++++
 package/libostree/libostree.mk                     | 22 ++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 package/libostree/0001-Use-autoreconf-from-the-build-environment.patch
 create mode 100644 package/libostree/Config.in
 create mode 100644 package/libostree/libostree.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 942abcf836..602122cfed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1129,6 +1129,9 @@ F:	package/turbolua/
 N:	Marcin Nowakowski <marcin.nowakowski@imgtec.com>
 F:	package/libkcapi/
 
+N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/libostree/
+
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
 F:	package/polkit/
diff --git a/package/Config.in b/package/Config.in
index d4cf62708a..8fbc213610 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1913,6 +1913,7 @@ menu "System tools"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
+	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/libostree/0001-Use-autoreconf-from-the-build-environment.patch b/package/libostree/0001-Use-autoreconf-from-the-build-environment.patch
new file mode 100644
index 0000000000..36d9b3f15e
--- /dev/null
+++ b/package/libostree/0001-Use-autoreconf-from-the-build-environment.patch
@@ -0,0 +1,42 @@
+From e4b940cc02776edee63c5a706746dc237862151d Mon Sep 17 00:00:00 2001
+From: Marcus Folkesson <marcus.folkesson@gmail.com>
+Date: Wed, 30 Aug 2017 19:20:35 +0200
+Subject: [PATCH] Use autoreconf from the build environment
+
+OSTree workarounds a bug in automake in their autogen.sh file.
+Use the script but do not call autoreconf from it.
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+---
+ autogen.sh | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 17f6abf4..0dfbb15a 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -6,12 +6,6 @@ test -n "$srcdir" || srcdir=.
+ olddir=`pwd`
+ cd $srcdir
+ 
+-AUTORECONF=`which autoreconf`
+-if test -z $AUTORECONF; then
+-        echo "*** No autoreconf found, please install it ***"
+-        exit 1
+-fi
+-
+ set -e
+ 
+ mkdir -p m4
+@@ -37,8 +31,3 @@ sed -e 's,$(libbsdiff_srcpath),bsdiff,g' < bsdiff/Makefile-bsdiff.am >bsdiff/Mak
+ 
+ # FIXME - figure out how to get aclocal to find this by default
+ ln -sf ../libglnx/libglnx.m4 buildutil/libglnx.m4
+-
+-autoreconf --force --install --verbose
+-
+-cd $olddir
+-test -n "$NOCONFIGURE" || "$srcdir/configure" "$@"
+-- 
+2.13.1
+
diff --git a/package/libostree/Config.in b/package/libostree/Config.in
new file mode 100644
index 0000000000..520e76ce6a
--- /dev/null
+++ b/package/libostree/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBOSTREE
+	bool "libostree"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PKGCONF
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGPGME
+	help
+	  OSTree is an upgrade system for Linux-based operating systems.
+
+	  https://ostree.readthedocs.io/en/latest/
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
new file mode 100644
index 0000000000..5d0483665c
--- /dev/null
+++ b/package/libostree/libostree.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libostree
+#
+################################################################################
+
+LIBOSTREE_VERSION = v2017.12
+LIBOSTREE_SITE = https://github.com/ostreedev/ostree.git
+LIBOSTREE_SITE_METHOD = git
+LIBOSTREE_GIT_SUBMODULES = yes
+LIBOSTREE_LICENSE = GPLv2
+LIBOSTREE_LICENSE_FILES = COPYING
+LIBOSTREE_AUTORECONF = YES
+LIBOSTREE_DEPENDENCIES = libgpgme libglib2 xz libfuse pkgconf e2fsprogs
+
+# Use their special autogen.sh script to workaround automake bug with subdir-objects and computed paths
+define LIBOSTREE_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+LIBOSTREE_PRE_CONFIGURE_HOOKS += LIBOSTREE_RUN_AUTOGEN
+
+$(eval $(autotools-package))
-- 
2.13.1
