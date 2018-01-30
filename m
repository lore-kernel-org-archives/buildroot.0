From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 13:29:09 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] busybox: don't remove
 S01logging when CONFIG_SYSLOGD is disabled
Message-ID: <20180130123229.32F04880BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a06bf88dcae4cf6d9b7f3a02b9abdbc60eab51b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
(cherry picked from commit 84e835ea9261b3e844f1a18489dd89253e3eb839)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 577f2f2470..3f4260be96 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -175,7 +175,7 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
 			$(TARGET_DIR)/etc/init.d/S01logging; \
-	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
+	fi
 endef
 
 ifeq ($(BR2_INIT_BUSYBOX),y)
