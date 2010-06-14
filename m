From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 14 Jun 2010 10:16:14 +0200
Subject: [Buildroot] PATCH  [1/1]  New package  ebtables
Message-ID: <1E85353ABB7D4F10B2D683F4863E7C6E@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Added ebtables to the buildroot system
ebtables is the bridge filetering tool.
 
 
 
--- buildroot-2010.05/package/Config.in 2010-05-30 22:24:10.000000000 +0200
+++ buildroot/package/Config.in 2010-06-13 19:06:17.000000000 +0200
@@ -354,6 +354,7 @@ source "package/dhcp/Config.in"
 endif
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
+source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
diff -rupN buildroot-2010.05/package/ebtables/Config.in
buildroot/package/ebtables/Config.in
--- buildroot-2010.05/package/ebtables/Config.in 1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/ebtables/Config.in 2010-06-13 19:10:16.000000000 +0200
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_EBTABLES
+ bool "ebtables"
+ help
+   Linux kernel bridge filtering tools.
+   http://sourceforge.net/projects/ebtables/
diff -rupN buildroot-2010.05/package/ebtables/ebtables.mk
buildroot/package/ebtables/ebtables.mk
--- buildroot-2010.05/package/ebtables/ebtables.mk 1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/ebtables/ebtables.mk 2010-06-13 19:10:16.000000000
+0200
@@ -0,0 +1,28 @@
+#############################################################
+#
+# ebtables
+#
+#############################################################
+EBTABLES_VERSION = v2.0.9-2
+EBTABLES_SOURCE = ebtables-$(EBTABLES_VERSION).tar.gz
+EBTABLES_SITE =
http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-2-0-9-2
+
+define EBTABLES_BUILD_CMDS
+ $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
+endef
+
+define EBTABLES_INSTALL_TARGET_CMDS
+ mkdir -p $(TARGET_DIR)/usr/lib
+ cp -dpf $(@D)/ebtables $(TARGET_DIR)/usr/bin
+ cp -dpf $(@D)/ebtables-restore $(TARGET_DIR)/usr/bin
+ cp -dpf $(@D)/*.so $(TARGET_DIR)/usr/lib
+ cp -dpf $(@D)/extensions/*.so $(TARGET_DIR)/usr/lib
+endef
+
+define EBTABLES_INSTALL_STAGING_CMDS
+ cp -dpf $(@D)/include/*.h $(STAGING_DIR)/usr/include
+ cp -dpf $(@D)/*.so $(STAGING_DIR)/usr/lib/
+ cp -dpf $(@D)/extensions/*.so $(STAGING_DIR)/usr/lib/
+endef
+
+$(eval $(call GENTARGETS,package,ebtables))

 
 
 
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100614/be50dabd/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ebtables.patch
Type: application/octet-stream
Size: 2054 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100614/be50dabd/attachment.obj>
