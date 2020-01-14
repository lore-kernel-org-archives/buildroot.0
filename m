From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 21:55:19 +0100
Subject: [Buildroot] [PATCH 1/5 v4] package/xenomai: move the version
 setting to Kconfig
In-Reply-To: <cover.1579035147.git.yann.morin.1998@free.fr>
References: <cover.1579035147.git.yann.morin.1998@free.fr>
Message-ID: <11d1ef09d50bb027aca094070792402d16d6c8b6.1579035147.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The xenomai version is decided in Kconfig, but the default value is
set in the .mk. This is unlike the other packages that have a version
choice (like linux, uboot...).

Move the value into Config.in.

This paves the way to using other custom sources, like from a git tree.

Note however that any existing configuration will need to be adapted to
the new settings. Adding legacy handling is non-trivial, so manual
intervention will be required.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in  | 26 +++++++++++++++++---------
 package/xenomai/xenomai.mk | 14 +++++++-------
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 0cb0b343de..39d10ae695 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -41,17 +41,25 @@ config BR2_PACKAGE_XENOMAI
 
 if BR2_PACKAGE_XENOMAI
 
-config BR2_PACKAGE_XENOMAI_VERSION
-	string "Custom Xenomai version"
+choice
+	bool "Xenomai version"
 	help
-	  Manually select Xenomai version. If left empty, the default
-	  version will be used.
-
 	  Make sure that the selected version has a patch for your
-	  selected Linux kernel. If it does not, download and select
-	  a patch manually with
-	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
-	  Kernel -> Linux Kernel Extensions menu.
+	  selected Linux kernel. If it does not, download and select a
+	  patch manually with BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH,
+	  in the Linux Kernel -> Linux Kernel Extensions menu.
+
+config BR2_PACKAGE_XENOMAI_LATEST_VERSION
+	bool "Latest version (3.0.10)"
+
+config BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
+	bool "Custom version"
+
+endchoice
+
+config BR2_PACKAGE_XENOMAI_VERSION
+	string "Custom Xenomai version" if !BR2_PACKAGE_XENOMAI_LATEST_VERSION
+	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
 
 choice
 	prompt "Xenomai core"
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 5f389ac851..bab9d6997d 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -5,14 +5,14 @@
 ################################################################################
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
-ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 3.0.10
-else
-BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
-endif
-
-XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
+XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
+
+# Exclude all from the hash check, but the latest version.
+ifeq ($(BR2_PACKAGE_XENOMAI)$(BR2_PACKAGE_XENOMAI_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
+endif
+
 XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
-- 
2.20.1
