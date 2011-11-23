From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Nov 2011 12:30:11 +0100
Subject: [Buildroot] [PATCH 3/3] Migrate the packages to the new infra
In-Reply-To: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1322047811-12933-4-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/at/at.mk                                 |    7 +------
 package/avahi/avahi.mk                           |    8 ++------
 package/busybox/busybox.mk                       |   13 ++++++-------
 package/dbus/dbus.mk                             |    3 ++-
 package/dhcp/dhcp.mk                             |    6 ++----
 package/dropbear/dropbear.mk                     |    6 ++----
 package/gdk-pixbuf/gdk-pixbuf.mk                 |    6 +-----
 package/gpsd/gpsd.mk                             |    2 +-
 package/input-event-daemon/input-event-daemon.mk |    4 +---
 package/multimedia/mpd/mpd.mk                    |    3 +--
 package/netplug/netplug.mk                       |    2 +-
 package/netsnmp/netsnmp.mk                       |    6 +++---
 package/nfs-utils/nfs-utils.mk                   |    4 ++--
 package/ntp/ntp.mk                               |    6 ++++--
 package/olsr/olsr.mk                             |    3 +--
 package/openssh/openssh.mk                       |    7 +------
 package/pango/pango.mk                           |    9 ++-------
 package/portmap/portmap.mk                       |    3 +--
 package/proftpd/proftpd.mk                       |    4 ++--
 package/radvd/radvd.mk                           |    7 +------
 package/rsyslog/rsyslog.mk                       |    3 +--
 package/samba/samba.mk                           |    9 +++------
 package/stunnel/stunnel.mk                       |    2 +-
 package/tftpd/tftpd.mk                           |    2 +-
 package/tinyhttpd/tinyhttpd.mk                   |    2 +-
 package/udev/udev.mk                             |    8 ++------
 26 files changed, 46 insertions(+), 89 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 4270c83..c88e207 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -21,17 +21,12 @@ AT_CONF_OPT = \
         --with-daemon_groupname=root \
 	SENDMAIL=/usr/sbin/sendmail
 
-define AT_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
-endef
-
-AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
+AT_INIT_SYSV = package/at/S99at
 
 define AT_UNINSTALL_TARGET_CMDS
 	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/atspool \
 					 /usr/lib/atjobs \
 					 /etc/at.deny \
-					 /etc/init.d/S99at \
 					 /usr/bin/at \
 					 /usr/bin/atrm \
 					 /usr/bin/atq \
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 739c5f2..b495c96 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -146,22 +146,18 @@ AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_INITSCRIPT
 define AVAHI_INSTALL_AUTOIPD
 	rm -rf $(TARGET_DIR)/etc/dhcp3/
 	$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
-	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 endef
 
 ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
+AVAHI_INIT_SYSV += package/avahi/S05avahi-setup.sh
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_AUTOIPD
 endif
 
-define AVAHI_INSTALL_DAEMON_INITSCRIPT
-	$(INSTALL) -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
-endef
-
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
-AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
+AVAHI_INIT_SYSV += package/avahi/S50avahi-daemon
 endif
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 73c4969..0ff27ca 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -30,11 +30,7 @@ endif
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
-define BUSYBOX_INSTALL_MDEV_SCRIPT
-	[ -f $(TARGET_DIR)/etc/init.d/S10mdev ] || \
-		install -D -m 0755 package/busybox/S10mdev \
-			$(TARGET_DIR)/etc/init.d/S10mdev
-endef
+BUSYBOX_INIT_SYSV += package/busybox/S10mdev
 define BUSYBOX_INSTALL_MDEV_CONF
 	[ -f $(TARGET_DIR)/etc/mdev.conf ] || \
 		install -D -m 0644 package/busybox/mdev.conf \
@@ -139,6 +135,7 @@ define BUSYBOX_SET_INIT
 endef
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
@@ -146,12 +143,15 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 				$(TARGET_DIR)/etc/init.d/S01logging; \
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
+else
+define BUSYBOX_INSTALL_LOGGING_SCRIPT
+endef
+endif
 
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
 define BUSYBOX_CONFIGURE_CMDS
-	$(BUSYBOX_SET_SYSKLOGD)
 	$(BUSYBOX_SET_BB_PWD)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
@@ -177,7 +177,6 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
 	fi
-	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 endef
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index f18d84a..9d2255d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -24,6 +24,8 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
+DBUS_INIT_SYSV = package/dbus/S30dbus
+
 ifeq ($(BR2_DBUS_EXPAT),y)
 DBUS_CONF_OPT += --with-xml=expat
 DBUS_DEPENDENCIES += expat
@@ -61,7 +63,6 @@ endif
 define DBUS_INSTALL_TARGET_FIXUP
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
-	$(INSTALL) -m 0755 -D package/dbus/S30dbus $(TARGET_DIR)/etc/init.d/S30dbus
 endef
 
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 7548f41..db4b5e1 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -20,25 +20,23 @@ ifneq ($(BR2_INET_IPV6),y)
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
+DHCP_INIT_SYSV += package/dhcp/S80dhcp-server
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-server \
-		$(TARGET_DIR)/etc/init.d/S80dhcp-server
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
 		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
+DHCP_INIT_SYSV += package/dhcp/S80dhcp-relay
 define DHCP_INSTALL_RELAY
 	mkdir -p $(TARGET_DIR)/var/lib
 	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
 	$(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
 		$(TARGET_DIR)/usr/sbin/dhcrelay
-	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay \
-		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
 endef
 endif
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bced0ef..348a5cb 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -11,6 +11,8 @@ DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
+DROPBEAR_INIT_SYSV = package/dropbear/S50dropbear
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DROPBEAR_MAKE += STATIC=1
 endif
@@ -59,15 +61,11 @@ define DROPBEAR_INSTALL_TARGET_CMDS
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
-	if [ ! -f $(TARGET_DIR)/etc/init.d/S50dropbear ]; then \
-		$(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d/S50dropbear; \
-	fi
 endef
 
 define DROPBEAR_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/dropbear
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(DROPBEAR_TARGET_BINS))
-	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
 endef
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 65b3dbd..e885649 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -9,6 +9,7 @@ GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).0
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.bz2
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
 GDK_PIXBUF_INSTALL_STAGING = YES
+GDK_PIXBUF_INIT_SYSV = package/gdk-pixbuf/S26gdk-pixbuf
 
 GDK_PIXBUF_CONF_ENV = \
 	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
@@ -43,11 +44,6 @@ GDK_PIXBUF_DEPENDENCIES += \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkg-config libglib2
 
-define GDK_PIXBUF_POST_INSTALL_TWEAKS
-	$(INSTALL) -m 755 -D package/gdk-pixbuf/S26gdk-pixbuf \
-		$(TARGET_DIR)/etc/init.d/S26gdk-pixbuf
-endef
-
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index be6daeb..d9b5cc2 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -8,6 +8,7 @@ GPSD_VERSION = 2.95
 GPSD_SITE = http://download.berlios.de/gpsd
 GPSD_INSTALL_STAGING = YES
 GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
+GPSD_INIT_SYSV = package/gpsd/S50gpsd
 
 # Build libgpsmm if we've got C++
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
@@ -169,7 +170,6 @@ endef
 define GPSD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
-		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
 		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
 	fi
 endef
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index a938ae7..523e764 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -6,6 +6,7 @@
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
 INPUT_EVENT_DAEMON_SITE = git://github.com/gandro/input-event-daemon.git
+INPUT_EVENT_INIT_SYSV = package/input-event-daemon/S99input-event-daemon
 
 define INPUT_EVENT_DAEMON_BUILD_CMDS
 	touch  $(@D)/input-event-table.h
@@ -19,9 +20,6 @@ define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
 	[ -f $(TARGET_DIR)/etc/input-event-daemon.conf ] || \
 		$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
 			$(TARGET_DIR)/etc/input-event-daemon.conf
-	[ -f $(TARGET_DIR)/etc/init.d/S99input-event-daemon ] || \
-		$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
-			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
 endef
 
 define INPUT_EVENT_DAEMON_CLEAN_CMDS
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index b29b9f7..0cc5a0b 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -8,6 +8,7 @@ MPD_VERSION = 0.16.5
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
 MPD_AUTORECONF = YES
 MPD_DEPENDENCIES = host-pkg-config libglib2
+MPD_INIT_SYSV = package/multimedia/mpd/S95mpd
 
 # Some options need an explicit --disable or --enable
 
@@ -125,8 +126,6 @@ define MPD_INSTALL_EXTRA_FILES
 		$(INSTALL) -D package/multimedia/mpd/mpd.conf \
 			$(TARGET_DIR)/etc/mpd.conf; \
 	fi
-	$(INSTALL) -m 0755 -D package/multimedia/mpd/S95mpd \
-		$(TARGET_DIR)/etc/init.d/S95mpd
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index db76021..f0052d8 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -6,6 +6,7 @@
 NETPLUG_VERSION=1.2.9.2
 NETPLUG_SOURCE=netplug-$(NETPLUG_VERSION).tar.bz2
 NETPLUG_SITE=http://www.red-bean.com/~bos/netplug
+NETPLUG_INIT_SYSV = package/netplug/S29netplug
 
 define NETPLUG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -18,7 +19,6 @@ endef
 define NETPLUG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/netplugd
 	rm -rf $(TARGET_DIR)/etc/netplug*
-	rm -f $(TARGET_DIR)/etc/init.d/S*netplug
 endef
 
 define NETPLUG_CLEAN_CMDS
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 5d789b9..1716ba0 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -21,6 +21,9 @@ NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--with-mib-modules="host ucd-snmp/dlmod" \
 		--with-out-mib-modules="disman/event disman/schedule utilities" \
 		--with-out-transports="Unix"
+
+NETSNMP_INIT_SYSV = package/netsnmp/S59snmpd
+
 NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -58,8 +61,6 @@ endif
 define NETSNMP_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) install
-	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
-		$(TARGET_DIR)/etc/init.d/S59snmpd
 	for mib in $(NETSNMP_BLOAT_MIBS); do \
 		rm -f $(TARGET_DIR)/usr/share/snmp/mibs/$$mib-MIB.txt; \
 	done
@@ -69,7 +70,6 @@ endef
 define NETSNMP_UNINSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) uninstall
-	rm -f $(TARGET_DIR)/etc/init.d/S59snmpd
 	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
 endef
 
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index bbe25fe..d3a26db 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -7,6 +7,8 @@ NFS_UTILS_VERSION = 1.2.3
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
 NFS_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nfs/
 
+NFS_UTILS_INIT_SYSV = package/nfs-utils/S60nfs
+
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPT = \
@@ -22,8 +24,6 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 
 define NFS_UTILS_INSTALL_FIXUP
-	$(INSTALL) -m 0755 package/nfs-utils/S60nfs \
-		$(TARGET_DIR)/etc/init.d/S60nfs
 	rm -f $(NFS_UTILS_TARGETS_)
 endef
 
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index f17193f..b3144ca 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -8,6 +8,10 @@ NTP_VERSION = 4.2.6p4
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
 
+ifdef ($(BR2_PACKAGE_NTP_NTPD))
+	NTP_INIT_SYSV += package/ntp/S49ntp
+endif
+
 ifneq ($(BR2_INET_IPV6),y)
 	NTP_CONF_ENV += isc_cv_have_in6addr_any=no
 endif
@@ -49,7 +53,6 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
 define NTP_INSTALL_TARGET_CMDS
 	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
 	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
-	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp)
 	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
 		install -m 755 -d $(TARGET_DIR)/etc/default ; \
 		install -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
@@ -59,7 +62,6 @@ endef
 define NTP_UNINSTALL_TARGET_CMDS
 	rm $(TARGET_DIR)/usr/sbin/ntpd
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTP_INSTALL_FILES_y))
-	rm $(TARGET_DIR)/etc/init.d/S49ntp
 	rm $(TARGET_DIR)/etc/default/ntpd
 endef
 
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 9ed4d5b..5c3a87c 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -14,6 +14,7 @@ OLSR_TARGET_BINARY:=usr/sbin/olsrd
 #OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
 OLSR_PLUGINS=dot_draw dyn_gw secure
 OLSR_TARGET_PLUGIN=usr/lib/
+OLSR_INIT_SYSV = package/olsr/S50olsr
 
 define OLSR_BUILD_CMDS
  $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd $(OLSR_PLUGINS)
@@ -22,8 +23,6 @@ endef
 define OLSR_INSTALL_TARGET_CMDS
  cp -dpf $(@D)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
  cp -R $(@D)/lib/*/olsrd_*.so* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
- mkdir -p $(TARGET_DIR)/etc/init.d
- cp -dpf package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/
  test -r $(TARGET_DIR)/etc/olsrd.conf || \
    cp -dpf $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
  -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so*
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 08bb499..e49547e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -11,11 +11,6 @@ OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
 OPENSSH_DEPENDENCIES = zlib openssl
-
-define OPENSSH_INSTALL_INITSCRIPT
-	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
-endef
-
-OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
+OPENSSH_INIT_SYSV = package/openssh/S50sshd
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 2691b88..228a9fd 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -13,6 +13,8 @@ PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
 PANGO_INSTALL_TARGET = YES
 
+PANGO_INIT_SYSV = package/pango/S25pango
+
 PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
@@ -53,11 +55,4 @@ else
         PANGO_CONF_OPT += --without-x
 endif
 
-define PANGO_INSTALL_INITSCRIPT
-	$(INSTALL) -m 755 -D package/pango/S25pango \
-		$(TARGET_DIR)/etc/init.d/S25pango
-endef
-
-PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
-
 $(eval $(call AUTOTARGETS))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index cb7c0e3..25fb65e 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -8,6 +8,7 @@ PORTMAP_VERSION = 6.0
 PORTMAP_SOURCE = portmap-$(PORTMAP_VERSION).tgz
 PORTMAP_SITE = http://neil.brown.name/portmap
 PORTMAP_SBINS = portmap pmap_dump pmap_set
+PORTMAP_INIT_SYSV = package/portmap/S13portmap
 
 PORTMAP_FLAGS = NO_TCP_WRAPPER=1 NO_PIE=1 NO_PERROR=1
 ifeq ($(BR2_USE_MMU),)
@@ -33,8 +34,6 @@ define PORTMAP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
 	$(INSTALL) -D $(@D)/pmap_set.8 \
 		$(TARGET_DIR)/usr/share/man/man8/pmap_set.8
-	$(INSTALL) -m 0755 package/portmap/S13portmap \
-		$(TARGET_DIR)/etc/init.d
 endef
 
 define PORTMAP_UNINSTALL_TARGET_CMDS
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 2523dd2..bc91f25 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -7,6 +7,8 @@ PROFTPD_VERSION = 1.3.3e
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
 
+PROFTPD_INIT_SYSV = package/proftpd/S50proftpd
+
 PROFTPD_CONF_ENV = ac_cv_func_setpgrp_void=yes \
 		ac_cv_func_setgrent_void=yes
 
@@ -33,12 +35,10 @@ define PROFTPD_INSTALL_TARGET_CMDS
 		$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
 		$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;) \
 	fi
-	$(INSTALL) -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
 endef
 
 define PROFTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/$(PROFTPD_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/etc/init.d/S50proftpd
 	rm -f $(TARGET_DIR)/etc/proftpd.conf
 endef
 
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index d4b9a73..6155236 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -7,11 +7,6 @@
 RADVD_VERSION = 1.8.3
 RADVD_SITE = http://www.litech.org/radvd/dist/
 RADVD_DEPENDENCIES = flex host-flex
-
-define RADVD_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
-endef
-
-RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
+RADVD_INIT_SYSV = package/radvd/S50radvd
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 6582812..e9dc8ac 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -6,6 +6,7 @@
 RSYSLOG_VERSION = 5.8.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
 RSYSLOG_DEPENDENCIES = zlib
+RSYSLOG_INIT_SYSV = package/rsyslog/S01rsyslog
 
 # Build after Busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -13,8 +14,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 endif
 
 define RSYSLOG_INSTALL_CONF_SCRIPT
-	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
-		$(TARGET_DIR)/etc/init.d/S01rsyslog
 	[ -f $(TARGET_DIR)/etc/rsyslog.conf ] || \
 		$(INSTALL) -m 0644 -D $(@D)/rsyslog.conf \
 			$(TARGET_DIR)/etc/rsyslog.conf
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index de2c13b..0c563d7 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -13,6 +13,7 @@ SAMBA_AUTORECONF = NO
 SAMBA_INSTALL_STAGING = YES
 SAMBA_INSTALL_TARGET = YES
 
+SAMBA_INIT_SYSV = package/samba/S91smb
 
 SAMBA_DEPENDENCIES = \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
@@ -173,17 +174,13 @@ SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
 endif
 endif
 
-define SAMBA_INSTALL_INITSCRIPTS_CONFIG
-	# install start/stop script
-	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
-		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
-	fi
+define SAMBA_INSTALL_CONFIG
 	# install config
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
 		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
 	fi
 endef
 
-SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
+SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_CONFIG
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 6088e58..c718525 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -10,9 +10,9 @@ STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT += \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--with-threads=fork
+STUNNEL_INIT_SYSV = package/stunnel/S50stunnel
 
 define STUNNEL_INSTALL_CONF_SCRIPT
-	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
 	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \
 		$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
 			$(TARGET_DIR)/etc/stunnel/stunnel.conf
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 728319b..45eb8b3 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -7,6 +7,7 @@ TFTPD_VERSION  = 5.0
 TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.bz2
 TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/
 TFTPD_CONF_OPT = --without-tcpwrappers
+TFTP_INIT_SYSV = package/tftpd/S80tftpd-hpa
 
 ifneq ($(BR2_INET_IPV6),y)
 TFTPD_CONF_OPT += --without-ipv6
@@ -14,7 +15,6 @@ endif
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
-	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
 endef
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 739849f..c86c056 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -10,6 +10,7 @@ TINYHTTPD_DIR:=$(BUILD_DIR)/tinyhttpd-$(TINYHTTPD_VER)
 TINYHTTPD_CAT:=$(ZCAT)
 TINYHTTPD_BINARY:=httpd
 TINYHTTPD_TARGET_BINARY:=usr/sbin/tinyhttpd
+TINYHTTPD_INIT_SYSV = package/tinyhttpd/S85tinyhttpd
 
 $(DL_DIR)/$(TINYHTTPD_SOURCE):
 	 $(call DOWNLOAD,$(TINYHTTPD_SITE),$(TINYHTTPD_SOURCE))
@@ -32,7 +33,6 @@ $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY): $(TINYHTTPD_DIR)/.unpacked
 $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY): $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY)
 	$(INSTALL) -m 0755 $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY) $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
-	$(INSTALL) -m 0755 package/tinyhttpd/S85tinyhttpd $(TARGET_DIR)/etc/init.d
 	mkdir -p $(TARGET_DIR)/var/www
 
 tinyhttpd: $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 1825396..2dac4e8 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -16,6 +16,8 @@ UDEV_CONF_OPT =			\
 
 UDEV_DEPENDENCIES = host-gperf host-pkg-config
 
+UDEV_INIT_SYSV = package/udev/S10udev
+
 ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
 UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
 UDEV_CONF_OPT +=							\
@@ -28,10 +30,4 @@ UDEV_CONF_OPT +=		\
 	--disable-gudev
 endif
 
-define UDEV_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
-endef
-
-UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
-
 $(eval $(call AUTOTARGETS))
-- 
1.7.4.1
