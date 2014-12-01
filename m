From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:34:10 +0100
Subject: [Buildroot] [git commit] ifplugd: install configuration files
	unconditionally
Message-ID: <20141201234334.70E717FA62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ad5d55924bcc7086f834a28db9c227371728470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

[Peter: use install -m as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ifplugd/ifplugd.mk |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 3d0736a..03ed8cd 100644
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
+	$(INSTALL) -D -m 0644 $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
+	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
+	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
+		$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
 endef
 
 IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
