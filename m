From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 24 Nov 2006 07:33:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  stunnel
Message-ID: <20061124153304.CFCE2485C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-24 07:33:04 -0800 (Fri, 24 Nov 2006)
New Revision: 16657

Log:
- add stunnel package. Thanks to Crispin Wellington


Added:
   trunk/buildroot/package/stunnel/
   trunk/buildroot/package/stunnel/Config.in
   trunk/buildroot/package/stunnel/stunnel-have-pty.patch
   trunk/buildroot/package/stunnel/stunnel.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-11-24 15:06:28 UTC (rev 16656)
+++ trunk/buildroot/package/Config.in	2006-11-24 15:33:04 UTC (rev 16657)
@@ -130,6 +130,7 @@
 source "package/socat/Config.in"
 source "package/sqlite/Config.in"
 source "package/strace/Config.in"
+source "package/stunnel/Config.in"
 source "package/sudo/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"

Added: trunk/buildroot/package/stunnel/Config.in
===================================================================
--- trunk/buildroot/package/stunnel/Config.in	2006-11-24 15:06:28 UTC (rev 16656)
+++ trunk/buildroot/package/stunnel/Config.in	2006-11-24 15:33:04 UTC (rev 16657)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_STUNNEL
+	bool "stunnel"
+	default n
+	help
+	  Stunnel is a utility that utilised OpenSSL to wrap plaintext TCP communications with SSL. Can be used to secure a programmes insecure network communications.

Added: trunk/buildroot/package/stunnel/stunnel-have-pty.patch
===================================================================
--- trunk/buildroot/package/stunnel/stunnel-have-pty.patch	2006-11-24 15:06:28 UTC (rev 16656)
+++ trunk/buildroot/package/stunnel/stunnel-have-pty.patch	2006-11-24 15:33:04 UTC (rev 16657)
@@ -0,0 +1,15 @@
+--- stunnel-4.16/configure.ac.orig	2006-08-20 04:28:14.000000000 +0800
++++ stunnel-4.16/configure.ac	2006-11-24 10:17:01.053905560 +0800
+@@ -45,8 +45,10 @@
+     AC_DEFINE(socklen_t, int))
+ 
+ AC_MSG_NOTICE([**************************************** PTY device files])
+-AC_CHECK_FILE("/dev/ptmx", AC_DEFINE(HAVE_DEV_PTMX))
+-AC_CHECK_FILE("/dev/ptc", AC_DEFINE(HAVE_DEV_PTS_AND_PTC))
++#AC_CHECK_FILE("/dev/ptmx", AC_DEFINE(HAVE_DEV_PTMX))
++#AC_CHECK_FILE("/dev/ptc", AC_DEFINE(HAVE_DEV_PTS_AND_PTC))
++AC_DEFINE(HAVE_DEV_PTMX)
++AC_DEFINE(HAVE_DEV_PTS_AND_PTC)
+ 
+ AC_MSG_NOTICE([**************************************** entropy])
+ 

Added: trunk/buildroot/package/stunnel/stunnel.mk
===================================================================
--- trunk/buildroot/package/stunnel/stunnel.mk	2006-11-24 15:06:28 UTC (rev 16656)
+++ trunk/buildroot/package/stunnel/stunnel.mk	2006-11-24 15:33:04 UTC (rev 16657)
@@ -0,0 +1,81 @@
+#############################################################
+#
+# stunnel
+#
+#############################################################
+STUNNEL_VER:=4.16
+STUNNEL_SOURCE:=stunnel-$(STUNNEL_VER).tar.gz
+STUNNEL_SITE:=http://www.stunnel.org/download/stunnel/src
+STUNNEL_CAT:=$(ZCAT)
+STUNNEL_DIR:=$(BUILD_DIR)/stunnel-$(STUNNEL_VER)
+
+$(DL_DIR)/$(STUNNEL_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(STUNNEL_SITE)/$(STUNNEL_SOURCE)
+
+stunnel-source: $(DL_DIR)/$(STUNNEL_SOURCE)
+
+$(STUNNEL_DIR)/.unpacked: $(DL_DIR)/$(STUNNEL_SOURCE)
+	$(STUNNEL_CAT) $(DL_DIR)/$(STUNNEL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(STUNNEL_DIR)
+	toolchain/patch-kernel.sh $(STUNNEL_DIR) package/stunnel stunnel\*.patch
+	touch $(STUNNEL_DIR)/*
+	touch $(STUNNEL_DIR)/.unpacked
+
+$(STUNNEL_DIR)/.configured: $(STUNNEL_DIR)/.unpacked
+	(cd $(STUNNEL_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS=-L$(STAGING_DIR)/lib \
+		ac_cv_file___dev_ptmx_=yes \
+		ac_cv_file___dev_ptc_=no \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--with-random=/dev/urandom \
+		--disable-libwrap \
+		--with-ssl=$(STAGING_DIR) \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+	);
+	touch $(STUNNEL_DIR)/.configured
+
+$(STUNNEL_DIR)/src/stunnel: $(STUNNEL_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(STUNNEL_DIR)
+
+$(TARGET_DIR)/usr/bin/stunnel: $(STUNNEL_DIR)/src/stunnel
+	install -c $(STUNNEL_DIR)/src/stunnel $(TARGET_DIR)/usr/bin/stunnel
+	$(STRIP) $(TARGET_DIR)/usr/bin/stunnel > /dev/null 2>&1
+ifeq ($(strip $(BR2_CROSS_TOOLCHAIN_TARGET_UTILS)),y)
+	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
+	install -c $(TARGET_DIR)/usr/bin/stunnel \
+		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/stunnel
+endif
+
+stunnel: uclibc $(TARGET_DIR)/usr/bin/stunnel 
+
+stunnel-clean: 
+	$(MAKE) -C $(STUNNEL_DIR) clean
+
+stunnel-dirclean: 
+	rm -rf $(STUNNEL_DIR) 
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_STUNNEL)),y)
+TARGETS+=stunnel
+endif
