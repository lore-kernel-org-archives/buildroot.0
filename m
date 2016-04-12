From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Apr 2016 02:33:44 -0300
Subject: [Buildroot] [PATCH] supertuxkart: new package
Message-ID: <1460439224-29314-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/Config.in                      |  1 +
 package/supertuxkart/Config.in         | 29 +++++++++++++++++++++++++++++
 package/supertuxkart/supertuxkart.hash |  2 ++
 package/supertuxkart/supertuxkart.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/supertuxkart/Config.in
 create mode 100644 package/supertuxkart/supertuxkart.hash
 create mode 100644 package/supertuxkart/supertuxkart.mk

diff --git a/package/Config.in b/package/Config.in
index 64822bf5f6fa..8438bca33195 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -232,6 +232,7 @@ menu "Games"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
+	source "package/supertuxkart/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
new file mode 100644
index 000000000000..4e9f5bb09ac6
--- /dev/null
+++ b/package/supertuxkart/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_SUPERTUXKART
+	bool "supertuxkart"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_ZLIB
+	help
+	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
+	  racer with multiple karts, tracks and modes you can play.
+	  Beat the evil Nolok by any means necessary, and make the
+	  mascot kingdom safe once again!
+
+	  http://supertuxkart.sourceforge.net/Main_Page
+
+comment "supertuxkart needs a toolchain w/ threads, C++"
+	depends on !(BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_HAS_THREADS)
+
+comment "supertuxkart needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
new file mode 100644
index 000000000000..d8e7ac30f6d1
--- /dev/null
+++ b/package/supertuxkart/supertuxkart.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	c50f00a71df165fb613d20e86bea2d9d5e51ed3e27e1d436fbac3b07cf2ea149	supertuxkart-0.9.1-src.tar.xz
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
new file mode 100644
index 000000000000..e1c67b4e14f4
--- /dev/null
+++ b/package/supertuxkart/supertuxkart.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# supertuxkart
+#
+################################################################################
+
+SUPERTUXKART_VERSION = 0.9.1
+SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
+SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
+SUPERTUXKART_LICENSE = GPLv3
+SUPERTUXKART_LICENSE_FILES = COPYING
+
+SUPERTUXKART_DEPENDENCIES += bluez5_utils jpeg libcurl libfribidi libgl libglu libpng \
+			     libogg libvorbis openal xlib_libXrandr zlib
+
+# Since supertuxkart is not installing libstkirrlicht.so,
+# and given we don't really need that library to be shared
+# we turn off shared libs here.
+SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
+
+# Disable Wiimote support
+SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
+
+$(eval $(cmake-package))
-- 
2.7.0
