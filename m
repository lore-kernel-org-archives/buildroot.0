From: Daniel HiFiBerry <daniel@hifiberry.com>
Date: Sun, 24 May 2020 09:43:36 +0000
Subject: [Buildroot] COG crashes on Pi4 (wpe_webkit)
In-Reply-To: <20200524114231.380a7420@gmx.net>
References: <1589894180081-0.post@n4.nabble.com>
 <20200519194400.3edad316@gmx.net>
 <1589958433571-0.post@n4.nabble.com> <1590157038870-0.post@n4.nabble.com>
 <20200523222948.009d9706@gmx.net>
 <em117da5c2-26eb-4d92-a84e-b17878209d76@power16>
 <20200524114231.380a7420@gmx.net>
Message-ID: <em13dfa41d-2620-4973-a5d2-6af5c473897e@power16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have this integrated (it's just not on Github).

------ Originalnachricht ------
Von: "Peter Seiderer" <ps.report@gmx.net>
An: "Daniel HiFiBerry" <daniel@hifiberry.com>
Cc: buildroot at busybox.net
Gesendet: 5/24/2020 11:42:31 AM
Betreff: Re: [Buildroot] COG crashes on Pi4 (wpe_webkit)

>Hello Daniel,
>
>On Sun, 24 May 2020 08:59:53 +0000, "Daniel HiFiBerry" <daniel@hifiberry.com> wrote:
>
>>  Hi Peter,
>>
>>  While I didn't test with a minimal configuration, using the
>>  "--backend=drm-backend.so" doesn't make a difference in my full-blown
>>  build.
>>  I'm using this already. I will do some more experiments...
>
>The trick for hifiberry-os should do (untested) the missing
>
>	BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
>
>in your configuration (see the 'hidden' hint in package/mesa3d/Config.in
>([1])...
>
>Regards,
>Peter
>
>[1] https://git.buildroot.net/buildroot/tree/package/mesa3d/Config.in#n265
>
>>
>>  Best regards,
>>  Daniel
>>
>>  ------ Originalnachricht ------
>>  Von: "Peter Seiderer" <ps.report@gmx.net>
>>  An: "usul27" <daniel@hifiberry.com>
>>  Cc: buildroot at busybox.net
>>  Gesendet: 5/23/2020 10:29:48 PM
>>  Betreff: Re: [Buildroot] COG crashes on Pi4 (wpe_webkit)
>>
>>  >Hello Daniel,
>>  >
>>  >On Fri, 22 May 2020 09:17:18 -0500 (CDT), usul27 <daniel@hifiberry.com> wrote:
>>  >
>>  >>  Ok, finally got a build with debug symbols:
>>  >>
>>  >>  Thread 1 "cog" received signal SIGSEGV, Segmentation fault.
>>  >>  0x00000000 in ?? ()
>>  >>  (gdb) backtrace
>>  >>  #0  0x00000000 in ?? ()
>>  >>  #1  0xb1799f84 in ffi_call_SYSV () from /lib/libffi.so.7
>>  >>  #2  0xb17993fc in ffi_call_int () from /lib/libffi.so.7
>>  >>  #3  0xb1799b1c in ffi_call () from /lib/libffi.so.7
>>  >>  #4  0xb149b28c in wl_closure_invoke (closure=closure at entry=0xadb03a00,
>>  >>  flags=flags at entry=2, target=<optimized out>, opcode=3025639260,
>>  >>  data=<optimized out>, data at entry=0x74c60) at src/connection.c:1014
>>  >>  #5  0xb1497db0 in wl_client_connection_data (fd=<optimized out>,
>>  >>  mask=<optimized out>, data=0x74c60) at src/wayland-server.c:429
>>  >>  #6  0xb1499608 in wl_event_loop_dispatch (loop=0x5bfc8, timeout=<optimized
>>  >>  out>) at src/event-loop.c:640
>>  >>  #7  0xb0c59400 in WS::ServerSource::{lambda(_GSource*, int (*)(void*),
>>  >>  void*)#3}::_FUN(_GSource*, int (*)(void*), void*) () from
>>  >>  /lib/libWPEBackend-fdo-1.0.so.1
>>  >>  Backtrace stopped: previous frame identical to this frame (corrupt stack?)
>>  >>
>>  >>  Somebody has any idea?
>>  >
>>  >Did some test on RPi4 with the following defconfig:
>>  >
>>  >BR2_arm=y
>>  >BR2_cortex_a72=y
>>  >BR2_ARM_FPU_NEON_VFPV4=y
>>  >BR2_ENABLE_DEBUG=y
>>  >BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>>  >BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>>  >BR2_BINUTILS_VERSION_2_31_X=y
>>  >BR2_TOOLCHAIN_BUILDROOT_CXX=y
>>  >BR2_PACKAGE_HOST_GDB=y
>>  >BR2_GDB_VERSION_8_3=y
>>  >BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>>  >BR2_SYSTEM_DHCP="eth0"
>>  >BR2_GENERATE_LOCALE="en_US"
>>  >BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
>>  >BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
>>  >BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
>>  >BR2_LINUX_KERNEL=y
>>  >BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>>  >BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4f2a4cc501c428c940549f39d5562e60404ac4f7)/linux-4f2a4cc501c428c940549f39d5562e60404ac4f7.tar.gz"
>>  >BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>>  >BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>  >BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
>>  >BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>>  >BR2_PACKAGE_STRACE=y
>>  >BR2_PACKAGE_DEJAVU=y
>>  >BR2_PACKAGE_COG=y
>>  >BR2_PACKAGE_MESA3D=y
>>  >BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
>>  >BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
>>  >BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
>>  >BR2_PACKAGE_MESA3D_OPENGL_ES=y
>>  >BR2_PACKAGE_WESTON=y
>>  >BR2_PACKAGE_WESTON_DRM=y
>>  >BR2_PACKAGE_WESTON_DEMO_CLIENTS=y
>>  >BR2_PACKAGE_RPI_FIRMWARE=y
>>  >BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
>>  >BR2_PACKAGE_WPEWEBKIT=y
>>  >BR2_PACKAGE_OPENSSH=y
>>  >BR2_TARGET_ROOTFS_EXT2=y
>>  >BR2_TARGET_ROOTFS_EXT2_4=y
>>  >BR2_TARGET_ROOTFS_EXT2_LABEL=""
>>  >BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
>>  ># BR2_TARGET_ROOTFS_TAR is not set
>>  >BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>  >BR2_PACKAGE_HOST_GENIMAGE=y
>>  >BR2_PACKAGE_HOST_MTOOLS=y
>>  >
>>  >Running:
>>  >
>>  >	$ export XDG_RUNTIME_DIR=/tmp
>>  >	$ weston --tty 1 &
>>  >	$ cog --platform=fdo
>>  >
>>  >leads to the 'Segmentation fault' as you described...
>>  >
>>  >Running:
>>  >
>>  >	$ export XDG_RUNTIME_DIR=/tmp
>>  >	$ weston --tty 1 --backend=drm-backend.so &
>>  >	$ cog --platform=fdo
>>  >
>>  >works...
>>  >
>>  >Regards,
>>  >Peter
>>  >
>>  >
>>  >>
>>  >>
>>  >>
>>  >>
>>  >>  --
>>  >>  Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
>>  >>  _______________________________________________
>>  >>  buildroot mailing list
>>  >>buildroot at busybox.net
>>  >>http://lists.busybox.net/mailman/listinfo/buildroot
>>  >
>>
>>  _______________________________________________
>>  buildroot mailing list
>>buildroot at busybox.net
>>http://lists.busybox.net/mailman/listinfo/buildroot
>
