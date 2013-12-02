From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Dec 2013 07:49:28 -0300
Subject: [Buildroot] [PATCH 5/5] sysklogd: install to /sbin
In-Reply-To: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385981368-2235-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install syslogd/klogd to /sbin instead of /usr/sbin to really win over
busybox and avoid the ugly noise when booting without busybox installed.
Also drop uninstall hook and manpage installation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysklogd/sysklogd.mk | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 8ffdc0f..615b084 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -27,28 +27,14 @@ define SYSKLOGD_BUILD_CMDS
 endef
 
 define SYSKLOGD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/usr/sbin/syslogd
-	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/usr/sbin/klogd
-	$(INSTALL) -D -m 0644 $(@D)/sysklogd.8 $(TARGET_DIR)/usr/share/man/man8/sysklogd.8
-	$(INSTALL) -D -m 0644 $(@D)/syslogd.8 $(TARGET_DIR)/usr/share/man/man8/syslogd.8
-	$(INSTALL) -D -m 0644 $(@D)/syslog.conf.5 $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
-	$(INSTALL) -D -m 0644 $(@D)/klogd.8 $(TARGET_DIR)/usr/share/man/man8/klogd.8
+	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/sbin/syslogd
+	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/sbin/klogd
 	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
 		$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
 			$(TARGET_DIR)/etc/syslog.conf; \
 	fi
 endef
 
-define SYSKLOGD_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/syslogd
-	rm -f $(TARGET_DIR)/usr/sbin/klogd
-	rm -f $(TARGET_DIR)/usr/share/man/man8/sysklogd.8
-	rm -f $(TARGET_DIR)/usr/share/man/man8/syslogd.8
-	rm -f $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
-	rm -f $(TARGET_DIR)/usr/share/man/man8/klogd.8
-	rm -f $(TARGET_DIR)/etc/syslog.conf
-endef
-
 define SYSKLOGD_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
-- 
1.8.3.2
