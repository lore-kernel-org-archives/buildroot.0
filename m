From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 00:03:18 +0200
Subject: [Buildroot] [git commit] kexec-lite: Depends on elfutils instead of
	libelf to get the libelf library
Message-ID: <20140913221240.427D99D67F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bd799ce2277c0364c255a05da711e6e19d17cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The elfutils package provides a more recent version of the libelf, so
let's use it. It will allow to remove the libelf package and to avoid
conflicts with two packages providing the same library.

[Peter: adjust toolchain options comment to match]
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec-lite/Config.in     |    8 +++++---
 package/kexec-lite/kexec-lite.mk |    2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 944ee29..e98ad3a 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on !BR2_PREFER_STATIC_LIB # dtc
-	select BR2_PACKAGE_LIBELF
+	depends on BR2_LARGEFILE # elfutils
+	depends on BR2_USE_WCHAR # elfutils
+	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_DTC_PROGRAMS
 	help
@@ -12,6 +14,6 @@ config BR2_PACKAGE_KEXEC_LITE
 	  This package is a tiny implementation of the kexec userspace
 	  components, for devicetree-based platforms.
 
-comment "kexec-lite needs a toolchain w/ dynamic library"
+comment "kexec-lite needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64
-	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_PREFER_STATIC_LIB || !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 7028c6e..7e3c8d3 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -7,7 +7,7 @@
 KEXEC_LITE_VERSION = fb8543fea3beb0522b5a63a74ea1a845dbd7b954
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPLv2+
-KEXEC_LITE_DEPENDENCIES = libelf dtc
+KEXEC_LITE_DEPENDENCIES = elfutils dtc
 
 define KEXEC_LITE_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
