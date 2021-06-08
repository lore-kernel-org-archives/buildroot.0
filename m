From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 08:39:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/hwloc: add
 optional dependencies to udev, libxml2, ncurses & numactl
Message-ID: <20210608064257.189238C56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc116b690b1f1766b242401d05ea7ad09fea6f74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 648ff342db3bac164e098673ded1a82bb843f91a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwloc/hwloc.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 9ec94f818d..b3cc5604d0 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -20,9 +20,15 @@ HWLOC_CONF_OPTS = \
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
@@ -30,6 +36,17 @@ else
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
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 HWLOC_CONF_OPTS += --enable-libnuma
 HWLOC_DEPENDENCIES += numactl
