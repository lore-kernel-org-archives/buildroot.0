From: Arnar Mar Sig <antab@valka.is>
Date: Mon, 17 Dec 2007 07:54:03 +0000
Subject: [Buildroot] Patch: Add package for minicom
Message-ID: <582EFA10-CF0A-4BFB-A2C8-262185BCA5F3@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for minicom  a menu driven communications  
program.
It creates a menu named "Terminal applications" and there under is  
minicom. Build and tested with avr32, and will test  with i386 soon.

I will be maintaining and supporting avr32 and i386 builds of this  
package.

Index: package/Config.in
===================================================================
--- package/Config.in	(revision 20654)
+++ package/Config.in	(working copy)
@@ -427,4 +427,14 @@
source "package/lxdoom/Config.in"
endif

+menuconfig BR2_TERMINAL
+	bool "Terminal applications"
+	default y
+	help
+	  Terminal applications
+
+if BR2_TERMINAL
+source "package/minicom/Config.in"
+endif
+
endmenu
Index: package/minicom/Config.in
===================================================================
--- package/minicom/Config.in	(revision 0)
+++ package/minicom/Config.in	(revision 0)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MINICOM
+	bool "Minicom"
+	default n
+	depends BR2_PACKAGE_NCURSES
+'	help
+		Minicom is a menu driven communications program. It
+		emulates ANSI and VT102 terminals. It has a dialing
+		directory and auto zmodem download.
+
+		http://alioth.debian.org/projects/minicom/
Index: package/minicom/minicom.mk
===================================================================
--- package/minicom/minicom.mk	(revision 0)
+++ package/minicom/minicom.mk	(revision 0)
@@ -0,0 +1,83 @@
+ 
###############################################################################
+# Copyright (C) 2007 by Valka ehf <valka@valka.is>
+# maintained by Arnar Mar Sig <antab@valka.is>
+# $Id: $
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU Library General Public License as
+# published by the Free Software Foundation; either version 2 of the
+# License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# Library General Public License for more details.
+#
+# You should have received a copy of the GNU Library General Public
+# License along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+# USA
+
+# TARGETS
+MINICOM_VERSION:=2.3-rc1
+MINICOM_SOURCE:=minicom-$(MINICOM_VERSION).tar.gz
+MINICOM_SITE:=http://alioth.debian.org/frs/download.php/2157/
+MINICOM_DIR=$(BUILD_DIR)/minicom-$(MINICOM_VERSION)
+
+$(DL_DIR)/$(MINICOM_SOURCE):
+	$(WGET) -P $(DL_DIR) $(MINICOM_SITE)/$(MINICOM_SOURCE)
+
+$(MINICOM_DIR)/.source: $(DL_DIR)/$(MINICOM_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(MINICOM_SOURCE) | tar -C $(BUILD_DIR) $ 
(TAR_OPTIONS) -
+	touch $@
+
+$(MINICOM_DIR)/.configured: $(MINICOM_DIR)/.source
+	(cd $(MINICOM_DIR); rm -rf config.cache; \
+		BUILD_CC="$(HOSTCC)" \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/lib \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--disable-rpath \
+		$(DISABLE_NLS) \
+	)
+	touch $@
+
+$(MINICOM_DIR)/.build: $(MINICOM_DIR)/.configured
+	echo $(TARGET_DIR)/usr/bin/minicom
+	echo "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
+	$(MAKE) -C $(MINICOM_DIR)
+	touch $@
+
+$(TARGET_DIR)/usr/bin/minicom: $(MINICOM_DIR)/.build
+	echo "yeah#########################################################"
+	$(MAKE) -C $(MINICOM_DIR) DESTDIR=$(TARGET_DIR) install
+
+minicom: uclibc ncurses $(TARGET_DIR)/usr/bin/minicom
+
+minicom-source: $(DL_DIR)/$(MINICOM_SOURCE)
+
+minicom-clean:
+	-$(MAKE) -C $(MINICOM_DIR) clean
+
+minicom-distclean:
+	rm -rf $(MINICOM_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MINICOM)),y)
+TARGETS+=minicom
+endif
+
