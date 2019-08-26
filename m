From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Aug 2019 20:34:02 -0600
Subject: [Buildroot] [PATCH/next 1/1] package/pipewire: new package
Message-ID: <20190826023402.39124-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PipeWire is a server and user space API to deal with multimedia
pipelines.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pipewire/Config.in     |  9 +++++++++
 package/pipewire/pipewire.hash |  4 ++++
 package/pipewire/pipewire.mk   | 22 ++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/pipewire/Config.in
 create mode 100644 package/pipewire/pipewire.hash
 create mode 100644 package/pipewire/pipewire.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5fe244a570..ad62f0968e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1074,6 +1074,7 @@ F:	configs/pine64_sopine_defconfig
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/pipewire/
 F:	package/python-aioconsole/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
diff --git a/package/Config.in b/package/Config.in
index 9f544f955c..2f6f222cf5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1354,6 +1354,7 @@ menu "Graphics"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
+	source "package/pipewire/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
new file mode 100644
index 0000000000..34c01b92d9
--- /dev/null
+++ b/package/pipewire/Config.in
@@ -0,0 +1,9 @@
+menuconfig BR2_PACKAGE_PIPEWIRE
+	bool "pipewire"
+	depends on BR2_PACKAGE_DBUS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  PipeWire is a server and user space API to deal with multimedia
+	  pipelines.
+
+	  https://pipewire.org/
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
new file mode 100644
index 0000000000..692c322530
--- /dev/null
+++ b/package/pipewire/pipewire.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 8592bcc2a83b078fee6cfb8560397cf2747346f28e88689197e780069b19cb17  pipewire-0.2.6.tar.gz
+sha256 88c0ca786c735a11e0eb508196d3aa1389fbaacb8d5de9adb5ccb15bcd4009d9  LICENSE
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
new file mode 100644
index 0000000000..88412b4b02
--- /dev/null
+++ b/package/pipewire/pipewire.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# pipewire
+#
+################################################################################
+
+PIPEWIRE_VERSION = 0.2.6
+PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
+PIPEWIRE_LICENSE = LGPL-2.1+
+PIPEWIRE_LICENSE_FILES = LICENSE LGPL
+PIPEWIRE_INSTALL_STAGING = YES
+PIPEWIRE_DEPENDENCIES = host-pkgconf dbus
+PIPEWIRE_CONF_OPTS = -Dgstreamer=disabled
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PIPEWIRE_CONF_OPTS += -Dsystemd=true
+PIPEWIRE_DEPENDENCIES += systemd
+else
+PIPEWIRE_CONF_OPTS += -Dsystemd=false
+endif
+
+$(eval $(meson-package))
-- 
2.20.1
