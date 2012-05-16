From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 16 May 2012 11:55:13 +0100
Subject: [Buildroot] [PATCH] midori: bump version to 0.4.6
Message-ID: <1337165713-9950-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/midori/Config.in                         |    6 ++++--
 package/midori/midori.mk                         |    8 ++++----
 package/vala/vala-fix-dirty-version-suffix.patch |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 package/vala/vala-fix-dirty-version-suffix.patch

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 95a0afb..a9315fe 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBINTL
+	depends on BR2_PACKAGE_LIBICONV
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_USE_WCHAR	 # webkit
 	help
@@ -10,5 +12,5 @@ config BR2_PACKAGE_MIDORI
 
 	  http://software.twotoasts.de/?page=midori
 
-comment "midori requires C++, WCHAR in toolchain and libgtk2"
-        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
+comment "midori requires C++, WCHAR in toolchain, libgtk2, libintl and libiconv"
+        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2 || !BR2_PACKAGE_LIBINTL || !BR2_PACKAGE_LIBICONV
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 3e46b1a..8a364ca 100644
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
+MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2 host-vala libintl libiconv
 
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
 
diff --git a/package/vala/vala-fix-dirty-version-suffix.patch b/package/vala/vala-fix-dirty-version-suffix.patch
new file mode 100644
index 0000000..4b0044d
--- /dev/null
+++ b/package/vala/vala-fix-dirty-version-suffix.patch
@@ -0,0 +1,15 @@
+Do not append a -dirty suffix to the valac version number. The presence of
+the suffix can caused problems for packages (e.g. midori) which check the
+valac version number during configuration.
+
+diff -Nur a/build-aux/git-version-gen b/build-aux/git-version-gen
+--- a/build-aux/git-version-gen	2010-08-15 12:49:03.000000000 +0100
++++ b/build-aux/git-version-gen	2012-05-14 10:17:19.977204570 +0100
+@@ -135,7 +135,6 @@
+     *) # Append the suffix only if there isn't one already.
+ 	case $v in
+ 	  *-dirty) ;;
+-	  *) v="$v-dirty" ;;
+ 	esac ;;
+ esac
+ 
-- 
1.7.9.5
