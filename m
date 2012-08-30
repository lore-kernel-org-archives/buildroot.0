From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Aug 2012 05:09:11 +0200
Subject: [Buildroot] [git commit branch/next] liblo: new pachage
Message-ID: <20120830031120.69D33994F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa6e224e589be3386b9b6b7a9bf25fc26325efa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

liblo is an implementation of the Open Sound Control protocol
for POSIX systems.

http://liblo.sourceforge.net/

[thomas.petazzoni at free-electrons.com: add dependency on thread support
in toolchain]

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/liblo/Config.in |   11 +++++++++++
 package/liblo/liblo.mk  |   14 ++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f0fe0a6..5b4788f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -295,6 +295,7 @@ source "package/libcdaudio/Config.in"
 source "package/libcue/Config.in"
 source "package/libcuefile/Config.in"
 source "package/libid3tag/Config.in"
+source "package/liblo/Config.in"
 source "package/libmad/Config.in"
 source "package/libmpd/Config.in"
 source "package/libreplaygain/Config.in"
diff --git a/package/liblo/Config.in b/package/liblo/Config.in
new file mode 100644
index 0000000..4c2d719
--- /dev/null
+++ b/package/liblo/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBLO
+	bool "liblo"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  liblo is an implementation of the Open Sound Control
+	  protocol for POSIX systems
+
+	  http://liblo.sourceforge.net/
+
+comment "liblo requires thread support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
new file mode 100644
index 0000000..924c3a7
--- /dev/null
+++ b/package/liblo/liblo.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# liblo
+#
+#############################################################
+LIBLO_VERSION = 0.26
+LIBLO_SOURCE = liblo-$(LIBLO_VERSION).tar.gz
+LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
+
+LIBLO_LICENSE = LGPLv2.1+
+LIBLO_LICENSE_FILES = COPYING
+LIBLO_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
