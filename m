From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  2 Apr 2020 15:08:40 +0200
Subject: [Buildroot] [PATCH 0/2] imx: fix gpu graphics support
Message-ID: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The GPU Vivante have been updated but the kernel module wasn't. This
mismatch will break graphics support for platforms unless they have the
exact same version in-tree (only NXP defconfig right now).

Also, while experimenting with the Wayland package I've noticed this
build issue:
In file included from host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:39,
                 from ../libweston/renderer-gl/gl-renderer.h:36,
                 from ../libweston/backend-drm/drm-gbm.c:42:
host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:144:10: fatal error: X11/Xlib.h: No such file or directory
  144 | #include <X11/Xlib.h>

So the second patch takes care of fixing the eglplatform.h header like
Jerome did for the fbbackend.

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (2):
  kernel-module-imx-gpu-viv: bump to version 6.4.0.p1.0
  package/freescale-imx/imx-gpu-viv: fix build issue with Wayland
    backend

 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk     | 12 +++++++++---
 .../kernel-module-imx-gpu-viv/Config.in              |  2 +-
 .../kernel-module-imx-gpu-viv.hash                   |  2 +-
 .../kernel-module-imx-gpu-viv.mk                     |  2 +-
 4 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.25.1
