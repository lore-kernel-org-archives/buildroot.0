From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 18:01:33 +0200
Subject: [Buildroot] [PATCH v2,1/1] libupnpp: fix build with uclibc
Message-ID: <20180504160133.5420-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to avoid failing with error if host_os doesn't start with
linux

Fixes:
 - http://autobuild.buildroot.net/results/cfb332a169863bcb3e6bc6ee7d6f6199f856b0b8
 - http://autobuild.buildroot.net/results/2f6f464f6360ed9ea4c238f503d2c3b8ab3cbd86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update patch to check for uclinux instead of assuming that default is
   linux

 ...cross-compilation-with-uclibc-on-arm-m68k.patch | 36 ++++++++++++++++++++++
 package/libupnpp/libupnpp.mk                       |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch

diff --git a/package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch b/package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch
new file mode 100644
index 0000000000..2c0a4ec79f
--- /dev/null
+++ b/package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch
@@ -0,0 +1,36 @@
+From 2828c2535d4380419ec5114cc3a0564d3686aba9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 4 May 2018 11:45:59 +0200
+Subject: [PATCH] Fix cross-compilation with uclibc on arm/m68k
+
+Commit 3f1132ecd27186fa3f1a87ead6a0389802baccbb breaks cross-compilation
+with uclibc on arm and m68k because host_os is set to
+arm-buildroot-uclinux-uclibc or m68k-buildroot-uclinux-uclibc so add
+uclinux to the linux case
+
+Fixes:
+ - http://autobuild.buildroot.net/results/cfb332a169863bcb3e6bc6ee7d6f6199f856b0b8
+ - http://autobuild.buildroot.net/results/2f6f464f6360ed9ea4c238f503d2c3b8ab3cbd86
+
+[Sent upstream]: https://opensourceprojects.eu/p/libupnpp/code/merge-requests/3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8903b72..3bb354c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,7 +35,7 @@ build_linux=no
+ build_mac=no
+ # Detect the target system
+ case "${host_os}" in
+-    linux*) build_linux=yes;;
++    linux*|uclinux*) build_linux=yes;;
+     darwin*) build_mac=yes;;
+     *) AC_MSG_ERROR(["OS $host_os is not supported"]);;
+ esac
+-- 
+2.14.1
+
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index b4e9e88fa9..852a72e822 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -10,6 +10,8 @@ LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
+# We're patching configure.ac
+LIBUPNPP_AUTORECONF = YES
 
 # configure script fails to link against the dependencies of libupnp
 # and libcurl causing detection to fail when statically linking
-- 
2.14.1
