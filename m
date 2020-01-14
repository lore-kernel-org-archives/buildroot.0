From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 21:55:20 +0100
Subject: [Buildroot] [PATCH 2/5 v4] package/xenomai: add support to download
 a custom tarball
In-Reply-To: <cover.1579035147.git.yann.morin.1998@free.fr>
References: <cover.1579035147.git.yann.morin.1998@free.fr>
Message-ID: <d3532bf6042199343b2dc3099f77bdcd628b10b6.1579035147.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in  | 8 ++++++++
 package/xenomai/xenomai.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 39d10ae695..326e1be737 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -55,11 +55,19 @@ config BR2_PACKAGE_XENOMAI_LATEST_VERSION
 config BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
 	bool "Custom version"
 
+config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	bool "Custom tarball"
+
 endchoice
 
 config BR2_PACKAGE_XENOMAI_VERSION
 	string "Custom Xenomai version" if !BR2_PACKAGE_XENOMAI_LATEST_VERSION
 	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
+	depends on !BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+
+config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL
+	string "URL of custom tarball"
+	depends on BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
 
 choice
 	prompt "Xenomai core"
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index bab9d6997d..d169c2e315 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -5,8 +5,14 @@
 ################################################################################
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
+ifeq ($(BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL),y)
+XENOMAI_TARBALL = $(call qstrip,$(BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL))
+XENOMAI_SOURCE = $(notdir $(XENOMAI_TARBALL))
+XENOMAI_SITE = $(patsubst %/,%,$(dir $(XENOMAI_TARBALL)))
+else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
+endif
 
 # Exclude all from the hash check, but the latest version.
 ifeq ($(BR2_PACKAGE_XENOMAI)$(BR2_PACKAGE_XENOMAI_LATEST_VERSION),y)
-- 
2.20.1
