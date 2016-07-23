From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 10:31:25 -0300
Subject: [Buildroot] [PATCH 6/6] pcmanfm: add optional support for gtk3
In-Reply-To: <1469280685-11787-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469280685-11787-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1469280685-11787-6-git-send-email-gustavo@zacarias.com.ar>
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
 package/pcmanfm/Config.in  |  2 +-
 package/pcmanfm/pcmanfm.mk | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index ac68188..40ebbdf 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PCMANFM
 	select BR2_PACKAGE_LIBFM
 	select BR2_PACKAGE_MENU_CACHE
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 2f5fa47..e361909 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -7,8 +7,16 @@
 PCMANFM_VERSION = 1.2.4
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
-PCMANFM_DEPENDENCIES = libgtk2 libglib2 menu-cache libfm
+PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm
 PCMANFM_LICENSE = GPLv2+
 PCMANFM_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+PCMANFM_CONF_OPTS += --with-gtk=3
+PCMANFM_DEPENDENCIES += libgtk3
+else
+PCMANFM_CONF_OPTS += --with-gtk=2
+PCMANFM_DEPENDENCIES += libgtk2
+endif
+
 $(eval $(autotools-package))
-- 
2.7.3
