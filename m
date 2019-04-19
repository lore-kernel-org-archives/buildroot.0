From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 19 Apr 2019 17:15:53 -0400
Subject: [Buildroot] [PATCH 02/10] package/gstreamer1/gst1-imx: fix
 integration with gstreamer 1.14
In-Reply-To: <20190419211601.53431-1-aduskett@gmail.com>
References: <20190419211601.53431-1-aduskett@gmail.com>
Message-ID: <20190419211601.53431-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In GStreamer 1.14 the GstPhysMemoryAllocator interface moved from bad to base.
This fixes glimagesink with the imx video decoder.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...-fix-integration-with-gstreamer-1.14.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/gstreamer1/gst1-imx/0001-fix-integration-with-gstreamer-1.14.patch

diff --git a/package/gstreamer1/gst1-imx/0001-fix-integration-with-gstreamer-1.14.patch b/package/gstreamer1/gst1-imx/0001-fix-integration-with-gstreamer-1.14.patch
new file mode 100644
index 0000000000..bd9044fbf2
--- /dev/null
+++ b/package/gstreamer1/gst1-imx/0001-fix-integration-with-gstreamer-1.14.patch
@@ -0,0 +1,70 @@
+From 6d609aa11405b6f25206fa2ee53422aac76b2ab1 Mon Sep 17 00:00:00 2001
+From: Lukas Studer <lukas.studer@distran.ch>
+Date: Fri, 5 Apr 2019 10:41:39 +0200
+Subject: [PATCH] Fix integration with GStreamer 1.14
+
+In GStreamer 1.14 the GstPhysMemoryAllocator interface moved from -bad
+to -base.
+
+Upstream status: pending
+https://github.com/Freescale/gstreamer-imx/pull/229/
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ src/common/phys_mem_allocator.c |  4 ++--
+ wscript                         | 10 ++++++----
+ 2 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/src/common/phys_mem_allocator.c b/src/common/phys_mem_allocator.c
+index a454bec..b0da738 100644
+--- a/src/common/phys_mem_allocator.c
++++ b/src/common/phys_mem_allocator.c
+@@ -20,7 +20,7 @@
+ #include <string.h>
+ #include "phys_mem_allocator.h"
+ 
+-#ifdef WITH_GSTBADALLOCATORS
++#ifdef WITH_GSTALLOCATORS
+ #include <gst/allocators/gstphysmemory.h>
+ #endif
+ 
+@@ -38,7 +38,7 @@ static GstMemory* gst_imx_phys_mem_allocator_copy(GstMemory *mem, gssize offset,
+ static GstMemory* gst_imx_phys_mem_allocator_share(GstMemory *mem, gssize offset, gssize size);
+ static gboolean gst_imx_phys_mem_allocator_is_span(GstMemory *mem1, GstMemory *mem2, gsize *offset);
+ 
+-#ifdef WITH_GSTBADALLOCATORS
++#ifdef WITH_GSTALLOCATORS
+ 
+ static guintptr gst_imx_phys_mem_allocator_get_phys_addr(GstPhysMemoryAllocator *allocator, GstMemory *mem)
+ {
+diff --git a/wscript b/wscript
+index 2777262..8264eff 100644
+--- a/wscript
++++ b/wscript
+@@ -167,7 +167,9 @@ def configure(conf):
+ 	else:
+ 		Logs.pprint('RED', 'could not find gstvideo library - not building video plugins')
+ 	if conf.check_cfg(package = 'gstreamer-bad-allocators-1.0', uselib_store = 'GSTREAMER_BAD_ALLOCATORS', args = '--cflags --libs', mandatory = 0):
+-		conf.env['WITH_GSTBADALLOCATORS'] = True
++		conf.env['WITH_GSTALLOCATORS'] = True
++	if conf.check_cfg(package = 'gstreamer-allocators-1.0', uselib_store = 'GSTREAMER_ALLOCATORS', args = '--cflags --libs', mandatory = 0):
++		conf.env['WITH_GSTALLOCATORS'] = True
+ 	if conf.check_cc(lib = 'gstphotography-1.0', uselib_store = 'GSTPHOTOGRAPHY', mandatory = 0):
+ 		conf.env['WITH_GSTPHOTOGRAPHY'] = True
+ 
+@@ -196,11 +198,11 @@ def configure(conf):
+ 	conf.define('PACKAGE_BUGREPORT', "https://github.com/Freescale/gstreamer-imx")
+ 	conf.define('VERSION', gstimx_version)
+ 
+-	if conf.env['WITH_GSTBADALLOCATORS']:
+-		conf.define('WITH_GSTBADALLOCATORS', 1)
++	if conf.env['WITH_GSTALLOCATORS']:
++		conf.define('WITH_GSTALLOCATORS', 1)
+ 
+ 	conf.env['GSTIMX_VERSION'] = gstimx_version
+-	conf.env['COMMON_USELIB'] = ['GSTREAMER', 'GSTREAMER_BASE', 'GSTREAMER_AUDIO', 'GSTREAMER_VIDEO', 'GSTREAMER_BAD_ALLOCATORS', 'PTHREAD', 'M']
++	conf.env['COMMON_USELIB'] = ['GSTREAMER', 'GSTREAMER_BASE', 'GSTREAMER_AUDIO', 'GSTREAMER_VIDEO', 'GSTREAMER_ALLOCATORS', 'GSTREAMER_BAD_ALLOCATORS', 'PTHREAD', 'M']
+ 
+ 
+ 	conf.recurse('src/common')
+
-- 
2.20.1
