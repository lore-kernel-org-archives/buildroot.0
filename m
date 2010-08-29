From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 22:04:02 +0200
Subject: [Buildroot] [git commit master 1/1] stunnel: remove broken package
Message-ID: <20100829200511.417468A301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c5193878189d9d199f3d88df52406a375f3e51e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It doesn't build as there's no dependency on openssl, and it hasn't seen
any real updates since it got added in 2006, so simply remove it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    2 +
 package/Config.in                      |    1 -
 package/stunnel/Config.in              |   12 -----
 package/stunnel/stunnel-have-pty.patch |   15 ------
 package/stunnel/stunnel.mk             |   82 --------------------------------
 5 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 package/stunnel/Config.in
 delete mode 100644 package/stunnel/stunnel-have-pty.patch
 delete mode 100644 package/stunnel/stunnel.mk

diff --git a/CHANGES b/CHANGES
index 5d0b940..317e9e6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,6 +21,8 @@
 	luafilesystem, lzo, netcat, php, proftpd, qt, samba,
 	startup-notification, sysvinit, util-linux
 
+	Removed packages: stunnel
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#635:  util-linux fails to build in 2009.08
diff --git a/package/Config.in b/package/Config.in
index 2b68cab..d8a730d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -420,7 +420,6 @@ source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/squid/Config.in"
-source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tcpreplay/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
deleted file mode 100644
index cd07eee..0000000
--- a/package/stunnel/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-comment "stunnel has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_STUNNEL
-
-config BR2_PACKAGE_STUNNEL
-	bool "stunnel"
-	help
-	  Stunnel is a utility that utilised OpenSSL to wrap plaintext
-	  TCP communications with SSL. Can be used to secure a
-	  programmes insecure network communications.
-
-	  http://www.stunnel.org/
-
diff --git a/package/stunnel/stunnel-have-pty.patch b/package/stunnel/stunnel-have-pty.patch
deleted file mode 100644
index c5490ce..0000000
--- a/package/stunnel/stunnel-have-pty.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- stunnel-4.16/configure.ac.orig	2006-08-20 04:28:14.000000000 +0800
-+++ stunnel-4.16/configure.ac	2006-11-24 10:17:01.053905560 +0800
-@@ -45,8 +45,10 @@
-     AC_DEFINE(socklen_t, int))
- 
- AC_MSG_NOTICE([**************************************** PTY device files])
--AC_CHECK_FILE("/dev/ptmx", AC_DEFINE(HAVE_DEV_PTMX))
--AC_CHECK_FILE("/dev/ptc", AC_DEFINE(HAVE_DEV_PTS_AND_PTC))
-+#AC_CHECK_FILE("/dev/ptmx", AC_DEFINE(HAVE_DEV_PTMX))
-+#AC_CHECK_FILE("/dev/ptc", AC_DEFINE(HAVE_DEV_PTS_AND_PTC))
-+AC_DEFINE(HAVE_DEV_PTMX)
-+AC_DEFINE(HAVE_DEV_PTS_AND_PTC)
- 
- AC_MSG_NOTICE([**************************************** entropy])
- 
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
deleted file mode 100644
index 834ef96..0000000
--- a/package/stunnel/stunnel.mk
+++ /dev/null
@@ -1,82 +0,0 @@
-#############################################################
-#
-# stunnel
-#
-#############################################################
-STUNNEL_VERSION:=4.16
-STUNNEL_SOURCE:=stunnel-$(STUNNEL_VERSION).tar.gz
-STUNNEL_SITE:=http://www.stunnel.org/download/stunnel/src
-STUNNEL_CAT:=$(ZCAT)
-STUNNEL_DIR:=$(BUILD_DIR)/stunnel-$(STUNNEL_VERSION)
-
-$(DL_DIR)/$(STUNNEL_SOURCE):
-	 $(call DOWNLOAD,$(STUNNEL_SITE),$(STUNNEL_SOURCE))
-
-stunnel-source: $(DL_DIR)/$(STUNNEL_SOURCE)
-
-$(STUNNEL_DIR)/.unpacked: $(DL_DIR)/$(STUNNEL_SOURCE)
-	$(STUNNEL_CAT) $(DL_DIR)/$(STUNNEL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(STUNNEL_DIR)
-	toolchain/patch-kernel.sh $(STUNNEL_DIR) package/stunnel stunnel\*.patch
-	touch $(STUNNEL_DIR)/*
-	touch $(STUNNEL_DIR)/.unpacked
-
-$(STUNNEL_DIR)/.configured: $(STUNNEL_DIR)/.unpacked
-	(cd $(STUNNEL_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_file___dev_ptmx_=yes \
-		ac_cv_file___dev_ptc_=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--with-random=/dev/urandom \
-		--disable-libwrap \
-		--with-ssl=$(STAGING_DIR)/usr/ \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $(STUNNEL_DIR)/.configured
-
-$(STUNNEL_DIR)/src/stunnel: $(STUNNEL_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(STUNNEL_DIR)
-
-$(TARGET_DIR)/usr/bin/stunnel: $(STUNNEL_DIR)/src/stunnel
-	install -c $(STUNNEL_DIR)/src/stunnel $(TARGET_DIR)/usr/bin/stunnel
-	$(STRIPCMD) $(TARGET_DIR)/usr/bin/stunnel > /dev/null 2>&1
-ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
-	install -c $(TARGET_DIR)/usr/bin/stunnel \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/stunnel
-endif
-
-stunnel: $(TARGET_DIR)/usr/bin/stunnel
-
-stunnel-clean:
-	-$(MAKE) -C $(STUNNEL_DIR) clean
-	rm -f $(TARGET_DIR)/usr/bin/stunnel
-
-stunnel-dirclean:
-	rm -rf $(STUNNEL_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_STUNNEL),y)
-TARGETS+=stunnel
-endif
-- 
1.7.1
