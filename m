From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:36:39 +0100
Subject: [Buildroot] [git commit] package/collectd: bump version to 5.5.1
Message-ID: <20160201224703.D96857F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29baa2cc4ba76eb34cd95d06c3ec2a4200064920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed COLLECTD_AUTORECONF=yes because our patches applied were applied
upstream:
http://git.verplant.org/?p=collectd.git;a=commitdiff;h=780e6a76021a240e95007a04b723d827120afa95
http://git.verplant.org/?p=collectd.git;a=commitdiff;h=3e3848349b753d78a0b1d19648fb394866856bda

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...libavltree-libcommon-libheap-dependencies.patch | 21 ----------------
 package/collectd/0002-ipc-enable-gnu-source.patch  | 28 ----------------------
 package/collectd/collectd.hash                     |  4 ++--
 package/collectd/collectd.mk                       |  4 +---
 4 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch b/package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch
deleted file mode 100644
index 1ee1e7c..0000000
--- a/package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-build: add libavltree, libcommon & libheap dependencies
-
-Otherwise it can break on very parallel builds since collectd link time
-arrives before one or more of these were built.
-
-Status: requested github pull (patch slightly different for newer rev).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura collectd-5.5.0.orig/src/daemon/Makefile.am collectd-5.5.0/src/daemon/Makefile.am
---- collectd-5.5.0.orig/src/daemon/Makefile.am	2015-07-06 10:01:17.820506239 -0300
-+++ collectd-5.5.0/src/daemon/Makefile.am	2015-07-06 10:02:03.364054763 -0300
-@@ -49,7 +49,7 @@
- collectd_CFLAGS = $(AM_CFLAGS)
- collectd_LDFLAGS = -export-dynamic
- collectd_LDADD = libavltree.la libcommon.la libheap.la -lm
--collectd_DEPENDENCIES =
-+collectd_DEPENDENCIES = libavltree.la libcommon.la libheap.la
- 
- # Link to these libraries..
- if BUILD_WITH_LIBRT
diff --git a/package/collectd/0002-ipc-enable-gnu-source.patch b/package/collectd/0002-ipc-enable-gnu-source.patch
deleted file mode 100644
index 459fdbd..0000000
--- a/package/collectd/0002-ipc-enable-gnu-source.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-https://github.com/collectd/collectd/commit/3e3848349b753d78a0b1d19648fb394866856bda
-
-    ipc: enable _GNU_SOURCE to fix build with musl libc
-
-    This fixes compile the compile error:
-
-    > ipc.c:154:49: error: 'struct shm_info' has no member named 'used_ids'
-    >    ipc_submit_g("shm", "segments", NULL, shm_info.used_ids);
-    >                                                   ^
-
-    Fixes #1147
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
-diff --git a/src/ipc.c b/src/ipc.c
-index 3763f24..b403847 100644
---- a/src/ipc.c
-+++ b/src/ipc.c
-@@ -32,6 +32,9 @@
- #include "configfile.h"
- 
- #if KERNEL_LINUX
-+  /* _GNU_SOURCE is needed for struct shm_info.used_ids on musl libc */
-+# define _GNU_SOURCE
-+
-   /* X/OPEN tells us to use <sys/{types,ipc,sem}.h> for semctl() */
-   /* X/OPEN tells us to use <sys/{types,ipc,msg}.h> for msgctl() */
-   /* X/OPEN tells us to use <sys/{types,ipc,shm}.h> for shmctl() */
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 43bcfdd..3d982fe 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,2 +1,2 @@
-# From http://collectd.org/download.shtml
-sha256	847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88	collectd-5.5.0.tar.bz2
+# From https://collectd.org/files/SHA256SUM
+sha256	f9c5d526e1f0429a7db1ccd90bdf9e23923a2fd43b7285cfda8f0341e5c0bc3f	collectd-5.5.1.tar.bz2
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index d7fd8f9..06c5389 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.5.0
+COLLECTD_VERSION = 5.5.1
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = GPLv2, LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
-# For 0001-build-add-libavltree-libcommon-libheap-dependencies.patch
-COLLECTD_AUTORECONF = YES
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
