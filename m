From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 21 Jan 2015 12:23:24 +0100
Subject: [Buildroot] [RFC 0/4] Try to clean up proprietary OpenGL drivers
Message-ID: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, xorg-xserver depends on mesa3d to compile with GLX/DRI support.
However, there was problem with proprietary OpenGL drivers. These ones depends
on GLX/DRI support (so, they depends on mesa3d) and overwrite files provided by
mesa3d (so, they conflict with mesa3d).

Thanks to opengl-registry, it is possible to change proprietary OpenGL drivers
in real LibGL provider and compile GLX/DRI support using proprietary drivers
instead of mesa3d.

Notice this series aim to highlight the problem described above. It does not
aim to be upstreamed. It apply on top of Yann series about nvidia driver and
my series about imx6 gpu driver.

J?r?me Pouiller (4):
  nvidia-driver: Add gl.pc
  gpu-viv-bin-mx6q: is a libgl provider
  opengl-registry: Also provide DRI interface
  xorg-server: Depends on libgl to enable DRI/GLX

 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |    5 +
 package/freescale-imx/gpu-viv-bin-mx6q/gl.pc       |   10 +
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    5 +-
 package/nvidia-driver/gl.pc                        |   11 +
 package/nvidia-driver/nvidia-driver.mk             |    1 +
 .../opengl/khronos-registry/opengl-registry/dri.pc |   11 +
 .../opengl-registry/dri_interface.h                | 1464 ++++++++++++++++++++
 .../opengl-registry/opengl-registry.mk             |    4 +
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in |    2 -
 .../xserver_xorg-server/xserver_xorg-server.mk     |    7 +-
 10 files changed, 1514 insertions(+), 6 deletions(-)
 create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gl.pc
 create mode 100644 package/nvidia-driver/gl.pc
 create mode 100644 package/opengl/khronos-registry/opengl-registry/dri.pc
 create mode 100644 package/opengl/khronos-registry/opengl-registry/dri_interface.h

-- 
1.9.1
