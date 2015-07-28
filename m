From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 28 Jul 2015 16:15:28 +0800
Subject: [Buildroot] [PATCH 2/2] Remmina: new package
In-Reply-To: <1438071328-12502-1-git-send-email-fancp2007@gmail.com>
References: <1438071328-12502-1-git-send-email-fancp2007@gmail.com>
Message-ID: <1438071328-12502-2-git-send-email-fancp2007@gmail.com>
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
 package/Config.in                            |  1 +
 package/remmina/0001-libintl-underlink.patch | 11 +++++++++++
 package/remmina/Config.in                    | 17 +++++++++++++++++
 package/remmina/remmina.mk                   | 19 +++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/remmina/0001-libintl-underlink.patch
 create mode 100644 package/remmina/Config.in
 create mode 100644 package/remmina/remmina.mk

diff --git a/package/Config.in b/package/Config.in
index 8d9511c..8ca27f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -239,6 +239,7 @@ endif
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
+	source "package/remmina/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
diff --git a/package/remmina/0001-libintl-underlink.patch b/package/remmina/0001-libintl-underlink.patch
new file mode 100644
index 0000000..6afba38
--- /dev/null
+++ b/package/remmina/0001-libintl-underlink.patch
@@ -0,0 +1,11 @@
+--- ./remmina/CMakeLists.txt.orig
++++ ./remmina/CMakeLists.txt
+@@ -91,7 +91,7 @@
+ add_executable(remmina ${REMMINA_SRCS})
+ 
+ include_directories(${GTK_INCLUDE_DIRS})
+-target_link_libraries(remmina ${GTK_LIBRARIES})
++target_link_libraries(remmina ${GTK_LIBRARIES} -lintl)
+ 
+ find_package(X11)
+ include_directories(${X11_INCLUDE_DIR})
diff --git a/package/remmina/Config.in b/package/remmina/Config.in
new file mode 100644
index 0000000..168f898
--- /dev/null
+++ b/package/remmina/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_REMMINA
+	bool "Remmina"
+	depends on BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_LIBVNCSERVER
+	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_GETTEXT
+	help
+	  Remmina is a remote desktop client written in GTK+, aiming to be useful for 
+	  system administrators and travellers, who need to work with lots of remote 
+	  computers in front of either large monitors or tiny netbooks. 
+
+	  Remmina supports multiple network protocols in an integrated and consistent 
+	  user interface. Currently RDP, VNC, NX, XDMCP and SSH are supported.
+
+	  http://remmina.sourceforge.net/
diff --git a/package/remmina/remmina.mk b/package/remmina/remmina.mk
new file mode 100644
index 0000000..0a03f3d
--- /dev/null
+++ b/package/remmina/remmina.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# Remmina
+#
+################################################################################
+
+REMMINA_VERSION = v1.1.2
+REMMINA_SITE = $(call github,FreeRDP,Remmina,$(REMMINA_VERSION))
+REMMINA_DEPENDENCIES = libgtk3 libgcrypt libssh libvncserver freerdp gettext
+REMMINA_LICENSE = GPLv2
+REMMINA_LICENSE_FILES = LICENSE
+
+REMMINA_CONF_OPTS = \
+	-DWITH_AVAHI=OFF \
+	-DWITH_APPINDICATOR=OFF \
+	-DWITH_TELEPATHY=OFF \
+	-DWITH_GNOMEKEYRING=OFF
+
+$(eval $(cmake-package))
-- 
2.4.6
