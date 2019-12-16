From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:37:49 +0100
Subject: [Buildroot] [git commit] package/pipewire: new package
Message-ID: <20191216212912.0877D8B710@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75c86f90c73c42ee35559610aec28a02190b65b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PipeWire is a server and user space API to deal with multimedia
pipelines.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Thomas:
 - further bump to 0.2.7
 - select BR2_PACKAGE_DBUS instead of depending on it]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pipewire/Config.in     | 14 ++++++++++++++
 package/pipewire/pipewire.hash |  4 ++++
 package/pipewire/pipewire.mk   | 22 ++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d9b4864b9f..5b7b3c80fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1128,6 +1128,7 @@ F:	configs/pine64_sopine_defconfig
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/pipewire/
 F:	package/python-aioconsole/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
diff --git a/package/Config.in b/package/Config.in
index f304a8fbd3..5a4be6ee2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1399,6 +1399,7 @@ menu "Graphics"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
+	source "package/pipewire/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
new file mode 100644
index 0000000000..ca23e6cff0
--- /dev/null
+++ b/package/pipewire/Config.in
@@ -0,0 +1,14 @@
+menuconfig BR2_PACKAGE_PIPEWIRE
+	bool "pipewire"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
+	help
+	  PipeWire is a server and user space API to deal with
+	  multimedia pipelines.
+
+	  https://pipewire.org/
+
+comment "pipewire needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
new file mode 100644
index 0000000000..81c53867e2
--- /dev/null
+++ b/package/pipewire/pipewire.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 bfaa0f6ae6c0791e2e0b59234d399753bf24f1b33dbf587682363a8463dd8df1  pipewire-0.2.7.tar.gz
+sha256 88c0ca786c735a11e0eb508196d3aa1389fbaacb8d5de9adb5ccb15bcd4009d9  LICENSE
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
new file mode 100644
index 0000000000..7717095535
--- /dev/null
+++ b/package/pipewire/pipewire.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# pipewire
+#
+################################################################################
+
+PIPEWIRE_VERSION = 0.2.7
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
