From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 18:53:49 +0200
Subject: [Buildroot] [git commit] bluez-alsa: new package
Message-ID: <20180428165441.B104589020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36f2d55eff9118c9a13dca7c77efdd4b781bd77c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bluez-alsa is a Bluetooth Audio ALSA Backend.

Note that we are using the latest commit from git master branch
instead of the latest version tag v1.2.0 which is almost a year old
and is 64 commits behind master.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas:
 - simplify the comments in the "depends on"
 - move the Config.in comment below the hcitop option to let
   menuconfig properly indent the hcitop option under bluez-alsa]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                  |  1 +
 package/bluez-alsa/Config.in       | 36 +++++++++++++++++++++++++++++++
 package/bluez-alsa/bluez-alsa.hash |  3 +++
 package/bluez-alsa/bluez-alsa.mk   | 43 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d5ba5cd36c..8be48816e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -13,6 +13,7 @@ menu "Audio and video applications"
 	source "package/atest/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/bluez-alsa/Config.in"
 	source "package/dvblast/Config.in"
 	source "package/dvdauthor/Config.in"
 	source "package/dvdrw-tools/Config.in"
diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
new file mode 100644
index 0000000000..317762057c
--- /dev/null
+++ b/package/bluez-alsa/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_BLUEZ_ALSA
+	bool "bluez-alsa"
+	depends on !BR2_STATIC_LIBS # bluez5
+	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5
+	depends on BR2_USE_MMU # bluez5 -> dbus
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_SBC
+	help
+	  Bluetooth Audio ALSA Backend.
+
+	  https://github.com/Arkq/bluez-alsa
+
+if BR2_PACKAGE_BLUEZ_ALSA
+
+config BR2_PACKAGE_BLUEZ_ALSA_HCITOP
+	bool "hcitop"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	select BR2_PACKAGE_BSD
+	select BR2_PACKAGE_NCURSES
+	help
+	  Enable top-like monitoring tool for HCI.
+
+endif
+
+comment "bluez-alsa needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_BLUEZ_UTILS
diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
new file mode 100644
index 0000000000..b96c37cc46
--- /dev/null
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  dfa48e991a6bbb194a9161deb949371155150dabd5cfc1453a8df754b7cbdc84  bluez-alsa-9045edb436ea755f395a2e09e4525b5defad286a.tar.gz
+sha256  c90a0081b0526834f700d084e48819b18d11453ecb030c9b7de0d2cc3e3711a5  LICENSE.txt
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
new file mode 100644
index 0000000000..3ba237a6b7
--- /dev/null
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# bluez-alsa
+#
+################################################################################
+
+BLUEZ_ALSA_VERSION = 9045edb436ea755f395a2e09e4525b5defad286a
+BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,$(BLUEZ_ALSA_VERSION))
+BLUEZ_ALSA_LICENSE = MIT
+BLUEZ_ALSA_LICENSE_FILES = LICENSE.txt
+BLUEZ_ALSA_DEPENDENCIES = alsa-lib bluez5_utils libglib2 sbc host-pkgconf
+
+# git repo, no configure
+BLUEZ_ALSA_AUTORECONF = YES
+
+# Autoreconf requires an existing m4 directory
+define BLUEZ_ALSA_MKDIR_M4
+	mkdir -p $(@D)/m4
+endef
+BLUEZ_ALSA_POST_PATCH_HOOKS += BLUEZ_ALSA_MKDIR_M4
+
+BLUEZ_ALSA_CONF_OPTS = \
+	--enable-aplay \
+	--disable-debug-time \
+	--disable-pcm-test \
+	--with-alsaplugindir=/usr/lib/alsa-lib \
+	--with-alsadatadir=/usr/share/alsa
+
+ifeq ($(BR2_PACKAGE_FDK_AAC),y)
+BLUEZ_ALSA_DEPENDENCIES += fdk-aac
+BLUEZ_ALSA_CONF_OPTS += --enable-aac
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-aac
+endif
+
+ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_HCITOP),y)
+BLUEZ_ALSA_DEPENDENCIES += libbsd ncurses
+BLUEZ_ALSA_CONF_OPTS += --enable-hcitop
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-hcitop
+endif
+
+$(eval $(autotools-package))
