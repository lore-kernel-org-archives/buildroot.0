From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:21:22 +0200
Subject: [Buildroot] [git commit] package/xenomai: add support to download a
 custom tarball
Message-ID: <20200624212441.3C5E7828EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6dd6fe4e254b6c399705afa23231a86e755ad00f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
