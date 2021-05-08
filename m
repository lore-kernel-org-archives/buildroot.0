From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  8 May 2021 20:44:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/monkey: drop package
Message-ID: <20210508184416.3391369-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in commit 26a7d912f4a44bce558ee24bbadb5d10527f68c1, upstream
is aware than the lack of release is an issue but no comments since
2018: https://github.com/monkey/monkey/issues/276

Moreover, TLS support is broken since 2016 but again upstream does not
seem to care about it: https://github.com/monkey/monkey/issues/336

So just drop monkey

Fixes:
 - http://autobuild.buildroot.org/results/0626ebab4f084d9b97d6696c7d4ebf7760d776a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy           |  7 +++++++
 package/Config.in          |  1 -
 package/monkey/Config.in   | 24 ------------------------
 package/monkey/monkey.hash |  3 ---
 package/monkey/monkey.mk   | 33 ---------------------------------
 5 files changed, 7 insertions(+), 61 deletions(-)
 delete mode 100644 package/monkey/Config.in
 delete mode 100644 package/monkey/monkey.hash
 delete mode 100644 package/monkey/monkey.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d583f3b603..ce6aeed87d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_MONKEY
+	bool "monkey package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it has not seen any release
+	  since 2016 and because TLS is broken on master.
+
 config BR2_PACKAGE_DOCKER_CONTAINERD
 	bool "docker-containerd package was renamed to containerd"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0d266b0d6c..ae8d67ce36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2189,7 +2189,6 @@ menu "Networking applications"
 	source "package/mjpg-streamer/Config.in"
 	source "package/modem-manager/Config.in"
 	source "package/mongrel2/Config.in"
-	source "package/monkey/Config.in"
 	source "package/mosh/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
diff --git a/package/monkey/Config.in b/package/monkey/Config.in
deleted file mode 100644
index 32a95ee623..0000000000
--- a/package/monkey/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_MONKEY
-	bool "monkey"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on BR2_USE_MMU # fork()
-	help
-	  Monkey Server is a fast and lightweight web server for Linux
-	  platforms.
-
-	  http://monkey-project.com/
-
-if BR2_PACKAGE_MONKEY
-
-config BR2_PACKAGE_MONKEY_SSL
-	bool "enable SSL/TLS"
-	select BR2_PACKAGE_MBEDTLS
-	help
-	  Enable build of the SSL/TLS plugin.
-
-endif
-
-comment "monkey needs an toolchain w/ threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
deleted file mode 100644
index 27ff806442..0000000000
--- a/package/monkey/monkey.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  c988d9f4f577a789aa244e5a0f99ebfd46ebddc328656f319acf64edc9fd5199  monkey-f54856ce250c4e25735434dc75717a4b7fbfc45b.tar.gz
-sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
deleted file mode 100644
index 2cb1a5f298..0000000000
--- a/package/monkey/monkey.mk
+++ /dev/null
@@ -1,33 +0,0 @@
-################################################################################
-#
-# monkey
-#
-################################################################################
-
-MONKEY_VERSION = f54856ce250c4e25735434dc75717a4b7fbfc45b
-MONKEY_SITE = $(call github,monkey,monkey,$(MONKEY_VERSION))
-MONKEY_LICENSE = Apache-2.0
-MONKEY_LICENSE_FILES = LICENSE
-
-MONKEY_CONF_OPTS = \
-	-DMK_PATH_WWW=/var/www \
-	-DWITHOUT_HEADERS=ON
-
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-MONKEY_CONF_OPTS += -DMK_UCLIB=ON -DMK_BACKTRACE=OFF
-endif
-
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-MONKEY_CONF_OPTS += -DMK_MUSL=ON -DMK_BACKTRACE=OFF
-endif
-
-ifeq ($(BR2_ENABLE_DEBUG),y)
-MONKEY_CONF_OPTS += -DMK_DEBUG=ON
-endif
-
-ifeq ($(BR2_PACKAGE_MONKEY_SSL),y)
-MONKEY_CONF_OPTS += -DMK_PLUGIN_TLS=ON -DMK_MBEDTLS_SHARED=ON
-MONKEY_DEPENDENCIES += mbedtls
-endif
-
-$(eval $(cmake-package))
-- 
2.30.2
