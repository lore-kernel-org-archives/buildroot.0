From: nimaim <nimaim@gmail.com>
Date: Fri, 22 Dec 2017 13:53:38 -0700 (MST)
Subject: [Buildroot] How to force mesa3d to use llvmpipe?
Message-ID: <1513976018164-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using Buildroot 2017.11 and following defconfig:

BR2_x86_i686=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.free-electrons.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="i686-buildroot-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_ROOTFS_OVERLAY="fs-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.71"
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_WIDGETS=y
BR2_PACKAGE_QT5BASE_OPENGL_ES2=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XINPUT=y
BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_FLUXBOX=y
BR2_TARGET_ROOTFS_INITRAMFS=y
BR2_TARGET_ROOTFS_ISO9660=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_SYSLINUX=y

Long story short, I am trying to run a Qt 5.9.x Open GL application (based
on Quick Controls 2) on a an x86 platform that has no Linux support for
hardware accelerated graphics. Trying to get a valid framebuffer working on
that platform is no go either (usually crashes the system when you try to
load an intel video driver) so I'm stuck with trying to get it to work with
a software rasterizer and xcb. Upon testing the results, the application
runs very poorly. My only guess is it's because BR's mesa3d package is not
building the llvmpipe driver. When I run glxgears / glxinfo, I can show it
running swrast or softpipe instead. How do I force Mesa to build AND use
this specific driver?

I know it's not completely the hardware's fault because when I run Tiny Core
on it with X and OpenGL SW rast, it seems to run much smoother and the only
difference I see is that they seem to explicitly configure it to build llvm:
http://tinycorelinux.net/8.x/x86/tcz/src/Xorg-7.7-3d/compile_mesa.

Thoughts? Maybe I am misunderstanding how Mesa and OpenGL with swrast,
softpipe, and llvmpipe all work.



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
