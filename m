From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:42 -0000
Subject: [Buildroot] [git commit branch/next] ptpd2: systemd support
Message-ID: <20150808105632.5FBED818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e060b9c83228e81ce61a8f326970e064982fa50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Following package and sysv initscript naming scheme,
the service is "ptpd2" instead of just "ptpd" version 2.

[Thomas:
  - use relative symlink instead of an absolute symlink
  - remove the -s option, which redirects stdout, since systemd will
    take care of it
  - add the -g option, to be consistent with what the init script is
    using.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ptpd2/ptpd2.mk      |    8 ++++++++
 package/ptpd2/ptpd2.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index e1d4f27..6b2e6bc 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -29,4 +29,12 @@ define PTPD2_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S65ptpd2
 endef
 
+define PTPD2_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/ptpd2/ptpd2.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ptpd2.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/ptpd2.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ptpd2.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/ptpd2/ptpd2.service b/package/ptpd2/ptpd2.service
new file mode 100644
index 0000000..66e71ce
--- /dev/null
+++ b/package/ptpd2/ptpd2.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Precision Time Protocol daemon
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/sbin/ptpd2 -C -g
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
