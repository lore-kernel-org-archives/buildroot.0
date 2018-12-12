From: Brenke, Maik <Maik.Brenke@continental-corporation.com>
Date: Wed, 12 Dec 2018 07:53:11 +0000
Subject: [Buildroot] WG: [PATCH] package/vsomeip: new package
In-Reply-To: <20181211181825.5733-1-maik.brenke@mail.de>
References: <20181211181825.5733-1-maik.brenke@mail.de>
Message-ID: <AM6PR0302MB3349E33E85C8C02FD8BE1B31A0A70@AM6PR0302MB3349.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maik Brenke <maik.brenke@continental-corporation.com>

Signed-off-by: Maik Brenke <maik.brenke@continental-corporation.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/vsomeip/Config.in    | 22 ++++++++++++++++++++++
 package/vsomeip/vsomeip.hash |  5 +++++
 package/vsomeip/vsomeip.mk   | 13 +++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/vsomeip/Config.in
 create mode 100644 package/vsomeip/vsomeip.hash
 create mode 100644 package/vsomeip/vsomeip.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8d5ed19..54a0331 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1258,6 +1258,9 @@ F:        package/mpv/
 F:      package/rpi-firmware/
 F:      package/rpi-userland/

+N:     Maik Brenke, <maik.brenke@continental-corporation.com>
+F:     package/vsomeip/
+
 N:      Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
 F:      package/nvme/

diff --git a/package/Config.in b/package/Config.in
index 712e360..7ebb739 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1582,6 +1582,7 @@ menu "Networking"
         source "package/sofia-sip/Config.in"
         source "package/thrift/Config.in"
         source "package/usbredir/Config.in"
+       source "package/vsomeip/Config.in"
         source "package/wampcc/Config.in"
         source "package/zeromq/Config.in"
         source "package/zmqpp/Config.in"
diff --git a/package/vsomeip/Config.in b/package/vsomeip/Config.in
new file mode 100644
index 0000000..7244c26
--- /dev/null
+++ b/package/vsomeip/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_VSOMEIP
+       bool "vsomeip"
+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+       depends on BR2_INSTALL_LIBSTDCPP
+       depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+       depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+       select BR2_PACKAGE_BOOST
+       select BR2_PACKAGE_BOOST_SYSTEM
+       select BR2_PACKAGE_BOOST_THREAD
+       select BR2_PACKAGE_BOOST_LOG
+       help
+         The vsomeip stack implements the Scalable service-Oriented
+         MiddlewarE over IP (SOME/IP)) protocol (http://some-ip.com/).
+         The stack consists out of:
+          * a shared library for SOME/IP (`libvsomeip.so`)
+          * a second shared library for SOME/IP's service discovery
+            (`libvsomeip-sd.so`) which is loaded during runtime if
+            the service discovery is enabled.
+         https://github.com/GENIVI/vsomeip
+comment "vsomeip needs a toolchain w/ C++, threads, gcc >= 4.8"
+       depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/vsomeip/vsomeip.hash b/package/vsomeip/vsomeip.hash
new file mode 100644
index 0000000..c872c72
--- /dev/null
+++ b/package/vsomeip/vsomeip.hash
@@ -0,0 +1,5 @@
+# Copied from https://github.com/GENIVI/vsomeip/
+md5    72c81358a15eb32e28b6249efda0635e        vsomeip-2.10.21.tar.gz
+sha256 c0ce3a3cf135f5c1538f7a33f98a2d6febfdfe7dcba3f42fdb7bb20d5fd1d4e3        vsomeip-2.10.21.tar.gz
+# License files, locally calculated
+sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85        LICENSE
diff --git a/package/vsomeip/vsomeip.mk b/package/vsomeip/vsomeip.mk
new file mode 100644
index 0000000..aebf707
--- /dev/null
+++ b/package/vsomeip/vsomeip.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# vsomeip
+#
+################################################################################
+VSOMEIP_VERSION = 2.10.21
+VSOMEIP_SITE = $(call github,GENIVI,vsomeip,$(VSOMEIP_VERSION))
+VSOMEIP_LICENSE = MPL-2.0
+VSOMEIP_LICENSE_FILES = LICENSE
+
+VSOMEIP_DEPENDENCIES = boost
+
+$(eval $(cmake-package))
--
2.7.4

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181212/26cca9ac/attachment.html>
