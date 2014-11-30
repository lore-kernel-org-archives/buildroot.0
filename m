From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:55 +0100
Subject: [Buildroot] [PATCHv3 67/74] ifplugd: install configuration files
	unconditionally
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-68-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/ifplugd/ifplugd.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 3d0736a..b24c79d 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -21,14 +21,10 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 endif
 
 define IFPLUGD_INSTALL_FIXUP
-	if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
-		$(INSTALL) -D $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
-		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
-	fi
-	if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.action ]; then \
-		$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
-			$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
-	fi
+	$(INSTALL) -D $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
+	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
+	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
+		$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
 endef
 
 IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
-- 
2.1.0
