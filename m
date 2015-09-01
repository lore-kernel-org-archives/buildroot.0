From: Scott Fan <fancp2007@gmail.com>
Date: Tue,  1 Sep 2015 22:36:14 +0800
Subject: [Buildroot] [PATCH v4] remmina: new package
Message-ID: <1441118174-9899-1-git-send-email-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remmina is a remote desktop client written in GTK+.
Currently RDP, VNC, NX, XDMCP and SSH are supported.

http://remmina.sourceforge.net/

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v3 -> v4:
1) rebase to master
2) remove libssh patch which had merged to master

Changes v2 -> v3:
1) pick the first patch 'libssh' from the 'next' tree.
2) fix the dependencies of package remmina.

Changes v1 -> v2:
1) fix the dependencies of package remmina.
2) fix the license of package remmina.
3) wrap lines at 72 characters.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/Config.in          |  1 +
 package/remmina/Config.in  | 28 ++++++++++++++++++++++++++++
 package/remmina/remmina.mk | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 package/remmina/Config.in
 create mode 100644 package/remmina/remmina.mk

diff --git a/package/Config.in b/package/Config.in
index 6ba21a1..fd95396 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,6 +240,7 @@ endif
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
+	source "package/remmina/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
diff --git a/package/remmina/Config.in b/package/remmina/Config.in
new file mode 100644
index 0000000..e82f31b
--- /dev/null
+++ b/package/remmina/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_REMMINA
+	bool "remmina"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_USE_MMU # libvncserver depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR # freerdp
+	depends on !BR2_STATIC_LIBS # freerdp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # freerdp
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_LIBVNCSERVER
+	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  Remmina is a remote desktop client written in GTK+, aiming to be
+	  useful for system administrators and travellers, who need to work
+	  with lots of remote computers in front of either large monitors
+	  or tiny netbooks.
+
+	  Remmina supports multiple network protocols in an integrated and
+	  consistent user interface.
+
+	  Currently RDP, VNC, NX, XDMCP and SSH are supported.
+
+	  http://remmina.sourceforge.net/
diff --git a/package/remmina/remmina.mk b/package/remmina/remmina.mk
new file mode 100644
index 0000000..0ac5fd0
--- /dev/null
+++ b/package/remmina/remmina.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# remmina
+#
+################################################################################
+
+REMMINA_VERSION = v1.1.2
+REMMINA_SITE = $(call github,FreeRDP,Remmina,$(REMMINA_VERSION))
+REMMINA_LICENSE = GPLv2+ with OpenSSL exception
+REMMINA_LICENSE_FILES = COPYING LICENSE LICENSE.OpenSSL
+
+REMMINA_CONF_OPTS = \
+	-DWITH_AVAHI=OFF \
+	-DWITH_APPINDICATOR=OFF \
+	-DWITH_GNOMEKEYRING=OFF \
+	-DWITH_TELEPATHY=OFF \
+	-DWITH_VTE=OFF
+
+REMMINA_DEPENDENCIES = \
+	libgtk3 libgcrypt libssh libvncserver freerdp \
+	xlib_libX11 xlib_libXext xlib_libxkbfile
+
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+REMMINA_DEPENDENCIES += gettext
+
+define REMMINA_POST_PATCH_FIXINTL
+	$(SED) 's/$${GTK_LIBRARIES}/$${GTK_LIBRARIES} -lintl/' \
+		$(@D)/remmina/CMakeLists.txt
+endef
+
+REMMINA_POST_PATCH_HOOKS += REMMINA_POST_PATCH_FIXINTL
+endif
+
+$(eval $(cmake-package))
-- 
2.5.1
