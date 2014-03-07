From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:54:05 +0100
Subject: [Buildroot] [git commit] ntp: add systemd unit file for ntpd
Message-ID: <20140307215413.D02609936F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16208184a2823404127c2304e6ea1a986d1113c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.mk       |   13 ++++++++++++-
 package/ntp/ntpd.service |   11 +++++++++++
 2 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 40d8e4f..fe64a21 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -52,13 +52,24 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
 define NTP_INSTALL_TARGET_CMDS
 	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
 	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
-	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp)
 	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
 		install -m 755 -d $(TARGET_DIR)/etc/default ; \
 		install -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
 	fi
 endef
 
+ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
+define NTP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
+endef
+
+define NTP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/etc/systemd/system/ntpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
+endef
+endif
+
 NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
 $(eval $(autotools-package))
diff --git a/package/ntp/ntpd.service b/package/ntp/ntpd.service
new file mode 100644
index 0000000..7964c53
--- /dev/null
+++ b/package/ntp/ntpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Network Time Service
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/ntpd.pid
+ExecStart=/usr/sbin/ntpd -g -p /run/ntpd.pid
+
+[Install]
+WantedBy=multi-user.target
