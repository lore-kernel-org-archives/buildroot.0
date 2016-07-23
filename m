From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 10:31:24 -0300
Subject: [Buildroot] [PATCH 5/6] libfm: add optional support for gtk3
In-Reply-To: <1469280685-11787-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469280685-11787-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1469280685-11787-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pcmanfm can now use gtk3+ so use that over gtk2+ if it's available.
Since it's only x11-safe for the moment the comment and deps other than
gtk stay the same.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfm/Config.in |  2 +-
 package/libfm/libfm.mk  | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index 603b4d5..0463d1c 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBFM
 	bool "libfm"
 	select BR2_PACKAGE_MENU_CACHE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_CAIRO
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index a9be094..633a844 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -7,7 +7,7 @@
 LIBFM_VERSION = 1.2.4
 LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
 LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
-LIBFM_DEPENDENCIES = menu-cache libgtk2 libglib2 cairo
+LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
 LIBFM_LICENSE = GPLv2+, LGPLv2.1+
 LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_INSTALL_STAGING = YES
@@ -19,4 +19,12 @@ else
 LIBFM_CONF_OPTS += --disable-exif
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+LIBFM_CONF_OPTS += --with-gtk=3
+LIBFM_DEPENDENCIES += libgtk3
+else
+LIBFM_CONF_OPTS += --with-gtk=2
+LIBFM_DEPENDENCIES += libgtk2
+endif
+
 $(eval $(autotools-package))
-- 
2.7.3
