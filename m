From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Nov 2018 23:46:33 +0100
Subject: [Buildroot] [git commit] package/alsa-utils: re-enable in
 BR2_STATIC_LIBS configuration
Message-ID: <20181107224643.5C9E281604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc717ce33964b5b83dd6db543bcd04710cffffb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 4707383c5d501a9ad7698579e5d0a4e2ab758c7e ("alsa-utils: needs
dynamic library support"), we added a !BR2_STATIC_LIBS dependency
because topology/topology.c was including <dlfcn.h>.

However, it turns out that this include is not needed/used at all, so
we can instead drop it, and re-enable the package in BR2_STATIC_LIBS
configuration.

This was discovered when analyzing why we have
package/alsa-lib/0003-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch. This
patch fixes the AM_PATH_ALSA autoconf macro, used by alsa-utils, so
that ALSA_LIBS doesn't carry the -ldl option, fixing static-linking
scenarios. This patch had become useless since alsa-utils was no
longer available in BR2_STATIC_LIBS configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-topology.c-drop-unneeded-dlfcn.h-include.patch | 29 ++++++++++++++++++++++
 package/alsa-utils/Config.in                       |  5 ++--
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/package/alsa-utils/0001-topology-topology.c-drop-unneeded-dlfcn.h-include.patch b/package/alsa-utils/0001-topology-topology.c-drop-unneeded-dlfcn.h-include.patch
new file mode 100644
index 0000000000..2a8be0b0b7
--- /dev/null
+++ b/package/alsa-utils/0001-topology-topology.c-drop-unneeded-dlfcn.h-include.patch
@@ -0,0 +1,29 @@
+From 4c9462a5ef2f680b24ddf6bae7ac7c693fa6a136 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 1 Nov 2018 15:15:31 +0100
+Subject: [PATCH] topology/topology.c: drop unneeded <dlfcn.h> include
+
+This include is not used/needed and prevents building on systems that
+don't provide <dlfcn.h>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141375.html
+---
+ topology/topology.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/topology/topology.c b/topology/topology.c
+index 097c255..b72e341 100644
+--- a/topology/topology.c
++++ b/topology/topology.c
+@@ -27,7 +27,6 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/stat.h>
+-#include <dlfcn.h>
+ #include <getopt.h>
+ #include <assert.h>
+ 
+-- 
+2.14.4
+
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index edf5d39f26..012f28aef4 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -1,12 +1,11 @@
-comment "alsa-utils needs a toolchain w/ threads, dynamic library"
+comment "alsa-utils needs a toolchain w/ threads"
 	depends on BR2_USE_MMU # fork
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
-	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	select BR2_PACKAGE_ALSA_LIB
 	help
 	  This package contains the command line utilities for the ALSA
