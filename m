From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 19 Apr 2016 16:52:34 -0400
Subject: [Buildroot] [PATCH 3/4] linux-headers: rename _AS_KERNEL to
	_FROM_KERNEL
In-Reply-To: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <1461099155-30702-4-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_KERNEL_HEADERS_AS_KERNEL is confusing when making the choice between
downloading the headers from an independent kernel source, and using the
headers found in the kernel built by Buildroot.

Rename it to BR2_KERNEL_HEADERS_FROM_KERNEL.

In the meantime, document this distinction between the two choices.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 package/linux-headers/Config.in.host   | 19 ++++++++++++-------
 package/linux-headers/linux-headers.mk |  8 ++++----
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6d86113..baadb2e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,15 +5,20 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
+	default BR2_KERNEL_HEADERS_FROM_KERNEL if BR2_LINUX_KERNEL
 	default BR2_KERNEL_HEADERS_4_5
 	help
-	  Select the version of kernel header files you wish to use.
-	  You must select the correct set of header files to match
-	  the kernel you intend to use on your target system.
+	  Select the source of kernel header files which matches the kernel
+	  version you intend to use on your target system.
 
-	config BR2_KERNEL_HEADERS_AS_KERNEL
-		bool "Same as kernel"
+	  Select BR2_KERNEL_HEADERS_FROM_KERNEL to use the header files from
+	  the kernel source you are building for your target.
+
+	  Select any other choices to download and use an independent kernel
+	  version for its headers. Useful when you are not building the kernel.
+
+	config BR2_KERNEL_HEADERS_FROM_KERNEL
+		bool "From the kernel source"
 		depends on BR2_LINUX_KERNEL
 
 	config BR2_KERNEL_HEADERS_3_2
@@ -91,7 +96,7 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 choice
 	bool "Custom kernel headers series"
-	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL
+	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_FROM_KERNEL
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	help
 	  Set to the kernel headers series you manually set above.
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 0900778..9afe5dc 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -7,7 +7,7 @@
 # This package is used to provide Linux kernel headers for the
 # internal toolchain backend.
 
-ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
+ifeq ($(BR2_KERNEL_HEADERS_FROM_KERNEL),y)
 
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
@@ -71,7 +71,7 @@ endef
 
 LINUX_HEADERS_POST_PATCH_HOOKS += LINUX_HEADERS_APPLY_LOCAL_PATCHES
 
-else # ! BR2_KERNEL_HEADERS_AS_KERNEL
+else # ! BR2_KERNEL_HEADERS_FROM_KERNEL
 
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
@@ -83,7 +83,7 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
-endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
+endif # ! BR2_KERNEL_HEADERS_FROM_KERNEL
 
 LINUX_HEADERS_LICENSE = GPLv2
 LINUX_HEADERS_LICENSE_FILES = COPYING
@@ -125,7 +125,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			headers_install)
 endef
 
-ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
+ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_FROM_KERNEL),y)
 define LINUX_HEADERS_CHECK_VERSION
 	$(call check_kernel_headers_version,\
 		$(STAGING_DIR),\
-- 
2.8.0
