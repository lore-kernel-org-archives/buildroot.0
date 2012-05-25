From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 25 May 2012 13:47:31 +0100
Subject: [Buildroot] [PATCH resend] midori: bump version to 0.4.6
Message-ID: <1337950052-18644-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/midori/Config.in |    3 +++
 package/midori/midori.mk |    8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 95a0afb..49867e4 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_USE_WCHAR	 # webkit
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 3e46b1a..19bf6dd 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-MIDORI_VERSION = 0.3.6
+MIDORI_VERSION = 0.4.6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.3/
-MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2
+MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4/
+MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2 host-vala $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifneq ($(BR2_PACKAGE_XORG7),y)
 define MIDORI_WITHOUT_X11
@@ -21,7 +21,7 @@ define MIDORI_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_OPTS)	\
 		./waf configure			\
 		--prefix=/usr			\
-		--disable-vala			\
+		--disable-libnotify			\
        )
 endef
 
-- 
1.7.9.5
