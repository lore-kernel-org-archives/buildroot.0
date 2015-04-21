From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2015 19:04:40 +0200
Subject: [Buildroot] [PATCH 4/8 v11] package/xserver_xorg-server: not all
	versions need all dependencies
In-Reply-To: <cover.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <4ef114d646d13c6c519a2c858473ff8d19c60130.1429635674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for the Present protocol has been added to, and is mandatory
since version 1.15.

As we're on the verge of adding 1.14.7, we need to make Present a
version-specific dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xserver_xorg-server/Config.in              | 2 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 05ce7d7..2c7839e 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -35,7 +35,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
@@ -69,6 +68,7 @@ choice
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1
 	bool "1.17.1"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
 endchoice
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d08197d..79d663c 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -38,7 +38,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_glproto 			\
 	xproto_inputproto 		\
 	xproto_kbproto 			\
-	xproto_presentproto 		\
 	xproto_randrproto 		\
 	xproto_renderproto 		\
 	xproto_resourceproto 		\
@@ -75,6 +74,12 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--disable-systemd-logind
 endif
 
+# Present protocol only required for xserver 1.15+, but does not matter if
+# enabled for older versions as they don't use it (not even optionally).
+ifeq ($(BR2_PACKAGE_XPROTO_PRESENTPROTO),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xproto_presentproto
+endif
+
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
-- 
1.9.1
