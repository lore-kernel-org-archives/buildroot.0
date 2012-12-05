From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 11:14:40 -0800
Subject: [Buildroot] [git commit] neard: new package
Message-ID: <20121205192421.693FC99C6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34ae9eb63db4ff48da4ed45b9b48997e7c6cd590
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add toolchain dependencies for libglib2/libnl/dbus + host-pkgconf]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/neard/Config.in |   18 ++++++++++++++++++
 package/neard/neard.mk  |   14 ++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ae94705..40ca8e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -237,6 +237,7 @@ source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
+source "package/neard/Config.in"
 source "package/ofono/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
diff --git a/package/neard/Config.in b/package/neard/Config.in
new file mode 100644
index 0000000..bcf6171
--- /dev/null
+++ b/package/neard/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_NEARD
+	bool "neard"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl / dbus
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBNL
+	help
+	  Near Field Communication (NFC) manager. This userspace daemon is
+	  a part of the NFC stack provided by the Linux NFC project.
+
+	  http://git.kernel.org/?p=network/nfc/neard.git;a=summary
+
+	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
+
+comment "neard requires a toolchain with WCHAR and threads support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
new file mode 100644
index 0000000..2d3e30e
--- /dev/null
+++ b/package/neard/neard.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# neard
+#
+#############################################################
+NEARD_VERSION = 0.8
+NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
+NEARD_LICENSE = GPLv2
+NEARD_LICENSE_FILES = COPYING
+
+NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
+NEARD_CONF_OPT = --disable-traces
+
+$(eval $(autotools-package))
