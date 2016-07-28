From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 23:26:15 +0200
Subject: [Buildroot] [git commit] wavemon: new package
Message-ID: <20160728212750.310EC82234@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45ffc2caf87e8877495110d1fd01feed22ded019
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wavemon is an ncurse-based wireless device monitoring application allowing to
watch signal and noise levels, packet statistics, device configuration and
network parameters of wireless network hardware.

[Peter: needs host-pkgconf, explain CC override]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |  1 +
 package/wavemon/Config.in    | 18 ++++++++++++++++++
 package/wavemon/wavemon.hash |  3 +++
 package/wavemon/wavemon.mk   | 19 +++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0f0c376..f0180cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1594,6 +1594,7 @@ endif
 	source "package/vpnc/Config.in"
 	source "package/vsftpd/Config.in"
 	source "package/vtun/Config.in"
+	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
 	source "package/wireless-regdb/Config.in"
diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
new file mode 100644
index 0000000..b0f2f34
--- /dev/null
+++ b/package/wavemon/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_WAVEMON
+	bool "wavemon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBNL
+	help
+	  wavemon is a wireless device monitoring application that allows you
+	  to watch signal and noise levels, packet statistics, device
+	  configuration and network parameters of your wireless network
+	  hardware.
+
+	  Note that you need a Linux Kernel configuration with wireless
+	  extensions or with wireless extensions compatibility enabled.
+
+	  https://github.com/uoaerg/wavemon
+
+comment "wavemon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
new file mode 100644
index 0000000..e35f6ac
--- /dev/null
+++ b/package/wavemon/wavemon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  81ee1f06f8349fee62e98ec5b53dff5b76c4d8fcb439f20cca806255239e3a2a  wavemon-v0.8.0.tar.gz
+sha256  681b86ef1469df8f7091040258dd01169bea2a7df294185c35bc867725deab2f  01e987a032b81af7bbeba1c439759d750dc1f398.patch
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
new file mode 100644
index 0000000..746d45f
--- /dev/null
+++ b/package/wavemon/wavemon.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# wavemon
+#
+################################################################################
+
+WAVEMON_VERSION = v0.8.0
+WAVEMON_SITE = $(call github,uoaerg,wavemon,$(WAVEMON_VERSION))
+WAVEMON_LICENSE = GPLv3+
+WAVEMON_LICENSE_FILES = COPYING
+WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
+
+# Fix musl build issue
+WAVEMON_PATCH = https://github.com/uoaerg/wavemon/commit/01e987a032b81af7bbeba1c439759d750dc1f398.patch
+
+# Handwritten Makefile.in, automake isn't used
+WAVEMON_MAKE_OPTS = CC="$(TARGET_CC)"
+
+$(eval $(autotools-package))
