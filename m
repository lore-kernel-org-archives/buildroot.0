From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 18:22:42 +0200
Subject: [Buildroot] [git commit] dhcpdump: move as a proper package,
	bump version
Message-ID: <20110518180429.D549E83564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=95cf21ef8c098369a54e8bd2ec97f1b56433c928
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dhcpdump 1.7 required tcpdump, but version 1.8 now uses libpcap
instead. Also version 1.8 is no longer autotools based, but just a
simple Makefile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/dhcpdump/Config.in                         |    5 ++
 .../dhcpdump-1.8-use-non-bsd-structures.patch      |   23 +++++++
 package/dhcpdump/dhcpdump.mk                       |   21 +++++++
 package/tcpdump/Config.in                          |    6 --
 package/tcpdump/dhcpdump.mk                        |   62 --------------------
 6 files changed, 50 insertions(+), 68 deletions(-)
 create mode 100644 package/dhcpdump/Config.in
 create mode 100644 package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
 create mode 100644 package/dhcpdump/dhcpdump.mk
 delete mode 100644 package/tcpdump/dhcpdump.mk

diff --git a/package/Config.in b/package/Config.in
index 5e48ab7..1d3c0cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -385,6 +385,7 @@ source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
+source "package/dhcpdump/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
new file mode 100644
index 0000000..1840e34
--- /dev/null
+++ b/package/dhcpdump/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DHCPDUMP
+	bool "dhcpdump"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  A tool for monitoring dhcp requests using tcpdump.
diff --git a/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch b/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
new file mode 100644
index 0000000..40115fb
--- /dev/null
+++ b/package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
@@ -0,0 +1,23 @@
+The udphdr structure has uh_* fields when _FAVOR_BSD is
+defined. Otherwise, the fields are just named source, dest, len and
+check. See <netinet/udp.h>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: dhcpdump-1.8/dhcpdump.c
+===================================================================
+--- dhcpdump-1.8.orig/dhcpdump.c	2011-05-17 20:20:46.506980003 +0200
++++ dhcpdump-1.8/dhcpdump.c	2011-05-17 20:20:59.338979999 +0200
+@@ -163,10 +163,10 @@
+ 	strcpy(ip_origin, (u_char *)inet_ntoa(ip->ip_src));
+ 	strcpy(ip_destination, (u_char *)inet_ntoa(ip->ip_dst));
+ 
+-	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->uh_ulen)))
++	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->len)))
+ 		return;
+ 
+-	printdata((u_char *)(sp + offset), ntohs(udp->uh_ulen));
++	printdata((u_char *)(sp + offset), ntohs(udp->len));
+ }
+ 
+ // check for matching CHADDR (Peter Apian-Bennewitz <apian@ise.fhg.de>)
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
new file mode 100644
index 0000000..cca6749
--- /dev/null
+++ b/package/dhcpdump/dhcpdump.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# dhcpdump
+#
+#############################################################
+
+DHCPDUMP_VERSION = 1.8
+DHCPDUMP_SITE    = http://www.mavetju.org/download/
+DHCPDUMP_SOURCE  = dhcpdump-$(DHCPDUMP_VERSION).tar.gz
+
+DHCPDUMP_DEPENDENCIES = libpcap
+
+define DHCPDUMP_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
+endef
+
+define DHCPDUMP_INSTALL_TARGET_CMDS
+	install -m 0755 -D $(@D)/dhcpdump $(TARGET_DIR)/usr/bin/dhcpdump
+endef
+
+$(eval $(call GENTARGETS,package,dhcpdump))
diff --git a/package/tcpdump/Config.in b/package/tcpdump/Config.in
index 09e2740..c284398 100644
--- a/package/tcpdump/Config.in
+++ b/package/tcpdump/Config.in
@@ -11,9 +11,3 @@ config BR2_PACKAGE_TCPDUMP_SMB
 	depends on BR2_PACKAGE_TCPDUMP
 	help
 	  enable possibly-buggy SMB printer
-
-config BR2_PACKAGE_DHCPDUMP
-	bool "dhcpdump"
-	select BR2_PACKAGE_LIBPCAP
-	help
-	  A tool for monitoring dhcp requests using tcpdump.
diff --git a/package/tcpdump/dhcpdump.mk b/package/tcpdump/dhcpdump.mk
deleted file mode 100644
index 0b2d64a..0000000
--- a/package/tcpdump/dhcpdump.mk
+++ /dev/null
@@ -1,62 +0,0 @@
-#############################################################
-#
-# dhcpdump
-#
-#############################################################
-# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-
-DHCPDUMP_VERSION:=1.7
-DHCPDUMP_DIR:=$(BUILD_DIR)/dhcpdump-$(DHCPDUMP_VERSION)
-DHCPDUMP_SITE:=http://www.mavetju.org/download/
-DHCPDUMP_SOURCE:=dhcpdump-$(DHCPDUMP_VERSION).tar.gz
-DHCPDUMP_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(DHCPDUMP_SOURCE):
-	 $(call DOWNLOAD,$(DHCPDUMP_SITE),$(DHCPDUMP_SOURCE))
-
-dhcpdump-source: $(DL_DIR)/$(DHCPDUMP_SOURCE)
-
-$(DHCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(DHCPDUMP_SOURCE)
-	$(DHCPDUMP_CAT) $(DL_DIR)/$(DHCPDUMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(DHCPDUMP_DIR)/.configured: $(DHCPDUMP_DIR)/.unpacked
-	(cd $(DHCPDUMP_DIR); rm -f config.cache; \
-		BUILD_CC="$(TARGET_CC)" HOSTCC="$(HOSTCC)" \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-	)
-	touch $@
-
-$(DHCPDUMP_DIR)/dhcpdump: $(DHCPDUMP_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(DHCPDUMP_DIR)
-
-$(TARGET_DIR)/usr/sbin/dhcpdump: $(DHCPDUMP_DIR)/dhcpdump
-	cp -af $< $@
-
-dhcpdump: zlib libpcap $(TARGET_DIR)/usr/sbin/dhcpdump
-
-dhcpdump-clean:
-	rm -f $(TARGET_DIR)/usr/sbin/dhcpdump
-	-$(MAKE) -C $(DHCPDUMP_DIR) clean
-
-dhcpdump-dirclean:
-	rm -rf $(DHCPDUMP_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DHCPDUMP),y)
-TARGETS+=dhcpdump
-endif
-- 
1.7.3.4
