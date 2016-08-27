From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:44:05 +0200
Subject: [Buildroot] [git commit] pixman: properly enable/disable ARM
	optimizations
Message-ID: <20160827124427.DE32481D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ba72e02b0883e61a11160f0212b51ae1e4d0c70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: add a comment above the --enable-arm-simd option, as suggested
by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pixman/pixman.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 38524e6..c797b3e 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -20,6 +20,23 @@ PIXMAN_AUTORECONF = YES
 # don't build gtk based demos
 PIXMAN_CONF_OPTS = --disable-gtk
 
+# The ARM SIMD code from pixman requires a recent enough ARM core, but
+# there is a runtime CPU check that makes sure it doesn't get used if
+# the HW doesn't support it. The only case where the ARM SIMD code
+# cannot be *built* at all is when the platform doesn't support ARM
+# instructions at all, so we have to disable that explicitly.
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
