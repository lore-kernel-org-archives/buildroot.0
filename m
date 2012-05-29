From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 May 2012 09:52:33 +0200
Subject: [Buildroot] [git commit] Add ofono package
Message-ID: <20120531113301.67BD496E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60db41fb41f00d1f5faee403ace1bc06626f995c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add upstream URL, fix dep, drop explicit bluetooth option, no AUTORECONF]
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/ofono/Config.in |   16 ++++++++++++++++
 package/ofono/ofono.mk  |   31 +++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9087a41..ca8fc96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -207,6 +207,7 @@ source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
+source "package/ofono/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
 source "package/parted/Config.in"
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
new file mode 100644
index 0000000..fc6c9c6
--- /dev/null
+++ b/package/ofono/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OFONO
+	bool "ofono"
+	depends on BR2_USE_WCHAR # gettext/libglib2
+	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
+	help
+	  oFono is a free, open source project for mobile telephony
+	  (GSM/UMTS) applications. It uses high-level D-Bus API for
+	  use by telephony applications. It uses 3GPP standard.
+
+	  http://ofono.org/
+
+comment "ofono requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
new file mode 100644
index 0000000..c49ee29
--- /dev/null
+++ b/package/ofono/ofono.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# ofono
+#
+#############################################################
+OFONO_VERSION = 1.5
+OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
+OFONO_DEPENDENCIES = \
+	host-pkg-config \
+	dbus \
+	libglib2 \
+	libcap-ng \
+	mobile-broadband-provider-info
+
+OFONO_CONF_OPT = --disable-test
+
+ifeq ($(BR2_PACKAGE_UDEV),y)
+	OFONO_CONF_OPT += --enable-udev
+	OFONO_DEPENDENCIES += udev
+else
+	OFONO_CONF_OPT += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+	OFONO_CONF_OPT += --enable-bluetooth
+	OFONO_DEPENDENCIES += bluez_utils
+else
+	OFONO_CONF_OPT += --disable-bluetooth
+endif
+
+$(eval $(call AUTOTARGETS))
