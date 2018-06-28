From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 21:28:58 +0200
Subject: [Buildroot] [git commit] wampcc: new package
Message-ID: <20180628192837.9D66583601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=985009e9c0f2526cd878a2fe1ebadfe9dcebcab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <neumann@teufel.de>
[Thomas:
 - add entry to DEVELOPERS file
 - add missing dependency on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 - rework comments on the dependencies]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/wampcc/Config.in   | 25 +++++++++++++++++++++++++
 package/wampcc/wampcc.hash |  3 +++
 package/wampcc/wampcc.mk   | 14 ++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c52a57c507..d26c53b2de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1883,6 +1883,7 @@ F:	package/python-influxdb/
 
 N:	Sven Neumann <neumann@teufel.de>
 F:	package/gstreamer1/gst1-libav/
+F:	package/wampcc/
 
 N:	Sven Neumann <s.neumann@raumfeld.com>
 F:	package/glib-networking/
diff --git a/package/Config.in b/package/Config.in
index a012d2c809..f72670c4e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1487,6 +1487,7 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
+	source "package/wampcc/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
 	source "package/zyre/Config.in"
diff --git a/package/wampcc/Config.in b/package/wampcc/Config.in
new file mode 100644
index 0000000000..d9d82df3ef
--- /dev/null
+++ b/package/wampcc/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_WAMPCC
+	bool "wampcc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_USE_MMU # libuv
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_OPENSSL
+	help
+	  wampcc is a C++ library that implements the Web Application
+	  Messaging Protocol.
+
+	  https://github.com/darrenjs/wampcc
+
+comment "wampcc needs a toolchain w/ NPTL, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
+comment "wampcc needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/wampcc/wampcc.hash b/package/wampcc/wampcc.hash
new file mode 100644
index 0000000000..162dcab0ec
--- /dev/null
+++ b/package/wampcc/wampcc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b3c3633b4c6a74d7ac8a676a7ea30fbfde7ae19aa1fc37de3b8aa3a553b674a2  wampcc-v1.6.tar.gz
+sha256  bd185b1ec8a292d42b42346757ff6e198073e13c1e080e9ea548d34dd42d30d8  LICENSE
diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
new file mode 100644
index 0000000000..d8e093f679
--- /dev/null
+++ b/package/wampcc/wampcc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# wampcc
+#
+################################################################################
+
+WAMPCC_VERSION = v1.6
+WAMPCC_SITE = $(call github,darrenjs,wampcc,$(WAMPCC_VERSION))
+WAMPCC_DEPENDENCIES = host-pkgconf libuv jansson openssl
+WAMPCC_INSTALL_STAGING = YES
+WAMPCC_LICENSE = MIT
+WAMPCC_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
