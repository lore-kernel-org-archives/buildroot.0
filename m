From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 11 May 2020 11:59:53 -0700
Subject: [Buildroot] mesa3d: builds with ES2 report no ES2 enabled EGL
 configs
Message-ID: <20200511185953.33125-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I seem to have encountered a potential configuration issue with mesa3d that's
precluding ES2 applications from running in Buildroot. I first encountered
this issue on Intel hardware, with an Intel GPU and the DRI i965 driver with
an EGL/ES2 app. I later confirmed the issue was still present on a Raspberry
Pi 4, using the Gallium v3d driver. Both platforms had a working graphical
stack with X11 and GLX.

I started with the master branch, commit 1025d09, and
raspberrypi4_64_defconfig.

I modified the defconfig as follows:

---
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index fd6f8e4dce..d8bd3c72ab 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -20,7 +20,27 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
?BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
?
?BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
+BR2_PACKAGE_MESA3D_DEMOS=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_OSMESA_CLASSIC=y
+BR2_PACKAGE_MESA3D_OPENGL_GLX=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XSERVER_XORG_SERVER=y
+BR2_PACKAGE_XCB_UTIL=y
+BR2_PACKAGE_XLIB_LIBFS=y
+BR2_PACKAGE_XLIB_LIBXSCRNSAVER=y
+BR2_PACKAGE_XLIB_LIBXCOMPOSITE=y
+BR2_PACKAGE_XLIB_LIBXFONT=y
+BR2_PACKAGE_XLIB_LIBXTST=y
+BR2_PACKAGE_XLIB_LIBXVMC=y
+BR2_PACKAGE_XLIB_LIBXXF86DGA=y
+BR2_PACKAGE_XLIB_LIBDMX=y
+BR2_PACKAGE_XAPP_XINIT=y
+BR2_PACKAGE_XTERM=y
?BR2_PACKAGE_RPI_FIRMWARE=y
?BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y


The configuration summary for mesa3d indicates that EGL and ES2 support are
both enabled:

---
Message: Configuration summary:
        
        prefix:          /usr
        libdir:          lib
        includedir:      include
        
        OpenGL:          yes (ES1: yes ES2: yes)
        
        OSMesa:          libOSMesa
        
        DRI platform:    drm
        DRI drivers:     swrast
        DRI driver dir:  /usr/lib/dri
        
        GLX:             DRI-based
        
        EGL:             yes
        EGL drivers:     builtin:egl_dri2 builtin:egl_dri3
        GBM:             yes
        EGL/Vulkan/VL platforms:   surfaceless drm x11
        
        Vulkan drivers:  no
        
        llvm:            no
        
        Gallium drivers: kmsro v3d
        Gallium st:      mesa
        HUD lmsensors:   no
        
        Shared-glapi:    yes



Additionally, the fkms overlay was enabled in config.txt like so:
dtoverlay=vc4-fkms-v3d,cma-192

With this configuration, I was able to successfully run the graphical program
glxgears, like so:
# startx /bin/glxgears

eglinfo also works, and outputs:

---
EGL client extensions string:
    EGL_EXT_client_extensions EGL_EXT_device_base
    EGL_EXT_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base
    EGL_KHR_client_get_all_proc_addresses EGL_KHR_debug
    EGL_EXT_platform_x11 EGL_MESA_platform_gbm
    EGL_MESA_platform_surfaceless EGL_EXT_platform_device

GBM platform:
EGL API version: 1.4
EGL vendor string: Mesa Project
EGL version string: 1.4
EGL client APIs: OpenGL OpenGL_ES 
EGL extensions string:
    EGL_ANDROID_blob_cache EGL_EXT_buffer_age
    EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers
    EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_context
    EGL_KHR_create_context_no_error EGL_KHR_fence_sync
    EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace
    EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image
    EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image
    EGL_KHR_image EGL_KHR_image_base EGL_KHR_image_pixmap
    EGL_KHR_no_config_context EGL_KHR_reusable_sync
    EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float
    EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_drm_image
    EGL_MESA_image_dma_buf_export EGL_MESA_query_driver
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0 10 10 10  2  0  0  0 0 0x30334241--         y  y  y     win
0x02 32  0 10 10 10  2 16  0  0 0 0x30334241--         y  y  y     win
0x03 32  0 10 10 10  2 24  0  0 0 0x30334241--         y  y  y     win
0x04 32  0 10 10 10  2 24  8  0 0 0x30334241--         y  y  y     win
0x05 32  0 10 10 10  2  0  0  4 1 0x30334241--         y  y  y     win
0x06 32  0 10 10 10  2 16  0  4 1 0x30334241--         y  y  y     win
0x07 32  0 10 10 10  2 24  0  4 1 0x30334241--         y  y  y     win
0x08 32  0 10 10 10  2 24  8  4 1 0x30334241--         y  y  y     win
0x09 32  0  8  8  8  8  0  0  0 0 0x34325241--         y  y  y     win
0x0a 32  0  8  8  8  8 16  0  0 0 0x34325241--         y  y  y     win
0x0b 32  0  8  8  8  8 24  0  0 0 0x34325241--         y  y  y     win
0x0c 32  0  8  8  8  8 24  8  0 0 0x34325241--         y  y  y     win
0x0d 32  0  8  8  8  8  0  0  4 1 0x34325241--         y  y  y     win
0x0e 32  0  8  8  8  8 16  0  4 1 0x34325241--         y  y  y     win
0x0f 32  0  8  8  8  8 24  0  4 1 0x34325241--         y  y  y     win
0x10 32  0  8  8  8  8 24  8  4 1 0x34325241--         y  y  y     win
0x11 24  0  8  8  8  0  0  0  0 0 0x34325258--         y  y  y     win
0x12 24  0  8  8  8  0 16  0  0 0 0x34325258--         y  y  y     win
0x13 24  0  8  8  8  0 24  0  0 0 0x34325258--         y  y  y     win
0x14 24  0  8  8  8  0 24  8  0 0 0x34325258--         y  y  y     win
0x15 24  0  8  8  8  0  0  0  4 1 0x34325258--         y  y  y     win
0x16 24  0  8  8  8  0 16  0  4 1 0x34325258--         y  y  y     win
0x17 24  0  8  8  8  0 24  0  4 1 0x34325258--         y  y  y     win
0x18 24  0  8  8  8  0 24  8  4 1 0x34325258--         y  y  y     win
0x19 16  0  5  6  5  0  0  0  0 0 0x36314752--         y  y  y     win
0x1a 16  0  5  6  5  0 16  0  0 0 0x36314752--         y  y  y     win
0x1b 16  0  5  6  5  0 24  0  0 0 0x36314752--         y  y  y     win
0x1c 16  0  5  6  5  0 24  8  0 0 0x36314752--         y  y  y     win
0x1d 16  0  5  6  5  0  0  0  4 1 0x36314752--         y  y  y     win
0x1e 16  0  5  6  5  0 16  0  4 1 0x36314752--         y  y  y     win
0x1f 16  0  5  6  5  0 24  0  4 1 0x36314752--         y  y  y     win
0x20 16  0  5  6  5  0 24  8  4 1 0x36314752--         y  y  y     win
libEGL warning: DRI2: failed to authenticate

X11 platform:
EGL API version: 1.4
EGL vendor string: Mesa Project
EGL version string: 1.4
EGL client APIs: OpenGL OpenGL_ES 
EGL extensions string:
    EGL_KHR_config_attribs EGL_KHR_create_context
    EGL_KHR_create_context_no_error EGL_KHR_get_all_proc_addresses
    EGL_KHR_no_config_context EGL_KHR_reusable_sync
    EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float
    EGL_MESA_configless_context
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 24  0  8  8  8  0  0  0  0 0 0x21TC      y  y  y  y     win,pb,pix
0x02 24  0  8  8  8  0  0  8  0 0 0x21TC      y  y  y  y     win,pb,pix
0x03 24  0  8  8  8  0 24  0  0 0 0x21TC      y  y  y  y     win,pb,pix
0x04 24  0  8  8  8  0 24  8  0 0 0x21TC      y  y  y  y     win,pb,pix
0x05 32  0  8  8  8  8  0  0  0 0 0x21TC      a  y  y  y     win,pb,pix
0x06 32  0  8  8  8  8  0  8  0 0 0x21TC      a  y  y  y     win,pb,pix
0x07 32  0  8  8  8  8 24  0  0 0 0x21TC      a  y  y  y     win,pb,pix
0x08 32  0  8  8  8  8 24  8  0 0 0x21TC      a  y  y  y     win,pb,pix
0x09 24  0  8  8  8  0  0  0  0 0 0x22DC      y  y  y  y     win,pb,pix
0x0a 24  0  8  8  8  0  0  8  0 0 0x22DC      y  y  y  y     win,pb,pix
0x0b 24  0  8  8  8  0 24  0  0 0 0x22DC      y  y  y  y     win,pb,pix
0x0c 24  0  8  8  8  0 24  8  0 0 0x22DC      y  y  y  y     win,pb,pix
0x0d 32  0  8  8  8  8  0  0  0 0 0x22DC      a  y  y  y     win,pb,pix
0x0e 32  0  8  8  8  8  0  8  0 0 0x22DC      a  y  y  y     win,pb,pix
0x0f 32  0  8  8  8  8 24  0  0 0 0x22DC      a  y  y  y     win,pb,pix
0x10 32  0  8  8  8  8 24  8  0 0 0x22DC      a  y  y  y     win,pb,pix

Device platform:
eglinfo: eglInitialize failed


Although the device platform failing to initialize looks suspicious.

es2_info fails with no configs returned by eglChooseConfig() with
EGL_OPENGL_ES2_BIT set.

---
es2_info: es2_info.c:158: make_x_window: Assertion `num_configs > 0' failed.


es2gears_x11 fails similarly

---
EGLUT: failed to choose a config
EGL_VERSION = 1.4


Any suggestions?

As a sidenote, is there a recommended way to include and delimit multiple
files/text snippets in an email like this, or is the way I did it okay?

Best,
Joseph
