From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 19 Dec 2019 09:24:33 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/xenomai: allow to pull git
 revisions
In-Reply-To: <cover.1576743874.git.jan.kiszka@siemens.com>
References: <cover.1576743874.git.jan.kiszka@siemens.com>
Message-ID: <4615b16355bc243960961d8b5203e9b6bc1587b5.1576743874.git.jan.kiszka@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Kiszka <jan.kiszka@siemens.com>

Default remains the latest stable release, expressed by
BR2_PACKAGE_XENOMAI_USE_RELEASE=y and an empty
BR2_PACKAGE_XENOMAI_VERSION.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 package/xenomai/Config.in  | 23 ++++++++++++++++++++++-
 package/xenomai/xenomai.mk | 10 +++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 0cb0b343de..f42c7c9c69 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -41,8 +41,21 @@ config BR2_PACKAGE_XENOMAI
 
 if BR2_PACKAGE_XENOMAI
 
+choice
+	prompt "Xenomai origin"
+	default BR2_PACKAGE_XENOMAI_USE_RELEASE
+
+config BR2_PACKAGE_XENOMAI_USE_RELEASE
+	bool "Release"
+
+config BR2_PACKAGE_XENOMAI_USE_GIT
+	bool "Git"
+
+endchoice
+
 config BR2_PACKAGE_XENOMAI_VERSION
-	string "Custom Xenomai version"
+	string "Xenomai version"
+	depends on BR2_PACKAGE_XENOMAI_USE_RELEASE
 	help
 	  Manually select Xenomai version. If left empty, the default
 	  version will be used.
@@ -53,6 +66,14 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
 	  Kernel -> Linux Kernel Extensions menu.
 
+config BR2_PACKAGE_XENOMAI_GIT_REVISION
+	string "Xenomai Git revision"
+	depends on BR2_PACKAGE_XENOMAI_USE_GIT
+	help
+	  This option allows Buildroot to get a custom revision from
+	  the Xenomai Git repository. This can be a SHA, a tag, or
+	  even a branch (floating revision).
+
 choice
 	prompt "Xenomai core"
 	default BR2_PACKAGE_XENOMAI_MERCURY
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 3813af707d..df7ca69f45 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -4,15 +4,23 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_XENOMAI_USE_GIT),y)
+XENOMAI_REV = $(call qstrip,$(BR2_PACKAGE_XENOMAI_GIT_REVISION))
+XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/$(XENOMAI_REV)
+XENOMAI_SOURCE = xenomai-$(XENOMAI_REV).tar.bz2
+XENOMAI_AUTORECONF = YES
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
+else
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
 XENOMAI_VERSION = 3.0.10
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
-
 XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
+endif
+
 XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
-- 
2.16.4
