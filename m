From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jan 2018 23:03:59 +0100
Subject: [Buildroot] [git commit] busybox: don't remove S01logging when
 CONFIG_SYSLOGD is disabled
Message-ID: <20180110220628.309B9835A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e835ea9261b3e844f1a18489dd89253e3eb839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current busybox.mk explicitly removes S01logging if CONFIG_SYSLOGD
is disabled in the Busybox configuration. However:

 - This causes the removal of the S01logging script potentially
   installed by another package (currently syslog-ng, rsyslog and
   sysklogd can all install a S01logging script).

 - We generally don't try to clean-up stuff that we may have installed
   in a previous make invocation and that is no longer needed
   following a configuration change.

Fixes bug #10176

Reported-by: Karl Krach <mail@kkrach.de>
Fix-provided-by: Karl Krach <mail@kkrach.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 8b720b3..d0bbd3f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -221,7 +221,7 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
 			$(TARGET_DIR)/etc/init.d/S01logging; \
-	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
+	fi
 endef
 
 ifeq ($(BR2_INIT_BUSYBOX),y)
