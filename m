From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed, 18 Nov 2015 14:41:51 +0100
Subject: [Buildroot] [PATCH 1/1] netsniff-ng: override NACL_INC_DIR and
	NACL_LIB_DIR to fix broken builds on system where nacl is
	installed + add dependencies on geoip,
	ncurses and zlib so that the entire netsniff-ng toolset can be build
Message-ID: <1447854111-5299-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/netsniff-ng/Config.in      | 3 +++
 package/netsniff-ng/netsniff-ng.mk | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 8c48f39..fe02ea3 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_NETSNIFF_NG
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_GEOIP
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_ZLIB
 	# Build with uClibc fails due to missing ceill()
 	# Build with musl fails due to various header issues
 	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 4fed88c..a6dfb61 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -8,13 +8,17 @@ NETSNIFF_NG_VERSION = v0.5.9
 NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
 NETSNIFF_NG_LICENSE = GPLv2
 NETSNIFF_NG_LICENSE_FILES = README COPYING
+NETSNIFF_NG_CONF_ENV = \
+			NACL_INC_DIR=/dev/null \
+			NACL_LIB_DIR=/dev/null
 NETSNIFF_NG_DEPENDENCIES = \
 	libnl libpcap libcli libnetfilter_conntrack \
-	liburcu libnet
+	liburcu libnet geoip ncurses zlib
 
 # hand-written configure script and makefile
 define NETSNIFF_NG_CONFIGURE_CMDS
 	(cd $(@D); \
+		$(NETSNIFF_NG_CONF_ENV) \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
-- 
1.8.3.1
