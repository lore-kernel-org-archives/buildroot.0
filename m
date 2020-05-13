From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 12 May 2020 17:08:29 -0700
Subject: [Buildroot] mesa3d: builds with ES2 report no ES2 enabled EGL
 configs
In-Reply-To: <20200511185953.33125-1-joseph.kogut@gmail.com>
References: <20200511185953.33125-1-joseph.kogut@gmail.com>
Message-ID: <CAMWSM7hm5HTZ==-SH1L0jKkEvjTWPuD1WwVK7ddJq3a80uGViQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to reproduce this on a PC in a chroot using the radeonsi
driver, as well as come up with a fix.

Here's a minimal config that includes mesa3d-demos, and most of the
drivers a PC would require:

---
BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_19=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_MERGED_USR=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XLIB_LIBFS=y
BR2_PACKAGE_XLIB_LIBXSCRNSAVER=y
BR2_PACKAGE_XLIB_LIBXCOMPOSITE=y
BR2_PACKAGE_XLIB_LIBXCURSOR=y
BR2_PACKAGE_XLIB_LIBXFONT=y
BR2_PACKAGE_XLIB_LIBXFONT2=y
BR2_PACKAGE_XLIB_LIBXFT=y
BR2_PACKAGE_XLIB_LIBXINERAMA=y
BR2_PACKAGE_XLIB_LIBXRES=y
BR2_PACKAGE_XLIB_LIBXTST=y
BR2_PACKAGE_XLIB_LIBXVMC=y
BR2_PACKAGE_XLIB_LIBXXF86DGA=y
BR2_PACKAGE_XLIB_LIBDMX=y
BR2_PACKAGE_XLIB_LIBXKBFILE=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_E2FSPROGS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


After chrooting into the extracted rootfs, I was able to run glxgears
(with an already running X server) like so:

$ DISPLAY=:0 glxgears

However, es2gears_x11 fails in the same way as on the RPi.

When running the program with EGL_LOG_LEVEL=debug, it reports:

libEGL debug: Native platform type: surfaceless (build-time configuration)
<snip>
libEGL warning: DRI2: failed to create dri screen
libEGL debug: EGL user error 0x3001 (EGL_NOT_INITIALIZED) in
eglInitialize: DRI2: failed to create screen

As you can see, the platform libEGL is attempting to use is
surfaceless, when this use case demands x11. According to Mesa's
documentation of their libEGL [1], the native platform is decided at
build time, and can be overridden with the EGL_PLATFORM environment
variable. When I set EGL_PLATFORM=x11, es2_info and es2gears_x11 now
work.

Other distributions, such as Arch [2] and Debian [3], specify x11 as
the first platform, followed by others such as  wayland, drm, and
surfaceless.

I would propose we sort by default in the same manner as other common
distributions, and maybe add a config to override the native platform
type. I can follow up with patches if this is a change that would be
acceptable.

Thoughts?

[1] https://www.mesa3d.org/egl.html
[2] https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/mesa#n45
[3] https://salsa.debian.org/xorg-team/lib/mesa/-/blob/debian-unstable/debian/rules#L38
