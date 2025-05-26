Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A7BC5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 232D28406C;
	Sat, 31 May 2025 17:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhO8IxgiEhkU; Sat, 31 May 2025 17:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D755C84065
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D755C84065;
	Sat, 31 May 2025 17:06:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A60127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9F4F83BD7
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7GeutmsAK3y for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8676F83BCF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8676F83BCF
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84DE587804; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 18:51:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c94e3242ca282cca33a3a6f331e09dbd2cd50ab1
X-Git-Newrev: 4717aa6f2ef2d41370c152d9d8ea8b9b8d08fc12
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.84DE587804@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "package/mesa3d:
 Gallium VC4 driver depends on NEON"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0180593834763543425=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0180593834763543425==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4717aa6f2ef2d41370c152d9d8ea8b9b8d08fc12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The Gallium VC4 driver does not require NEON[1]; Gallium V3D does. Also,
the Gallium VC4 driver supports the Raspberry Pi from 0 to 3[2].

        Mesa’s VC4 graphics driver supports multiple implementations of
        Broadcom’s VideoCore IV GPU. It is notably used in the Raspberry
        Pi 0 through Raspberry Pi 3 hardware, and the driver is included
        as an option as of the 2016-02-09 Raspbian release using
        raspi-config. On most other distributions such as Debian or
	Fedora, you need no configuration to enable the driver.

This reverts commit a5cdb54ed78b136c83dd44aebfa27f715cda5ea3.

That commit is superseded by 85c95e3614f4b3fde23fd75f9bbc5bb18b503cce
that patches the sources to disable NEON via an option[3]; the sources
using NEON (tiling) are disabled if the CPU does not have that feature.
Thus, the VC4 driver compiles with toolchain without the NEON support
enabled as the one targetting the Raspberry Pi (ARMv6).

This removes the depends on BR2_ARM_CPU_HAS_NEON config since a meson
option disables NEON if the CPU does not support for it. It allows
building Gallium VC4 on Raspberry Pi, Raspberry Pi Zero and Compute
Module.

Note: kmscube with OpenGLES and Gallium/VC4 runs on Raspberry Pi B+ Rev
1.2.

	# uname -a
	Linux buildroot 6.12.20 #1 Fri Apr 25 02:54:03 CEST 2025 armv6l GNU/Linux

	# cat /sys/firmware/devicetree/base/model
	Raspberry Pi Model B Plus Rev 1.2#

	# dmesg
	(...)
	[   39.817806] rpi-gpiomem 20200000.gpiomem: window base 0x20200000 size 0x00001000
	[   39.837139] rpi-gpiomem 20200000.gpiomem: initialised 1 regions as /dev/gpiomem
	[   40.693845] Console: switching to colour dummy device 80x30
	[   40.717223] vc4-drm soc:gpu: bound 20400000.hvs (ops vc4_hvs_ops [vc4])
	[   40.793911] vc4-drm soc:gpu: bound 20400000.hvs (ops vc4_hvs_ops [vc4])
	[   40.824330] Registered IR keymap rc-cec
	[   40.828596] rc rc0: vc4-hdmi as /devices/platform/soc/20902000.hdmi/rc/rc0
	[   40.844139] input: vc4-hdmi as /devices/platform/soc/20902000.hdmi/rc/rc0/input0
	[   40.873434] input: vc4-hdmi HDMI Jack as /devices/platform/soc/20902000.hdmi/sound/card0/input1
	[   40.895848] vc4-drm soc:gpu: bound 20902000.hdmi (ops vc4_hdmi_ops [vc4])
	[   40.914034] vc4-drm soc:gpu: bound 20004000.txp (ops vc4_txp_ops [vc4])
	[   40.921843] vc4-drm soc:gpu: bound 20206000.pixelvalve (ops vc4_crtc_ops [vc4])
	[   40.943543] vc4-drm soc:gpu: bound 20207000.pixelvalve (ops vc4_crtc_ops [vc4])
	[   40.951969] vc4-drm soc:gpu: bound 20807000.pixelvalve (ops vc4_crtc_ops [vc4])
	[   40.983322] vc4-drm soc:gpu: bound 20c00000.v3d (ops vc4_v3d_ops [vc4])
	[   41.010210] [drm] Initialized vc4 0.0.0 for soc:gpu on minor 0
	[   41.151906] Console: switching to colour frame buffer device 240x67
	[   41.223414] vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device

	# kmscube
	Using display 0x1f12530 with EGL version 1.4
	===================================
	EGL information:
	  version: "1.4"
	  vendor: "Mesa Project"
	  client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base EGL_EXT_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base EGL_KHR_client_get_all_proc_addresses EGL_KHR_debug EGL_EXT_platform_device EGL_EXT_explicit_device EGL_MESA_platform_gbm EGL_KHR_platform_gbm EGL_MESA_platform_surfaceless"
	  display extensions: "EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync EGL_EXT_buffer_age EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_context_flush_control EGL_KHR_create_context EGL_KHR_create_context_no_error EGL_KHR_fence_sync EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image EGL_KHR_gl_texture_cubemap_image EGL_KHR_image EGL_KHR_image_base EGL_KHR_image_pixmap EGL_KHR_no_config_context EGL_KHR_reusable_sync EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_drm_image EGL_MESA_gl_interop EGL_MESA_image_dma_buf_export EGL_MESA_query_driver "
	===================================
	OpenGL ES 2.x information:
	  version: "OpenGL ES 2.0 Mesa 24.0.9"
	  shading language version: "OpenGL ES GLSL ES 1.0.16"
	  vendor: "Broadcom"
	  renderer: "VC4 V3D 2.1"
	  extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays GL_EXT_texture_compression_s3tc GL_EXT_texture_compression_dxt1 GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_texture GL_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap GL_OES_mapbuffer GL_OES_rgb8_rgba8 GL_OES_stencil8 GL_OES_texture_npot GL_OES_vertex_half_float GL_OES_EGL_image GL_OES_depth_texture GL_AMD_performance_monitor GL_OES_packed_depth_stencil GL_OES_get_program_binary GL_APPLE_texture_max_level GL_EXT_discard_framebuffer GL_EXT_read_format_bgra GL_NV_pack_subimage GL_NV_texture_barrier GL_EXT_frag_depth GL_NV_fbo_color_attachments GL_OES_EGL_image_external GL_OES_EGL_sync GL_OES_vertex_array_object GL_ANGLE_pack_reverse_row_order GL_ANGLE_texture_compression_dxt3 GL_ANGLE_texture_compression_dxt5 GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_buffer GL_NV_read_depth GL_NV_read_depth_stencil GL_NV_read_stencil GL_APPLE_sync GL_EXT_draw_buffers GL_EXT_map_buffer_range GL_KHR_debu
 g GL_KHR_texture_compression_astc_ldr GL_NV_generate_mipmap_sRGB GL_NV_pixel_buffer_object GL_OES_required_internalformat GL_OES_surfaceless_context GL_EXT_debug_label GL_EXT_separate_shader_objects GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_draw_elements_base_vertex GL_EXT_texture_border_clamp GL_KHR_context_flush_control GL_OES_draw_elements_base_vertex GL_OES_texture_border_clamp GL_KHR_no_error GL_KHR_texture_compression_astc_sliced_3d GL_EXT_texture_compression_s3tc_srgb GL_KHR_parallel_shader_compile GL_MESA_tile_raster_order GL_MESA_sampler_objects GL_MESA_bgra "
	===================================
	Rendered 120 frames in 2.000020 sec (59.999400 fps)

[1]: https://gitlab.freedesktop.org/mesa/mesa/-/commit/932ed9c00b99e6ec92146ec9e820f546cf3e6551
[2]: https://docs.mesa3d.org/drivers/vc4.html
[3]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3f1f404b5c59eaf3ae52ef1a4c8c2d74c0b5c80c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0412998214..dd016c8b0f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -257,7 +257,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
-	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4

--===============0180593834763543425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0180593834763543425==--
