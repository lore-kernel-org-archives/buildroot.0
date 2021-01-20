From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Jan 2021 18:54:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/mono: disable boehm
In-Reply-To: <20210120175443.157316-1-fontaine.fabrice@gmail.com>
References: <20210120175443.157316-1-fontaine.fabrice@gmail.com>
Message-ID: <20210120175443.157316-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mono uses the Unity fork of recent Boehm since version 6.10.0.65 and
https://github.com/mono/mono/commit/cc137237d86b0553e844dc34c9a3cbc5b20782c0

However, this raises the following build failure:

/tmp/instance-0/output-1/per-package/mono/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/string3.h:81: warning: memset used with constant zero length parameter; this could be due to transposed parameters
../../external/bdwgc/.libs/libgc.a(gc.o): In function `GC_steal_mark_stack':
gc.c:(.text+0x1d18): undefined reference to `AO_store_full_emulation'

So just disable boehm

Fixes:
 - http://autobuild.buildroot.org/results/f921db5824b3062ba37c91af0ac07835c6e1b34c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mono/mono.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index df3481a498..dc11e744e8 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -22,6 +22,7 @@ MONO_COMMON_CONF_OPTS = --with-mcs-docs=no \
 	--with-ikvm-native=no \
 	--enable-minimal=profiler,debug \
 	--enable-static \
+	--disable-boehm \
 	--disable-btls \
 	--disable-system-aot
 
-- 
2.29.2
