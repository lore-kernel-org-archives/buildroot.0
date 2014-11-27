From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 22:48:09 +0100
Subject: [Buildroot] [git commit] botan: fix static build
Message-ID: <20141127224641.E5CCC7FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f824d3e2bebfab9ae746e605b65a852c68f55152
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see http://autobuild.buildroot.net/results/2d1/2d1563e253b669b45c9df449c5b3a750c04a43dc/

this commit reverts the previous commit 84047394ed6ad08adb9f59a9022553a327eef040
which disables static build in Config.in

the option --no-autoload prevents the use of the function dlopen.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/Config.in |    5 ++---
 package/botan/botan.mk  |    2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index c82a77f..733dc89 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -10,12 +10,11 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
 	help
 	  Botan is a crypto library for C++
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
+comment "botan needs a toolchain w/ C++, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index ae0e02d..2e47eb6 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -20,7 +20,7 @@ BOTAN_CONF_OPTS = \
 	--cc-bin="$(TARGET_CXX)"
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-	BOTAN_CONF_OPTS += --disable-shared
+	BOTAN_CONF_OPTS += --disable-shared --no-autoload
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
