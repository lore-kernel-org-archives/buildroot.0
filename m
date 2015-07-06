From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 15:48:43 +0200
Subject: [Buildroot] [git commit] collectd: fix parallel build issues
Message-ID: <20150706134849.8979680120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a562d2968ac3bff353030be8dab0a1990503000d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For version 5.5.x a reorganization was made and some common funtionality
was moved to libraries, however proper dependency accounting isn't
handled in the Makefile thus causing build breakage on some parallel
builds. Fixes:
http://autobuild.buildroot.net/results/a5e/a5e6891e9ea66ac8216d3302da3702770ef7247b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...libavltree-libcommon-libheap-dependencies.patch |   21 ++++++++++++++++++++
 package/collectd/collectd.mk                       |    2 +
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch b/package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch
new file mode 100644
index 0000000..1ee1e7c
--- /dev/null
+++ b/package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch
@@ -0,0 +1,21 @@
+build: add libavltree, libcommon & libheap dependencies
+
+Otherwise it can break on very parallel builds since collectd link time
+arrives before one or more of these were built.
+
+Status: requested github pull (patch slightly different for newer rev).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura collectd-5.5.0.orig/src/daemon/Makefile.am collectd-5.5.0/src/daemon/Makefile.am
+--- collectd-5.5.0.orig/src/daemon/Makefile.am	2015-07-06 10:01:17.820506239 -0300
++++ collectd-5.5.0/src/daemon/Makefile.am	2015-07-06 10:02:03.364054763 -0300
+@@ -49,7 +49,7 @@
+ collectd_CFLAGS = $(AM_CFLAGS)
+ collectd_LDFLAGS = -export-dynamic
+ collectd_LDADD = libavltree.la libcommon.la libheap.la -lm
+-collectd_DEPENDENCIES =
++collectd_DEPENDENCIES = libavltree.la libcommon.la libheap.la
+ 
+ # Link to these libraries..
+ if BUILD_WITH_LIBRT
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 7649f72..6e1ea5c 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -11,6 +11,8 @@ COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = GPLv2 LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
+# For 0001-build-add-libavltree-libcommon-libheap-dependencies.patch
+COLLECTD_AUTORECONF = YES
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
