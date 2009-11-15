From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Nov 2009 22:54:25 +0100
Subject: [Buildroot] [git commit master] openntpd: convert to
	Makefile.autotools.in format
Message-ID: <20091115223027.7565E77785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=26073d2aa7d6f0406a4df616993d58441a239c96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #713

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    9 +++--
 package/openntpd/openntpd.mk |   82 +++++------------------------------------
 2 files changed, 15 insertions(+), 76 deletions(-)

diff --git a/CHANGES b/CHANGES
index 21e1c20..2cfa390 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,10 +8,10 @@
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libelf, libevent, libglib2, liblockfile, libmad, libpcap, libupnp,
 	libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp, ncurses,
-	netkittelnet, netsnmp, ntfs-3g, openssl, php, python, quagga, radvd,
-	rsync, samba, sawman, shared-mime-info, speech-tools, sqlite,
-	squashfs, synergy, syslinux, tcpdump, u-boot, util-linux, valgrind,
-	vsftpd, wipe
+	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python,
+	quagga, radvd, rsync, samba, sawman, shared-mime-info, speech-tools,
+	sqlite, squashfs, synergy, syslinux, tcpdump, u-boot, util-linux,
+	valgrind, vsftpd, wipe
 
 	wpa-supplicant, xdata_xcursor-themes, zlib
 
@@ -38,6 +38,7 @@
 	#665: [PATCH] Samba package
 	#667: [PATCH] e2fsprogs
 	#709: Bump lighttpd package to 1.4.24
+	#713: Migrate openntpd package to Makefile.autotools.in
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 5ea743c..c42ed9c 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -3,79 +3,17 @@
 # OpenNTPD
 #
 #############################################################
-OPENNTPD_VERSION:=3.9p1
-OPENNTPD_SOURCE:=openntpd-$(OPENNTPD_VERSION).tar.gz
-OPENNTPD_SITE:=ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
-OPENNTPD_DIR:=$(BUILD_DIR)/openntpd-$(OPENNTPD_VERSION)
-OPENNTPD_CAT:=$(ZCAT)
-OPENNTPD_BINARY:=ntpd
-OPENNTPD_TARGET_BINARY:=usr/sbin/ntpd
 
-$(DL_DIR)/$(OPENNTPD_SOURCE):
-	$(call DOWNLOAD,$(OPENNTPD_SITE),$(OPENNTPD_SOURCE))
+OPENNTPD_VERSION = 3.9p1
+OPENNTPD_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
+OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
+OPENNTPD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(OPENNTPD_DIR)/.source: $(DL_DIR)/$(OPENNTPD_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(OPENNTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	#mv $(BUILD_DIR)/ntpd $(OPENNTPD_DIR)
-	touch $@
+$(eval $(call AUTOTARGETS,package,openntpd))
 
-$(OPENNTPD_DIR)/.configured: $(OPENNTPD_DIR)/.source
-	(cd $(OPENNTPD_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--mandir=/usr/share/man \
-		--with-builtin-arc4random \
-	)
-	touch $@
-
-$(OPENNTPD_DIR)/$(OPENNTPD_BINARY): $(OPENNTPD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(OPENNTPD_DIR)
-	#(cd $(OPENNTPD_DIR); \
-	# $(YACC) parse.y; \
-	# $(TARGET_CC) $(TARGET_CFLAGS) $(CFLAGS_COMBINE) \
-	# $(CFLAGS_WHOLE_PROGRAM) -I$(OPENNTPD_DIR) \
-	# -D__dead="__attribute((__noreturn__))" -DHAVE_INTXX_T=1 \
-	# -include defines.h \
-	# -o $@ \
-	# ntpd.c buffer.c log.c imsg.c ntp.c ntp_msg.c y.tab.c config.c \
-	# server.c client.c sensors.c util.c; \
-	#)
-	$(STRIPCMD) $@
-
-$(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY): $(OPENNTPD_DIR)/$(OPENNTPD_BINARY)
+$(OPENNTPD_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/sbin/ntpd
 	rm -f $(TARGET_DIR)/etc/ntpd.conf
-	$(MAKE) DESTDIR=$(TARGET_DIR) STRIP_OPT="" -C $(OPENNTPD_DIR) install
-	-$(STRIPCMD) $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
-	cp -af $(OPENNTPD_DIR)/ntpd.conf $(TARGET_DIR)/etc/ntpd.conf
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -Rf $(TARGET_DIR)/usr/share/man
-endif
-
-ntpd: $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
-
-ntpd-source: $(DL_DIR)/$(OPENNTPD_SOURCE)
-
-ntpd-clean:
-	rm -f $(addprefix $(TARGET_DIR)/,etc/ntpd.conf \
-					 usr/share/man/man?/ntpd* \
-					 $(OPENNTPD_TARGET_BINARY))
-	-$(MAKE) -C $(OPENNTPD_DIR) clean
-
-ntpd-dirclean:
-	rm -rf $(OPENNTPD_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_OPENNTPD),y)
-TARGETS+=ntpd
-endif
+	rm -f $(TARGET_DIR)/usr/share/man/man?/ntpd*
+	rm -f $(OPENNTPD_TARGET_INSTALL_TARGET) $(OPENNTPD_HOOK_POST_INSTALL)
-- 
1.6.3.3
