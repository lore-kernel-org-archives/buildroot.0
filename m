From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 14:13:19 +0200
Subject: [Buildroot] [git commit] package/hwloc: add optional dependencies
 to udev, libxml2, ncurses & numactl
Message-ID: <20210523114429.5CBF981233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=648ff342db3bac164e098673ded1a82bb843f91a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udev:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L626

libxml2:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L1273

ncurses:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L340

numactl:
https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L419

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: drop unconditional --disable-libxml2]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/hwloc/hwloc.mk | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 77a25a1775..2a5a82cea4 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -24,9 +24,15 @@ HWLOC_CONF_OPTS = \
 	--disable-nvml \
 	--disable-gl \
 	--disable-cairo \
-	--disable-libxml2 \
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
@@ -34,4 +40,19 @@ else
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
