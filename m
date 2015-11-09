From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Mon,  9 Nov 2015 10:03:32 +0100
Subject: [Buildroot] [PATCH 2/2] netsniff-ng:new package
In-Reply-To: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <1447059812-26424-2-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/Config.in                  |  1 +
 package/netsniff-ng/Config.in      | 22 ++++++++++++++++++++++
 package/netsniff-ng/netsniff-ng.mk | 30 ++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/netsniff-ng/Config.in
 create mode 100644 package/netsniff-ng/netsniff-ng.mk

diff --git a/package/Config.in b/package/Config.in
index e0b42c0..0a80afb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -88,6 +88,7 @@ endif
 	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
 	source "package/netperf/Config.in"
+	source "package/netsniff-ng/Config.in"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
 	source "package/pv/Config.in"
diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
new file mode 100644
index 0000000..448e853
--- /dev/null
+++ b/package/netsniff-ng/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_NETSNIFF_NG
+	bool "netsniff-ng"
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBCLI
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_LIBNET
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
+	help
+	  netsniff-ng is a free, performant Linux network analyzer and
+	  networking toolkit. If you will, the Swiss army knife for
+	  network packets.
+
+comment "netsniff-ng needs an (e)glibc toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854
+
+comment "netsniff-ng needs a toolchain not affected by GCC bug 58854"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
new file mode 100644
index 0000000..6f755a1
--- /dev/null
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# netsniff-ng
+#
+################################################################################
+
+NETSNIFF_NG_VERSION = v0.5.9
+NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
+NETSNIFF_NG_LICENSE = GPLv2
+NETSNIFF_NG_LICENSE_FILES = README
+
+define NETSNIFF_NG_CONFIGURE_CMDS
+		(cd $(@D); \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--prefix=$(TARGET_DIR)/usr \
+	)
+endef
+
+define NETSNIFF_NG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NETSNIFF_NG_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		PREFIX=$(TARGET_DIR)/usr ETCDIR=$(TARGET_DIR)/etc install -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.1
