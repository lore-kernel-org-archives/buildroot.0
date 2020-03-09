From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Mar 2020 13:34:31 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: fix vc4 neon related
 compile failure
Message-ID: <20200309123432.5943-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add mesa3d patch to add a vc4 option to disable
the optional neon support and set it dependent
on BR2_ARM_CPU_HAS_NEON.

Fixes:

  http://autobuild.buildroot.net/results/6387b0a99e1a0922811919623d9a10b0943988df

  [1086/1254] Compiling C object 'src/gallium/drivers/vc4/691f666@@vc4_neon at sta/vc4_tiling_lt_neon.c.o'.
  {standard input}: Assembler messages:
  {standard input}:334: Error: selected processor does not support `vldm r4,{q0,q1,q2,q3}' in ARM mode
  {standard input}:335: Error: selected processor does not support `vst1.8 d0,[r3],r2' in ARM mode
  {standard input}:336: Error: selected processor does not support `vst1.8 d1,[r3],r2' in ARM mode
  {standard input}:337: Error: selected processor does not support `vst1.8 d2,[r3],r2' in ARM mode
  {standard input}:338: Error: selected processor does not support `vst1.8 d3,[r3],r2' in ARM mode
  {standard input}:339: Error: selected processor does not support `vst1.8 d4,[r3],r2' in ARM mode
  {standard input}:340: Error: selected processor does not support `vst1.8 d5,[r3],r2' in ARM mode
  {standard input}:341: Error: selected processor does not support `vst1.8 d6,[r3],r2' in ARM mode

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...tion-to-disable-optional-neon-suppor.patch | 82 +++++++++++++++++++
 package/mesa3d/mesa3d.mk                      |  6 ++
 2 files changed, 88 insertions(+)
 create mode 100644 package/mesa3d/0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch

diff --git a/package/mesa3d/0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
new file mode 100644
index 0000000000..138f145af5
--- /dev/null
+++ b/package/mesa3d/0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -0,0 +1,82 @@
+From e3b47c1b84964c62b3e1fa782f1ffa4be0ae62f9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 9 Mar 2020 13:01:14 +0100
+Subject: [PATCH] vc4: add meson option to disable optional neon support
+
+Not all toolchains are able to compile the runtime
+optional vc4 neon support, so add an meson option
+to force disabling it at compile time.
+
+[Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson_options.txt                    | 7 +++++++
+ src/gallium/drivers/vc4/meson.build  | 4 ++--
+ src/gallium/drivers/vc4/vc4_tiling.h | 4 ++--
+ 3 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index a39596a6f19..0f6b6c62b55 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -117,6 +117,13 @@ option(
+   choices : ['auto', 'true', 'false'],
+   description : 'enable gallium va state tracker.',
+ )
++option(
++  'gallium-vc4-neon',
++  type : 'combo',
++  value : 'auto',
++  choices : ['auto', 'disabled'],
++  description : 'enable gallium vc4 optional neon support.',
++)
+ option(
+   'va-libs-path',
+   type : 'string',
+diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson.build
+index 5ce5af5f6b4..e3f7d8d62ae 100644
+--- a/src/gallium/drivers/vc4/meson.build
++++ b/src/gallium/drivers/vc4/meson.build
+@@ -84,7 +84,7 @@ files_libvc4 = files(
+ vc4_c_args = []
+ 
+ libvc4_neon = []
+-if host_machine.cpu_family() == 'arm'
++if host_machine.cpu_family() == 'arm' and get_option('gallium-vc4-neon') != 'disabled'
+   libvc4_neon = static_library(
+     'vc4_neon',
+     'vc4_tiling_lt_neon.c',
+@@ -93,7 +93,7 @@ if host_machine.cpu_family() == 'arm'
+     ],
+     c_args : '-mfpu=neon',
+   )
+-  vc4_c_args += '-DUSE_ARM_ASM'
++  vc4_c_args += '-DVC4_TILING_LT_NEON'
+ endif
+ 
+ if dep_simpenrose.found()
+diff --git a/src/gallium/drivers/vc4/vc4_tiling.h b/src/gallium/drivers/vc4/vc4_tiling.h
+index 66767e7f1f8..7446f1c3d0c 100644
+--- a/src/gallium/drivers/vc4/vc4_tiling.h
++++ b/src/gallium/drivers/vc4/vc4_tiling.h
+@@ -89,7 +89,7 @@ vc4_load_lt_image(void *dst, uint32_t dst_stride,
+                   void *src, uint32_t src_stride,
+                   int cpp, const struct pipe_box *box)
+ {
+-#ifdef USE_ARM_ASM
++#ifdef VC4_TILING_LT_NEON
+         if (util_cpu_caps.has_neon) {
+                 vc4_load_lt_image_neon(dst, dst_stride, src, src_stride,
+                                        cpp, box);
+@@ -105,7 +105,7 @@ vc4_store_lt_image(void *dst, uint32_t dst_stride,
+                    void *src, uint32_t src_stride,
+                    int cpp, const struct pipe_box *box)
+ {
+-#ifdef USE_ARM_ASM
++#ifdef VC4_TILING_LT_NEON
+         if (util_cpu_caps.has_neon) {
+                 vc4_store_lt_image_neon(dst, dst_stride, src, src_stride,
+                                         cpp, box);
+-- 
+2.25.1
+
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2a22d2fddc..e742c4982b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -69,6 +69,12 @@ MESA3D_CONF_OPTS += \
 	-Dgallium-xa=false
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+MESA3D_CONF_OPTS += -Dgallium-vc4-neon=auto
+else
+MESA3D_CONF_OPTS += -Dgallium-vc4-neon=disabled
+endif
+
 # Drivers
 
 #Gallium Drivers
-- 
2.25.1
