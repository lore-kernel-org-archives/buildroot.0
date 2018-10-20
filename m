From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 00:14:31 +0200
Subject: [Buildroot] [PATCH 0/6] OpenCL support
Message-ID: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series started with the patches from Valentin enabling mesa3d as
an OpenCL provider, and clinfo as a first package using OpenCL.

OpenCL, like OpenGL or EGL, is an API specified by Khronos, so it can
have multiple implementations. Therefore, tying clinfo directly with
mesa3d wasn't the right thing to do.

And indeed, we have at least another package in Buildroot that
provides an OpenCL implementation: nvidia-driver, and clinfo builds
fine against it.

So, this series introduces a virtual-package for OpenCL, and makes
nvidia-driver and mesa3d providers of OpenCL. In order to make
nvidia-driver a provider of OpenCL, we need to teach mesa3d-headers
how to install OpenCL headers, because nvidia-drivers doesn't provide
them (just like it doesn't provide GL, EGL, etc. headers).

Thomas

Thomas Petazzoni (4):
  package/opengl/opencl: new virtual package
  package/mesa3d-headers: install OpenCL headers when needed
  package/nvidia-driver: use += where appropriate
  package/nvidia-driver: become an OpenCL provider

Valentin Korenblit (2):
  package/mesa3d: enable OpenCL support
  package/clinfo: new package

 DEVELOPERS                                      |  1 +
 package/Config.in                               |  1 +
 package/clinfo/Config.in                        | 12 ++++++++
 package/clinfo/clinfo.hash                      |  4 +++
 package/clinfo/clinfo.mk                        | 21 ++++++++++++++
 package/mesa3d-headers/mesa3d-headers.mk        |  4 +++
 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch | 37 +++++++++++++++++++++++++
 package/mesa3d/Config.in                        | 14 ++++++++++
 package/mesa3d/mesa3d.mk                        | 12 +++++++-
 package/nvidia-driver/Config.in                 |  5 ++++
 package/nvidia-driver/nvidia-driver.mk          |  8 ++++--
 package/opengl/Config.in                        |  1 +
 package/opengl/libopencl/Config.in              |  6 ++++
 package/opengl/libopencl/libopencl.mk           |  7 +++++
 14 files changed, 129 insertions(+), 4 deletions(-)
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk
 create mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
 create mode 100644 package/opengl/libopencl/Config.in
 create mode 100644 package/opengl/libopencl/libopencl.mk

-- 
2.14.4
