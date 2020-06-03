From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  3 Jun 2020 06:04:58 -0500
Subject: [Buildroot] [PATCH v2] package/ethtool: bump to 5.6
Message-ID: <20200603110458.18125-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Now by default ethtool depends on libmnl so make this optional

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Thomas
 - Noted that the libmnl is conditional and the pkgconfig dependency
   is part of the libmnl being enabled

 AC_ARG_ENABLE(netlink,
              [  --enable-netlink         enable netlink interface (enabled by default)],
              ,
              enable_netlink=yes)
if test x$enable_netlink = xyes; then
    PKG_PROG_PKG_CONFIG
    PKG_CHECK_MODULES([MNL], [libmnl])
    AC_DEFINE(ETHTOOL_ENABLE_NETLINK, 1,
              Define this to support netlink interface to talk to kernel.)
fi
---
 package/ethtool/ethtool.hash | 6 +++---
 package/ethtool/ethtool.mk   | 9 ++++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 86c71d7380..67fe263315 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	22f81e4927d6eb6a13a259d705248a96005fce2005e15257f639f5a1c8c52b6b	ethtool-5.4.tar.xz
+sha256  ca0f1b526dad5153f0aa0f1eb3c17c31770c75a74f70af622b1a83ae38043995  ethtool-5.6.tar.xz
 # Locally calculated
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1	LICENSE
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index ce4f2d862d..c36268544f 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.4
+ETHTOOL_VERSION = 5.6
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
@@ -12,4 +12,11 @@ ETHTOOL_LICENSE_FILES = LICENSE COPYING
 ETHTOOL_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_ETHTOOL_PRETTY_PRINT),--enable-pretty-dump,--disable-pretty-dump)
 
+ifeq ($(BR2_PACKAGE_LIBMNL),y)
+ETHTOOL_DEPENDENCIES += host-pkgconf libmnl
+ETHTOOL_CONF_OPTS += --enable-netlink
+else
+ETHTOOL_CONF_OPTS += --disable-netlink
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
