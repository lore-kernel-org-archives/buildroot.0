From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Sep 2009 19:28:07 +0200
Subject: [Buildroot] [git commit master] package/: remove unused /
	unreferenced udhcp package
Message-ID: <20090919172940.3111977767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=72cdec0a4345796753edbc83e1e67d1f3153983a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Udhcp got integrated into busybox a long time ago, and the udhcp package
wasn't even included in package/Config.in, so it couldn't be used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udhcp/Config.in                 |    7 ---
 package/udhcp/udhcp-gcc_complains.patch |   11 -----
 package/udhcp/udhcp.mk                  |   74 -------------------------------
 3 files changed, 0 insertions(+), 92 deletions(-)
 delete mode 100644 package/udhcp/Config.in
 delete mode 100644 package/udhcp/udhcp-gcc_complains.patch
 delete mode 100644 package/udhcp/udhcp.mk

diff --git a/package/udhcp/Config.in b/package/udhcp/Config.in
deleted file mode 100644
index b16a644..0000000
--- a/package/udhcp/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_UDHCP
-	bool "udhcp"
-	help
-	  An embedded dhcp server/client package that strives to be
-	  fully functional, RFC compliant, and really tiny.
-
-	  http://udhcp.busybox.net/
diff --git a/package/udhcp/udhcp-gcc_complains.patch b/package/udhcp/udhcp-gcc_complains.patch
deleted file mode 100644
index 3b4f9bc..0000000
--- a/package/udhcp/udhcp-gcc_complains.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- udhcp-0.9.8/dhcpc.c.orig	2005-11-24 01:41:48.000000000 +1000
-+++ udhcp-0.9.8/dhcpc.c	2005-11-24 01:44:16.000000000 +1000
-@@ -132,6 +132,8 @@
- 		state = INIT_SELECTING;
- 		break;
- 	case INIT_SELECTING:
-+	default:
-+		break;
- 	}
- 
- 	/* start things over */
diff --git a/package/udhcp/udhcp.mk b/package/udhcp/udhcp.mk
deleted file mode 100644
index 0a50ca4..0000000
--- a/package/udhcp/udhcp.mk
+++ /dev/null
@@ -1,74 +0,0 @@
-#############################################################
-#
-# uchdp DHCP client and/or server
-#
-#############################################################
-# Copyright (C) 2001-2005 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
-UDHCP_VERSION:=0.9.8
-UDHCP_SOURCE:=udhcp-$(UDHCP_VERSION).tar.gz
-UDHCP_SITE:=http://udhcp.busybox.net/downloads/
-UDHCP_DIR:=$(BUILD_DIR)/udhcp-$(UDHCP_VERSION)
-
-$(DL_DIR)/$(UDHCP_SOURCE):
-	$(call DOWNLOAD,$(UDHCP_SITE),$(UDHCP_SOURCE))
-
-udhcp-source: $(DL_DIR)/$(UDHCP_SOURCE)
-
-$(UDHCP_DIR)/.unpacked: $(DL_DIR)/$(UDHCP_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(UDHCP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(SED) 's/-Os -fomit-frame-pointer/$(TARGET_CFLAGS)/' $(UDHCP_DIR)/Makefile
-	toolchain/patch-kernel.sh $(UDHCP_DIR) package/udhcp/ udhcp\*.patch
-	touch $(UDHCP_DIR)/.unpacked
-
-#$(UDHCP_DIR)/.unpacked:
-# (cd $(BUILD_DIR); \
-# CVS_PASSFILE=$(CVS_PASSFILE) \
-# cvs -z3 -d:pserver:anonymous at busybox.net:/var/cvs co udhcp )
-# touch $(UDHCP_DIR)/.unpacked
-
-$(UDHCP_DIR)/udhcpc: $(UDHCP_DIR)/.unpacked
-	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" prefix="$(TARGET_DIR)" -C $(UDHCP_DIR)
-
-$(TARGET_DIR)/sbin/udhcpc: $(UDHCP_DIR)/udhcpc
-	-$(SED) 's/pump/udhcpc/' $(TARGET_DIR)/etc/pcmcia/network*
-	-$(SED) 's/PUMP/UDHCPC/' $(TARGET_DIR)/etc/pcmcia/network*
-	-$(SED) 's/DHCP="n"/DHCP="y"/' $(TARGET_DIR)/etc/pcmcia/network*
-	mkdir -p $(TARGET_DIR)/sbin
-	rm -f $(TARGET_DIR)/sbin/udhcpc
-	cp $(UDHCP_DIR)/udhcpc $(TARGET_DIR)/sbin/
-	mkdir -p $(TARGET_DIR)/usr/share/udhcpc
-	cp $(UDHCP_DIR)/samples/simple.script $(TARGET_DIR)/usr/share/udhcpc/default.script
-	chmod a+x $(TARGET_DIR)/sbin/udhcpc $(TARGET_DIR)/usr/share/udhcpc/default.script
-
-udhcp: $(TARGET_DIR)/sbin/udhcpc
-
-udhcp-clean:
-	rm -f $(TARGET_DIR)/sbin/udhcpc
-	-$(MAKE) -C $(UDHCP_DIR) clean
-
-udhcp-dirclean:
-	rm -rf $(UDHCP_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_UDHCP),y)
-TARGETS+=udhcp
-endif
-- 
1.6.3.3
