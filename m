From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:15 -0000
Subject: [Buildroot] [git commit] netsniff-ng: new package
Message-ID: <20151201232114.9A9E0821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=500d287b07190c9c1a1284bc91b37d07e1a835a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - add comment in Config.in to explain why this package depends on
   glibc, and specifically why it doesn't build for uClibc and musl.
 - add hash file.
 - add 'COPYING' to the list of LICENSE_FILES
 - add themissing <pkg>_DEPENDENCIES variable in the .mk file, to make
   sure dependencies are built before netsniff-ng.
 - add comment in the .mk file explain why we're using the
   generic-package infrastructure even if the build procedure is
   essentially ./configure, make, make install.
 - fix indentation in NETSNIFF_NG_CONFIGURE_CMDS.]

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/netsniff-ng/Config.in        | 24 ++++++++++++++++++++++++
 package/netsniff-ng/netsniff-ng.hash |  2 ++
 package/netsniff-ng/netsniff-ng.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

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
index 0000000..8c48f39
--- /dev/null
+++ b/package/netsniff-ng/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_NETSNIFF_NG
+	bool "netsniff-ng"
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBCLI
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_LIBNET
+	# Build with uClibc fails due to missing ceill()
+	# Build with musl fails due to various header issues
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
diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
new file mode 100644
index 0000000..935003c
--- /dev/null
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f0008edd31df93822b7befe50cfb3740ce6fd35b1013ae3a73b2a389a41022e4 netsniff-ng-v0.5.9.tar.gz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
new file mode 100644
index 0000000..4fed88c
--- /dev/null
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# netsniff-ng
+#
+################################################################################
+
+NETSNIFF_NG_VERSION = v0.5.9
+NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
+NETSNIFF_NG_LICENSE = GPLv2
+NETSNIFF_NG_LICENSE_FILES = README COPYING
+NETSNIFF_NG_DEPENDENCIES = \
+	libnl libpcap libcli libnetfilter_conntrack \
+	liburcu libnet
+
+# hand-written configure script and makefile
+define NETSNIFF_NG_CONFIGURE_CMDS
+	(cd $(@D); \
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
