From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu,  3 Jul 2014 18:57:39 +0200
Subject: [Buildroot] [PATCH 6/6] systemd: install timesync service if
	selected
In-Reply-To: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1404406659-31109-7-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If support for systemd-timesyncd is selected, install the associated
service.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2da65e6..3454e43 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -112,6 +112,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPT += --enable-timesyncd
+define SYSTEMD_INSTALL_SERVICE_TIMESYNC
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
+	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
+		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
+endef
 else
 SYSTEMD_CONF_OPT += --disable-timesyncd
 endif
@@ -180,6 +185,7 @@ endef
 
 define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
+	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
 endef
 
 $(eval $(autotools-package))
-- 
1.7.10.4
