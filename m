From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 15:03:47 +0200
Subject: [Buildroot] [RFC v4 3/3] package/qt5/qt5wayland: fix compile
 for rpi3
In-Reply-To: <20200403212357.26997-3-ps.report@gmx.net>
References: <20200403212357.26997-1-ps.report@gmx.net>
 <20200403212357.26997-3-ps.report@gmx.net>
Message-ID: <20200411150347.2dd79d94@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Apr 2020 23:23:57 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add three patches to fix compile for rpi3.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I'm not super at ease with the patches. Especially, I'm always worried
about a commit that fixes things for one particular platform: patches 1
and 3 don't seem at all related to Rpi3 specifically.

> diff --git a/package/qt5/qt5wayland/0001-fix-libdrm-related-configure-test-failure.patch b/package/qt5/qt5wayland/0001-fix-libdrm-related-configure-test-failure.patch
> new file mode 100644
> index 0000000000..b4d0a2c302
> --- /dev/null
> +++ b/package/qt5/qt5wayland/0001-fix-libdrm-related-configure-test-failure.patch
> @@ -0,0 +1,56 @@
> +From ba93ccba2aa70bd76f0af43675fa5864e166e3c3 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Fri, 3 Apr 2020 21:52:30 +0200
> +Subject: [PATCH 1/3] fix libdrm related configure test failure

Nit: use git format-patch -N to generate patches.

> +
> +Fixes:
> +
> +  Project ERROR: Test config.qtwayland_client.tests.dmabuf-server-buffer tries to use undeclared library 'drm'
> +  Project ERROR: Test config.qtwayland_compositor.tests.dmabuf-server-buffer tries to use undeclared library 'drm'
> +  Project ERROR: Test config.qtwayland_compositor.tests.dmabuf-client-buffer tries to use undeclared library 'drm'
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Should the "drm" library be declared somewhere instead? How is this
building for upstream?

> diff --git a/package/qt5/qt5wayland/0002-brcm-egl-needs-wayland-scanner-client-wayland-protoc.patch b/package/qt5/qt5wayland/0002-brcm-egl-needs-wayland-scanner-client-wayland-protoc.patch
> new file mode 100644
> index 0000000000..f14c374e76
> --- /dev/null
> +++ b/package/qt5/qt5wayland/0002-brcm-egl-needs-wayland-scanner-client-wayland-protoc.patch
> @@ -0,0 +1,36 @@
> +From 4770af94884be5a603934b36e6804eed7d18d43c Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Fri, 3 Apr 2020 22:42:23 +0200
> +Subject: [PATCH 2/3] brcm-egl: needs
> + wayland-scanner-client-wayland-protocol-include
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  wayland-brcm-client-protocol.h: In function ?wl_buffer* qt_brcm_create_buffer(qt_brcm*, int32_t, int32_t, wl_array*)?:
> +  wayland-brcm-client-protocol.h:115:29: error: ?wl_buffer_interface? was not declared in this scope; did you mean ?qt_brcm_interface??
> +    115 |     QT_BRCM_CREATE_BUFFER, &wl_buffer_interface, NULL, width, height, data);
> +        |                             ^~~~~~~~~~~~~~~~~~~
> +        |                             qt_brcm_interface
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>

A bit more explanation on the relationship between the build issue and
the fix would be good.

> diff --git a/package/qt5/qt5wayland/0003-examples-fix-wayland-texture-sharing-custom-composit.patch b/package/qt5/qt5wayland/0003-examples-fix-wayland-texture-sharing-custom-composit.patch
> new file mode 100644
> index 0000000000..1f0f919c93
> --- /dev/null
> +++ b/package/qt5/qt5wayland/0003-examples-fix-wayland-texture-sharing-custom-composit.patch
> @@ -0,0 +1,42 @@
> +From f7d96ddd00f868810ed2ca260acd41435717e6b8 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Fri, 3 Apr 2020 22:40:29 +0200
> +Subject: [PATCH 3/3] examples: fix wayland/texture-sharing/custom-compositor
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  main.cpp:83:33: error: ?GL_RGBA8? was not declared in this scope; did you mean ?GL_RGBA4??
> +     83 |             *glInternalFormat = GL_RGBA8;
> +        |                                 ^~~~~~~~
> +        |                                 GL_RGBA4
> +  main.cpp:120:33: error: ?GL_RGBA8? was not declared in this scope; did you mean ?GL_RGBA4??
> +    120 |             *glInternalFormat = GL_RGBA8;
> +        |                                 ^~~~~~~~
> +        |                                 GL_RGBA4
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + examples/wayland/texture-sharing/custom-compositor/main.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/examples/wayland/texture-sharing/custom-compositor/main.cpp b/examples/wayland/texture-sharing/custom-compositor/main.cpp
> +index a39c8c3..af37502 100644
> +--- a/examples/wayland/texture-sharing/custom-compositor/main.cpp
> ++++ b/examples/wayland/texture-sharing/custom-compositor/main.cpp
> +@@ -63,6 +63,10 @@
> + 
> + #include "QtWaylandCompositor/private/qwltexturesharingextension_p.h"
> + 
> ++#ifndef GL_RGBA8
> ++#define GL_RGBA8 0x8058
> ++#endif

This feels like a hack. What should normally be providing the GL_RGBA8
define? The OpenGL headers?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
