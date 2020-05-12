From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Date: Tue, 12 May 2020 15:16:46 +0200
Subject: [Buildroot] [PATCH 6/6] package/nvidia-driver: update to 390.132,
 435.21, 440.82
In-Reply-To: <20200512131646.14821-1-jskrzypnik@novomatic-tech.com>
References: <20200512131646.14821-1-jskrzypnik@novomatic-tech.com>
Message-ID: <20200512131646.14821-6-jskrzypnik@novomatic-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update NVIDIA to latest version of 390.xx branch (so called "legacy").

This is the last branch supporting i386.

Additionaly, there's an option to select "long-lived" and "short-lived"
version branches for newer NVIDIA drivers.

The installation workflow was redone to make it less complex and support
multiple versions, specified symlinks and so on.

On x86_64, a no-compat32 binaries are downloaded to avoid cluttering build
environment with multilib support.

Now requires libglvnd as it already was "stealthly" delivered by NVIDIA in
its software bundle without being notived.

On the longer term, this Makefile should use ".manifest" from installation
binary, but dealing with it without nvidia-installer is very comples, leads
to various problems and has a lot of edge-cases resolved in the installer on
its own.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
---
 .../390.132/0001-kernel-416.patch             |   33 +
 .../390.132/0002-kernel-55.patch              | 1286 +++++++++++++++++
 .../390.132/0003-kernel-56.patch              |  415 ++++++
 .../435.21/0001-kernel-5.4.patch              |  142 ++
 package/nvidia-driver/Config.in               |   61 +-
 package/nvidia-driver/egl.pc                  |   10 -
 package/nvidia-driver/gl.pc                   |   11 -
 package/nvidia-driver/nvidia-driver.hash      |    6 +-
 package/nvidia-driver/nvidia-driver.mk        |  366 +++--
 9 files changed, 2145 insertions(+), 185 deletions(-)
 create mode 100644 package/nvidia-driver/390.132/0001-kernel-416.patch
 create mode 100644 package/nvidia-driver/390.132/0002-kernel-55.patch
 create mode 100644 package/nvidia-driver/390.132/0003-kernel-56.patch
 create mode 100644 package/nvidia-driver/435.21/0001-kernel-5.4.patch
 delete mode 100644 package/nvidia-driver/egl.pc
 delete mode 100644 package/nvidia-driver/gl.pc

diff --git a/package/nvidia-driver/390.132/0001-kernel-416.patch b/package/nvidia-driver/390.132/0001-kernel-416.patch
new file mode 100644
index 0000000000..67172815ff
--- /dev/null
+++ b/package/nvidia-driver/390.132/0001-kernel-416.patch
@@ -0,0 +1,33 @@
+diff --git a/kernel/common/inc/nv-linux.h b/kernel/common/inc/nv-linux.h
+index 10fc418..22ef968 100644
+--- a/kernel/common/inc/nv-linux.h
++++ b/kernel/common/inc/nv-linux.h
+@@ -175,7 +175,11 @@ static inline uid_t __kuid_val(kuid_t uid)
+ 
+ #if defined(NV_VM_INSERT_PAGE_PRESENT)
+ #include <linux/pagemap.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 16, 0)
+ #include <linux/dma-mapping.h>
++#else
++#include <linux/dma-direct.h>
++#endif
+ #endif
+ 
+ #if defined(CONFIG_SWIOTLB) && defined(NVCPU_AARCH64)
+diff --git a/kernel/conftest.sh b/kernel/conftest.sh
+index b23dbb4..42dc576 100755
+--- a/kernel/conftest.sh
++++ b/kernel/conftest.sh
+@@ -1906,7 +1906,12 @@ compile_test() {
+             # Determine if the phys_to_dma function is present.
+             #
+             CODE="
++            #include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 16, 0)
+             #include <linux/dma-mapping.h>
++#else
++            #include <linux/dma-direct.h>
++#endif
+             void conftest_phys_to_dma(void) {
+                 phys_to_dma();
+             }"
diff --git a/package/nvidia-driver/390.132/0002-kernel-55.patch b/package/nvidia-driver/390.132/0002-kernel-55.patch
new file mode 100644
index 0000000000..9f582c32d5
--- /dev/null
+++ b/package/nvidia-driver/390.132/0002-kernel-55.patch
@@ -0,0 +1,1286 @@
+diff --git a/.manifest b/.manifest
+index 56186f6..82ed5a4 100644
+--- a/.manifest
++++ b/.manifest
+@@ -397,6 +397,7 @@ kernel/nvidia-drm/nvidia-drm.c 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODUL
+ kernel/nvidia-drm/nvidia-drm.h 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODULE:nvidia_drm
+ kernel/nvidia-drm/nvidia-drm-helper.h 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODULE:nvidia_drm
+ kernel/nvidia-drm/nvidia-dma-fence-helper.h 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODULE:nvidia_drm
++kernel/nvidia-drm/nvidia-dma-resv-helper.h 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODULE:nvidia_drm
+ kernel/nvidia-drm/nvidia-drm-priv.h 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODULE:nvidia_drm
+ kernel/nvidia-drm/nvidia-drm-connector.h 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODULE:nvidia_drm
+ kernel/nvidia-drm/nvidia-drm-crtc.h 0644 KERNEL_MODULE_SRC INHERIT_PATH_DEPTH:1 MODULE:nvidia_drm
+diff --git a/kernel/conftest.sh b/kernel/conftest.sh
+index cc25806..ec9e093 100755
+--- a/kernel/conftest.sh
++++ b/kernel/conftest.sh
+@@ -108,6 +108,12 @@ test_headers() {
+     FILES="$FILES drm/drm_framebuffer.h"
+     FILES="$FILES drm/drm_connector.h"
+     FILES="$FILES drm/drm_probe_helper.h"
++    FILES="$FILES drm/drm_prime.h"
++    FILES="$FILES drm/drm_plane.h"
++    FILES="$FILES drm/drm_vblank.h"
++    FILES="$FILES drm/drm_file.h"
++    FILES="$FILES drm/drm_ioctl.h"
++    FILES="$FILES drm/drm_device.h"
+     FILES="$FILES generated/autoconf.h"
+     FILES="$FILES generated/compile.h"
+     FILES="$FILES generated/utsrelease.h"
+@@ -126,7 +132,9 @@ test_headers() {
+     FILES="$FILES linux/sched/task_stack.h"
+     FILES="$FILES xen/ioemu.h"
+     FILES="$FILES linux/fence.h"
++    FILES="$FILES linux/dma-resv.h"
+     FILES="$FILES linux/ktime.h"
++    FILES="$FILES sound/hdaudio.h"
+ 
+     # Arch specific headers which need testing
+     FILES_ARCH="asm/book3s/64/hash-64k.h"
+@@ -1679,9 +1687,19 @@ compile_test() {
+             #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
+             #endif
++
++            #if defined(NV_DRM_DRM_DRV_H_PRESENT)
++            #include <drm/drm_drv.h>
++            #endif
++
++            #if defined(NV_DRM_DRM_PRIME_H_PRESENT)
++            #include <drm/drm_prime.h>
++            #endif
++
+             #if !defined(CONFIG_DRM) && !defined(CONFIG_DRM_MODULE)
+             #error DRM not enabled
+             #endif
++
+             void conftest_drm_available(void) {
+                 struct drm_driver drv;
+ 
+@@ -2318,7 +2336,10 @@ compile_test() {
+             # removed: 2014-08-29  c5786fe5f1c50941dbe27fc8b4aa1afee46ae893
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             void conftest_drm_bus_present(void) {
+                 struct drm_bus bus;
+             }"
+@@ -2334,7 +2355,10 @@ compile_test() {
+             # removed: 2013-11-03  42b21049fc26513ca8e732f47559b1525b04a992
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             int conftest_drm_bus_has_bus_type(void) {
+                 return offsetof(struct drm_bus, bus_type);
+             }"
+@@ -2350,7 +2374,10 @@ compile_test() {
+             # removed: 2013-11-03  b2a21aa25a39837d06eb24a7f0fef1733f9843eb
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             int conftest_drm_bus_has_get_irq(void) {
+                 return offsetof(struct drm_bus, get_irq);
+             }"
+@@ -2366,7 +2393,10 @@ compile_test() {
+             # removed: 2013-11-03  9de1b51f1fae6476155350a0670dc637c762e718
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             int conftest_drm_bus_has_get_name(void) {
+                 return offsetof(struct drm_bus, get_name);
+             }"
+@@ -2384,7 +2414,14 @@ compile_test() {
+             #   2013-12-11  b3f2333de8e81b089262b26d52272911523e605f
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
++            #if defined(NV_DRM_DRM_DRV_H_PRESENT)
++            #include <drm/drm_drv.h>
++            #endif
++
+             int conftest_drm_driver_has_legacy_dev_list(void) {
+                 return offsetof(struct drm_driver, legacy_dev_list);
+             }"
+@@ -2408,7 +2445,13 @@ compile_test() {
+             #   2017-07-23  e6fc3b68558e4c6d8d160b5daf2511b99afa8814
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
++            #if defined(NV_DRM_DRM_CRTC_H_PRESENT)
++            #include <drm/drm_crtc.h>
++            #endif
+ 
+             int conftest_drm_crtc_init_with_planes_has_name_arg(void) {
+                 return
+@@ -2424,7 +2467,13 @@ compile_test() {
+             compile_check_conftest "$CODE" "NV_DRM_CRTC_INIT_WITH_PLANES_HAS_NAME_ARG" "" "types"
+ 
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
++            #if defined(NV_DRM_DRM_ENCODER_H_PRESENT)
++            #include <drm/drm_encoder.h>
++            #endif
+ 
+             int conftest_drm_encoder_init_has_name_arg(void) {
+                 return
+@@ -2439,7 +2488,13 @@ compile_test() {
+             compile_check_conftest "$CODE" "NV_DRM_ENCODER_INIT_HAS_NAME_ARG" "" "types"
+ 
+             echo "$CONFTEST_PREAMBLE
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
++            #if defined(NV_DRM_DRM_PLANE_H_PRESENT)
++            #include <drm/drm_plane.h>
++            #endif
+ 
+             int conftest_drm_universal_plane_init_has_format_modifiers_arg(void) {
+                 return
+@@ -2466,7 +2521,13 @@ compile_test() {
+                 echo "#undef NV_DRM_UNIVERSAL_PLANE_INIT_HAS_FORMAT_MODIFIERS_ARG" | append_conftest "types"
+ 
+                 echo "$CONFTEST_PREAMBLE
++                #if defined(NV_DRM_DRMP_H_PRESENT)
+                 #include <drm/drmP.h>
++                #endif
++
++                #if defined(NV_DRM_DRM_PLANE_H_PRESENT)
++                #include <drm/drm_plane.h>
++                #endif
+ 
+                 int conftest_drm_universal_plane_init_has_name_arg(void) {
+                     return
+@@ -2535,7 +2596,10 @@ compile_test() {
+             #   2014-08-29  915b4d11b8b9e7b84ba4a4645b6cc7fbc0c071cf
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             int conftest_drm_driver_has_set_busid(void) {
+                 return offsetof(struct drm_driver, set_busid);
+             }"
+@@ -3087,7 +3151,10 @@ compile_test() {
+             #  2016-06-21 : d6ed682eba54915ea56315bc2e5a33fca5922997
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             void conftest_drm_master_drop_has_from_release_arg(struct drm_driver *drv) {
+                 drv->master_drop(NULL, NULL, false);
+             }"
+@@ -3195,7 +3262,9 @@ compile_test() {
+             #   2017-01-06  11b3c20bdd15d17382068be569740de1dccb173d
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
+ 
+             int conftest_drm_driver_unload_has_int_return_type(struct drm_driver *drv) {
+                 return drv->unload(NULL /* dev */);
+@@ -3605,10 +3674,14 @@ compile_test() {
+             # Introduce drm_framebuffer_{get,put}()) on 2017-02-28.
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             #if defined(NV_DRM_DRM_FRAMEBUFFER_H_PRESENT)
+             #include <drm/drm_framebuffer.h>
+             #endif
++
+             void conftest_drm_framebuffer_get(void) {
+                 drm_framebuffer_get();
+             }"
+@@ -3624,7 +3697,10 @@ compile_test() {
+             # Introduce drm_gem_object_{get,put}()) on 2017-02-28.
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             #if defined(NV_DRM_DRM_GEM_H_PRESENT)
+             #include <drm/drm_gem.h>
+             #endif
+@@ -3643,7 +3719,10 @@ compile_test() {
+             # introduce drm_dev_{get/put} functions) on 2017-09-26.
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             #if defined(NV_DRM_DRM_DRV_H_PRESENT)
+             #include <drm/drm_drv.h>
+             #endif
+@@ -3768,10 +3847,14 @@ compile_test() {
+             # (2019-01-29).
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
++
+             #if defined(NV_DRM_DRM_DRV_H_PRESENT)
+             #include <drm/drm_drv.h>
+             #endif
++
+             unsigned int drm_driver_prime_flag_present_conftest(void) {
+                 return DRIVER_PRIME;
+             }"
+@@ -3779,6 +3862,68 @@ compile_test() {
+             compile_check_conftest "$CODE" "NV_DRM_DRIVER_PRIME_FLAG_PRESENT" "" "types"
+         ;;
+ 
++        drm_connector_for_each_possible_encoder)
++            #
++            # Determine the number of arguments of the
++            # drm_connector_for_each_possible_encoder() macro.
++            #
++            # drm_connector_for_each_possible_encoder() is added by commit
++            # 83aefbb887b5 (drm: Add drm_connector_for_each_possible_encoder())
++            # in v4.19. The definition and prorotype is changed to take only
++            # two arguments connector and encoder, by commit 62afb4ad425a
++            # (drm/connector: Allow max possible encoders to attach to a
++            # connector) in v5.5rc1.
++            #
++            echo "$CONFTEST_PREAMBLE
++            #if defined(NV_DRM_DRMP_H_PRESENT)
++            #include <drm/drmP.h>
++            #endif
++
++            #if defined(NV_DRM_CONNECTOR_H_PRESENT)
++            #include <drm/drm_connector.h>
++            #endif
++
++            void conftest_drm_connector_for_each_possible_encoder(
++                struct drm_connector *connector,
++                struct drm_encoder *encoder,
++                int i) {
++
++                drm_connector_for_each_possible_encoder(connector, encoder, i) {
++                }
++            }" > conftest$$.c
++
++            $CC $CFLAGS -c conftest$$.c > /dev/null 2>&1
++            rm -f conftest$$.c
++
++            if [ -f conftest$$.o ]; then
++                echo "#define NV_DRM_CONNECTOR_FOR_EACH_POSSIBLE_ENCODER_ARGUMENT_COUNT 3" | append_conftest "functions"
++                rm -f conftest$$.o
++                return
++            else
++                echo "#define NV_DRM_CONNECTOR_FOR_EACH_POSSIBLE_ENCODER_ARGUMENT_COUNT 2" | append_conftest "functions"
++            fi
++        ;;
++
++        drm_gem_object_has_resv)
++            #
++            # Determine if the 'drm_gem_object' structure has a 'resv' field.
++            #
++            # A 'resv' filed in the 'drm_gem_object' structure, is added by
++            # commit 1ba627148ef5 (drm: Add reservation_object to
++            # drm_gem_object) in v5.2.
++            #
++            CODE="$CONFTEST_PREAMBLE
++            #if defined(NV_DRM_DRM_GEM_H_PRESENT)
++            #include <drm/drm_gem.h>
++            #endif
++
++            int conftest_drm_gem_object_has_resv(void) {
++                return offsetof(struct drm_gem_object, resv);
++            }"
++
++            compile_check_conftest "$CODE" "NV_DRM_GEM_OBJECT_HAS_RESV" "" "types"
++        ;;
++
+         drm_gem_prime_export_has_dev_arg)
+             #
+             # Determine if drm_driver::gem_prime_export() has 'dev' argument.
+@@ -3789,7 +3934,9 @@ compile_test() {
+             # (2019-06-14).
+             #
+             CODE="
++            #if defined(NV_DRM_DRMP_H_PRESENT)
+             #include <drm/drmP.h>
++            #endif
+             #if defined(NV_DRM_DRM_DRV_H_PRESENT)
+             #include <drm/drm_drv.h>
+             #endif
+diff --git a/kernel/nvidia-drm/nvidia-dma-fence-helper.h b/kernel/nvidia-drm/nvidia-dma-fence-helper.h
+index 0aa5a4f..a09ab76 100644
+--- a/kernel/nvidia-drm/nvidia-dma-fence-helper.h
++++ b/kernel/nvidia-drm/nvidia-dma-fence-helper.h
+@@ -25,7 +25,7 @@
+ 
+ #include "nvidia-drm-conftest.h"
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
++#if defined(NV_DRM_FENCE_AVAILABLE)
+ 
+ /*
+  * Fence headers are moved to file dma-fence.h and struct fence has
+@@ -40,8 +40,6 @@
+ #include <linux/dma-fence.h>
+ #endif
+ 
+-#include <linux/reservation.h>
+-
+ #if defined(NV_LINUX_FENCE_H_PRESENT)
+ typedef struct fence nv_dma_fence_t;
+ typedef struct fence_ops nv_dma_fence_ops_t;
+@@ -118,6 +116,6 @@ nv_dma_fence_init(nv_dma_fence_t *fence,
+ #endif
+ }
+ 
+-#endif /* defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ) */
++#endif /* defined(NV_DRM_FENCE_AVAILABLE) */
+ 
+ #endif /* __NVIDIA_DMA_FENCE_HELPER_H__ */
+diff --git a/kernel/nvidia-drm/nvidia-dma-resv-helper.h b/kernel/nvidia-drm/nvidia-dma-resv-helper.h
+new file mode 100644
+index 0000000..ad8800d
+--- /dev/null
++++ b/kernel/nvidia-drm/nvidia-dma-resv-helper.h
+@@ -0,0 +1,80 @@
++/*
++ * Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be included in
++ * all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ */
++
++#ifndef __NVIDIA_DMA_RESV_HELPER_H__
++#define __NVIDIA_DMA_RESV_HELPER_H__
++
++#include "nvidia-drm-conftest.h"
++
++#if defined(NV_DRM_FENCE_AVAILABLE)
++
++/*
++ * linux/reservation.h is renamed to linux/dma-resv.h, by commit
++ * 52791eeec1d9 (dma-buf: rename reservation_object to dma_resv)
++ * in v5.4.
++ */
++
++#if defined(NV_LINUX_DMA_RESV_H_PRESENT)
++#include <linux/dma-resv.h>
++#else
++#include <linux/reservation.h>
++#endif
++
++#include <nvidia-dma-fence-helper.h>
++
++#if defined(NV_LINUX_DMA_RESV_H_PRESENT)
++typedef struct dma_resv nv_dma_resv_t;
++#else
++typedef struct reservation_object nv_dma_resv_t;
++#endif
++
++static inline void nv_dma_resv_init(nv_dma_resv_t *obj)
++{
++#if defined(NV_LINUX_DMA_RESV_H_PRESENT)
++    dma_resv_init(obj);
++#else
++    reservation_object_init(obj);
++#endif
++}
++
++static inline void nv_dma_resv_fini(nv_dma_resv_t *obj)
++{
++#if defined(NV_LINUX_DMA_RESV_H_PRESENT)
++    dma_resv_fini(obj);
++#else
++    reservation_object_init(obj);
++#endif
++}
++
++static inline void nv_dma_resv_add_excl_fence(nv_dma_resv_t *obj,
++                                              nv_dma_fence_t *fence)
++{
++#if defined(NV_LINUX_DMA_RESV_H_PRESENT)
++    dma_resv_add_excl_fence(obj, fence);
++#else
++    reservation_object_add_excl_fence(obj, fence);
++#endif
++}
++
++#endif /* defined(NV_DRM_FENCE_AVAILABLE) */
++
++#endif /* __NVIDIA_DMA_RESV_HELPER_H__ */
+diff --git a/kernel/nvidia-drm/nvidia-drm-conftest.h b/kernel/nvidia-drm/nvidia-drm-conftest.h
+index 7775ed2..bed8d81 100644
+--- a/kernel/nvidia-drm/nvidia-drm-conftest.h
++++ b/kernel/nvidia-drm/nvidia-drm-conftest.h
+@@ -54,5 +54,11 @@
+ 
+ #endif
+ 
++#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ) || \
++    defined(NV_DRM_GEM_OBJECT_HAS_RESV)
++#define NV_DRM_FENCE_AVAILABLE
++#else
++#undef NV_DRM_FENCE_AVAILABLE
++#endif
+ 
+ #endif /* defined(__NVIDIA_DRM_CONFTEST_H__) */
+diff --git a/kernel/nvidia-drm/nvidia-drm-connector.c b/kernel/nvidia-drm/nvidia-drm-connector.c
+index 857bb2c..54167a7 100644
+--- a/kernel/nvidia-drm/nvidia-drm-connector.c
++++ b/kernel/nvidia-drm/nvidia-drm-connector.c
+@@ -58,20 +58,100 @@ static void nv_drm_connector_destroy(struct drm_connector *connector)
+     nv_drm_free(nv_connector);
+ }
+ 
++static bool
++__nv_drm_detect_encoder(struct NvKmsKapiDynamicDisplayParams *pDetectParams,
++                        struct drm_connector *connector,
++                        struct drm_encoder *encoder)
++{
++    struct nv_drm_connector *nv_connector = to_nv_connector(connector);
++    struct drm_device *dev = connector->dev;
++    struct nv_drm_device *nv_dev = to_nv_device(dev);
++    struct nv_drm_encoder *nv_encoder;
++
++    /*
++     * DVI-I connectors can drive both digital and analog
++     * encoders.  If a digital connection has been forced then
++     * skip analog encoders.
++     */
++
++    if (connector->connector_type == DRM_MODE_CONNECTOR_DVII &&
++        connector->force == DRM_FORCE_ON_DIGITAL &&
++        encoder->encoder_type == DRM_MODE_ENCODER_DAC) {
++        return false;
++    }
++
++    nv_encoder = to_nv_encoder(encoder);
++
++    memset(pDetectParams, 0, sizeof(*pDetectParams));
++
++    pDetectParams->handle = nv_encoder->hDisplay;
++
++    switch (connector->force) {
++        case DRM_FORCE_ON:
++        case DRM_FORCE_ON_DIGITAL:
++            pDetectParams->forceConnected = NV_TRUE;
++            break;
++        case DRM_FORCE_OFF:
++            pDetectParams->forceDisconnected = NV_TRUE;
++            break;
++        case DRM_FORCE_UNSPECIFIED:
++            break;
++    }
++
++    if (connector->override_edid) {
++        const struct drm_property_blob *edid = connector->edid_blob_ptr;
++
++        if (edid->length <= sizeof(pDetectParams->edid.buffer)) {
++            memcpy(pDetectParams->edid.buffer, edid->data, edid->length);
++            pDetectParams->edid.bufferSize = edid->length;
++            pDetectParams->overrideEdid = NV_TRUE;
++        } else {
++            WARN_ON(edid->length >
++                    sizeof(pDetectParams->edid.buffer));
++        }
++    }
++
++    if (!nvKms->getDynamicDisplayInfo(nv_dev->pDevice, pDetectParams)) {
++        NV_DRM_DEV_LOG_ERR(
++            nv_dev,
++            "Failed to detect display state");
++        return false;
++    }
++
++    if (pDetectParams->connected) {
++        if (!pDetectParams->overrideEdid && pDetectParams->edid.bufferSize) {
++
++            if ((nv_connector->edid = nv_drm_calloc(
++                        1,
++                        pDetectParams->edid.bufferSize)) != NULL) {
++
++                memcpy(nv_connector->edid,
++                       pDetectParams->edid.buffer,
++                       pDetectParams->edid.bufferSize);
++            } else {
++                NV_DRM_LOG_ERR("Out of Memory");
++            }
++        }
++
++        return true;
++    }
++
++    return false;
++}
++
+ static enum drm_connector_status __nv_drm_connector_detect_internal(
+     struct drm_connector *connector)
+ {
+     struct drm_device *dev = connector->dev;
+-    struct nv_drm_device *nv_dev = to_nv_device(dev);
+     struct nv_drm_connector *nv_connector = to_nv_connector(connector);
+ 
+     enum drm_connector_status status = connector_status_disconnected;
+ 
+     struct drm_encoder *detected_encoder = NULL;
+     struct nv_drm_encoder *nv_detected_encoder = NULL;
++    struct drm_encoder *encoder;
+ 
+     struct NvKmsKapiDynamicDisplayParams *pDetectParams = NULL;
+-    unsigned int i;
+ 
+     BUG_ON(!mutex_is_locked(&dev->mode_config.mutex));
+ 
+@@ -87,90 +167,12 @@ static enum drm_connector_status __nv_drm_connector_detect_internal(
+         goto done;
+     }
+ 
+-    for (i = 0;
+-         i < DRM_CONNECTOR_MAX_ENCODER && detected_encoder == NULL; i++) {
+-        struct drm_encoder *encoder;
+-        struct nv_drm_encoder *nv_encoder;
+-
+-        if (connector->encoder_ids[i] == 0) {
+-            break;
+-        }
+-
+-        encoder = nv_drm_encoder_find(dev, connector->encoder_ids[i]);
+-
+-        if (encoder == NULL) {
+-            BUG_ON(encoder != NULL);
+-            continue;
+-        }
+-
+-        /*
+-         * DVI-I connectors can drive both digital and analog
+-         * encoders.  If a digital connection has been forced then
+-         * skip analog encoders.
+-         */
+-
+-        if (connector->connector_type == DRM_MODE_CONNECTOR_DVII &&
+-            connector->force == DRM_FORCE_ON_DIGITAL &&
+-            encoder->encoder_type == DRM_MODE_ENCODER_DAC) {
+-            continue;
+-        }
+-
+-        nv_encoder = to_nv_encoder(encoder);
+-
+-        memset(pDetectParams, 0, sizeof(*pDetectParams));
+-
+-        pDetectParams->handle = nv_encoder->hDisplay;
+-
+-        switch (connector->force) {
+-            case DRM_FORCE_ON:
+-            case DRM_FORCE_ON_DIGITAL:
+-                pDetectParams->forceConnected = NV_TRUE;
+-                break;
+-            case DRM_FORCE_OFF:
+-                pDetectParams->forceDisconnected = NV_TRUE;
+-                break;
+-            case DRM_FORCE_UNSPECIFIED:
+-                break;
+-        }
+-
+-        if (connector->override_edid) {
+-            const struct drm_property_blob *edid = connector->edid_blob_ptr;
+-
+-            if (edid->length <= sizeof(pDetectParams->edid.buffer)) {
+-                memcpy(pDetectParams->edid.buffer, edid->data, edid->length);
+-                pDetectParams->edid.bufferSize = edid->length;
+-                pDetectParams->overrideEdid = NV_TRUE;
+-            } else {
+-                WARN_ON(edid->length >
+-                        sizeof(pDetectParams->edid.buffer));
+-            }
+-        }
+-
+-        if (!nvKms->getDynamicDisplayInfo(nv_dev->pDevice, pDetectParams)) {
+-            NV_DRM_DEV_LOG_ERR(
+-                nv_dev,
+-                "Failed to detect display state");
+-            continue;
+-        }
+-
+-        if (pDetectParams->connected) {
+-            if (!pDetectParams->overrideEdid && pDetectParams->edid.bufferSize) {
+-
+-                if ((nv_connector->edid = nv_drm_calloc(
+-                            1,
+-                            pDetectParams->edid.bufferSize)) != NULL) {
+-
+-                    memcpy(nv_connector->edid,
+-                           pDetectParams->edid.buffer,
+-                           pDetectParams->edid.bufferSize);
+-                } else {
+-                    NV_DRM_LOG_ERR("Out of Memory");
+-                }
+-            }
+-
++    nv_drm_connector_for_each_possible_encoder(connector, encoder) {
++        if (__nv_drm_detect_encoder(pDetectParams, connector, encoder)) {
+             detected_encoder = encoder;
++            break;
+         }
+-    }
++    } nv_drm_connector_for_each_possible_encoder_end;
+ 
+     if (detected_encoder == NULL) {
+         goto done;
+diff --git a/kernel/nvidia-drm/nvidia-drm-connector.h b/kernel/nvidia-drm/nvidia-drm-connector.h
+index f74e22c..fd83d7a 100644
+--- a/kernel/nvidia-drm/nvidia-drm-connector.h
++++ b/kernel/nvidia-drm/nvidia-drm-connector.h
+@@ -27,7 +27,13 @@
+ 
+ #if defined(NV_DRM_ATOMIC_MODESET_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
++#endif
++
++#if defined(NV_DRM_DRM_CONNECTOR_H_PRESENT)
++#include <drm/drm_connector.h>
++#endif
+ 
+ #include "nvtypes.h"
+ #include "nvkms-api-types.h"
+diff --git a/kernel/nvidia-drm/nvidia-drm-crtc.h b/kernel/nvidia-drm/nvidia-drm-crtc.h
+index 5fd6ae7..f54e34d 100644
+--- a/kernel/nvidia-drm/nvidia-drm-crtc.h
++++ b/kernel/nvidia-drm/nvidia-drm-crtc.h
+@@ -29,7 +29,12 @@
+ 
+ #include "nvidia-drm-helper.h"
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
++#endif
++
++#include <drm/drm_crtc.h>
++
+ #include "nvtypes.h"
+ #include "nvkms-kapi.h"
+ 
+diff --git a/kernel/nvidia-drm/nvidia-drm-drv.c b/kernel/nvidia-drm/nvidia-drm-drv.c
+index 57c3495..17e377d 100644
+--- a/kernel/nvidia-drm/nvidia-drm-drv.c
++++ b/kernel/nvidia-drm/nvidia-drm-drv.c
+@@ -39,7 +39,27 @@
+ 
+ #include "nvidia-drm-ioctl.h"
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
++#endif
++
++#if defined(NV_DRM_DRM_VBLANK_H_PRESENT)
++#include <drm/drm_vblank.h>
++#endif
++
++#if defined(NV_DRM_DRM_FILE_H_PRESENT)
++#include <drm/drm_file.h>
++#endif
++
++#if defined(NV_DRM_DRM_PRIME_H_PRESENT)
++#include <drm/drm_prime.h>
++#endif
++
++#if defined(NV_DRM_DRM_IOCTL_H_PRESENT)
++#include <drm/drm_ioctl.h>
++#endif
++
++#include <linux/pci.h>
+ 
+ /*
+  * Commit fcd70cd36b9b ("drm: Split out drm_probe_helper.h")
+@@ -627,7 +647,7 @@ static const struct drm_ioctl_desc nv_drm_ioctls[] = {
+                       nv_drm_get_dev_info_ioctl,
+                       DRM_RENDER_ALLOW|DRM_UNLOCKED),
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
++#if defined(NV_DRM_FENCE_AVAILABLE)
+     DRM_IOCTL_DEF_DRV(NVIDIA_FENCE_SUPPORTED,
+                       nv_drm_fence_supported_ioctl,
+                       DRM_RENDER_ALLOW|DRM_UNLOCKED),
+diff --git a/kernel/nvidia-drm/nvidia-drm-fb.h b/kernel/nvidia-drm/nvidia-drm-fb.h
+index 7f292ce..bfa93fd 100644
+--- a/kernel/nvidia-drm/nvidia-drm-fb.h
++++ b/kernel/nvidia-drm/nvidia-drm-fb.h
+@@ -27,7 +27,14 @@
+ 
+ #if defined(NV_DRM_ATOMIC_MODESET_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
++#endif
++
++#if defined(NV_DRM_DRM_FRAMEBUFFER_H_PRESENT)
++#include <drm/drm_framebuffer.h>
++#endif
++
+ #include "nvidia-drm-gem-nvkms-memory.h"
+ #include "nvkms-kapi.h"
+ 
+diff --git a/kernel/nvidia-drm/nvidia-drm-gem-nvkms-memory.c b/kernel/nvidia-drm/nvidia-drm-gem-nvkms-memory.c
+index 65114d6..52a3d2a 100644
+--- a/kernel/nvidia-drm/nvidia-drm-gem-nvkms-memory.c
++++ b/kernel/nvidia-drm/nvidia-drm-gem-nvkms-memory.c
+@@ -27,6 +27,12 @@
+ #include "nvidia-drm-gem-nvkms-memory.h"
+ #include "nvidia-drm-ioctl.h"
+ 
++#if defined(NV_DRM_DRM_DRV_H_PRESENT)
++#include <drm/drm_drv.h>
++#endif
++
++#include <linux/io.h>
++
+ #include "nv-mm.h"
+ 
+ static void __nv_drm_gem_nvkms_memory_free(struct nv_drm_gem_object *nv_gem)
+diff --git a/kernel/nvidia-drm/nvidia-drm-gem-user-memory.c b/kernel/nvidia-drm/nvidia-drm-gem-user-memory.c
+index a1be81f..76dedba 100644
+--- a/kernel/nvidia-drm/nvidia-drm-gem-user-memory.c
++++ b/kernel/nvidia-drm/nvidia-drm-gem-user-memory.c
+@@ -24,6 +24,10 @@
+ 
+ #if defined(NV_DRM_AVAILABLE)
+ 
++#if defined(NV_DRM_DRM_PRIME_H_PRESENT)
++#include <drm/drm_prime.h>
++#endif
++
+ #include "nvidia-drm-gem-user-memory.h"
+ #include "nvidia-drm-ioctl.h"
+ 
+diff --git a/kernel/nvidia-drm/nvidia-drm-gem.c b/kernel/nvidia-drm/nvidia-drm-gem.c
+index e55ccd9..2059f19 100644
+--- a/kernel/nvidia-drm/nvidia-drm-gem.c
++++ b/kernel/nvidia-drm/nvidia-drm-gem.c
+@@ -28,6 +28,15 @@
+ #include "nvidia-drm-ioctl.h"
+ #include "nvidia-drm-prime-fence.h"
+ #include "nvidia-drm-gem.h"
++#include "nvidia-dma-resv-helper.h"
++
++#if defined(NV_DRM_DRM_DRV_H_PRESENT)
++#include <drm/drm_drv.h>
++#endif
++
++#if defined(NV_DRM_DRM_PRIME_H_PRESENT)
++#include <drm/drm_prime.h>
++#endif
+ 
+ void nv_drm_gem_free(struct drm_gem_object *gem)
+ {
+@@ -40,8 +49,8 @@ void nv_drm_gem_free(struct drm_gem_object *gem)
+ 
+     drm_gem_object_release(&nv_gem->base);
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
+-    reservation_object_fini(&nv_gem->resv);
++#if defined(NV_DRM_FENCE_AVAILABLE) && !defined(NV_DRM_GEM_OBJECT_HAS_RESV)
++    nv_dma_resv_fini(&nv_gem->resv);
+ #endif
+ 
+     nv_gem->ops->free(nv_gem);
+@@ -103,7 +112,7 @@ void nv_drm_gem_prime_vunmap(struct drm_gem_object *gem, void *address)
+ }
+ 
+ #if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
+-struct reservation_object* nv_drm_gem_prime_res_obj(struct drm_gem_object *obj)
++nv_dma_resv_t* nv_drm_gem_prime_res_obj(struct drm_gem_object *obj)
+ {
+     struct nv_drm_gem_object *nv_gem = to_nv_gem_object(obj);
+ 
+diff --git a/kernel/nvidia-drm/nvidia-drm-gem.h b/kernel/nvidia-drm/nvidia-drm-gem.h
+index b7c7fa7..5691a7a 100644
+--- a/kernel/nvidia-drm/nvidia-drm-gem.h
++++ b/kernel/nvidia-drm/nvidia-drm-gem.h
+@@ -29,13 +29,19 @@
+ 
+ #include "nvidia-drm-priv.h"
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
+-#include "nvkms-kapi.h"
++#endif
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
++#if defined(NV_DRM_DRM_GEM_H_PRESENT)
++#include <drm/drm_gem.h>
++#endif
+ 
+-#include "nvidia-dma-fence-helper.h"
++#include "nvkms-kapi.h"
+ 
++#if defined(NV_DRM_FENCE_AVAILABLE)
++#include "nvidia-dma-fence-helper.h"
++#include "nvidia-dma-resv-helper.h"
+ #endif
+ 
+ struct nv_drm_gem_object;
+@@ -53,8 +59,8 @@ struct nv_drm_gem_object {
+     struct nv_drm_device *nv_dev;
+     const struct nv_drm_gem_object_funcs *ops;
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
+-    struct reservation_object resv;
++#if defined(NV_DRM_FENCE_AVAILABLE)
++    nv_dma_resv_t  resv;
+ #endif
+ 
+     bool prime:1;
+@@ -126,11 +132,16 @@ void nv_drm_gem_object_init(struct nv_drm_device *nv_dev,
+ 
+     /* Initialize the gem object */
+ 
+-    drm_gem_private_object_init(dev, &nv_gem->base, size);
++#if defined(NV_DRM_FENCE_AVAILABLE)
++    nv_dma_resv_init(&nv_gem->resv);
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
+-    reservation_object_init(&nv_gem->resv);
++#if defined(NV_DRM_GEM_OBJECT_HAS_RESV)
++    nv_gem->base.resv = &nv_gem->resv;
+ #endif
++
++#endif
++
++    drm_gem_private_object_init(dev, &nv_gem->base, size);
+ }
+ 
+ static inline int nv_drm_gem_create_mmap_offset(
+@@ -194,7 +205,7 @@ void *nv_drm_gem_prime_vmap(struct drm_gem_object *gem);
+ void nv_drm_gem_prime_vunmap(struct drm_gem_object *gem, void *address);
+ 
+ #if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
+-struct reservation_object* nv_drm_gem_prime_res_obj(struct drm_gem_object *obj);
++nv_dma_resv_t* nv_drm_gem_prime_res_obj(struct drm_gem_object *obj);
+ #endif
+ 
+ #endif /* NV_DRM_AVAILABLE */
+diff --git a/kernel/nvidia-drm/nvidia-drm-helper.c b/kernel/nvidia-drm/nvidia-drm-helper.c
+index da602ac..601a9c3 100644
+--- a/kernel/nvidia-drm/nvidia-drm-helper.c
++++ b/kernel/nvidia-drm/nvidia-drm-helper.c
+@@ -31,7 +31,10 @@
+ 
+ #if defined(NV_DRM_ATOMIC_MODESET_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
++#endif
++
+ #if defined(NV_DRM_DRM_ATOMIC_UAPI_H_PRESENT)
+ #include <drm/drm_atomic_uapi.h>
+ #endif
+diff --git a/kernel/nvidia-drm/nvidia-drm-helper.h b/kernel/nvidia-drm/nvidia-drm-helper.h
+index 8f050d8..2489924 100644
+--- a/kernel/nvidia-drm/nvidia-drm-helper.h
++++ b/kernel/nvidia-drm/nvidia-drm-helper.h
+@@ -27,7 +27,13 @@
+ 
+ #if defined(NV_DRM_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
++#endif
++
++#if defined(NV_DRM_DRM_DRV_H_PRESENT)
++#include <drm/drm_drv.h>
++#endif
+ 
+ /*
+  * drm_dev_put() is added by commit 9a96f55034e41b4e002b767e9218d55f03bdff7d
+@@ -276,6 +282,96 @@ static inline struct drm_encoder *nv_drm_encoder_find(struct drm_device *dev,
+ #endif
+ }
+ 
++/*
++ * drm_connector_for_each_possible_encoder() is added by commit
++ * 83aefbb887b59df0b3520965c3701e01deacfc52 which was Signed-off-by:
++ *     Ville Syrj?l? <ville.syrjala@linux.intel.com>
++ *
++ * drm_connector_for_each_possible_encoder() is copied from
++ * include/drm/drm_connector.h and modified to use nv_drm_encoder_find()
++ * instead of drm_encoder_find().
++ *
++ * drm_connector_for_each_possible_encoder() is copied from
++ *      include/drm/drm_connector.h @
++ *      83aefbb887b59df0b3520965c3701e01deacfc52
++ * which has the following copyright and license information:
++ *
++ * Copyright (c) 2016 Intel Corporation
++ *
++ * Permission to use, copy, modify, distribute, and sell this software and its
++ * documentation for any purpose is hereby granted without fee, provided that
++ * the above copyright notice appear in all copies and that both that copyright
++ * notice and this permission notice appear in supporting documentation, and
++ * that the name of the copyright holders not be used in advertising or
++ * publicity pertaining to distribution of the software without specific,
++ * written prior permission.  The copyright holders make no representations
++ * about the suitability of this software for any purpose.  It is provided "as
++ * is" without express or implied warranty.
++ *
++ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
++ * OF THIS SOFTWARE.
++ */
++
++#if defined(NV_DRM_DRM_CONNECTOR_H_PRESENT)
++#include <drm/drm_connector.h>
++#endif
++
++/**
++ * nv_drm_connector_for_each_possible_encoder - iterate connector's possible
++ * encoders
++ * @connector: &struct drm_connector pointer
++ * @encoder: &struct drm_encoder pointer used as cursor
++ * @__i: int iteration cursor, for macro-internal use
++ */
++#if !defined(drm_connector_for_each_possible_encoder)
++
++#if !defined(for_each_if)
++#define for_each_if(condition) if (!(condition)) {} else
++#endif
++
++#define __nv_drm_connector_for_each_possible_encoder(connector, encoder, __i) \
++       for ((__i) = 0; (__i) < ARRAY_SIZE((connector)->encoder_ids) &&        \
++                    (connector)->encoder_ids[(__i)] != 0; (__i)++)            \
++               for_each_if((encoder) =                                        \
++                           nv_drm_encoder_find((connector)->dev,              \
++                                               (connector)->encoder_ids[(__i)]))
++
++#define nv_drm_connector_for_each_possible_encoder(connector, encoder) \
++    {                                                                  \
++        unsigned int __i;                                              \
++        __nv_drm_connector_for_each_possible_encoder(connector, encoder, __i)
++
++#define nv_drm_connector_for_each_possible_encoder_end \
++    }
++
++#else
++
++#if NV_DRM_CONNECTOR_FOR_EACH_POSSIBLE_ENCODER_ARGUMENT_COUNT == 3
++
++#define nv_drm_connector_for_each_possible_encoder(connector, encoder) \
++    {                                                                  \
++        unsigned int __i;                                              \
++        drm_connector_for_each_possible_encoder(connector, encoder, __i)
++
++#define nv_drm_connector_for_each_possible_encoder_end \
++    }
++
++#else
++
++#define nv_drm_connector_for_each_possible_encoder(connector, encoder) \
++    drm_connector_for_each_possible_encoder(connector, encoder)
++
++#define nv_drm_connector_for_each_possible_encoder_end
++
++#endif
++
++#endif
++
+ static inline int
+ nv_drm_connector_attach_encoder(struct drm_connector *connector,
+                                 struct drm_encoder *encoder)
+diff --git a/kernel/nvidia-drm/nvidia-drm-linux.c b/kernel/nvidia-drm/nvidia-drm-linux.c
+index b60304b..1d3e658 100644
+--- a/kernel/nvidia-drm/nvidia-drm-linux.c
++++ b/kernel/nvidia-drm/nvidia-drm-linux.c
+@@ -31,6 +31,12 @@
+ 
+ #if defined(NV_DRM_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
++#include <drm/drmP.h>
++#endif
++
++#include <linux/vmalloc.h>
++
+ #include "nv-mm.h"
+ 
+ MODULE_PARM_DESC(
+diff --git a/kernel/nvidia-drm/nvidia-drm-modeset.c b/kernel/nvidia-drm/nvidia-drm-modeset.c
+index c94d861..035c0d9 100644
+--- a/kernel/nvidia-drm/nvidia-drm-modeset.c
++++ b/kernel/nvidia-drm/nvidia-drm-modeset.c
+@@ -30,6 +30,14 @@
+ #include "nvidia-drm-os-interface.h"
+ #include "nvidia-drm-helper.h"
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
++#include <drm/drmP.h>
++#endif
++
++#if defined(NV_DRM_DRM_VBLANK_H_PRESENT)
++#include <drm/drm_vblank.h>
++#endif
++
+ #include <drm/drm_atomic.h>
+ #include <drm/drm_atomic_helper.h>
+ #include <drm/drm_crtc.h>
+diff --git a/kernel/nvidia-drm/nvidia-drm-modeset.h b/kernel/nvidia-drm/nvidia-drm-modeset.h
+index e2cb5c3..effb990 100644
+--- a/kernel/nvidia-drm/nvidia-drm-modeset.h
++++ b/kernel/nvidia-drm/nvidia-drm-modeset.h
+@@ -27,7 +27,10 @@
+ 
+ #if defined(NV_DRM_ATOMIC_MODESET_AVAILABLE)
+ 
+-#include <drm/drmP.h>
++#include "nvkms-kapi.h"
++
++struct drm_device;
++struct drm_atomic_state;
+ 
+ struct drm_atomic_state *nv_drm_atomic_state_alloc(struct drm_device *dev);
+ void nv_drm_atomic_state_clear(struct drm_atomic_state *state);
+diff --git a/kernel/nvidia-drm/nvidia-drm-os-interface.h b/kernel/nvidia-drm/nvidia-drm-os-interface.h
+index f43f851..ac52752 100644
+--- a/kernel/nvidia-drm/nvidia-drm-os-interface.h
++++ b/kernel/nvidia-drm/nvidia-drm-os-interface.h
+@@ -29,7 +29,7 @@
+ 
+ #if defined(NV_DRM_AVAILABLE)
+ 
+-#include <drm/drmP.h>
++struct page;
+ 
+ /* Set to true when the atomic modeset feature is enabled. */
+ extern bool nv_drm_modeset_module_param;
+diff --git a/kernel/nvidia-drm/nvidia-drm-prime-fence.c b/kernel/nvidia-drm/nvidia-drm-prime-fence.c
+index c5cb3b7..6ec082c 100644
+--- a/kernel/nvidia-drm/nvidia-drm-prime-fence.c
++++ b/kernel/nvidia-drm/nvidia-drm-prime-fence.c
+@@ -24,12 +24,17 @@
+ 
+ #if defined(NV_DRM_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
++#include <drm/drmP.h>
++#endif
++
+ #include "nvidia-drm-priv.h"
+ #include "nvidia-drm-ioctl.h"
+ #include "nvidia-drm-gem.h"
+ #include "nvidia-drm-prime-fence.h"
++#include "nvidia-dma-resv-helper.h"
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
++#if defined(NV_DRM_FENCE_AVAILABLE)
+ 
+ #include "nvidia-dma-fence-helper.h"
+ 
+@@ -519,7 +524,7 @@ int nv_drm_gem_fence_attach_ioctl(struct drm_device *dev,
+         goto fence_context_create_fence_failed;
+     }
+ 
+-    reservation_object_add_excl_fence(&nv_gem->resv, fence);
++    nv_dma_resv_add_excl_fence(&nv_gem->resv, fence);
+ 
+     ret = 0;
+ 
+@@ -533,6 +538,6 @@ done:
+     return ret;
+ }
+ 
+-#endif /* NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ */
++#endif /* NV_DRM_FENCE_AVAILABLE */
+ 
+ #endif /* NV_DRM_AVAILABLE */
+diff --git a/kernel/nvidia-drm/nvidia-drm-prime-fence.h b/kernel/nvidia-drm/nvidia-drm-prime-fence.h
+index 20da923..5afa2ae 100644
+--- a/kernel/nvidia-drm/nvidia-drm-prime-fence.h
++++ b/kernel/nvidia-drm/nvidia-drm-prime-fence.h
+@@ -27,9 +27,10 @@
+ 
+ #if defined(NV_DRM_AVAILABLE)
+ 
+-#include <drm/drmP.h>
++struct drm_file;
++struct drm_device;
+ 
+-#if defined(NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ)
++#if defined(NV_DRM_FENCE_AVAILABLE)
+ 
+ int nv_drm_fence_supported_ioctl(struct drm_device *dev,
+                                  void *data, struct drm_file *filep);
+@@ -40,7 +41,7 @@ int nv_drm_fence_context_create_ioctl(struct drm_device *dev,
+ int nv_drm_gem_fence_attach_ioctl(struct drm_device *dev,
+                                   void *data, struct drm_file *filep);
+ 
+-#endif /* NV_DRM_DRIVER_HAS_GEM_PRIME_RES_OBJ */
++#endif /* NV_DRM_FENCE_AVAILABLE */
+ 
+ #endif /* NV_DRM_AVAILABLE */
+ 
+diff --git a/kernel/nvidia-drm/nvidia-drm-priv.h b/kernel/nvidia-drm/nvidia-drm-priv.h
+index f16bea9..4f1a0e7 100644
+--- a/kernel/nvidia-drm/nvidia-drm-priv.h
++++ b/kernel/nvidia-drm/nvidia-drm-priv.h
+@@ -27,7 +27,13 @@
+ 
+ #if defined(NV_DRM_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
+ #include <drm/drmP.h>
++#endif
++
++#if defined(NV_DRM_DRM_DEVICE_H_PRESENT)
++#include <drm/drm_device.h>
++#endif
+ 
+ #if defined(NV_DRM_DRM_GEM_H_PRESENT)
+ #include <drm/drm_gem.h>
+diff --git a/kernel/nvidia-drm/nvidia-drm-utils.c b/kernel/nvidia-drm/nvidia-drm-utils.c
+index ac1097e..8cb2d5e 100644
+--- a/kernel/nvidia-drm/nvidia-drm-utils.c
++++ b/kernel/nvidia-drm/nvidia-drm-utils.c
+@@ -24,6 +24,17 @@
+ 
+ #if defined(NV_DRM_ATOMIC_MODESET_AVAILABLE)
+ 
++#if defined(NV_DRM_DRMP_H_PRESENT)
++#include <drm/drmP.h>
++#endif
++
++#if defined(NV_DRM_DRM_PLANE_H_PRESENT)
++#include <drm/drm_plane.h>
++#endif
++
++#include <drm/drm_modes.h>
++#include <uapi/drm/drm_fourcc.h>
++
+ #include "nvidia-drm-priv.h"
+ #include "nvidia-drm-utils.h"
+ 
+diff --git a/kernel/nvidia-drm/nvidia-drm-utils.h b/kernel/nvidia-drm/nvidia-drm-utils.h
+index 33bf60c..4801b5e 100644
+--- a/kernel/nvidia-drm/nvidia-drm-utils.h
++++ b/kernel/nvidia-drm/nvidia-drm-utils.h
+@@ -27,9 +27,11 @@
+ 
+ #if defined(NV_DRM_ATOMIC_MODESET_AVAILABLE)
+ 
+-#include <drm/drmP.h>
+ #include "nvkms-kapi.h"
+ 
++enum drm_plane_type;
++struct drm_display_mode;
++
+ struct NvKmsKapiConnectorInfo*
+ nvkms_get_connector_info(struct NvKmsKapiDevice *pDevice,
+                          NvKmsKapiConnector hConnector);
+diff --git a/kernel/nvidia-drm/nvidia-drm.Kbuild b/kernel/nvidia-drm/nvidia-drm.Kbuild
+index 3ab1b24..ecdb607 100644
+--- a/kernel/nvidia-drm/nvidia-drm.Kbuild
++++ b/kernel/nvidia-drm/nvidia-drm.Kbuild
+@@ -65,6 +65,7 @@ NV_CONFTEST_FUNCTION_COMPILE_TESTS += vmf_insert_pfn
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += drm_framebuffer_get
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += drm_gem_object_get
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += drm_dev_put
++NV_CONFTEST_FUNCTION_COMPILE_TESTS += drm_connector_for_each_possible_encoder
+ 
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_bus_present
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_bus_has_bus_type
+@@ -88,4 +89,5 @@ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_mode_object_find_has_file_priv_arg
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_connector_list_iter
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_atomic_helper_swap_state_has_stall_arg
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_driver_prime_flag_present
++NV_CONFTEST_TYPE_COMPILE_TESTS += drm_gem_object_has_resv
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_gem_prime_export_has_dev_arg
+diff --git a/kernel/nvidia/nv-vm.c b/kernel/nvidia/nv-vm.c
+index e407714..9579a01 100644
+--- a/kernel/nvidia/nv-vm.c
++++ b/kernel/nvidia/nv-vm.c
+@@ -265,7 +265,9 @@ static unsigned int nv_compute_gfp_mask(
+         }
+     }
+ #endif
+-#if defined(__GFP_NORETRY)
++#if defined(__GFP_RETRY_MAYFAIL)
++    gfp_mask |= __GFP_RETRY_MAYFAIL;
++#elif defined(__GFP_NORETRY)
+     gfp_mask |= __GFP_NORETRY;
+ #endif
+ #if defined(__GFP_ZERO)
+diff --git a/kernel/nvidia/nv.c b/kernel/nvidia/nv.c
+index 51e167b..fc9c769 100644
+--- a/kernel/nvidia/nv.c
++++ b/kernel/nvidia/nv.c
+@@ -56,6 +56,12 @@ MODULE_ALIAS_CHARDEV_MAJOR(NV_MAJOR_DEVICE_NUMBER);
+ #endif
+ #endif
+ 
++#include <sound/core.h>             /* HDA struct snd_card */
++
++#if defined(NV_SOUND_HDAUDIO_H_PRESENT)
++#include "sound/hdaudio.h"
++#endif
++
+ #include "conftest/patches.h"
+ 
+ /*
+@@ -285,6 +291,12 @@ void NV_API_CALL nv_verify_pci_config(
+         nv_check_pci_config_space(nv, NV_MAY_SLEEP());
+ }
+ 
++#if defined(HDA_MAX_CODECS)
++#define NV_HDA_MAX_CODECS HDA_MAX_CODECS
++#else
++#define NV_HDA_MAX_CODECS 8
++#endif
++
+ /***
+  *** STATIC functions, only in this file
+  ***/
diff --git a/package/nvidia-driver/390.132/0003-kernel-56.patch b/package/nvidia-driver/390.132/0003-kernel-56.patch
new file mode 100644
index 0000000000..bc1968d71e
--- /dev/null
+++ b/package/nvidia-driver/390.132/0003-kernel-56.patch
@@ -0,0 +1,415 @@
+diff --git a/kernel/common/inc/nv-linux.h b/kernel/common/inc/nv-linux.h
+index 85041c2..ac5bb95 100644
+--- a/kernel/common/inc/nv-linux.h
++++ b/kernel/common/inc/nv-linux.h
+@@ -553,7 +553,11 @@ static inline void *nv_ioremap(NvU64 phys, NvU64 size)
+ 
+ static inline void *nv_ioremap_nocache(NvU64 phys, NvU64 size)
+ {
++#if defined(NV_IOREMAP_NOCACHE_PRESENT)
+     void *ptr = ioremap_nocache(phys, size);
++#else
++    void *ptr = ioremap(phys, size);
++#endif
+     if (ptr)
+         NV_MEMDBG_ADD(ptr, size);
+     return ptr;
+diff --git a/kernel/common/inc/nv-procfs.h b/kernel/common/inc/nv-procfs.h
+index 3c812ea..e57c4f9 100644
+--- a/kernel/common/inc/nv-procfs.h
++++ b/kernel/common/inc/nv-procfs.h
+@@ -52,6 +52,19 @@
+     })
+ #endif
+ 
++#if defined(NV_HAVE_PROC_OPS)
++#define NV_CREATE_PROC_FILE(filename,parent,__name,__data)               \
++   ({                                                                    \
++        struct proc_dir_entry *__entry;                                  \
++        int mode = (S_IFREG | S_IRUGO);                                  \
++        const struct proc_ops *fops = &nv_procfs_##__name##_fops;        \
++        if (fops->proc_write != 0)                                       \
++            mode |= S_IWUSR;                                             \
++        __entry = NV_CREATE_PROC_ENTRY(filename, mode, parent, fops,     \
++            __data);                                                     \
++        __entry;                                                         \
++    })
++#else
+ #define NV_CREATE_PROC_FILE(filename,parent,__name,__data)               \
+    ({                                                                    \
+         struct proc_dir_entry *__entry;                                  \
+@@ -63,6 +76,7 @@
+             __data);                                                     \
+         __entry;                                                         \
+     })
++#endif
+ 
+ /*
+  * proc_mkdir_mode exists in Linux 2.6.9, but isn't exported until Linux 3.0.
+@@ -104,6 +118,24 @@
+     remove_proc_entry(entry->name, entry->parent);
+ #endif
+ 
++#if defined(NV_HAVE_PROC_OPS)
++#define NV_DEFINE_PROCFS_SINGLE_FILE(__name)                                  \
++    static int nv_procfs_open_##__name(                                       \
++        struct inode *inode,                                                  \
++        struct file *filep                                                    \
++    )                                                                         \
++    {                                                                         \
++        return single_open(filep, nv_procfs_read_##__name,                    \
++            NV_PDE_DATA(inode));                                              \
++    }                                                                         \
++                                                                              \
++    static const struct proc_ops nv_procfs_##__name##_fops = {                \
++        .proc_open       = nv_procfs_open_##__name,                           \
++        .proc_read       = seq_read,                                          \
++        .proc_lseek      = seq_lseek,                                         \
++        .proc_release    = single_release,                                    \
++    };
++#else
+ #define NV_DEFINE_PROCFS_SINGLE_FILE(__name)                                  \
+     static int nv_procfs_open_##__name(                                       \
+         struct inode *inode,                                                  \
+@@ -121,6 +153,7 @@
+         .llseek     = seq_lseek,                                              \
+         .release    = single_release,                                         \
+     };
++#endif
+ 
+ #endif  /* CONFIG_PROC_FS */
+ 
+diff --git a/kernel/common/inc/nv-time.h b/kernel/common/inc/nv-time.h
+index 2c799c9..0206062 100644
+--- a/kernel/common/inc/nv-time.h
++++ b/kernel/common/inc/nv-time.h
+@@ -30,7 +30,12 @@
+ #include <linux/ktime.h>
+ #endif
+ 
+-static inline void nv_gettimeofday(struct timeval *tv)
++struct nv_timeval {
++    __kernel_long_t      tv_sec;
++    __kernel_suseconds_t tv_usec;
++};
++
++static inline void nv_gettimeofday(struct nv_timeval *tv)
+ {
+ #ifdef NV_DO_GETTIMEOFDAY_PRESENT
+     do_gettimeofday(tv);
+@@ -39,7 +44,7 @@ static inline void nv_gettimeofday(struct timeval *tv)
+ 
+     ktime_get_real_ts64(&now);
+ 
+-    *tv = (struct timeval) {
++    *tv = (struct nv_timeval) {
+         .tv_sec = now.tv_sec,
+         .tv_usec = now.tv_nsec/1000,
+     };
+diff --git a/kernel/conftest.sh b/kernel/conftest.sh
+index ec9e093..463a464 100755
+--- a/kernel/conftest.sh
++++ b/kernel/conftest.sh
+@@ -1197,6 +1197,22 @@ compile_test() {
+             compile_check_conftest "$CODE" "NV_IOREMAP_CACHE_PRESENT" "" "functions"
+         ;;
+ 
++        ioremap_nocache)
++            #
++            # Determine if the ioremap_nocache() function is present.
++            #
++            # Removed by commit 4bdc0d676a64 ("remove ioremap_nocache and
++            # devm_ioremap_nocache") in v5.6 (2020-01-06)
++            #
++            CODE="
++            #include <asm/io.h>
++            void conftest_ioremap_nocache(void) {
++                ioremap_nocache();
++            }"
++
++            compile_check_conftest "$CODE" "NV_IOREMAP_NOCACHE_PRESENT" "" "functions"
++        ;;
++
+         ioremap_wc)
+             #
+             # Determine if the ioremap_wc() function is present.
+@@ -1430,6 +1446,31 @@ compile_test() {
+             compile_check_conftest "$CODE" "NV_SG_ALLOC_TABLE_FROM_PAGES_PRESENT" "" "functions"
+         ;;
+ 
++        proc_ops)
++            CODE="
++            #include <linux/proc_fs.h>
++            int conftest_proc_ops(void) {
++                return offsetof(struct proc_ops, proc_open);
++            }"
++
++            compile_check_conftest "$CODE" "NV_HAVE_PROC_OPS" "" "types"
++        ;;
++
++        ktime_get_raw_ts64)
++            #
++            # Determine if the ktime_get_raw_ts64() function is present.
++            #
++            CODE="
++            #include <linux/ktime.h>
++            int conftest_ktime_get_raw_ts64(void) {
++                struct timespec64 ts = {0};
++
++                ktime_get_raw_ts64(&ts64);
++            }"
++
++            compile_check_conftest "$CODE" "NV_KTIME_GET_RAW_TS64_PRESENT" "" "functions"
++        ;;
++
+         efi_enabled)
+             #
+             # Determine if the efi_enabled symbol is present, or if
+diff --git a/kernel/nvidia-modeset/nvidia-modeset-linux.c b/kernel/nvidia-modeset/nvidia-modeset-linux.c
+index d42aabb..f0404fb 100644
+--- a/kernel/nvidia-modeset/nvidia-modeset-linux.c
++++ b/kernel/nvidia-modeset/nvidia-modeset-linux.c
+@@ -216,7 +216,7 @@ void NVKMS_API_CALL nvkms_usleep(NvU64 usec)
+ 
+ NvU64 NVKMS_API_CALL nvkms_get_usec(void)
+ {
+-    struct timeval tv;
++    struct nv_timeval tv;
+ 
+     nv_gettimeofday(&tv);
+ 
+diff --git a/kernel/nvidia-uvm/uvm_linux.h b/kernel/nvidia-uvm/uvm_linux.h
+index 8784a82..c256cdb 100644
+--- a/kernel/nvidia-uvm/uvm_linux.h
++++ b/kernel/nvidia-uvm/uvm_linux.h
+@@ -329,7 +329,16 @@ static inline uint64_t NV_DIV64(uint64_t dividend, uint64_t divisor, uint64_t *r
+ }
+ #endif
+ 
+-#if defined(CLOCK_MONOTONIC_RAW)
++#if defined(NV_KTIME_GET_RAW_TS64_PRESENT)
++static inline NvU64 NV_GETTIME(void)
++{
++    struct timespec64 ts64 = {0};
++
++    ktime_get_raw_ts64(&ts64);
++
++    return (ts64.tv_sec * 1000000000ULL + ts64.tv_nsec);
++}
++#elif defined(CLOCK_MONOTONIC_RAW)
+ /* Return a nanosecond-precise value */
+ static inline NvU64 NV_GETTIME(void)
+ {
+@@ -345,7 +354,7 @@ static inline NvU64 NV_GETTIME(void)
+  * available non-GPL symbols. */
+ static inline NvU64 NV_GETTIME(void)
+ {
+-    struct timeval tv = {0};
++    struct nv_timeval tv = {0};
+ 
+     nv_gettimeofday(&tv);
+ 
+diff --git a/kernel/nvidia/nv-procfs.c b/kernel/nvidia/nv-procfs.c
+index 5808a88..bc60a08 100644
+--- a/kernel/nvidia/nv-procfs.c
++++ b/kernel/nvidia/nv-procfs.c
+@@ -414,6 +414,15 @@ done:
+     return ((status < 0) ? status : (int)count);
+ }
+ 
++#if defined(NV_HAVE_PROC_OPS)
++static struct proc_ops nv_procfs_registry_fops = {
++    .proc_open    = nv_procfs_open_registry,
++    .proc_read    = seq_read,
++    .proc_write   = nv_procfs_write_file,
++    .proc_lseek   = seq_lseek,
++    .proc_release = nv_procfs_close_registry,
++};
++#else
+ static struct file_operations nv_procfs_registry_fops = {
+     .owner   = THIS_MODULE,
+     .open    = nv_procfs_open_registry,
+@@ -422,6 +431,7 @@ static struct file_operations nv_procfs_registry_fops = {
+     .llseek  = seq_lseek,
+     .release = nv_procfs_close_registry,
+ };
++#endif
+ 
+ /*
+  * Forwards error to nv_log_error which exposes data to vendor callback
+@@ -517,12 +527,20 @@ done:
+     return status;
+ }
+ 
++#if defined(NV_HAVE_PROC_OPS)
++static struct proc_ops nv_procfs_exercise_error_forwarding_fops = {
++    .proc_open    = nv_procfs_open_exercise_error_forwarding,
++    .proc_write   = nv_procfs_write_file,
++    .proc_release = nv_procfs_close_exercise_error_forwarding,
++};
++#else
+ static struct file_operations nv_procfs_exercise_error_forwarding_fops = {
+     .owner   = THIS_MODULE,
+     .open    = nv_procfs_open_exercise_error_forwarding,
+     .write   = nv_procfs_write_file,
+     .release = nv_procfs_close_exercise_error_forwarding,
+ };
++#endif
+ 
+ static int
+ nv_procfs_read_unbind_lock(
+@@ -650,6 +668,15 @@ done:
+     return rc;
+ }
+ 
++#if defined(NV_HAVE_PROC_OPS)
++static struct proc_ops nv_procfs_unbind_lock_fops = {
++    .proc_open    = nv_procfs_open_unbind_lock,
++    .proc_read    = seq_read,
++    .proc_write   = nv_procfs_write_file,
++    .proc_lseek   = seq_lseek,
++    .proc_release = nv_procfs_close_unbind_lock,
++};
++#else
+ static struct file_operations nv_procfs_unbind_lock_fops = {
+     .owner   = THIS_MODULE,
+     .open    = nv_procfs_open_unbind_lock,
+@@ -658,6 +685,7 @@ static struct file_operations nv_procfs_unbind_lock_fops = {
+     .llseek  = seq_lseek,
+     .release = nv_procfs_close_unbind_lock,
+ };
++#endif
+ 
+ static int
+ nv_procfs_read_text_file(
+diff --git a/kernel/nvidia/nvidia.Kbuild b/kernel/nvidia/nvidia.Kbuild
+index 8ae1016..da7f135 100644
+--- a/kernel/nvidia/nvidia.Kbuild
++++ b/kernel/nvidia/nvidia.Kbuild
+@@ -117,6 +117,7 @@ NV_CONFTEST_FUNCTION_COMPILE_TESTS += on_each_cpu
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += smp_call_function
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += acpi_evaluate_integer
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += ioremap_cache
++NV_CONFTEST_FUNCTION_COMPILE_TESTS += ioremap_nocache
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += ioremap_wc
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += acpi_walk_namespace
+ NV_CONFTEST_FUNCTION_COMPILE_TESTS += pci_domain_nr
+@@ -169,7 +170,9 @@ NV_CONFTEST_TYPE_COMPILE_TESTS += outer_flush_all
+ NV_CONFTEST_TYPE_COMPILE_TESTS += proc_dir_entry
+ NV_CONFTEST_TYPE_COMPILE_TESTS += scatterlist
+ NV_CONFTEST_TYPE_COMPILE_TESTS += sg_table
++NV_CONFTEST_TYPE_COMPILE_TESTS += proc_ops
+ NV_CONFTEST_TYPE_COMPILE_TESTS += file_operations
++NV_CONFTEST_TYPE_COMPILE_TESTS += ktime_get_raw_ts64
+ NV_CONFTEST_TYPE_COMPILE_TESTS += vm_operations_struct
+ NV_CONFTEST_TYPE_COMPILE_TESTS += atomic_long_type
+ NV_CONFTEST_TYPE_COMPILE_TESTS += pci_save_state
+diff --git a/kernel/nvidia/nvlink_linux.c b/kernel/nvidia/nvlink_linux.c
+index 0014280..537b257 100644
+--- a/kernel/nvidia/nvlink_linux.c
++++ b/kernel/nvidia/nvlink_linux.c
+@@ -518,8 +518,8 @@ void * NVLINK_API_CALL nvlink_memcpy(void *dest, void *src, NvLength size)
+ 
+ static NvBool nv_timer_less_than
+ (
+-    const struct timeval *a,
+-    const struct timeval *b
++    const struct nv_timeval *a,
++    const struct nv_timeval *b
+ )
+ {
+     return (a->tv_sec == b->tv_sec) ? (a->tv_usec < b->tv_usec) 
+@@ -528,9 +528,9 @@ static NvBool nv_timer_less_than
+ 
+ static void nv_timeradd
+ (
+-    const struct timeval    *a,
+-    const struct timeval    *b,
+-    struct timeval          *result
++    const struct nv_timeval    *a,
++    const struct nv_timeval    *b,
++    struct nv_timeval          *result
+ )
+ {
+     result->tv_sec = a->tv_sec + b->tv_sec;
+@@ -544,9 +544,9 @@ static void nv_timeradd
+ 
+ static void nv_timersub
+ (
+-    const struct timeval    *a,
+-    const struct timeval    *b,
+-    struct timeval          *result
++    const struct nv_timeval    *a,
++    const struct nv_timeval    *b,
++    struct nv_timeval          *result
+ )
+ {
+     result->tv_sec = a->tv_sec - b->tv_sec;
+@@ -566,7 +566,7 @@ void NVLINK_API_CALL nvlink_sleep(unsigned int ms)
+     unsigned long us;
+     unsigned long jiffies;
+     unsigned long mdelay_safe_msec;
+-    struct timeval tm_end, tm_aux;
++    struct nv_timeval tm_end, tm_aux;
+ 
+     nv_gettimeofday(&tm_aux);
+ 
+diff --git a/kernel/nvidia/os-interface.c b/kernel/nvidia/os-interface.c
+index 344daa8..39d0a19 100644
+--- a/kernel/nvidia/os-interface.c
++++ b/kernel/nvidia/os-interface.c
+@@ -430,7 +430,7 @@ NV_STATUS NV_API_CALL os_get_current_time(
+     NvU32 *useconds
+ )
+ {
+-    struct timeval tm;
++    struct nv_timeval tm;
+ 
+     nv_gettimeofday(&tm);
+ 
+@@ -444,9 +444,15 @@ NV_STATUS NV_API_CALL os_get_current_time(
+ 
+ void NV_API_CALL os_get_current_tick(NvU64 *nseconds)
+ {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0)
++    struct timespec64 ts;
++
++    jiffies_to_timespec64(jiffies, &ts);
++#else
+     struct timespec ts;
+ 
+     jiffies_to_timespec(jiffies, &ts);
++#endif
+ 
+     *nseconds = ((NvU64)ts.tv_sec * NSEC_PER_SEC + (NvU64)ts.tv_nsec);
+ }
+@@ -502,7 +508,7 @@ NV_STATUS NV_API_CALL os_delay_us(NvU32 MicroSeconds)
+     unsigned long usec;
+ 
+ #ifdef NV_CHECK_DELAY_ACCURACY
+-    struct timeval tm1, tm2;
++    struct nv_timeval tm1, tm2;
+ 
+     nv_gettimeofday(&tm1);
+ #endif
+@@ -542,9 +548,9 @@ NV_STATUS NV_API_CALL os_delay(NvU32 MilliSeconds)
+     unsigned long MicroSeconds;
+     unsigned long jiffies;
+     unsigned long mdelay_safe_msec;
+-    struct timeval tm_end, tm_aux;
++    struct nv_timeval tm_end, tm_aux;
+ #ifdef NV_CHECK_DELAY_ACCURACY
+-    struct timeval tm_start;
++    struct nv_timeval tm_start;
+ #endif
+ 
+     nv_gettimeofday(&tm_aux);
+@@ -1926,7 +1932,7 @@ static NV_STATUS NV_API_CALL _os_ipmi_receive_resp
+ {
+     struct ipmi_recv_msg    *rx_msg;
+     int                     err_no;
+-    struct timeval          tv;
++    struct nv_timeval          tv;
+     NvU64                   start_time;
+ 
+     nv_gettimeofday(&tv);
diff --git a/package/nvidia-driver/435.21/0001-kernel-5.4.patch b/package/nvidia-driver/435.21/0001-kernel-5.4.patch
new file mode 100644
index 0000000000..eb13d2962b
--- /dev/null
+++ b/package/nvidia-driver/435.21/0001-kernel-5.4.patch
@@ -0,0 +1,142 @@
+From b713e240cdafa6aeb2145285e7878b20344dd841 Mon Sep 17 00:00:00 2001
+From: Alberto Milone <alberto.milone@canonical.com>
+Date: Fri, 15 Nov 2019 10:40:17 +0100
+Subject: [PATCH 1/1] Add support for Linux 5.4
+
+These changes come from the 440.31 driver.
+---
+ Kbuild                       | 14 ++++++++---
+ conftest.sh                  | 48 +++++++++++++++++++++++++++++++++++-
+ nvidia-drm/nvidia-drm-drv.c  |  6 ++++-
+ nvidia-drm/nvidia-drm.Kbuild |  1 +
+ 4 files changed, 64 insertions(+), 5 deletions(-)
+
+diff --git a/Kbuild b/Kbuild
+index 1e79d0b..b459908 100644
+--- a/kernel/Kbuild
++++ b/kernel/Kbuild
+@@ -26,11 +26,19 @@
+ # $(1): The object files.
+ # $(2): The CFLAGS to add for those object files.
+ #
+-
++# With kernel git commit 54b8ae66ae1a3454a7645d159a482c31cd89ab33, the
++# handling of object-specific CFLAGs, CFLAGS_$(object) has changed. Prior to
++# this commit, the CFLAGS_$(object) variable was required to be defined with
++# only the the object name (<CFLAGS_somefile.o>). With the aforementioned git
++# commit, it is now required to give Kbuild relative paths along-with the
++# object name (CFLAGS_<somepath>/somefile.o>). As a result, CFLAGS_$(object)
++# is set twice, once with a relative path to the object files and once with
++# just the object files.
++#
+ ASSIGN_PER_OBJ_CFLAGS = \
+  $(foreach _cflags_variable, \
+- $(addprefix CFLAGS_,$(notdir $(1))), \
+- $(eval $(_cflags_variable) += $(2)))
++ $(notdir $(1)) $(1), \
++ $(eval $(addprefix CFLAGS_,$(_cflags_variable)) += $(2)))
+ 
+ 
+ #
+diff --git a/conftest.sh b/conftest.sh
+index c00c826..b957ffe 100755
+--- a/kernel/conftest.sh
++++ b/kernel/conftest.sh
+@@ -196,6 +196,23 @@ build_cflags() {
+     if [ -n "$BUILD_PARAMS" ]; then
+         CFLAGS="$CFLAGS -D$BUILD_PARAMS"
+     fi
++
++    # Check if gcc supports asm goto and set CC_HAVE_ASM_GOTO if it does.
++    # Older kernels perform this check and set this flag in Kbuild, and since
++    # conftest.sh runs outside of Kbuild it ends up building without this flag.
++    # Starting with commit e9666d10a5677a494260d60d1fa0b73cc7646eb3 this test
++    # is done within Kconfig, and the preprocessor flag is no longer needed.
++
++    GCC_GOTO_SH="$SOURCES/build/gcc-goto.sh"
++
++    if [ -f "$GCC_GOTO_SH" ]; then
++        # Newer versions of gcc-goto.sh don't print anything on success, but
++        # this is okay, since it's no longer necessary to set CC_HAVE_ASM_GOTO
++        # based on the output of those versions of gcc-goto.sh.
++        if [ `/bin/sh "$GCC_GOTO_SH" "$CC"` = "y" ]; then
++            CFLAGS="$CFLAGS -DCC_HAVE_ASM_GOTO"
++        fi
++    fi
+ }
+ 
+ CONFTEST_PREAMBLE="#include \"conftest/headers.h\"
+@@ -3214,6 +3231,35 @@ compile_test() {
+         # <function> was added|removed|etc by commit <sha> ("<commit message")
+         # in <kernel-version> (<commit date>).
+ 
++        drm_driver_prime_flag_present)
++            #
++            # Determine whether driver feature flag DRIVER_PRIME is present.
++            #
++            # The DRIVER_PRIME flag was added by commit 3248877ea179 (drm:
++            # base prime/dma-buf support (v5)) in v3.4 (2011-11-25) and is
++            # removed by commit 0424fdaf883a (drm/prime: Actually remove
++            # DRIVER_PRIME everywhere) on 2019-06-17.
++            #
++            # DRIVER_PRIME definition moved from drmP.h to drm_drv.h by
++            # commit 85e634bce01a (drm: Extract drm_drv.h) in v4.10
++            # (2016-11-14).
++            #
++            # DRIVER_PRIME define is changed to enum value by commit
++            # 0e2a933b02c9 (drm: Switch DRIVER_ flags to an enum) in v5.1
++            # (2019-01-29).
++            #
++            CODE="
++            #include <drm/drmP.h>
++            #if defined(NV_DRM_DRM_DRV_H_PRESENT)
++            #include <drm/drm_drv.h>
++            #endif
++            unsigned int drm_driver_prime_flag_present_conftest(void) {
++                return DRIVER_PRIME;
++            }"
++
++            compile_check_conftest "$CODE" "NV_DRM_DRIVER_PRIME_FLAG_PRESENT" "" "types"
++        ;;
++
+         *)
+             # Unknown test name given
+             echo "Error: unknown conftest '$1' requested" >&2
+@@ -3585,7 +3631,7 @@ case "$5" in
+         TAB='	'
+ 
+         if [ -f "$OUTPUT/Module.symvers" ] && \
+-             grep -e "^[^${TAB}]*${TAB}[^${TAB}]*${TAB}vmlinux" \
++             grep -e "^[^${TAB}]*${TAB}[^${TAB}]*${TAB}\+vmlinux" \
+                      "$OUTPUT/Module.symvers" >/dev/null 2>&1; then
+             exit 0
+         fi
+diff --git a/nvidia-drm/nvidia-drm-drv.c b/nvidia-drm/nvidia-drm-drv.c
+index bc31de7..8ea037f 100644
+--- a/kernel/nvidia-drm/nvidia-drm-drv.c
++++ b/kernel/nvidia-drm/nvidia-drm-drv.c
+@@ -659,7 +659,11 @@ static const struct drm_ioctl_desc nv_drm_ioctls[] = {
+ 
+ static struct drm_driver nv_drm_driver = {
+ 
+-    .driver_features        = DRIVER_GEM | DRIVER_PRIME | DRIVER_RENDER,
++    .driver_features        =
++#if defined(NV_DRM_DRIVER_PRIME_FLAG_PRESENT)
++                               DRIVER_PRIME |
++#endif
++                               DRIVER_GEM  | DRIVER_RENDER,
+ 
+     .gem_free_object        = nv_drm_gem_free,
+ 
+diff --git a/nvidia-drm/nvidia-drm.Kbuild b/nvidia-drm/nvidia-drm.Kbuild
+index 921deea..ff10094 100644
+--- a/kernel/nvidia-drm/nvidia-drm.Kbuild
++++ b/kernel/nvidia-drm/nvidia-drm.Kbuild
+@@ -85,3 +85,4 @@ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_mode_object_find_has_file_priv_arg
+ NV_CONFTEST_TYPE_COMPILE_TESTS += dma_buf_owner
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_connector_list_iter
+ NV_CONFTEST_TYPE_COMPILE_TESTS += drm_atomic_helper_swap_state_has_stall_arg
++NV_CONFTEST_TYPE_COMPILE_TESTS += drm_driver_prime_flag_present
+-- 
+2.20.1
+
diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 9631b3e70c..12a2861823 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -14,6 +14,33 @@ config BR2_PACKAGE_NVIDIA_DRIVER
 
 if BR2_PACKAGE_NVIDIA_DRIVER
 
+choice 
+	prompt "Release branch"
+	default BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_LONG_LIVED	if BR2_x86_64
+	default BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_LEGACY	if BR2_i386
+
+config BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_LEGACY
+	bool "Legacy (390.xxx branch, for old cards and i386)"
+
+if BR2_x86_64
+config BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_LONG_LIVED
+	bool "Long-lived branch"
+
+config BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_SHORT_LIVED
+	bool "Short-lived branch (for very fresh GPUs and fixes)"
+endif
+
+comment "Only legacy branch is supported on i386"
+	depends on BR2_i386
+
+endchoice
+
+config BR2_PACKAGE_NVIDIA_DRIVER_RELEASE
+	string
+	default "legacy"	if BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_LEGACY
+	default "short"		if BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_SHORT_LIVED
+	default "long"		if BR2_PACKAGE_NVIDIA_DRIVER_RELEASE_LONG_LIVED
+
 comment "nvidia-driver X.org drivers needs a modular Xorg server"
 	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 
@@ -21,37 +48,13 @@ config BR2_PACKAGE_NVIDIA_DRIVER_XORG
 	bool "X.org drivers"
 	default y
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
-	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_LIBGL_HEADERS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
-	select BR2_PACKAGE_HAS_LIBGLES
-
-if BR2_PACKAGE_NVIDIA_DRIVER_XORG
-
-config BR2_PACKAGE_PROVIDES_LIBGL
-	default "nvidia-driver"
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "nvidia-driver"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "nvidia-driver"
-
-config BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS
-	bool "Install private libraries"
-	help
-	  Two libraries require special agreement with NVidia to
-	  develop code linking to those libraries: libnvidia-ifr.so
-	  and libnvidia-fbc.so (to grab and encode an OpenGL buffer or
-	  an X framebuffer.)
-
-	  Say 'y' here if you plan on running a program that uses
-	  those private libraries.
 
-endif # BR2_PACKAGE_NVIDIA_DRIVER_XORG
+config BR2_PACKAGE_NVIDIA_DRIVER_VDPAU
+	bool "VDPAU support"
+	select BR2_PACKAGE_LIBVDPAU
 
 config BR2_PACKAGE_NVIDIA_DRIVER_CUDA
 	bool "CUDA support"
@@ -60,7 +63,7 @@ if BR2_PACKAGE_NVIDIA_DRIVER_CUDA
 
 config BR2_PACKAGE_NVIDIA_DRIVER_OPENCL
 	bool "OpenCL support"
-	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_LIBGL_HEADERS
 	select BR2_PACKAGE_HAS_LIBOPENCL
 
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
diff --git a/package/nvidia-driver/egl.pc b/package/nvidia-driver/egl.pc
deleted file mode 100644
index a5aeace63c..0000000000
--- a/package/nvidia-driver/egl.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: egl
-Description: Nvidia OpenGL library
-Version: 1
-Cflags: -I${includedir}
-Libs: -L${libdir} -lEGL
diff --git a/package/nvidia-driver/gl.pc b/package/nvidia-driver/gl.pc
deleted file mode 100644
index d01f5d6944..0000000000
--- a/package/nvidia-driver/gl.pc
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: gl
-Description: Nvidia OpenGL library
-Version: 10.4.2
-Libs: -L${libdir} -lGL -lm -lXext -lX11 -ldl
-Cflags: -I${includedir}  -DEGL_NO_X11
-glx_tls: no
diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 79ac052610..4592a27c1f 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,6 @@
 # Locally computed
-sha256 6f4af70ee3d03ed31c497a5d555164c56057b53ecedfc0d2c8de4b0b90728805  NVIDIA-Linux-x86-390.67.run
-sha256 6df2ca1a7420b6751bcaf257d321b14f4e5f7ca54d77a43514912a3792ece65a  NVIDIA-Linux-x86_64-390.67.run
+sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
+sha256 caee54f0ee5f6171a61b25670d309d1abe16d59fc7bec0577794b1a52c09244a  NVIDIA-Linux-x86_64-435.21-no-compat32.run
+sha256 89feda0c3e54c9c0d0528760bbb5cf4d8e57408fb3df2728653f3a1b73c110a9  NVIDIA-Linux-x86_64-440.82-no-compat32.run
+sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
 sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index baf2ba2be5..7a45934aac 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,126 +4,46 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.67
-NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
-NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
-NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION).run
-NVIDIA_DRIVER_LICENSE = NVIDIA Software License
-NVIDIA_DRIVER_LICENSE_FILES = LICENSE
-NVIDIA_DRIVER_REDISTRIBUTE = NO
-NVIDIA_DRIVER_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
-
-# Since nvidia-driver are binary blobs, the below dependencies are not
-# strictly speaking build dependencies of nvidia-driver. However, they
-# are build dependencies of packages that depend on nvidia-driver, so
-# they should be built prior to those packages, and the only simple
-# way to do so is to make nvidia-driver depend on them.
-NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext
-NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
-
-# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; it
-# has been replaced with libGL.so.1.0.0. Installing both is technically
-# possible, but great care must be taken to ensure they do not conflict,
-# so that EGL still works. The legacy library exposes an NVidia-specific
-# API, so it should not be needed, except for legacy, binary-only
-# applications (in other words: we don't care).
+# Provide a choice for driver release branch
 #
-# libGL.so.1.0.0 is the new vendor-neutral library, aimed at replacing
-# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The latter contains
-# NVidia extensions (which is deemed bad now), while the former follows
-# the newly-introduced vendor-neutral "dispatching" API/ABI:
-#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-opengl-abi-proposal.txt
-# However, this is not very usefull to us, as we don't support multiple
-# GL providers at the same time on the system, which this proposal is
-# aimed at supporting.
-#
-# So we only install the legacy library for now.
-NVIDIA_DRIVER_LIBS_GL = \
-	libGLX.so.0 \
-	libGL.so.$(NVIDIA_DRIVER_VERSION) \
-	libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
-
-NVIDIA_DRIVER_LIBS_EGL = \
-	libEGL.so.1.1.0 \
-	libGLdispatch.so.0 \
-	libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION)
-
-NVIDIA_DRIVER_LIBS_GLES = \
-	libGLESv1_CM.so.1.2.0 \
-	libGLESv2.so.2.1.0 \
-	libGLESv1_CM_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
-	libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
-
-NVIDIA_DRIVER_LIBS_MISC = \
-	libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-egl-wayland.so.1.0.2 \
-	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
-	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
-	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
-
-NVIDIA_DRIVER_LIBS += \
-	$(NVIDIA_DRIVER_LIBS_GL) \
-	$(NVIDIA_DRIVER_LIBS_EGL) \
-	$(NVIDIA_DRIVER_LIBS_GLES) \
-	$(NVIDIA_DRIVER_LIBS_MISC)
-
-# Install the gl.pc file
-define NVIDIA_DRIVER_INSTALL_GL_DEV
-	$(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:__GENERATED_BY__:Buildroot:' $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
-	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
-	$(INSTALL) -D -m 0644 package/nvidia-driver/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-endef
+# These versions are all listed on https://www.nvidia.com/en-us/drivers/unix/
+# Does not require js/flash/"gpu autodetection"
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_VERSION = 390.132
+endif
 
-# Those libraries are 'private' libraries requiring an agreement with
-# NVidia to develop code for those libs. There seems to be no restriction
-# on using those libraries (e.g. if the user has such an agreement, or
-# wants to run a third-party program developped under such an agreement).
-ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
-NVIDIA_DRIVER_LIBS += \
-	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
+# NVIDIA 4xx only supports x86_64 and ARM
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"short")
+NVIDIA_DRIVER_VERSION = 440.82
 endif
 
-# We refer to the destination path; the origin file has no directory component
-NVIDIA_DRIVER_X_MODS = \
-	drivers/nvidia_drv.so \
-	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"long")
+NVIDIA_DRIVER_VERSION = 435.21
+endif
 
-endif # X drivers
+# TODO: Nvidia does have ARM driver now
+NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
+NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
+NVIDIA_DRIVER_LICENSE = NVIDIA Software License
+NVIDIA_DRIVER_LICENSE_FILES = LICENSE
+NVIDIA_DRIVER_REDISTRIBUTE = NO
+NVIDIA_DRIVER_INSTALL_STAGING = NO
+NVIDIA_DRIVER_DEPENDENCIES += libglvnd 
 
-ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
-NVIDIA_DRIVER_LIBS += \
-	libcuda.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
-ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
-NVIDIA_DRIVER_PROGS = nvidia-cuda-mps-control nvidia-cuda-mps-server
-endif
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
+NVIDIA_DRIVER_DEPENDENCIES += xlib_libX11 xlib_libXext
 endif
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
-NVIDIA_DRIVER_LIBS += \
-	libOpenCL.so.1.0.0 \
-	libnvidia-opencl.so.$(NVIDIA_DRIVER_VERSION)
-NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers
-NVIDIA_DRIVER_PROVIDES += libopencl
+NVIDIA_DRIVER_DEPENDENCIES += ocl-icd
 endif
 
 # Build and install the kernel modules if needed
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
-
 NVIDIA_DRIVER_MODULES = nvidia nvidia-modeset nvidia-drm
+
 ifeq ($(BR2_x86_64),y)
 NVIDIA_DRIVER_MODULES += nvidia-uvm
 endif
@@ -153,46 +73,226 @@ define NVIDIA_DRIVER_EXTRACT_CMDS
 	rm -rf $(@D)/tmp-extract
 endef
 
+# Q: Why don't use ".manifest" provided with NVIDIA installer?
+# A: The manifest isn't suitable to be parsed with anything else but the
+#    installer. It also inconsistent in its own terms and there are some
+#    hooks implemented in nvidia-installer binary directly. For example,
+#    manifest declares two files with "xdriver" "module" and identical
+#    "signature" where their target directories are different and there's
+#    no way to figure that out from it.
+
+# Core private OpenGL / EGL / GLES libraries
+NVIDIA_DRIVER_LIBRARIES = \
+	libnvidia-glcore.so \
+	libnvidia-eglcore.so \
+	libnvidia-glsi.so
+	
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_LIBRARIES += libnvidia-egl-wayland.so.1.0.2
+endif
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"long")
+NVIDIA_DRIVER_LIBRARIES += libnvidia-egl-wayland.so.1.1.3
+endif
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"short")
+NVIDIA_DRIVER_LIBRARIES += libnvidia-egl-wayland.so.1.1.4
+endif
+
+# GLX extension module for X11
+# NOTE: libglx.so.* != libGLX_nvidia.so.* !!!
+# The first one is private part of GLX extension of Nvidia driver, the second one is global
+# provider part callable by other applications
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_LIBRARIES += libglx.so:/usr/lib/nvidia/xorg
+else
+NVIDIA_DRIVER_LIBRARIES += libglxserver_nvidia.so:/usr/lib/nvidia/xorg
+endif
+NVIDIA_DRIVER_LIBRARIES += \
+	libGLX_nvidia.so \
+	nvidia_drv.so:/usr/lib/xorg/modules/drivers
+endif
+
+# Public OpenGL / EGL / GLES libraries
+NVIDIA_DRIVER_LIBRARIES += \
+	libEGL_nvidia.so \
+	libGLESv1_CM_nvidia.so \
+	libGLESv2_nvidia.so
+
+# Private misc libraries
+NVIDIA_DRIVER_LIBRARIES += \
+	libnvidia-cfg.so \
+	libnvidia-encode.so \
+	libnvidia-gtk2.so \
+	libnvidia-gtk3.so \
+	libnvidia-fbc.so \
+	libnvidia-ifr.so \
+	libnvidia-ml.so
+
+ifneq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_LIBRARIES += \
+	libnvidia-allocator.so \
+	libnvidia-glvkspirv.so
+endif
+
+# Public VDPAU library
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_VDPAU),y)
+NVIDIA_DRIVER_LIBRARIES += libvdpau_nvidia.so
+endif
+
+# Private TLS (thread-local storage) libraries
+NVIDIA_DRIVER_LIBRARIES += libnvidia-tls.so
+
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_LIBRARIES += tls/libnvidia-tls.so:/usr/lib/tls
+endif
+
+# CUDA
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
+NVIDIA_DRIVER_LIBRARIES += \
+	libcuda.so \
+	libnvcuvid.so \
+	libnvidia-ptxjitcompiler.so
+
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
+NVIDIA_DRIVER_LIBRARIES += \
+	libnvidia-compiler.so \
+	libnvidia-opencl.so
+endif
+endif
+
+# Raytracing
+ifneq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_LIBRARIES += \
+	libnvoptix.so \
+	libnvidia-rtcore.so \
+	libnvidia-cbl.so
+endif
+
+# Optical Flow
+ifneq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_LIBRARIES += libnvidia-opticalflow.so
+endif
+
+# Private fat binary loader
+NVIDIA_DRIVER_LIBRARIES += libnvidia-fatbinaryloader.so
+	
+NVIDIA_DRIVER_BINARIES = \
+	nvidia-debugdump \
+	nvidia-modprobe \
+	nvidia-persistenced \
+	nvidia-settings \
+	nvidia-smi \
+	nvidia-xconfig
+	
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
+NVIDIA_DRIVER_BINARIES += \
+	nvidia-cuda-mps-control \
+	nvidia-cuda-mps-server
+endif
+
+# GLVND provider definition for EGL
+NVIDIA_DRIVER_CONFIGS = \
+	10_nvidia.json:/usr/share/glvnd/egl_vendor.d/10_nvidia.json
+	
+# DRM OutputClass specification - essential to detect NVIDIA GPU by X11 on some systems
+NVIDIA_DRIVER_CONFIGS += \
+	nvidia-drm-outputclass.conf:/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf
+	
+# Vulkan ICD definition
+NVIDIA_DRIVER_CONFIGS += \
+	nvidia_icd.json:/usr/share/vulkan/icd.d/nvidia_icd.json
+
+ifneq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_CONFIGS += \
+	nvidia_layers.json:/usr/share/vulkan/implicit_layer.d/nvidia_layers.json
+endif
+
+# OpenCL ICD definition
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_OPENCL),y)
+NVIDIA_DRIVER_CONFIGS += \
+	nvidia.icd:/etc/OpenCL/vendors/nvidia.icd
+endif
+
+# Application proviles (aka. quirks for specific weirldy-behaving applications on NVIDIA hardware)
+NVIDIA_DRIVER_CONFIGS += \
+	nvidia-application-profiles-$(NVIDIA_DRIVER_VERSION)-rc:/usr/share/nvidia/nvidia-application-profiles-$(NVIDIA_DRIVER_VERSION)-rc \
+	nvidia-application-profiles-$(NVIDIA_DRIVER_VERSION)-key-documentation:/usr/share/nvidia/nvidia-application-profiles-$(NVIDIA_DRIVER_VERSION)-key-documentation
+	
+NVIDIA_DRIVER_SYMLINKS =
+# libglx/libglxserver does not have SONAME!
+ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_RELEASE),"legacy")
+NVIDIA_DRIVER_SYMLINKS += \
+	/usr/lib/nvidia/xorg/libglx.so.$(NVIDIA_DRIVER_VERSION):/usr/lib/nvidia/xorg/libglx.so.1 \
+	/usr/lib/nvidia/xorg/libglx.so.$(NVIDIA_DRIVER_VERSION):/usr/lib/nvidia/xorg/libglx.so
+else
+NVIDIA_DRIVER_SYMLINKS += \
+	/usr/lib/nvidia/xorg/libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION):/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1 \
+	/usr/lib/nvidia/xorg/libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION):/usr/lib/nvidia/xorg/libglxserver_nvidia.so
+endif
+
 # Helper to install libraries
-# $1: destination directory (target or staging)
+# $1: library name 
+# $2: destination directory
 #
 # For all libraries, we install them and create a symlink using
 # their SONAME, so we can link to them at runtime; we also create
 # the no-version symlink, so we can link to them at build time.
-define NVIDIA_DRIVER_INSTALL_LIBS
-	$(foreach lib,$(NVIDIA_DRIVER_LIBS),\
-		$(INSTALL) -D -m 0644 $(@D)/$(lib) $(1)/usr/lib/$(notdir $(lib))
-		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$(lib)" \
-			|sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
-		if [ -n "$${libsoname}" -a "$${libsoname}" != "$(notdir $(lib))" ]; then \
-			ln -sf $(notdir $(lib)) \
-				$(1)/usr/lib/$${libsoname}; \
-		fi
-		baseso=$(firstword $(subst .,$(space),$(notdir $(lib)))).so; \
-		if [ -n "$${baseso}" -a "$${baseso}" != "$(notdir $(lib))" ]; then \
-			ln -sf $(notdir $(lib)) $(1)/usr/lib/$${baseso}; \
-		fi
+define NVIDIA_DRIVER_INSTALL_LIBRARIES
+	$(foreach libspec,$(NVIDIA_DRIVER_LIBRARIES),                                               \
+	libname="$$( echo $(libspec) | cut -f1 -d: )";                                              \
+	libdest="$$( echo $(libspec) | cut -f2 -d: )";                                              \
+	if [ "$${libdest}" = "$${libname}" ]; then                                                  \
+	libdest="/usr/lib";                                                                         \
+	fi;                                                                                         \
+	if [ "$$(echo $${libname} | grep -o '.so$$')" = ".so" ] ; then                              \
+	  if [ -f $(@D)/$${libname}.${NVIDIA_DRIVER_VERSION} ] ; then                               \
+	    libname="$${libname}.$(NVIDIA_DRIVER_VERSION)";                                         \
+	  fi;                                                                                       \
+	fi;                                                                                         \
+	$(INSTALL) -D -m 755 $(@D)/$${libname} $(TARGET_DIR)/$${libdest}/$${libname};               \
+	libsoname="$$( $(TARGET_OBJDUMP) -p $(@D)/$${libname} | awk '/SONAME/ { print $$2 }')";     \
+	if [ -n "$${libsoname}" -a "$${libsoname}" != "$${libname}" ]; then                         \
+		ln -srf $(TARGET_DIR)$${libdest}/$${libname} $(TARGET_DIR)$${libdest}/$${libsoname};\
+	fi;                                                                                         \
+	libbaseso="$$( echo $${libname} | cut -d. -f-2)";                                           \
+	if [ -n "$${libbaseso}" -a "$${libbaseso}" != "$${libname}" ]; then                         \
+		ln -srf $(TARGET_DIR)$${libdest}/$${libname} $(TARGET_DIR)$${libdest}/$${libbaseso};\
+	fi                                                                            
 	)
 endef
 
-# For staging, install libraries and development files
-define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
-	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(STAGING_DIR))
-	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
+define NVIDIA_DRIVER_INSTALL_BINARIES
+	$(foreach binname,$(NVIDIA_DRIVER_BINARIES), \
+	$(INSTALL) -D -m 755 $(@D)/$(binname) $(TARGET_DIR)/usr/bin/$(binname)
+	)
 endef
 
-# For target, install libraries and X.org modules
-define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
-	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
-	$(foreach m,$(NVIDIA_DRIVER_X_MODS), \
-		$(INSTALL) -D -m 0644 $(@D)/$(notdir $(m)) \
-			$(TARGET_DIR)/usr/lib/xorg/modules/$(m)
+define NVIDIA_DRIVER_INSTALL_CONFIGS
+	$(foreach confspec,$(NVIDIA_DRIVER_CONFIGS),    \
+	confname="$$(echo $(confspec) | cut -f1 -d: )"; \
+	confdest="$$(echo $(confspec) | cut -f2 -d: )"; \
+	$(INSTALL) -D -m 644 $(@D)/$${confname} $(TARGET_DIR)$${confdest}
 	)
-	$(foreach p,$(NVIDIA_DRIVER_PROGS), \
-		$(INSTALL) -D -m 0755 $(@D)/$(p) \
-			$(TARGET_DIR)/usr/bin/$(p)
+endef
+
+define NVIDIA_DRIVER_INSTALL_SYMLINKS
+	$(foreach symspec,$(NVIDIA_DRIVER_SYMLINKS),  \
+	symsrc="$$(echo $(symspec) | cut -f1 -d: )";  \
+	symdest="$$(echo $(symspec) | cut -f2 -d: )"; \
+	ln -srf $(TARGET_DIR)$${symsrc} $(TARGET_DIR)$${symdest}
 	)
-	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
+endef
+# Due to a conflict with xserver_xorg-server, this needs to be performed when
+# finalizing the target filesystem to make sure this version is used.
+NVIDIA_DRIVER_TARGET_FINALIZE_HOOKS += NVIDIA_DRIVER_INSTALL_SYMLINKS
+
+define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
+	if [ -f $(@D)/nvidia_icd.json.template ] ; then \
+	  sed 's/__NV_VK_ICD__/libGLX_nvidia.so.0/' $(@D)/nvidia_icd.json.template > $(@D)/nvidia_icd.json ;\
+	fi
+	$(call NVIDIA_DRIVER_INSTALL_LIBRARIES)
+	$(call NVIDIA_DRIVER_INSTALL_CONFIGS)
+	$(call NVIDIA_DRIVER_INSTALL_BINARIES)
 endef
 
 $(eval $(generic-package))
-- 
2.26.2


-- 
CONFIDENTIALITY NOTICE
------------------------------------
This
 E-mail is 
intended only to be read or used by the addressee.The 
information 
contained in this E-mail message may be confidential 
information. If you 
are not the intended recipient, any use, 
interference with, distribution, 
disclosure or copying of this material 
is unauthorized and prohibited. 
Confidentiality attached to this 
communication is not waived or lost by 
reason of the mistaken delivery 
to you.
If you have received this message 
in error, please delete
 it and notify us by return E-mail or telephone 
NOVOMATIC Technologies 
Poland S.A. +48 12 258 00 50. Any E-mail attachment 
may contain software
 viruses which could damage your own computer system. 
Whilst reasonable 
precaution has been taken to minimize this risk, we 
cannot accept 
liability for any damage which you sustain as a result of 
software 
viruses. You should therefore carry out your own virus checks 
before 
opening any attachments.
------------------------------------

NOVOMATIC Technologies Poland S.A., Poland, Krakowska 368, 32-080 Zabierz?w
