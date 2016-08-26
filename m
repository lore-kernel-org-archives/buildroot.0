From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 22:44:58 +0200
Subject: [Buildroot] [PATCH] pixman: properly enable/disable ARM
	optimizations
Message-ID: <1472244298-13978-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pixman ARM optimized code assumes that ARM instructions are
available. Unfortunately, the configure.ac checks do not detect that the
platform is Thumb-only for Cortex-M builds, so it enables the ARM
optimizations, leading to failures like:

error: /home/test/autobuild/run/instance-3/output/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libpixman-1.a(pixman-arm-simd-asm-scaled.o): Conflicting CPU architectures 13/1

When building programs linked with pixman on Thumb-only
architectures. This is due to the fact that some object files in
libpixman-1.a are built for the ARM instruction set.

To resolve this, we give better hints to the pixman configure script
about which ARM optimizations to use: the ARM SIMD optimizations need at
least a CPU that supports ARM instructions, and obviously the ARM NEON
optimizations need NEON support.

Fixes:

  http://autobuild.buildroot.net/results/54bee2ce382fcd067965d30f758f9d15514478d9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pixman/pixman.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 38524e6..ed75efe 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -20,6 +20,18 @@ PIXMAN_AUTORECONF = YES
 # don't build gtk based demos
 PIXMAN_CONF_OPTS = --disable-gtk
 
+ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
+PIXMAN_CONF_OPTS += --enable-arm-simd
+else
+PIXMAN_CONF_OPTS += --disable-arm-simd
+endif
+
+ifeq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_ARM_CPU_HAS_NEON),yy)
+PIXMAN_CONF_OPTS += --enable-arm-neon
+else
+PIXMAN_CONF_OPTS += --disable-arm-neon
+endif
+
 # disable iwmmxt support for CPU's that don't have
 # this feature
 ifneq ($(BR2_iwmmxt),y)
-- 
2.7.4
