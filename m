From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:43:31 +0100
Subject: [Buildroot] [git commit] thttpd: add systemd service file
Message-ID: <20150320194335.8282581885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c85b3fca39e9a3361a3202037010211566d152fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on Arch service file, adjusted to point to /usr/sbin.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/thttpd/thttpd.mk      |    8 ++++++++
 package/thttpd/thttpd.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 1a028c8..5b4b0c4 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -44,4 +44,12 @@ define THTTPD_INSTALL_INIT_SYSV
 	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
 endef
 
+define THTTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/thttpd/thttpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/thttpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	ln -fs ../../../../usr/lib/systemd/system/thttpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/thttpd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/thttpd/thttpd.service b/package/thttpd/thttpd.service
new file mode 100644
index 0000000..e3c93e7
--- /dev/null
+++ b/package/thttpd/thttpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Tiny HTTP Daemon
+
+[Service]
+PIDFile=/run/thttpd.pid
+ExecStart=/usr/sbin/thttpd -D -C /etc/thttpd.conf
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
