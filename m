From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Oct 2013 00:28:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/rpi-userland: install all of
 our .pc files the same way
In-Reply-To: <2af363937eee36127cf5f3c3ffdc3750fcf0e4ad.1381616359.git.yann.morin.1998@free.fr>
References: <cover.1381616359.git.yann.morin.1998@free.fr>
 <2af363937eee36127cf5f3c3ffdc3750fcf0e4ad.1381616359.git.yann.morin.1998@free.fr>
Message-ID: <20131012222838.GC3262@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2013-10-13 00:20 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Install bcm_host the same way we install egl.pc and glesv2.pc, using
> the cmake lists.

No, no, no, I forgot to commit the rest of the changes for this cset.
Forget it...

Sorry for the noise... :-(

Regards,
Yann E. MORIN.

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../rpi-userland-000-add-pkgconfig-files.patch     | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
> index 4ffc2b0..d7984ff 100644
> --- a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
> +++ b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
> @@ -1,9 +1,10 @@
> -Add .pc files for the OpenGLESv2 and EGL libraries
> +Add .pc files for the OpenGLESv2, EGL and bcm_host libraries
>  
>  Those pkg-config files make it easier for Qt5 to find those libraries
>  and the appropriate link flags.
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  
>  Index: b/interface/khronos/egl/egl.pc.in
>  ===================================================================
> @@ -25,7 +26,7 @@ Index: b/interface/khronos/CMakeLists.txt
>  ===================================================================
>  --- a/interface/khronos/CMakeLists.txt
>  +++ b/interface/khronos/CMakeLists.txt
> -@@ -73,3 +73,11 @@
> +@@ -74,3 +74,11 @@
>   
>   install(TARGETS EGL GLESv2 OpenVG WFC khrn_client DESTINATION lib)
>   install(TARGETS EGL_static GLESv2_static khrn_static DESTINATION lib)
> @@ -52,3 +53,30 @@ Index: b/interface/khronos/glxx/glesv2.pc.in
>  +Version: 2.0
>  +Libs: -L${libdir} -lGLESv2
>  +Cflags: -I${includedir}/
> +Index: b/host_applications/linux/libs/bcm_host/CMakeLists.txt
> +===================================================================
> +--- a/host_applications/linux/libs/bcm_host/CMakeLists.txt
> ++++ b/host_applications/linux/libs/bcm_host/CMakeLists.txt
> +@@ -20,3 +20,7 @@
> + 
> + install(TARGETS bcm_host DESTINATION lib)
> + 
> ++configure_file("${CMAKE_CURRENT_SOURCE_DIR}/bcm_host.pc.in"
> ++  "${CMAKE_CURRENT_BINARY_DIR}/bcm_host.pc" @ONLY)
> ++install(FILES "${CMAKE_CURRENT_BINARY_DIR}/bcm_host.pc"
> ++  DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
> +Index: b/host_applications/linux/libs/bcm_host/bcm_host.pc.in
> +===================================================================
> +--- /dev/null
> ++++ b/host_applications/linux/libs/bcm_host/bcm_host.pc.in
> +@@ -0,0 +1,10 @@
> ++prefix=/usr
> ++exec_prefix=${prefix}
> ++libdir=${exec_prefix}/lib
> ++includedir=${prefix}/include
> ++
> ++Name: bcm_host
> ++Description: Broadcom VideoCore host API library
> ++Version: 1
> ++Libs: -L${libdir} -lbcm_host -lvcos -lvchiq_arm
> ++Cflags: -I${includedir} -I${includedir}/interface/vmcs_host/linux -I${includedir}/interface/vcos/pthreads -DUSE_VCHIQ_ARM
> -- 
> 1.8.1.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
