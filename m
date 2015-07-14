From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 11:58:28 +0200
Subject: [Buildroot] [git commit] ptpd: systemd support
Message-ID: <20150714101513.CE75581D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ad7b47c5ee1a69dc3540f1da75dce8b07f2c234
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - use relative symbolic link instead of absolute one
   - remove the -S option, since redirecting stdout is not needed,
     it's already taken care of by systemd. Suggested by Maxime
     Hadjinlian.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ptpd/ptpd.mk      |    8 ++++++++
 package/ptpd/ptpd.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/ptpd/ptpd.mk b/package/ptpd/ptpd.mk
index ac9ab98..dad8ccf 100644
--- a/package/ptpd/ptpd.mk
+++ b/package/ptpd/ptpd.mk
@@ -22,4 +22,12 @@ define PTPD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S65ptpd
 endef
 
+define PTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/ptpd/ptpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/ptpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptpd.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/ptpd/ptpd.service b/package/ptpd/ptpd.service
new file mode 100644
index 0000000..c9da3f4
--- /dev/null
+++ b/package/ptpd/ptpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/ptpd -c
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
