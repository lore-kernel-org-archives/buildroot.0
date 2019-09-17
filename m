From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 23:14:27 +0200
Subject: [Buildroot] [git commit] package/systemd-bootchart: enable
 systemd-bootchart.service
Message-ID: <20190917210950.71FF28EB16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b81e00e2ed483e1f3079181b5fdb324da0f6d6ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This would normally be enabled by systemctl preset-all however since we
don't have a host systemctl we need to enable the service manually.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd-bootchart/systemd-bootchart.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
index bcc3dbe22a..62bc79539b 100644
--- a/package/systemd-bootchart/systemd-bootchart.mk
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -16,4 +16,10 @@ SYSTEMD_BOOTCHART_DEPENDENCIES = systemd
 
 SYSTEMD_BOOTCHART_CONF_OPTS = --disable-man
 
+define SYSTEMD_BOOTCHART_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
+	ln -sf ../../../../lib/systemd/system/systemd-bootchart.service \
+		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-bootchart.service
+endef
+
 $(eval $(autotools-package))
