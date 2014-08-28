From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Thu, 28 Aug 2014 11:47:09 +0200
Subject: [Buildroot] [PATCH 3/4] kexec-lite: Depends on elfutils instead of
	libelf to get the libelf library
In-Reply-To: <1409219230-17443-1-git-send-email-gregory.clement@free-electrons.com>
References: <1409219230-17443-1-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <1409219230-17443-4-git-send-email-gregory.clement@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The elfutils package provides a more recent version of the libelf, so
let's use it. It will allow to remove the libelf package and to avoid
conflicts with two packages providing the same library.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 package/kexec-lite/Config.in     | 2 +-
 package/kexec-lite/kexec-lite.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index 944ee29..9fa9f4b 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on !BR2_PREFER_STATIC_LIB # dtc
-	select BR2_PACKAGE_LIBELF
+	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_DTC_PROGRAMS
 	help
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
-- 
1.9.1
