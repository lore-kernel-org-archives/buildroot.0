From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Tue, 14 Jan 2020 09:56:41 +0100
Subject: [Buildroot] [PATCH v3] package/xenomai: allow to pull git revisions
Message-ID: <7a471c0c-9f4d-b4e5-7bb3-8aaae6d8a885@siemens.com>
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

Changes in v3:
 - Replaced BR2_PACKAGE_XENOMAI_REV with BR2_PACKAGE_XENOMAI_VERSION
 - Adopted logic suggested by Yann 

 package/xenomai/Config.in  | 25 +++++++++++++++++--------
 package/xenomai/xenomai.mk | 11 +++++++++--
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 0cb0b343de..6ee773c98f 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -41,17 +41,26 @@ config BR2_PACKAGE_XENOMAI
 
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
 	help
-	  Manually select Xenomai version. If left empty, the default
-	  version will be used.
+	  If downloading a release, leave empty for the default version,
+	  or specify a valid release version.
 
-	  Make sure that the selected version has a patch for your
-	  selected Linux kernel. If it does not, download and select
-	  a patch manually with
-	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
-	  Kernel -> Linux Kernel Extensions menu.
+	  If downloading from git, this can be any commit-ish (e.g.
+	  a tag, or a hash).
 
 choice
 	prompt "Xenomai core"
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 5f389ac851..abc768fd9f 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -5,14 +5,21 @@
 ################################################################################
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
+XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
+
+ifeq ($(BR2_PACKAGE_XENOMAI_USE_RELEASE),y)
 ifeq ($(XENOMAI_VERSION),)
 XENOMAI_VERSION = 3.0.10
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
-
 XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
-XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
+else
+XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/$(XENOMAI_VERSION)
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
+XENOMAI_AUTORECONF = YES
+endif
+
 XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
