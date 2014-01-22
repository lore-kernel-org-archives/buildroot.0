From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 22 Jan 2014 08:26:33 +0100
Subject: [Buildroot] [PATCH v2] libnftnl: new package
Message-ID: <1390375593-20554-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
v2: add toolchain dependecies (Gustavo Zacarias)

 package/Config.in            |    1 +
 package/libnftnl/Config.in   |   18 ++++++++++++++++++
 package/libnftnl/libnftnl.mk |   15 +++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/libnftnl/Config.in
 create mode 100644 package/libnftnl/libnftnl.mk

diff --git a/package/Config.in b/package/Config.in
index 8495cdd..d2e0424 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -675,6 +675,7 @@ source "package/libnetfilter_cttimeout/Config.in"
 source "package/libnetfilter_log/Config.in"
 source "package/libnetfilter_queue/Config.in"
 source "package/libnfnetlink/Config.in"
+source "package/libnftnl/Config.in"
 source "package/libnl/Config.in"
 source "package/liboauth/Config.in"
 source "package/liboping/Config.in"
diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
new file mode 100644
index 0000000..0c7f659
--- /dev/null
+++ b/package/libnftnl/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBNFTNL
+	bool "libnftnl"
+	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBMNL
+	help
+	  libnftnl is a userspace library providing a low-level
+	  netlink programming interface (API) to the in-kernel
+	  nf_tables subsystem. The library libnftnl has been
+	  previously known as libnftables. This library is
+	  currently used by nftables.
+
+	  http://netfilter.org/projects/libnftnl/index.html
+
+comment "libnftnl needs a toolchain w/ threads, IPv6, largefile"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_INET_IPV6 && \
+		BR2_LARGEFILE
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
new file mode 100644
index 0000000..bb8bdb4
--- /dev/null
+++ b/package/libnftnl/libnftnl.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libnftnl
+#
+################################################################################
+
+LIBNFTNL_VERSION = 1.0.0
+LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files/
+LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
+LIBNFTNL_LICENSE = GPLv2
+LIBNFTNL_LICENSE_FILES = COPYING
+LIBNFTNL_INSTALL_STAGING = YES
+LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
+
+$(eval $(autotools-package))
-- 
1.7.7
