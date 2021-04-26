From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Apr 2021 23:53:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/monkey: bump to latest git commit
Message-ID: <20210426215358.519314-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a build failure with gcc 10

- Update indentation in hash file (two spaces)
- Drop INSTALL_SYSCONFDIR, INSTALL_WEBROOTDIR and WITH_SYSTEM_MALLOC
  (not available since
  https://github.com/monkey/monkey/commit/df145932e33fca0d4a1dcd9d7675f996c8e6a73b)
- Set WITHOUT_HEADERS to ON because headers are not needed and to avoid
  the following build failure:

CMake Error at include/cmake_install.cmake:46 (file):
  file INSTALL cannot find
  "/home/fabrice/buildroot/output/build/monkey-f54856ce250c4e25735434dc75717a4b7fbfc45b/include/mk_core.h":
  No such file or directory.
Call Stack (most recent call first):
  cmake_install.cmake:69 (include)

Upstream is aware than the lack of release is an issue but no comments
since 2018: https://github.com/monkey/monkey/issues/276

Fixes:
 - http://autobuild.buildroot.org/results/0b723937ca048228082d040100f6e6324ac8300b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monkey/monkey.hash |  7 +++----
 package/monkey/monkey.mk   | 18 ++++++++----------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
index 83fc0def60..27ff806442 100644
--- a/package/monkey/monkey.hash
+++ b/package/monkey/monkey.hash
@@ -1,4 +1,3 @@
-# md5 from http://monkey-project.com/releases/1.6/monkey-1.6.9.tar.gz.md5, sha256 locally computed:
-md5    c401734985a936ee07dbff5eca7d176a 				monkey-1.6.9.tar.gz
-sha256 f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb	monkey-1.6.9.tar.gz
-sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594	LICENSE
+# Locally computed:
+sha256  c988d9f4f577a789aa244e5a0f99ebfd46ebddc328656f319acf64edc9fd5199  monkey-f54856ce250c4e25735434dc75717a4b7fbfc45b.tar.gz
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 5264713120..2cb1a5f298 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -4,31 +4,29 @@
 #
 ################################################################################
 
-MONKEY_VERSION_MAJOR = 1.6
-MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).9
-MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)
+MONKEY_VERSION = f54856ce250c4e25735434dc75717a4b7fbfc45b
+MONKEY_SITE = $(call github,monkey,monkey,$(MONKEY_VERSION))
 MONKEY_LICENSE = Apache-2.0
 MONKEY_LICENSE_FILES = LICENSE
 
 MONKEY_CONF_OPTS = \
-	-DINSTALL_SYSCONFDIR=/etc/monkey \
-	-DINSTALL_WEBROOTDIR=/var/www \
-	-DWITH_SYSTEM_MALLOC=1
+	-DMK_PATH_WWW=/var/www \
+	-DWITHOUT_HEADERS=ON
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-MONKEY_CONF_OPTS += -DWITH_UCLIB=1 -DWITH_BACKTRACE=0
+MONKEY_CONF_OPTS += -DMK_UCLIB=ON -DMK_BACKTRACE=OFF
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-MONKEY_CONF_OPTS += -DWITH_MUSL=1 -DWITH_BACKTRACE=0
+MONKEY_CONF_OPTS += -DMK_MUSL=ON -DMK_BACKTRACE=OFF
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-MONKEY_CONF_OPTS += -DWITH_DEBUG=1
+MONKEY_CONF_OPTS += -DMK_DEBUG=ON
 endif
 
 ifeq ($(BR2_PACKAGE_MONKEY_SSL),y)
-MONKEY_CONF_OPTS += -DWITH_PLUGINS=tls -DWITH_MBEDTLS_SHARED=1
+MONKEY_CONF_OPTS += -DMK_PLUGIN_TLS=ON -DMK_MBEDTLS_SHARED=ON
 MONKEY_DEPENDENCIES += mbedtls
 endif
 
-- 
2.30.2
