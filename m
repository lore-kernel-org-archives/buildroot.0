From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:31 -0000
Subject: [Buildroot] [git commit branch/next] inadyn: systemd support
Message-ID: <20150808105631.0DA897FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0719dd240f35c44967ea63f8ffd60734dfefb56a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inadyn/inadyn.mk      |    8 ++++++++
 package/inadyn/inadyn.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index b002f94..5c3b0e3 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -30,4 +30,12 @@ define INADYN_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S70inadyn
 endef
 
+define INADYN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/inadyn/inadyn.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/inadyn.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/inadyn.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/inadyn.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/inadyn/inadyn.service b/package/inadyn/inadyn.service
new file mode 100644
index 0000000..abc0a1e
--- /dev/null
+++ b/package/inadyn/inadyn.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DDNS client
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/bin/inadyn
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
