From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 May 2021 11:43:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: add optional dependencies to
 udev, libxml2, ncurses & numactl
Message-ID: <20210523094346.118963-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udev:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L626

libxml2:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L1273

ncurses:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L340

numactl:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L419

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hwloc/hwloc.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 77a25a1775..8a08ab89c8 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -27,6 +27,13 @@ HWLOC_CONF_OPTS = \
 	--disable-libxml2 \
 	--disable-doxygen
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+HWLOC_CONF_OPTS += --enable-libudev
+HWLOC_DEPENDENCIES += udev
+else
+HWLOC_CONF_OPTS += --disable-libudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
 HWLOC_CONF_OPTS += --enable-pci
 HWLOC_DEPENDENCIES += libpciaccess
@@ -34,4 +41,19 @@ else
 HWLOC_CONF_OPTS += --disable-pci
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+HWLOC_CONF_OPTS += --enable-libxml2
+HWLOC_DEPENDENCIES += libxml2
+else
+HWLOC_CONF_OPTS += --disable-libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+HWLOC_DEPENDENCIES += ncurses
+endif
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+HWLOC_DEPENDENCIES += numactl
+endif
+
 $(eval $(autotools-package))
-- 
2.29.2
