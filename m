From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 00:21:11 +0100
Subject: [Buildroot] [git commit] libevas: autodetect cpu variant code
	tuning options
Message-ID: <20120128232349.465E29091F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4e64bd61b29b70de69172628ef722b82d928510
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for ffmpeg.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in  |   44 ----------------------------------------
 package/efl/libevas/libevas.mk |   25 +++++++++++----------
 2 files changed, 13 insertions(+), 56 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 5b48af2..637d895 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -137,50 +137,6 @@ config BR2_PACKAGE_LIBEVAS_GLES_S3C6410
 endchoice
 
 
-comment "libevas code tuning"
-
-config BR2_PACKAGE_LIBEVAS_DISABLE_C
-	bool "libevas disable C code"
-	depends on BR2_PACKAGE_LIBEVAS_MMX || BR2_PACKAGE_LIBEVAS_SSE || BR2_PACKAGE_LIBEVAS_SSE3
-	help
-	  This disables the generic C fallback code which is not required
-	  if MMX or SSE is used instead.
-
-config BR2_PACKAGE_LIBEVAS_MMX
-	bool "libevas MMX routines"
-	depends on BR2_i386 || BR2_x86_64
-	help
-	  This enables the MMX optimized routines. this works for
-	  Pentium, Pentium 2, Pentium 3, Pentium 4, Athlon and Duron
-	  processors.
-
-config BR2_PACKAGE_LIBEVAS_SSE
-	bool "libevas SSE routines"
-	depends on BR2_i386 || BR2_x86_64
-	help
-	  This enables SSE optimizations available in the Pentium 3 and
-	  4 cpus (not Athlon and Duron or Pentium 2 or Pentium cpus).
-
-config BR2_PACKAGE_LIBEVAS_SSE3
-	bool "libevas SSE3 routines"
-	depends on BR2_i386 || BR2_x86_64
-	help
-	  This enables SSE3 optimizations available in the Pentium 4 and
-	  above cpus.
-
-config BR2_PACKAGE_LIBEVAS_ALTIVEC
-	bool "libevas altivec routines"
-	depends on BR2_powerpc
-	help
-	  This enables AltiVec optimizations available in some PowerPC cpus.
-
-config BR2_PACKAGE_LIBEVAS_NEON
-	bool "libevas neon routines"
-	depends on BR2_arm
-	help
-	  This enables NEON optimizations available in some ARM cpus.
-
-
 comment "libevas loaders"
 
 config BR2_PACKAGE_LIBEVAS_PNG
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 1a96551..3a1e42d 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -93,27 +93,28 @@ LIBEVAS_CONF_OPT += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
 endif
 
 # code options
-ifeq ($(BR2_PACKAGE_LIBEVAS_DISABLE_C),y)
-LIBEVAS_CONF_OPT += --disable-cpu-c
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_MMX),y)
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+# enable if cpu variant has mmx support
+ifneq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
 LIBEVAS_CONF_OPT += --enable-cpu-mmx
-endif
 
-ifeq ($(BR2_PACKAGE_LIBEVAS_SSE),y)
+ifneq ($(BR2_x86_pentium_mmx)$(BR2_x86_pentium2)$(BR2_x86_k6)$(BR2_x86_k6_2)$(BR2_x86_athlon)$(BR2_x86_c3)$(BR2_x86_winchip_c6)$(BR2_x86_winchip2),y)
 LIBEVAS_CONF_OPT += --enable-cpu-sse
-endif
 
-ifeq ($(BR2_PACKAGE_LIBEVAS_SSE3),y)
+ifneq ($(BR2_x86_pentium3)$(BR2_x86_pentium4)$(BR2_x86_prescott)$(BR2_x86_athlon_4)$(BR2_x86_opteron)$(BR2_x86_c32)$(BR2_x86_64_opteron),y)
 LIBEVAS_CONF_OPT += --enable-cpu-sse3
-endif
 
-ifeq ($(BR2_PACKAGE_LIBEVAS_ALTIVEC),y)
+endif # sse3
+endif # sse
+endif # mmx
+endif # x86
+
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
 LIBEVAS_CONF_OPT += --enable-cpu-altivec
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEVAS_NEON),y)
+ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
+# NEON is optional for A9
 LIBEVAS_CONF_OPT += --enable-cpu-neon
 endif
 
