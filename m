From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Aug 2017 16:28:08 +0200
Subject: [Buildroot] [git commit branch/next] package/sysdig: bump to
	version 0.17.0
Message-ID: <20170813154723.596C881F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a04b0b519e89a2fa9f82ff81376509b8d4e6a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps sysdig to version 0.17.0 and updates the
dependencies accordingly.

According to [1], the minimum GCC version is 4.8 so encode that as
well.

[1] https://www.sysdig.org/wiki/how-to-install-sysdig-from-the-source-code/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Arnout: also bump gcc dependency to 4.8]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sysdig/Config.in   | 11 ++++++++---
 package/sysdig/sysdig.hash |  2 +-
 package/sysdig/sysdig.mk   |  8 +++++---
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index dfb9db5..d3f73e6 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -3,11 +3,16 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on !BR2_STATIC_LIBS # luajit
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_JQ
+	select BR2_PACKAGE_LIBB64
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux instance,
@@ -17,7 +22,7 @@ config BR2_PACKAGE_SYSDIG
 
 	  http://sysdig.org
 
-comment "sysdig needs a toolchain w/ C++, gcc >= 4.7, dynamic library and a Linux kernel to be built"
+comment "sysdig needs a toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index f64ef9e..8305413 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  e72490eaf413745aef87965a5abb1024908053064f86593b257f12bf5b0d6b97  sysdig-0.1.100.tar.gz
+sha256  f009acc32f2b15fcb0d2267bde6f6de9b3445179003c979ba61a8836abdb78f9  sysdig-0.17.0.tar.gz
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index f967727..2d5ad23 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.1.100
+SYSDIG_VERSION = 0.17.0
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
-	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF
-SYSDIG_DEPENDENCIES = zlib luajit jsoncpp
+	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF -DUSE_BUNDLED_CURL=OFF \
+	-DUSE_BUNDLED_NCURSES=OFF -DUSE_BUNDLED_OPENSSL=OFF \
+	-DUSE_BUNDLED_JQ=OFF -DUSE_BUNDLED_B64=OFF
+SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # sysdig creates the module Makefile from a template, which contains a
