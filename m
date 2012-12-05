From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 11:22:48 -0800
Subject: [Buildroot] [git commit] neardal: new package
Message-ID: <20121205192421.A236399C6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=907ff8983e51046cd9fddd884440e83545a38088
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add toolchain deps for dbus. add dbus/host-pkgconf, wrap help text]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (built-test on a minimal powerpc config)
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/neardal/Config.in  |   15 +++++++++++++++
 package/neardal/neardal.mk |   16 ++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 40ca8e6..74e439e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -424,6 +424,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
 endmenu
 
diff --git a/package/neardal/Config.in b/package/neardal/Config.in
new file mode 100644
index 0000000..045ccee
--- /dev/null
+++ b/package/neardal/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_NEARDAL
+	bool "neardal"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	help
+	  Provides a simple C API to exchange data with the neard NFC
+	  manager daemon.
+
+	  https://github.com/connectivity/neardal
+
+comment "neardal requires a toolchain with WCHAR and threads support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
new file mode 100644
index 0000000..66b729d
--- /dev/null
+++ b/package/neardal/neardal.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# neardal
+#
+#############################################################
+NEARDAL_VERSION = 0.7
+NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
+NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
+NEARDAL_INSTALL_STAGING = YES
+NEARDAL_LICENSE = GPLv2
+NEARDAL_LICENSE_FILES = COPYING
+
+NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
+NEARDAL_AUTORECONF = YES
+
+$(eval $(autotools-package))
