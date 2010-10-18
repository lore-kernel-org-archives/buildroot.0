From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 11:30:31 +0200
Subject: [Buildroot] [git commit master 1/1] pppd: convert to gentargets,
	properly add radius support, fix l2tp for 2.6.35 headers
Message-ID: <20101018093104.1E5248C9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61e61aebce3316f55725d114240a206210188114
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |   14 ++--
 package/pppd/Config.in                       |    6 ++
 package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch |   24 ++++++++
 package/pppd/pppd.mk                         |   77 ++++++++++++++++++--------
 4 files changed, 91 insertions(+), 30 deletions(-)
 create mode 100644 package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch

diff --git a/CHANGES b/CHANGES
index 72b7913..6d982be 100644
--- a/CHANGES
+++ b/CHANGES
@@ -39,13 +39,13 @@
 	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
 	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
 	openssh, openssl, openvpn, oprofile, pango, patch, pcre, php,
-	pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga, samba,
-	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
-	speex, sqlite, squashfs, startup-notification, strace,
-	sylpheed, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev,
-	udpcast, usbmount, usbutils, vsftpd, vtun, which,
-	wpa_supplicant, xapp_twm, xapp_xbacklight, xapp_xcursorgen,
-	xapp_xinput, xapp_xmore,
+	pkg-config, pppd, prboom, radvd, rdesktop, ruby, qt, quagga,
+	samba, sawman, sdl_mixer, sdl_sound, setserial,
+	shared-mime-info, speex, sqlite, squashfs,
+	startup-notification, strace, sylpheed, taglib, tcpdump,
+	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount,
+	usbutils, vsftpd, vtun, which, wpa_supplicant, xapp_twm,
+	xapp_xbacklight, xapp_xcursorgen, xapp_xinput, xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index daca876..879b263 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -13,3 +13,9 @@ config BR2_PACKAGE_PPPD_FILTER
 	  Packet filtering abilities for pppd. If enabled,
 	  the pppd active-filter and pass-filter options
 	  are available.
+
+config BR2_PACKAGE_PPPD_RADIUS
+	depends on BR2_PACKAGE_PPPD
+	bool "radius"
+	help
+	  Install RADIUS support for pppd
diff --git a/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch b/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch
new file mode 100644
index 0000000..0e71e24
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch
@@ -0,0 +1,24 @@
+--- ppp-2.4.5/include/linux/if_pppol2tp.h       2009-11-16 22:26:07.000000000 +0000
++++ ppp-2.4.5/include/linux/if_pppol2tp.h       2010-07-16 22:35:22.000000000 +0100
+@@ -32,6 +32,20 @@
+  	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
+ };
+
++/* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
++ * bits. So we need a different sockaddr structure.
++ */
++struct pppol2tpv3_addr {
++       pid_t   pid;                    /* pid that owns the fd.
++                                        * 0 => current */
++       int     fd;                     /* FD of UDP or IP socket to use */
++
++       struct sockaddr_in addr;        /* IP address and port to send to */
++
++       __u32 s_tunnel, s_session;      /* For matching incoming packets */
++       __u32 d_tunnel, d_session;      /* For sending outgoing packets */
++};
++
+ /* Socket options:
+  * DEBUG	- bitmask of debug message categories
+  * SENDSEQ	- 0 => don't send packets with sequence numbers
+
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 35fd451..05c1c32 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -9,7 +9,10 @@ PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),chat pppd pppdump pppstats)
-PPPD_MAKE = $(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_MAKE_OPT)
+PPPD_RADIUS_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),pppd-radattr pppd-radius)
+PPPD_RADIUS_CONF = dictionary dictionary.ascend dictionary.compat \
+			dictionary.merit dictionary.microsoft \
+			issue port-id-map realms server radiusclient.conf
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
 	PPPD_DEPENDENCIES += libpcap
@@ -20,15 +23,56 @@ ifeq ($(BR2_INET_IPV6),y)
 	PPPD_MAKE_OPT += HAVE_INET6=y
 endif
 
-$(eval $(call AUTOTARGETS,package,pppd))
-
-$(PPPD_HOOK_POST_EXTRACT):
+define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
-	touch $@
+	( cd $(@D); ./configure )
+endef
+
+define PPPD_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
+		-C $(@D) $(PPPD_MAKE_OPT)
+endef
+
+define PPPD_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(PPPD_TARGET_BINS))
+	rm -f $(TARGET_DIR)/usr/sbin/pppoe-discovery
+	rm -rf $(TARGET_DIR)/usr/lib/pppd
+	rm -rf $(TARGET_DIR)/etc/ppp/radius
+	for m in $(PPPD_MANPAGES); do \
+		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
+	done
+	for m in $(PPPD_RADIUS_MANPAGES); do \
+		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
+	done
+endef
+
+ifeq ($(BR2_PACKAGE_PPPD_RADIUS),y)
+define PPPD_INSTALL_RADIUS
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radius.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radius.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radrealms.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radrealms.so
+	for m in $(PPPD_RADIUS_CONF); do \
+		$(INSTALL) -m 644 -D $(PPPD_DIR)/pppd/plugins/radius/etc/$$m \
+			$(TARGET_DIR)/etc/ppp/radius/$$m; \
+	done
+	$(SED) 's:/usr/local/etc:/etc:' \
+		$(TARGET_DIR)/etc/ppp/radius/radiusclient.conf
+	$(SED) 's:/usr/local/sbin:/usr/sbin:' \
+		$(TARGET_DIR)/etc/ppp/radius/radiusclient.conf
+	$(SED) 's:/etc/radiusclient:/etc/ppp/radius:g' \
+		$(TARGET_DIR)/etc/ppp/radius/*
+	for m in $(PPPD_RADIUS_MANPAGES); do \
+		$(INSTALL) -m 644 -D $(PPPD_DIR)/pppd/plugins/radius/$$m.8 \
+			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
+	done
+endef
+endif
 
-$(PPPD_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
+define PPPD_INSTALL_TARGET_CMDS
 	for sbin in $(PPPD_TARGET_BINS); do \
 		$(INSTALL) -D $(PPPD_DIR)/$$sbin/$$sbin \
 			$(TARGET_DIR)/usr/sbin/$$sbin; \
@@ -51,24 +95,11 @@ $(PPPD_TARGET_INSTALL_TARGET):
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/openl2tp.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/pppol2tp.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppol2tp.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radius.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radius.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radrealms.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radrealms.so
+	$(PPPD_INSTALL_RADIUS)
 	for m in $(PPPD_MANPAGES); do \
 		$(INSTALL) -m 644 -D $(PPPD_DIR)/$$m/$$m.8 \
 			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
 	done
-	touch $@
+endef
 
-$(PPPD_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(PPPD_TARGET_BINS))
-	rm -f $(TARGET_DIR)/usr/sbin/pppoe-discovery
-	for m in $(PPPD_MANPAGES); do \
-		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-	done
-	rm -rf $(TARGET_DIR)/usr/lib/pppd
-	rm -f $(PPPD_TARGET_INSTALL_TARGET) $(PPPD_HOOK_POST_INSTALL)
+$(eval $(call GENTARGETS,package,pppd))
-- 
1.7.1
