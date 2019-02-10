From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Feb 2019 11:03:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: bump version to 2.4.0
Message-ID: <20190210100313.19591-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002, applied upstream.
Follow upstream switch of release tarball to bz2 and new location.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-KJSL-fix-up-C99-issue.patch          | 120 ------------------
 package/libva-utils/libva-utils.hash          |   4 +-
 package/libva-utils/libva-utils.mk            |   5 +-
 3 files changed, 5 insertions(+), 124 deletions(-)
 delete mode 100644 package/libva-utils/0002-KJSL-fix-up-C99-issue.patch

diff --git a/package/libva-utils/0002-KJSL-fix-up-C99-issue.patch b/package/libva-utils/0002-KJSL-fix-up-C99-issue.patch
deleted file mode 100644
index 763986c774..0000000000
--- a/package/libva-utils/0002-KJSL-fix-up-C99-issue.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 6307b68156db2040a1be5b324efe4bad4461d52e Mon Sep 17 00:00:00 2001
-From: Kev <klambert@kevs-encoder.switch.internal>
-Date: Fri, 26 Oct 2018 10:59:49 +1100
-Subject: [PATCH] KJSL fix up C99 issue
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/intel/libva-utils/commit/6307b68156db2040a1be5b324efe4bad4461d52e]
----
- encode/vp8enc.c | 24 +++++++++++++++---------
- 1 file changed, 15 insertions(+), 9 deletions(-)
-
-diff --git a/encode/vp8enc.c b/encode/vp8enc.c
-index 9be2870..fce0a46 100644
---- a/encode/vp8enc.c
-+++ b/encode/vp8enc.c
-@@ -400,18 +400,19 @@ vp8enc_upload_thread_function(void *data)
- void vp8enc_init_QMatrix(VAQMatrixBufferVP8 *qMatrix)
- {
-   // When segmentation is disabled, only quantization_index[0] will be used
--  for (size_t i = 0; i < N_ELEMENTS(qMatrix->quantization_index); i++) {
-+  size_t i;
-+  for (i = 0; i < N_ELEMENTS(qMatrix->quantization_index); i++) {
-       qMatrix->quantization_index[i] = settings.quantization_parameter;
-   }
- 
--  for (size_t i = 0; i < N_ELEMENTS(qMatrix->quantization_index_delta); i++) {
-+  for (i = 0; i < N_ELEMENTS(qMatrix->quantization_index_delta); i++) {
-       qMatrix->quantization_index_delta[i] = 0;
-   }
--
- }
- 
- void vp8enc_init_SequenceParameterBuffer(VAEncSequenceParameterBufferVP8* seqParam)
- {
-+  size_t i;
- 
-   memset(seqParam, 0, sizeof(VAEncSequenceParameterBufferVP8));
- 
-@@ -426,12 +427,13 @@ void vp8enc_init_SequenceParameterBuffer(VAEncSequenceParameterBufferVP8* seqPar
-   seqParam->intra_period = settings.intra_period;
-   seqParam->error_resilient = settings.error_resilient;
- 
--  for (size_t i = 0; i < N_ELEMENTS(seqParam->reference_frames); i++)
-+  for (i = 0; i < N_ELEMENTS(seqParam->reference_frames); i++)
-      seqParam->reference_frames[i] = VA_INVALID_ID;
- }
- 
- void vp8enc_init_PictureParameterBuffer(VAEncPictureParameterBufferVP8 *picParam)
- {
-+  size_t i;
-   memset(picParam, 0, sizeof(VAEncPictureParameterBufferVP8));
- 
-   picParam->ref_last_frame = VA_INVALID_SURFACE;
-@@ -441,7 +443,7 @@ void vp8enc_init_PictureParameterBuffer(VAEncPictureParameterBufferVP8 *picParam
-   /* always show it */
-   picParam->pic_flags.bits.show_frame = 1;
- 
--  for (size_t i = 0; i < N_ELEMENTS(picParam->loop_filter_level); i++) {
-+  for (i = 0; i < N_ELEMENTS(picParam->loop_filter_level); i++) {
-       picParam->loop_filter_level[i] = settings.loop_filter_level;
-   }
- 
-@@ -578,8 +580,9 @@ void vp8enc_update_picture_parameter(int frame_type, int current_frame)
- VASurfaceID vp8enc_get_unused_surface()
- {
-   VASurfaceID current_surface;
-+  size_t i = 0;
- 
--  for (size_t i = 0; i < NUM_REF_SURFACES; i++) {
-+  for (i = 0; i < NUM_REF_SURFACES; i++) {
-         current_surface = vaapi_context.surfaces[i];
- 
-         if(current_surface != vaapi_context.last_ref_surface && current_surface != vaapi_context.golden_ref_surface && current_surface != vaapi_context.alt_ref_surface)
-@@ -676,6 +679,7 @@ void vp8enc_create_EncoderPipe()
- {
-   VAEntrypoint entrypoints[5];
-   int num_entrypoints;
-+  int i;
-   bool entrypoint_found;
-   VAConfigAttrib conf_attrib[2];
-   VASurfaceAttrib surface_attrib;
-@@ -690,7 +694,7 @@ void vp8enc_create_EncoderPipe()
-                            &num_entrypoints);
- 
-   entrypoint_found = true;
--  for(int i = 0; i < num_entrypoints;i++)
-+  for(i = 0; i < num_entrypoints;i++)
-   {
-     if (entrypoints[i] == settings.vaapi_entry_point)
-       entrypoint_found = true;
-@@ -773,6 +777,7 @@ void vp8enc_destory_EncoderPipe()
- 
- void vp8enc_init_VaapiContext()
- {
-+  size_t i;
-   vaapi_context.profile = VAProfileVP8Version0_3;
- 
-   vp8enc_init_SequenceParameterBuffer(&vaapi_context.seq_param);
-@@ -784,7 +789,7 @@ void vp8enc_init_VaapiContext()
-   vaapi_context.rate_control_param.header.type = VAEncMiscParameterTypeRateControl;
-   vp8enc_init_MiscParameterBuffers(&vaapi_context.hrd_param.data, &vaapi_context.frame_rate_param.data,&vaapi_context.rate_control_param.data);
- 
--  for(size_t i = 0; i < N_ELEMENTS(vaapi_context.va_buffers);i++)
-+  for(i = 0; i < N_ELEMENTS(vaapi_context.va_buffers);i++)
-     vaapi_context.va_buffers[i] = VA_INVALID_ID;
-   vaapi_context.num_va_buffers = 0;
- 
-@@ -956,9 +961,10 @@ vp8enc_render_picture()
- 
- void vp8enc_destroy_buffers()
- {
-+  int i;
-   VAStatus va_status;
- 
--  for(int i = 0; i < vaapi_context.num_va_buffers; i++) {
-+  for(i = 0; i < vaapi_context.num_va_buffers; i++) {
-     if (vaapi_context.va_buffers[i] != VA_INVALID_ID) {
-       va_status = vaDestroyBuffer(vaapi_context.display, vaapi_context.va_buffers[i]);
-       CHECK_VASTATUS(va_status,"vaDestroyBuffer");
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 1c2dc5df01..4bd015002a 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
 # From https://github.com/intel/libva-utils/releases
-sha1 91e470d0755ec7a102a4e4ce694190e5e95b9c7f  libva-utils-2.3.0.tar.gz
+sha1 98121e21dd3c679d06b1068a1b5f32246533099b  libva-utils-2.4.0.tar.bz2
 # Locally computed
-sha256 f338497b867bbc9bf008e4892eaebda08955785dc7eb2005855bba5f1a20b037  libva-utils-2.3.0.tar.gz
+sha256 5b7d1954b40fcb2c0544be20125c71a0852049715ab85a3e8aba60434a40c6b3  libva-utils-2.4.0.tar.bz2
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index ac341cd428..fab3894b18 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.3.0
-LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/archive/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_VERSION = 2.4.0
+LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
+LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
 # 0001-check-ssp.patch
-- 
2.20.1
