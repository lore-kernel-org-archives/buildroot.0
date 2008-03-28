From: jspence at uclibc.org <jspence@uclibc.org>
Date: Thu, 27 Mar 2008 19:54:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  udpcast
Message-ID: <20080328025442.9F6123C32C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jspence
Date: 2008-03-27 19:54:42 -0700 (Thu, 27 Mar 2008)
New Revision: 21526

Log:
Added udpcast package.

Added:
   trunk/buildroot/package/udpcast/
   trunk/buildroot/package/udpcast/Config.in
   trunk/buildroot/package/udpcast/udpcast.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-03-28 02:50:42 UTC (rev 21525)
+++ trunk/buildroot/package/Config.in	2008-03-28 02:54:42 UTC (rev 21526)
@@ -205,6 +205,7 @@
 # ATTENTION! This was merged into busybox!
 #source "package/udhcp/Config.in"
 #endif
+source "package/udpcast/Config.in"
 source "package/vpnc/Config.in"
 source "package/vtun/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

Added: trunk/buildroot/package/udpcast/Config.in
===================================================================
--- trunk/buildroot/package/udpcast/Config.in	                        (rev 0)
+++ trunk/buildroot/package/udpcast/Config.in	2008-03-28 02:54:42 UTC (rev 21526)
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_UDPCAST
+        bool "udpcast"
+        default n
+        help
+          A multicast protocol implementation which happens to
+          be very handy for imaging drives over the network.
+
+          http://www.udpcast.linux.lu/
+
+menu "udpcast tools selection"
+        depends on BR2_PACKAGE_UDPCAST
+
+config BR2_PACKAGE_UDPCAST_SENDER
+        bool "sender"
+        default n
+        depends on BR2_PACKAGE_UDPCAST
+        help
+          The udpcast transmitter.
+
+config BR2_PACKAGE_UDPCAST_RECEIVER
+        bool "receiver"
+        default n
+        depends on BR2_PACKAGE_UDPCAST
+        help
+          The udpcast receiver.
+
+endmenu

Added: trunk/buildroot/package/udpcast/udpcast.mk
===================================================================
--- trunk/buildroot/package/udpcast/udpcast.mk	                        (rev 0)
+++ trunk/buildroot/package/udpcast/udpcast.mk	2008-03-28 02:54:42 UTC (rev 21526)
@@ -0,0 +1,99 @@
+#############################################################
+#
+# udpcast
+#
+#############################################################
+UDPCAST_VERSION:=20071228
+UDPCAST_SOURCE:=udpcast-$(UDPCAST_VERSION).tar.gz
+UDPCAST_SITE:=http://www.udpcast.linux.lu/download
+UDPCAST_CAT:=$(ZCAT)
+UDPCAST_DIR:=$(BUILD_DIR)/udpcast-$(UDPCAST_VERSION)
+
+BR2_UDPCAST_CFLAGS:=
+
+$(DL_DIR)/$(UDPCAST_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(UDPCAST_SITE)/$(UDPCAST_SOURCE)
+
+udpcast-source: $(DL_DIR)/$(UDPCAST_SOURCE)
+
+$(UDPCAST_DIR)/.unpacked: $(DL_DIR)/$(UDPCAST_SOURCE)
+	$(UDPCAST_CAT) $(DL_DIR)/$(UDPCAST_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(UDPCAST_DIR) package/udpcast udpcast\*.patch
+	$(CONFIG_UPDATE) $(UDPCAST_DIR)
+	touch $(UDPCAST_DIR)/.unpacked
+
+$(UDPCAST_DIR)/.configured: $(UDPCAST_DIR)/.unpacked
+	(cd $(UDPCAST_DIR); rm -rf config.cache; \
+		$(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		CFLAGS="$(TARGET_CFLAGS) $(BR2_UDPCAST_CFLAGS)" \
+		./configure \
+		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/lib \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		$(DISABLE_NLS) \
+	)
+	touch $(UDPCAST_DIR)/.configured
+
+UDPCAST_BINARIES:=udp-sender udp-receiver
+
+UDPCAST_BUILD_TARGETS:=$(addprefix $(UDPCAST_DIR)/,$(UDPCAST_BINARIES))
+
+$(UDPCAST_BUILD_TARGETS): $(UDPCAST_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(UDPCAST_DIR)
+
+UDPCAST_PROGS:=$(addprefix $(TARGET_DIR)/usr/sbin/,$(UDPCAST_BINARIES))
+
+UDPCAST_INSTALL_MANPAGES=$(addprefix $(TARGET_DIR)/usr/man/, $(addsuffix .1,$(UDPCAST_BINARIES)))
+
+UDPCAST_INSTALL_FILES:=$(UDPCAST_PROGS) $(UDPCAST_INSTALL_MANPAGES)
+
+$(UDPCAST_PROGS): $(UDPCAST_BUILD_TARGETS)
+	$(MAKE) -C $(UDPCAST_DIR) DESTDIR=$(TARGET_DIR) install
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(REMOVE_SECTION_COMMENT) \
+	  $(REMOVE_SECTION_NOTE) \
+	  $(UDPCAST_PROGS)
+ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
+	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
+	rm -f $(TARGET_DIR)/usr/sbin/udp-sender.1
+endif
+ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
+	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver
+	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver.1
+endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -f $(addprefix $(TARGET_DIR)/usr/man/, \
+		$(addsuffix .1,$(UDPCAST_BINARIES)))
+endif
+
+udpcast: uclibc $(UDPCAST_PROGS)
+
+udpcast-clean:
+	rm -f $(UDPCAST_INSTALL_FILES)
+	$(MAKE) -C $(UDPCAST_DIR) clean
+	rm -f $(UDPCAST_DIR)/.configured
+
+udpcast-dirclean:
+	rm -rf $(UDPCAST_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_UDPCAST)),y)
+TARGETS+=udpcast
+endif
