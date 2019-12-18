From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package: rely on systemctl preset-all for
 upstream-provided services
Message-ID: <20191218172934.5B33D812A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1640fca2085382cafe97edecafaa032b24f42f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All these packages have an upstream-provided service, but buildroot
enabled manually the services in exactly the same way as the [Install]
section.

This is not needed anymore

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr: fix check-package errors]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/audit/audit.mk                         |  4 ----
 package/avahi/avahi.mk                         |  8 --------
 package/bluez5_utils/bluez5_utils.mk           |  8 --------
 package/boinc/boinc.mk                         |  6 ------
 package/docker-engine/docker-engine.mk         |  3 ---
 package/fail2ban/fail2ban.mk                   |  3 ---
 package/gerbera/gerbera.mk                     |  7 -------
 package/iputils/iputils.mk                     | 16 ----------------
 package/lighttpd/lighttpd.mk                   |  6 ------
 package/lldpd/lldpd.mk                         |  6 ------
 package/mosquitto/mosquitto.mk                 |  3 ---
 package/nfs-utils/nfs-utils.mk                 | 16 ----------------
 package/ofono/ofono.mk                         |  6 ------
 package/pcsc-lite/pcsc-lite.mk                 |  6 ------
 package/php/php.mk                             |  3 ---
 package/rsyslog/rsyslog.mk                     | 14 --------------
 package/samba4/samba4.mk                       |  7 -------
 package/squid/squid.mk                         |  3 ---
 package/sshguard/sshguard.mk                   |  3 ---
 package/sysrepo/sysrepo.mk                     |  8 --------
 package/systemd-bootchart/systemd-bootchart.mk |  6 ------
 package/transmission/transmission.mk           |  3 ---
 package/upmpdcli/upmpdcli.mk                   |  3 ---
 23 files changed, 148 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 1e05688f45..03967ee650 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -44,10 +44,6 @@ define AUDIT_INSTALL_INIT_SYSV
 endef
 
 define AUDIT_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/auditd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/auditd.service
-
 	$(INSTALL) -D -m 644 package/audit/audit_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
 endef
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index baffe3cb69..53021f6b6d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -198,14 +198,6 @@ endef
 endif
 
 define AVAHI_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -fs ../../../../usr/lib/systemd/system/avahi-daemon.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
-
-	ln -fs ../../../../usr/lib/systemd/system/avahi-dnsconfd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
-
 	$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
 
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7c5202b717..8f9249454d 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -118,12 +118,4 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
-define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/bluetooth.service \
-		$(TARGET_DIR)/etc/systemd/system/bluetooth.target.wants/bluetooth.service
-	ln -fs ../../../usr/lib/systemd/system/bluetooth.service \
-		$(TARGET_DIR)/etc/systemd/system/dbus-org.bluez.service
-endef
-
 $(eval $(autotools-package))
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 5a29214f46..827eaa0c84 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -53,10 +53,4 @@ define BOINC_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S99boinc-client
 endef
 
-define BOINC_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/boinc-client.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/boinc-client.service
-endef
-
 $(eval $(autotools-package))
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 6a225ee5f0..c6a0442570 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -68,9 +68,6 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
-	ln -fs ../../../../usr/lib/systemd/system/docker.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
 endef
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 16fa63c147..a0325dffc5 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -25,9 +25,6 @@ endef
 define FAIL2BAN_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/files/fail2ban.service.in \
 		$(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib//systemd/system/fail2ban.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/fail2ban.service
 	$(SED) 's, at BINDIR@,/usr/bin,g' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
 	$(SED) '/^PIDFile/c\PIDFile=/run/fail2ban.pid' $(TARGET_DIR)/usr/lib/systemd/system/fail2ban.service
 endef
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 2579b8f2e4..21c6836952 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -104,11 +104,4 @@ define GERBERA_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S99gerbera
 endef
 
-# gerbera.service is installed by cmake in $(TARGET_DIR)/usr/lib/systemd/system
-define GERBERA_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/gerbera.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/gerbera.service
-endef
-
 $(eval $(cmake-package))
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index daceb192f2..5b20d4f99e 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -62,11 +62,6 @@ ifeq ($(IPUTILS_NINFOD),n)
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 else
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=true
-define IPUTILS_INSTALL_SERVICE_NINFOD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../lib/systemd/system/ninfod.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ninfod.service
-endef
 endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
@@ -118,15 +113,4 @@ define IPUTILS_PERMISSIONS
 endef
 endif
 
-define IPUTILS_INSTALL_SERVICE_RDISC
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../lib/systemd/system/rdisc.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rdisc.service
-endef
-
-define IPUTILS_INSTALL_INIT_SYSTEMD
-	$(IPUTILS_INSTALL_SERVICE_NINFOD)
-	$(IPUTILS_INSTALL_SERVICE_RDISC)
-endef
-
 $(eval $(meson-package))
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 449b4b4de2..d7622ad822 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -99,12 +99,6 @@ endef
 define LIGHTTPD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/doc/systemd/lighttpd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/lighttpd.service
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	ln -fs ../../../../usr/lib/systemd/system/lighttpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
-
 	$(INSTALL) -D -m 644 package/lighttpd/lighttpd_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/lighttpd.conf
 endef
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 5569e409dd..264323a879 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -65,10 +65,4 @@ define LLDPD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S60lldpd
 endef
 
-define LLDPD_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/lldpd.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lldpd.service
-endef
-
 $(eval $(autotools-package))
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d0ffffd1d6..2c3bd18d5e 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -111,9 +111,6 @@ endef
 define MOSQUITTO_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/service/systemd/mosquitto.service.notify \
 		$(TARGET_DIR)/usr/lib/systemd/system/mosquitto.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/mosquitto.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mosquitto.service
 endef
 
 define MOSQUITTO_USERS
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index cb2caa03f0..a3484286d1 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -73,25 +73,9 @@ define NFS_UTILS_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S60nfs
 endef
 
-define NFS_UTILS_INSTALL_INIT_SYSTEMD_NFSD
-	ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
-endef
 endif
 
 define NFS_UTILS_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-
-	$(NFS_UTILS_INSTALL_INIT_SYSTEMD_NFSD)
-
-	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-client.target
-
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants
-
-	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
-		$(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants/nfs-client.target
-
 	$(INSTALL) -D -m 0755 package/nfs-utils/nfs-utils_env.sh \
 		$(TARGET_DIR)/usr/libexec/nfs-utils/nfs-utils_env.sh
 
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 0765ff97c1..797e30bd43 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -31,12 +31,6 @@ define OFONO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/ofono/S46ofono $(TARGET_DIR)/etc/init.d/S46ofono
 endef
 
-define OFONO_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/systemd/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/ofono.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-endef
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 OFONO_CONF_OPTS += --enable-udev
 OFONO_DEPENDENCIES += udev
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index e819a93910..08aab466fc 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -44,10 +44,4 @@ ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
-define PCSC_LITE_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/pcscd.socket \
-		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/pcscd.socket
-endef
-
 $(eval $(autotools-package))
diff --git a/package/php/php.mk b/package/php/php.mk
index 1f3972c413..be35ed4456 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -338,9 +338,6 @@ endef
 define PHP_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/sapi/fpm/php-fpm.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/php-fpm.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/php-fpm.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/php-fpm.service
 endef
 
 define PHP_INSTALL_FPM_CONF
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 1d535fc26b..c4446c210d 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -85,20 +85,6 @@ define RSYSLOG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S01rsyslogd
 endef
 
-# The rsyslog.service is installed by rsyslog, but the link is not created
-# so the service is not enabled.
-# We need to create another link which is due to the fact that the
-# rsyslog.service contains an Alias=
-# If we were to use systemctl enable to enable the service, it would
-# create both, so we mimic that.
-define RSYSLOG_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/rsyslog.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rsyslog.service
-	ln -sf ../../../usr/lib/systemd/system/rsyslog.service \
-		$(TARGET_DIR)/etc/systemd/system/syslog.service
-endef
-
 define RSYSLOG_INSTALL_CONF
 	$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
 		$(TARGET_DIR)/etc/rsyslog.conf
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 201328fe4b..bf9636f6e8 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -174,13 +174,6 @@ SAMBA4_DEPENDENCIES += systemd
 endif
 
 define SAMBA4_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/nmb.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nmb.service
-	ln -sf ../../../../usr/lib/systemd/system/smb.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smb.service
-	ln -sf ../../../../usr/lib/systemd/system/winbind.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/winbind.service
 	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/samba.conf.tmp \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/samba.conf
 	printf "d /var/log/samba  755 root root\n" >>$(TARGET_DIR)/usr/lib/tmpfiles.d/samba.conf
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 0d09968bd3..34a463d80d 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -85,9 +85,6 @@ endef
 define SQUID_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/tools/systemd/squid.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/squid.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../..//usr/lib/systemd/system/squid.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/squid.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 0f39974d46..ceff520693 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -25,9 +25,6 @@ endef
 define SSHGUARD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/examples/sshguard.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/sshguard.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/sshguard.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshguard.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index cc4f8e406f..f693ff70da 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -41,14 +41,6 @@ define SYSREPO_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S51sysrepo-plugind
 endef
 
-define SYSREPO_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/sysrepod.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/sysrepo-plugind.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-endef
-
 HOST_SYSREPO_CONF_OPTS = \
 	-DGEN_PYTHON2_TESTS=OFF \
 	-DENABLE_TESTS=OFF \
diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
index 62bc79539b..bcc3dbe22a 100644
--- a/package/systemd-bootchart/systemd-bootchart.mk
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -16,10 +16,4 @@ SYSTEMD_BOOTCHART_DEPENDENCIES = systemd
 
 SYSTEMD_BOOTCHART_CONF_OPTS = --disable-man
 
-define SYSTEMD_BOOTCHART_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
-	ln -sf ../../../../lib/systemd/system/systemd-bootchart.service \
-		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-bootchart.service
-endef
-
 $(eval $(autotools-package))
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 00652e7f4c..8fbda5eea3 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -66,9 +66,6 @@ endef
 define TRANSMISSION_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/daemon/transmission-daemon.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/transmission-daemon.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/transmission-daemon.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/transmission-daemon.service
 endef
 
 else
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 6fa3ae3c5e..290cdcb1f2 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -27,9 +27,6 @@ endef
 define UPMPDCLI_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 $(@D)/systemd/upmpdcli.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/upmpdcli.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/upmpdcli.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upmpdcli.service
 endef
 
 define UPMPDCLI_INSTALL_CONF_FILE
