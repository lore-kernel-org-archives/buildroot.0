From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:53:01 +0200
Subject: [Buildroot] [git commit] bluez5_utils: add patch to fix readline
 issue
Message-ID: <20180421125333.F085280FC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4158df6c19c76ea3405975b87f13b1c092a40e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bluez5_utils 5.49, some code using readline was compiled even if
readline was not available. After this issue was reported upstream, a
patch was proposed by an upstream developer to address the issue. This
commit integrates this patch (under review upstream), which fixes the
problem.

Fixes:

  http://autobuild.buildroot.net/results/3e266a79acab8b8eb33360f7afbc1cd6db46f7cb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Is-shall-only-be-build-if-readline-is-pre.patch | 32 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch b/package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch
new file mode 100644
index 0000000000..394742b680
--- /dev/null
+++ b/package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch
@@ -0,0 +1,32 @@
+From 654444dd8faf02b46f41d81f3d9c623d57bdd399 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Fri, 20 Apr 2018 16:04:17 +0200
+Subject: [PATCH] bt_shell APIs shall only be build if readline is present on
+ the system since it currently depend on it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream-status: https://marc.info/?l=linux-bluetooth&m=152422938306592&w=2
+---
+ Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index daf34b6ca..9c3c17139 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -119,7 +119,11 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
+ 			src/shared/gatt-server.h src/shared/gatt-server.c \
+ 			src/shared/gatt-db.h src/shared/gatt-db.c \
+ 			src/shared/gap.h src/shared/gap.c \
+-			src/shared/tty.h src/shared/shell.c src/shared/shell.h
++			src/shared/tty.h
++
++if READLINE
++shared_sources += src/shared/shell.c src/shared/shell.h
++endif
+ 
+ src_libshared_glib_la_SOURCES = $(shared_sources) \
+ 				src/shared/io-glib.c \
+-- 
+2.14.3
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index e1c67bd622..3189855624 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -11,6 +11,8 @@ BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
+# 0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch
+BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-tools \
