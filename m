From: Ryan Raasch <ryan.raasch@gmail.com>
Date: Mon, 7 Nov 2011 15:40:50 +0100
Subject: [Buildroot] [PATCH] sysklogd: Check for hanging link file also when
	installing the conf file.
Message-ID: <1320676850-20690-1-git-send-email-ryan.raasch@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the configuration files point to a rw area (such as tmp), the
build time link is dangling and the current check of the syslog.conf
is not complete. The configuration file therefore can point to some
runtime config file or the default in the ro fs.

Signed-off-by: Ryan Raasch <ryan.raasch@gmail.com>
---
 package/sysklogd/sysklogd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 11aee2a..283fe18 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -32,7 +32,7 @@ define SYSKLOGD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/syslogd.8 $(TARGET_DIR)/usr/share/man/man8/syslogd.8
 	$(INSTALL) -D -m 0644 $(@D)/syslog.conf.5 $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
 	$(INSTALL) -D -m 0644 $(@D)/klogd.8 $(TARGET_DIR)/usr/share/man/man8/klogd.8
-	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
+	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ] && [ ! -h $(TARGET_DIR)/etc/syslog.conf ] ; then \
 		$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
 			$(TARGET_DIR)/etc/syslog.conf; \
 	fi
-- 
1.7.7.1
