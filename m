From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 14:21:07 +0200
Subject: [Buildroot] [git commit] targetcli-fb: systemd support
Message-ID: <20151003122242.30ED98192C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6ff869eee978eb82ae740c60a7282860a300d9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The systemd service file is taken from Fedora.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/targetcli-fb/target.service  |   14 ++++++++++++++
 package/targetcli-fb/targetcli-fb.mk |    8 +++++++-
 2 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/package/targetcli-fb/target.service b/package/targetcli-fb/target.service
new file mode 100644
index 0000000..400284e
--- /dev/null
+++ b/package/targetcli-fb/target.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Restore LIO kernel target configuration
+Requires=sys-kernel-config.mount
+After=sys-kernel-config.mount network.target local-fs.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/usr/bin/targetctl restore
+ExecStop=/usr/bin/targetctl clear
+SyslogIdentifier=target
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 0a64c46..cf7f29f 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -12,7 +12,13 @@ TARGETCLI_FB_SETUP_TYPE = setuptools
 TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target $(TARGET_DIR)/etc/init.d/S50target
+	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
+		$(TARGET_DIR)/etc/init.d/S50target
+endef
+
+define TARGETCLI_FB_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D package/targetcli-fb/target.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/target.service
 endef
 
 # Targetcli stores its configuration in /etc/target/saveconfig.json
