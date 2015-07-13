From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 19:05:23 +0200
Subject: [Buildroot] [git commit] exim: systemd support
Message-ID: <20150713170529.7D63C80E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b52d96ab4ed5e3ea8e993283a14cd2999aea10ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.mk      |    8 ++++++++
 package/exim/exim.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 8ad0328..d8f41b0 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -133,4 +133,12 @@ define EXIM_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S86exim
 endef
 
+define EXIM_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/exim/exim.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/exim.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/exim.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/exim.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/exim/exim.service b/package/exim/exim.service
new file mode 100644
index 0000000..26daabc
--- /dev/null
+++ b/package/exim/exim.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Exim MTA
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/bin/exim -bdf
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
