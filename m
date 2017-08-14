From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Aug 2017 23:47:24 +0200
Subject: [Buildroot] [PATCH v7 1/3] rpi-userland: fix opengl library
 symlinks
In-Reply-To: <20170813135650.14067-2-gael.portay@savoirfairelinux.com>
References: <20170813135650.14067-1-gael.portay@savoirfairelinux.com>
 <20170813135650.14067-2-gael.portay@savoirfairelinux.com>
Message-ID: <20170814214724.GG2810@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2017-08-13 09:56 -0400, Ga?l PORTAY spake thusly:
> The Qt WebEngine module loads libEGL.so.1 and libGLESv2.so.2 libraries.
> Paths are hard-coded [1].

But now they no longer do that:

    https://github.com/qt/qtwebengine/commit/d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad

> This patch sets up cmake to create those library links.
> 
> 	$ ls -l output/target/usr/lib/libEGL* output/target/usr/lib/libGLESv2*
> 	-rwxr-xr-x 1 buildroot buildroot 130032 Aug 10 21:17 output/target/usr/lib/libEGL.so
> 	lrwxrwxrwx 1 buildroot buildroot      9 Aug  9 12:30 output/target/usr/lib/libEGL.so.1 -> libEGL.so
> 	-rwxr-xr-x 1 buildroot buildroot  71088 Aug 10 21:16 output/target/usr/lib/libGLESv2.so
> 	lrwxrwxrwx 1 buildroot buildroot     12 Aug  9 12:30 output/target/usr/lib/libGLESv2.so.2 -> libGLESv2.so
> 
> A pull request is pending [2].
> 
> [1] https://github.com/qt/qtwebengine/blob/5.9.1/src/core/surface_factory_qt.cpp#L76-L86
> [2] https://github.com/raspberrypi/userland/pull/379

Upstream was not too happy with your MR... :-(

So, do you think you could look at backporting the Qt patch instead?

Regards,
Yann E. MORIN.

> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  .../0007-Add-OpenGL-library-versioning.patch       | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/rpi-userland/0007-Add-OpenGL-library-versioning.patch
> 
> diff --git a/package/rpi-userland/0007-Add-OpenGL-library-versioning.patch b/package/rpi-userland/0007-Add-OpenGL-library-versioning.patch
> new file mode 100644
> index 000000000..9a22a66d2
> --- /dev/null
> +++ b/package/rpi-userland/0007-Add-OpenGL-library-versioning.patch
> @@ -0,0 +1,41 @@
> +From a6abc80168512993f390cfdb40531c50829af6da Mon Sep 17 00:00:00 2001
> +From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
> +Date: Fri, 3 Mar 2017 17:28:41 -0500
> +Subject: [PATCH] Add OpenGL library versioning
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=utf-8
> +Content-Transfer-Encoding: 8bit
> +
> +Some applications like QtWebEngine dynamically load libraries using
> +dlopen. The library name is hardcoded, and it includes the library
> +version [1].
> +
> +This patch creates symlinks for EGL and GLES libraries.
> +
> +	libEGL.so.1 -> libEGL.so
> +	libGLESv2.so.2 -> libGLESv2.so
> +
> +[1] https://github.com/qt/qtwebengine/blob/v5.9.1/src/core/surface_factory_qt.cpp#L76-L86
> +
> +Upstream-Status: https://github.com/raspberrypi/userland/pull/379
> +Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> +---
> + host_applications/android/apps/vidtex/CMakeLists.txt | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
> +index 1f705ef..d68ae5f 100644
> +--- a/host_applications/android/apps/vidtex/CMakeLists.txt
> ++++ b/host_applications/android/apps/vidtex/CMakeLists.txt
> +@@ -10,3 +10,8 @@ set (VIDTEX_SOURCES
> +    vidtex.c)
> + add_executable(vidtex ${VIDTEX_SOURCES})
> + target_link_libraries(vidtex GLESv2 EGL m bcm_host mmal_core mmal_components mmal_util mmal_vc_client vcos)
> ++
> ++set(DESTDIR \$ENV{DESTDIR})
> ++include(GNUInstallDirs)
> ++install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink libEGL.so ${DESTDIR}/${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libEGL.so.1)")
> ++install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink libGLESv2.so ${DESTDIR}/${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libGLESv2.so.2)")
> +-- 
> +2.13.2
> +
> -- 
> 2.13.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
