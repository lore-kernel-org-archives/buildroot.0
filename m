From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Nov 2009 19:53:38 +0100
Subject: [Buildroot] [git commit master] package: remove disabled/broken
	irda-utils package
Message-ID: <20091124190730.BB58177756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1330cf5b19b9d1e756f0521e55b8155268da71f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No updates since it got marked as broken back in January, so lets get
rid of it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 -
 package/irda-utils/Config.in                       |   45 ---------------
 .../irda-utils-0.9.18-install_irnetd.patch         |   12 ----
 package/irda-utils/irda.mk.broken                  |   57 --------------------
 4 files changed, 0 insertions(+), 115 deletions(-)
 delete mode 100644 package/irda-utils/Config.in
 delete mode 100644 package/irda-utils/irda-utils-0.9.18-install_irnetd.patch
 delete mode 100644 package/irda-utils/irda.mk.broken

diff --git a/package/Config.in b/package/Config.in
index 84492a8..c5a2365 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -139,7 +139,6 @@ source "package/ethtool/Config.in"
 source "package/haserl/Config.in"
 source "package/hostap/Config.in"
 source "package/ifplugd/Config.in"
-#source "package/irda-utils/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
diff --git a/package/irda-utils/Config.in b/package/irda-utils/Config.in
deleted file mode 100644
index edb74a1..0000000
--- a/package/irda-utils/Config.in
+++ /dev/null
@@ -1,45 +0,0 @@
-menuconfig BR2_PACKAGE_IRDA_UTILS
-	bool "irda_utils"
-	depends on BROKEN
-	help
-	  Tools for accessing the irda-Subsystem of the Linux-Kernel
-	  The makefile is totally broken.
-
-if BR2_PACKAGE_IRDA_UTILS
-config IRDA_IRATTACH
-	bool "irattach"
-	default y
-	help
-		To start the Irda-Subsystem in SIR-Mode you may need this
-
-config IRDA_IRDAPING
-	bool "irdaping"
-	help
-		what ping is for networks is irdaping for Irda
-
-config IRDA_IRNETD
-	bool "irnetd"
-	help
-		Needed for Networking over Irda
-
-config IRDA_IRDADUMP
-	bool "irdadump"
-	help
-		Like tcpdump, but for infrared connections
-
-config IRDA_FINDCHIP
-	bool "findchip"
-
-config IRDA_PSION
-	bool "support psion-dongle"
-
-config IRDA_TEKRAM
-	bool "support tekram-dongle"
-
-config IRDA_SMCINIT
-	bool "support toshiba-laptops"
-	help
-		Some Toshiba Laptops have buggy BIOSes which didn't initialize
-		Irda. This may help those.
-
-endif
diff --git a/package/irda-utils/irda-utils-0.9.18-install_irnetd.patch b/package/irda-utils/irda-utils-0.9.18-install_irnetd.patch
deleted file mode 100644
index 03f1f1d..0000000
--- a/package/irda-utils/irda-utils-0.9.18-install_irnetd.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -Naur irda-utils-0.9.18.orig/irnetd/Makefile irda-utils-0.9.18/irnetd/Makefile
---- irda-utils-0.9.18.orig/irnetd/Makefile	2006-07-11 08:16:06.000000000 +0200
-+++ irda-utils-0.9.18/irnetd/Makefile	2007-06-08 20:39:25.000000000 +0200
-@@ -55,7 +55,7 @@
- 
- install: irnetd
- 	$(prn_install)
--	$(ECMD) install irnetd /usr/sbin/
-+	$(ECMD) install irnetd $(ROOT)/usr/sbin/
- 
- 
- clean:
diff --git a/package/irda-utils/irda.mk.broken b/package/irda-utils/irda.mk.broken
deleted file mode 100644
index 8fcf952..0000000
--- a/package/irda-utils/irda.mk.broken
+++ /dev/null
@@ -1,57 +0,0 @@
-#############################################################
-#
-# irda-utils
-#
-#############################################################
-IRDA_UTILS_VERSION:=0.9.18
-IRDA_UTILS_SOURCE:=irda-utils-$(IRDA_UTILS_VERSION).tar.gz
-IRDA_UTILS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/irda/$(IRDA_UTILS_SOURCE)
-IRDA_UTILS_DIR:=$(BUILD_DIR)/irda-utils-$(IRDA_UTILS_VERSION)
-
-ifeq ($(IRDA_IRATTACH),y)
-IRDA_DIRS += irattach
-endif
-ifeq ($(IRDA_IRDAPING),y)
-IRDA_DIRS += irdaping
-endif
-ifeq ($(IRDA_IRNETD),y)
-IRDA_DIRS += irnetd
-endif
-ifeq ($(IRDA_PSION),y)
-IRDA_DIRS += psion
-endif
-ifeq ($(IRDA_TEKRAM),y)
-IRDA_DIRS += tekram
-endif
-ifeq ($(IRDA_FINDCHIP),y)
-IRDA_DIRS += findchip
-endif
-ifeq ($(IRDA_IRDADUMP),y)
-IRDA_DIRS += irdadump
-endif
-ifeq ($(IRDA_SMCINIT),y)
-IRDA_DIRS += smcinit
-endif
-
-IRDA_UTILS_MAKE_OPT:=-e "DIRS=$(IRDA_DIRS)"
-IRDA_UTILS_MAKE_ENV:=CC=$(TARGET_CC) LD=$(TARGET_LD) AR=$(TARGET_AR) RANLIB=$(TARGET_RANLIB) ROOT=$(TARGET_DIR) PREFIX=$(TARGET_DIR)
-
-# Since there is no configure-script
-
-$(IRDA_UTILS_DIR)/.configured: $(IRDA_UTILS_DIR)/.patched
-	touch $@
-
-irda-utils: uclibc $(DL_DIR)/$(IRDA_UTILS_SOURCE) $(IRDA_UTILS_DIR)/.installed
-
-irda-utils-clean: $(IRDA_UTILS_DIR)/.clean
-
-irda-utils-dirclean: $(IRDA_UTILS_DIR)/.dirclean
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_IRDA_UTILS),y)
-TARGETS+=irda-utils
-endif
-- 
1.6.3.3
