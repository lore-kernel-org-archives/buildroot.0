From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 11:47:11 +0100
Subject: [Buildroot] [git commit] package/casync: new package
Message-ID: <20210110102925.B833B86539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f580f58f94c4e1b12b9d81aeb01366597b08aa96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
[yann.morin.1998 at free.fr:
  - correctly fix build without lzma in an upstreamable fashion
  - actually fix the build without udev
  - depend on udev, not libudev (which does not exist)
  - don't use += for the first variable assignment to _CONF_OPTS
  - explicitly disable unsupported fuzz options
  - add explicit optiopnal support for bash-completion
  - drop useless comments about "features" and "booleans"
  - fix alphabetical order in DEVELOPERS
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...0001-castore-fix-build-without-lzma-or-xz.patch | 35 ++++++++++++
 ...t-install-udev-rules-without-udev-support.patch | 53 ++++++++++++++++++
 package/casync/Config.in                           | 13 +++++
 package/casync/casync.hash                         |  3 +
 package/casync/casync.mk                           | 64 ++++++++++++++++++++++
 7 files changed, 170 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ee175b7586..828b0a6b33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2715,6 +2715,7 @@ N:	Wojciech Nizi??ski <niziak@spox.org>
 F:	package/fwup/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
+F:	package/casync/
 F:	package/gloox/
 
 N:	Yann CARDAILLAC <ycardaillac@sepro-group.com>
diff --git a/package/Config.in b/package/Config.in
index f497fbffde..c24969f723 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2072,6 +2072,7 @@ menu "Networking applications"
 	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/cannelloni/Config.in"
+	source "package/casync/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/connman/Config.in"
diff --git a/package/casync/0001-castore-fix-build-without-lzma-or-xz.patch b/package/casync/0001-castore-fix-build-without-lzma-or-xz.patch
new file mode 100644
index 0000000000..a528b1244c
--- /dev/null
+++ b/package/casync/0001-castore-fix-build-without-lzma-or-xz.patch
@@ -0,0 +1,35 @@
+From 06b667de02df34e3efa1864b4031853bd4ee010d Mon Sep 17 00:00:00 2001
+From: Yair Ben-Avraham <yairba@protonmail.com>
+Date: Sun, 10 Jan 2021 06:34:58 +0100
+Subject: [PATCH] castore: fix build without lzma or xz
+
+castore.c unconditioanlly includes lzma.h, but lzma support if optional.
+Furthermore, castore.c does not need anything from lzma.h.
+
+Drop the include altogether.
+
+Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
+[yann.morin.1998 at free.fr:
+  - lzma.h is not needed at all
+  - rewrite commit log accordingly
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/castore.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/castore.c b/src/castore.c
+index c290dfd..b2e5320 100644
+--- a/src/castore.c
++++ b/src/castore.c
+@@ -2,7 +2,6 @@
+ 
+ #include <dirent.h>
+ #include <fcntl.h>
+-#include <lzma.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+-- 
+2.25.1
+
diff --git a/package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch b/package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch
new file mode 100644
index 0000000000..838b065571
--- /dev/null
+++ b/package/casync/0002-build-don-t-install-udev-rules-without-udev-support.patch
@@ -0,0 +1,53 @@
+From e3f683dc3013d14bddb9f9ec5bdc31367dc51a1c Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 10 Jan 2021 10:44:39 +0100
+Subject: [PATCH] build: don't install udev rules without udev support
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ meson.build | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index aac7727..92be1ea 100644
+--- a/meson.build
++++ b/meson.build
+@@ -151,6 +151,11 @@ conf.set10('HAVE_SELINUX', get_option('selinux'))
+ 
+ if get_option('udev')
+         libudev = dependency('libudev')
++        udevrulesdir = get_option('udevrulesdir')
++        if udevrulesdir == ''
++                udev = dependency('udev', required : false)
++                udevrulesdir = join_paths(udev.get_pkgconfig_variable('udevdir'), 'rules.d')
++        endif
+ else
+         libudev = []
+ endif
+@@ -175,12 +180,6 @@ subdir('test')
+ 
+ includes = include_directories('src')
+ 
+-udevrulesdir = get_option('udevrulesdir')
+-if udevrulesdir == ''
+-        udev = dependency('udev', required : false)
+-        udevrulesdir = join_paths(udev.get_pkgconfig_variable('udevdir'), 'rules.d')
+-endif
+-
+ subdir('shell-completion/bash')
+ subdir('doc')
+ 
+@@ -318,7 +317,9 @@ udev_rule = configure_file(
+           input : 'src/75-casync.rules.in',
+           configuration : substs)
+ 
+-install_data(udev_rule, install_dir : udevrulesdir)
++if get_option('udev')
++        install_data(udev_rule, install_dir : udevrulesdir)
++endif
+ 
+ ############################################################
+ 
+-- 
+2.25.1
+
diff --git a/package/casync/Config.in b/package/casync/Config.in
new file mode 100644
index 0000000000..89a9520e35
--- /dev/null
+++ b/package/casync/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_CASYNC
+	bool "casync"
+	depends on BR2_TOOLCHAIN_USES_GLIBC # scandirat() is not implemented by musl and uclibc-ng
+	select BR2_PACKAGE_ACL
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Content-Addressable Data Synchronization Tool
+
+	  https://github.com/systemd/casync
+
+comment "casync needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/casync/casync.hash b/package/casync/casync.hash
new file mode 100644
index 0000000000..dbb85520de
--- /dev/null
+++ b/package/casync/casync.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  d07f43e70e3c466152033da4c55c065f815d3025234a046c2bce1cfe4ac7d273  casync-4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/casync/casync.mk b/package/casync/casync.mk
new file mode 100644
index 0000000000..d74cb1bfe8
--- /dev/null
+++ b/package/casync/casync.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# casync
+#
+################################################################################
+
+CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
+CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
+CASYNC_LICENSE = LGPL-2.1+
+CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
+CASYNC_DEPENDENCIES = acl libcurl openssl
+
+CASYNC_CONF_OPTS = -Dman=false -Doss-fuzz=false -Dllvm-fuzz=false
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+CASYNC_DEPENDENCIES += bash-completion
+# The default path is correct, leave it as-is
+else
+CASYNC_CONF_OPTS += -Dbashcompletiondir=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+CASYNC_DEPENDENCIES += libfuse
+CASYNC_CONF_OPTS += -Dfuse=true
+else
+CASYNC_CONF_OPTS += -Dfuse=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+CASYNC_DEPENDENCIES += libselinux
+CASYNC_CONF_OPTS += -Dselinux=true
+else
+CASYNC_CONF_OPTS += -Dselinux=false
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+CASYNC_DEPENDENCIES += udev
+CASYNC_CONF_OPTS += -Dudev=true
+else
+CASYNC_CONF_OPTS += -Dudev=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBZSTD),y)
+CASYNC_DEPENDENCIES += libzstd
+CASYNC_CONF_OPTS += -Dlibzstd=enabled
+else
+CASYNC_CONF_OPTS += -Dlibzstd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+CASYNC_DEPENDENCIES += xz
+CASYNC_CONF_OPTS += -Dliblzma=enabled
+else
+CASYNC_CONF_OPTS += -Dliblzma=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CASYNC_DEPENDENCIES += zlib
+CASYNC_CONF_OPTS += -Dlibz=enabled
+else
+CASYNC_CONF_OPTS += -Dlibz=disabled
+endif
+
+$(eval $(meson-package))
