From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 20 Jul 2019 15:39:36 -0300
Subject: [Buildroot] [PATCH] package/dcron: create
 /var/spool/cron/cronstamps in installation
Message-ID: <20190720183936.20746-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The directory is required by dcron at run-time.

On systems with busybox and sysvinit startup /var/spool is a symlink to
/tmp (see package/skeleton-init-sysv/skeleton/) so the directories will
vanish after mounting /tmp, which by default is a tmpfs. In order to
really solve the problem we must also change skeleton-init-sysv to make
/var/spool persistent across rebuilds.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12011 (partially)

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/dcron/dcron.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 2ee0709af5..4a3994cd1a 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -20,6 +20,7 @@ define DCRON_INSTALL_TARGET_CMDS
 	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
 	$(SED) 's#/usr/sbin/run-cron#/bin/run-parts#g' $(TARGET_DIR)/etc/cron.d/system
 	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
+		$(TARGET_DIR)/var/spool/cron/cronstamps \
 		$(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
 		$(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
 endef
-- 
2.18.1
