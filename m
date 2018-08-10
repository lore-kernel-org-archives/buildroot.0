From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 10 Aug 2018 10:10:31 +0200
Subject: [Buildroot] [PATCH v3] package/sysdig: bump to version 0.22.1
Message-ID: <1533888631-7613-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps sysdig to version 0.22.1, adds a new dependency on
elfutils and adds hash for the license file.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/sysdig/Config.in   | 5 ++++-
 package/sysdig/sysdig.hash | 5 +++--
 package/sysdig/sysdig.mk   | 4 ++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 6ccb706..f87b5dd 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -4,7 +4,9 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on !BR2_STATIC_LIBS # luajit
+	depends on !BR2_STATIC_LIBS # luajit, elfutils
+	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_JSONCPP
@@ -13,6 +15,7 @@ config BR2_PACKAGE_SYSDIG
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_JQ
 	select BR2_PACKAGE_LIBB64
+	select BR2_PACKAGE_ELFUTILS
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 63a9e38..c344863 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  480d5d8fd7e7373c08008c30bd8e2c7595d5c45d710bf07bd15a522021b560f6  sysdig-0.19.1.tar.gz
+# sha256 locally computed
+sha256  b0ca30473c813c8086187e171f1b8faee6e72689fc02cb1e54ff9f8563bfbe89  sysdig-0.22.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index a9c9f21..49b4bf8 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.19.1
+SYSDIG_VERSION = 0.22.1
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
 	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF -DUSE_BUNDLED_CURL=OFF \
 	-DUSE_BUNDLED_NCURSES=OFF -DUSE_BUNDLED_OPENSSL=OFF \
 	-DUSE_BUNDLED_JQ=OFF -DUSE_BUNDLED_B64=OFF
-SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64
+SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64 elfutils
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # sysdig creates the module Makefile from a template, which contains a
-- 
2.7.4
