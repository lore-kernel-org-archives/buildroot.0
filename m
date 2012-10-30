From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Tue, 30 Oct 2012 13:24:01 +0100
Subject: [Buildroot] [PATCH] package: add bcusdk
In-Reply-To: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1351599843-24291-2-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in                                  |    1 +
 package/bcusdk/Config.in                           |   11 +++++++
 .../bcusdk-0.0.5-fix-pthsem-config-issue.patch     |   33 ++++++++++++++++++++
 package/bcusdk/bcusdk.mk                           |   21 +++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 package/bcusdk/Config.in
 create mode 100644 package/bcusdk/bcusdk-0.0.5-fix-pthsem-config-issue.patch
 create mode 100644 package/bcusdk/bcusdk.mk

diff --git a/package/Config.in b/package/Config.in
index a55a584..a6d0517 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -541,6 +541,7 @@ menu "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
+source "package/bcusdk/Config.in"
 source "package/bluez_utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
new file mode 100644
index 0000000..81d8882
--- /dev/null
+++ b/package/bcusdk/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BCUSDK
+	bool "bcusdk"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBPTHSEM
+	help
+	  A free development environment for BCU1 and BCU2
+
+	  http://www.auto.tuwien.ac.at/~mkoegler/eib/
+
+comment "bcusdk requires a toolchain with C++ "
+	depends on !(BR2_INSTALL_LIBSTDCPP)
diff --git a/package/bcusdk/bcusdk-0.0.5-fix-pthsem-config-issue.patch b/package/bcusdk/bcusdk-0.0.5-fix-pthsem-config-issue.patch
new file mode 100644
index 0000000..82649f0
--- /dev/null
+++ b/package/bcusdk/bcusdk-0.0.5-fix-pthsem-config-issue.patch
@@ -0,0 +1,33 @@
+From 8129fd135b0674017854fd722105eb0558cd3987 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Mon, 22 Oct 2012 15:29:43 +0200
+Subject: [PATCH] Prevent pthsem-config script to return bad include path.
+
+During the bcusdk configuration step, the script pthsem-config
+is used to return some parameters about the pthsem library location.
+Unfortunately this script returns host include path and prevents
+the bcusdk build.
+
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ configure |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 843e017..f77d5a9 100755
+--- a/configure
++++ b/configure
+@@ -15958,8 +15958,8 @@ if test ".$with_pth" != .no; then
+                                         if test ".$_pth_version" != .; then
+                         _pth_location=`$_dir/pthsem-config --prefix`
+                         _pth_type="installed"
+-                        _pth_cppflags=`$_dir/pthsem-config --cflags`
+-                        _pth_cflags=`$_dir/pthsem-config --cflags`
++#                       _pth_cppflags=`$_dir/pthsem-config --cflags`
++#                       _pth_cflags=`$_dir/pthsem-config --cflags`
+                         _pth_ldflags=`$_dir/pthsem-config --ldflags`
+                         _pth_libs=`$_dir/pthsem-config --libs --all`
+                         _pth_found=yes
+-- 
+1.7.9.5
+
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
new file mode 100644
index 0000000..9ed615d
--- /dev/null
+++ b/package/bcusdk/bcusdk.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# bcusck
+#
+#############################################################
+
+BCUSDK_VERSION = 0.0.5
+BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
+BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib/
+BCUSDK_LICENSE = GPLv2+
+BCUSDK_LICENSE_FILES = COPYING
+BCUSDK_INSTALL_STAGING = YES
+BCUSDK_INSTALL_TARGET = YES
+BCUSDK_CONF_OPT =  --enable-onlyeibd --enable-ft12 --enable-pei16 \
+		 --enable-eibnetip --enable-eibnetipserver \
+		 --enable-eibnetiptunnel --without-pth-test \
+		 --with-pth=$(STAGING_DIR)/usr 
+
+BCUSDK_DEPENDENCIES = libpthsem
+
+$(eval $(autotools-package))
-- 
1.7.9.5
