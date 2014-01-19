From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 21:20:29 +0100
Subject: [Buildroot] [git commit] transmission: use <PKG>_INSTALL_INIT_SYSV
	infra instead of custom hook
Message-ID: <20140119203153.3D2B09C559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=171fc468dc0dc2a2011d105357c91fdaf4af463a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: only install if _DAEMON is enabled]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 3ced558..a08e7ef 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -19,12 +19,6 @@ TRANSMISSION_CONF_OPT = \
 	--disable-libnotify \
 	--enable-lightweight
 
-define TRANSMISSION_INIT_SCRIPT_INSTALL
-	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
-		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
-			$(TARGET_DIR)/etc/init.d/S92transmission
-endef
-
 ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
 	TRANSMISSION_CONF_OPT += --enable-utp
 else
@@ -39,7 +33,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
 	TRANSMISSION_CONF_OPT += --enable-daemon
-	TRANSMISSION_POST_INSTALL_TARGET_HOOKS += TRANSMISSION_INIT_SCRIPT_INSTALL
+
+define TRANSMISSION_INSTALL_INIT_SYSV
+	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
+		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
+			$(TARGET_DIR)/etc/init.d/S92transmission
+endef
+
 else
 	TRANSMISSION_CONF_OPT += --disable-daemon
 endif
