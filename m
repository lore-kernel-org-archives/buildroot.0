From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 11:56:21 +0200
Subject: [Buildroot] [git commit] proftpd: systemd support
Message-ID: <20150714095704.B45DB817DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=727c23cf0531c704f6e66f90dfe2e3efd2e2be93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: change to use a relative symlink, and fix a minor typo in the
service file in the service description.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/proftpd/proftpd.mk      |    8 ++++++++
 package/proftpd/proftpd.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 023b4dd..dec243d 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -55,4 +55,12 @@ define PROFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d/S50proftpd
 endef
 
+define PROFTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/proftpd/proftpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/proftpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/proftpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/proftpd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/proftpd/proftpd.service b/package/proftpd/proftpd.service
new file mode 100644
index 0000000..1c730e5
--- /dev/null
+++ b/package/proftpd/proftpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=FTP server
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/proftpd -n -q
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
