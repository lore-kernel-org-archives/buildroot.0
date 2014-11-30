From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:53 +0100
Subject: [Buildroot] [PATCHv3 65/74] logrotate: install configuration file
	unconditionally
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-66-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/logrotate.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 2e49feb..dc26d85 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -17,9 +17,7 @@ endef
 
 define LOGROTATE_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX=$(TARGET_DIR) -C $(@D) install
-	if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then \
-		$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf; \
-	fi
+	$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
 endef
 
-- 
2.1.0
