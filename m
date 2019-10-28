From: Rostislav Lisovy <rostislav.lisovy@r7-engineering.com>
Date: Mon, 28 Oct 2019 21:34:54 +0100
Subject: [Buildroot] Raspberrypi4: Unable to run Weston?
Message-ID: <d6e80828979625a2bb2689e73cae1fed84fdc10c.camel@r7-engineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,
I am building system for my RPi4 using Buildroot (master branch).

I would like to run simple libgtk3 (libwebkitgtk) application with
graphical output shown on a display connected through HDMI.

I did following in the configuration (based on raspberrypi4_defconfig):
* glibc
* systemd
* Mesa3D Gallium VC4
* *not using* rpi-userland
* Weston & Wayland

Exact content of my custom defconfig (created using `make
savedefconfig`) is following (interesting/important lines start with
exclamation mark):

   BR2_arm=y
   BR2_cortex_a72=y
   BR2_ARM_FPU_NEON_VFPV4=y
   BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
   BR2_TOOLCHAIN_BUILDROOT_CXX=y
   BR2_INIT_SYSTEMD=y
   BR2_TARGET_GENERIC_ROOT_PASSWD="aaa"
   BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
   BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
   BR2_SYSTEM_DHCP="eth0"
   BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
   BR2_LINUX_KERNEL=y
   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
   BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
   BR2_LINUX_KERNEL_DTS_SUPPORT=y
   BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
   BR2_PACKAGE_KMSCUBE=y
   BR2_PACKAGE_MESA3D_DEMOS=y
   BR2_PACKAGE_MESA3D=y
   BR2_PACKAGE_MESA3D_LLVM=y
   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
   ! BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
   BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
   BR2_PACKAGE_MESA3D_OPENGL_ES=y
   ! BR2_PACKAGE_WESTON=y
   ! BR2_PACKAGE_WESTON_DRM=y
   BR2_PACKAGE_WESTON_FBDEV=y
   BR2_PACKAGE_WESTON_DEMO_CLIENTS=y
   ! BR2_PACKAGE_RPI_FIRMWARE=y
   ! BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
   BR2_PACKAGE_OPENSSL=y
   BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
   BR2_PACKAGE_DROPBEAR=y
   BR2_TARGET_ROOTFS_EXT2=y
   BR2_TARGET_ROOTFS_EXT2_4=y
   BR2_TARGET_ROOTFS_EXT2_SIZE="1G"
   # BR2_TARGET_ROOTFS_TAR is not set
   BR2_PACKAGE_HOST_DOSFSTOOLS=y
   BR2_PACKAGE_HOST_GENIMAGE=y
   BR2_PACKAGE_HOST_MTOOLS=y

My "config.txt" contains:
   dtoverlay=vc4-kms-v3d

and default
   gpu_mem_256=100
   gpu_mem_512=100
   gpu_mem_1024=100


When I power on my RPi4 (with my LG 4k display connected to HDMI) I can
definitely see some testing (?) color pattern and then kernel console
(in a decent resolution), then there is just black screen and nothing
else...

Kernel log (dmesg) contains following at its end:
   [    8.443019] rpivid-mem feb00000.hevc-decoder: rpivid-hevcmem initialised: Registers at 0xfeb00000 length 0x0000ffff
   [    8.464522] rpivid-mem feb10000.rpivid-local-intc: rpivid-intcmem initialised: Registers at 0xfeb10000 length 0x00000fff
   [    8.478300] rpivid-mem feb20000.h264-decoder: rpivid-h264mem initialised: Registers at 0xfeb20000 length 0x0000ffff
   [    8.493534] vc_sm_cma: module is from the staging directory, the quality is unknown, you have been warned.
   [    8.501060] media: Linux media interface: v0.10
   [    8.513475] bcm2835_vc_sm_cma_probe: Videocore shared memory driver
   [    8.527433] rpivid-mem feb30000.vp9-decoder: rpivid-vp9mem initialised: Registers at 0xfeb30000 length 0x0000ffff
   [    8.527966] [vc_sm_connected_init]: start
   [    8.562646] [vc_sm_connected_init]: installed successfully
   [    8.563267] videodev: Linux video capture interface: v2.00
   [    8.712772] cfg80211: Loading compiled-in X.509 certificates for regulatory database
   [    9.032843] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
   [    9.039723] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
   [    9.048565] cfg80211: failed to load regulatory.db
   [    9.055761] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
   [    9.055765] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
   [    9.106096] [drm] Initialized v3d 1.0.0 20180419 for fec00000.v3d on minor 0
   [    9.127611] bcm2835_v4l2: module is from the staging directory, the quality is unknown, you have been warned.
   [    9.133626] brcmfmac: F1 signature read @0x18000000=0x15264345
   [    9.138893] bcm2835_codec: module is from the staging directory, the quality is unknown, you have been warned.
   [    9.157000] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-sdio for chip BCM4345/6
   [    9.166491] bcm2835-codec bcm2835-codec: Device registered as /dev/video10
   [    9.173639] bcm2835-codec bcm2835-codec: Loaded V4L2 decode
   [    9.173945] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.bin failed with error -2
   [    9.176065] bcmgenet: Skipping UMAC reset
   [    9.195449] usbcore: registered new interface driver brcmfmac
   [    9.197317] bcm2835-codec bcm2835-codec: Device registered as /dev/video11
   [    9.209475] bcm2835-codec bcm2835-codec: Loaded V4L2 encode
   [    9.218436] bcm2835-codec bcm2835-codec: Device registered as /dev/video12
   [    9.225648] bcm2835-codec bcm2835-codec: Loaded V4L2 isp
   [    9.272020] bcmgenet fd580000.genet: configuring instance for external RGMII (no delay)
   [    9.280828] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
   [    9.352593] vc4_hdmi fe902000.hdmi: ASoC: Failed to create component debugfs directory
   [    9.362087] vc4_hdmi fe902000.hdmi: vc4-hdmi-hifi <-> fe902000.hdmi mapping ok
   [    9.370166] vc4-drm soc:gpu: bound fe902000.hdmi (ops vc4_hdmi_ops [vc4])
   [    9.377413] vc4-drm soc:gpu: bound fe806000.vec (ops vc4_vec_ops [vc4])
   [    9.384399] vc4-drm soc:gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
   [    9.391219] vc4-drm soc:gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
   [    9.398416] vc4-drm soc:gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
   [    9.406845] vc4-drm soc:gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
   [    9.414938] vc4-drm soc:gpu: bound fe807000.pixelvalve (ops vc4_crtc_ops [vc4])
   [    9.423624] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 1
   [    9.430791] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
   [    9.438240] [drm] Driver supports precise vblank timestamp query.
   [   10.212853] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
   [   10.311665] bcmgenet fd580000.genet eth0: Link is Down
   [   10.471468] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   11.511476] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   12.551453] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   13.591464] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   14.471688] bcmgenet fd580000.genet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
   [   14.479770] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
   [   14.631460] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   24.791538] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
   [   24.791647] Console: switching to colour frame buffer device 90x30
   [   35.031547] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
   [   45.271542] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] [  853.517889] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   *ERROR* [CONNECTOR:44:Composite-1] flip_done timed out
   [   55.511538] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [PLANE:113:plane-20] flip_done timed out
   [   65.751603] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
   [   65.842171] vc4-drm soc:gpu: fb0: DRM emulated frame buffer device
   [   67.991534] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   69.031556] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   70.071556] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   71.111566] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   72.151559] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   73.191558] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   74.231562] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   75.271566] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   76.311569] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   77.351572] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [   87.511686] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
   [   97.751695] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CONNECTOR:44:Composite-1] flip_done timed out
   [  104.826916] random: crng init done
   [  104.833185] random: 7 urandom warning(s) missed due to ratelimiting
   [  107.991704] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [PLANE:113:plane-20] flip_done timed out
   [  118.231702] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
   [  129.511825] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  130.551854] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  131.591879] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  132.631909] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  133.671934] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  144.872175] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  145.912191] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  146.952244] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
   [  147.992231] i2c-bcm2835 fe805000.i2c: i2c transfer timed out


and the "i2c-bcm2835 fe805000.i2c: i2c transfer timed out" goes on and
on... approx. 1 times per second...

When I ssh to the RPi4 and try to run Weston, following happens:
# mkdir /tmp/wayland
# chmod 0700 /tmp/wayland
# export XDG_RUNTIME_DIR=/tmp/wayland
# weston --backend=drm-backend.so --tty=2
Date: 2019-10-28 UTC
[20:19:42.911] weston 6.0.1
               https://wayland.freedesktop.org
               Bug reports to: https://gitlab.freedesktop.org/wayland/weston/issues/
               Build: unknown (not built from git or tarball)
[20:19:42.911] Command line: weston --backend=drm-backend.so --tty=2
[20:19:42.912] OS: Linux, 4.19.66-v7l, #1 SMP Mon Oct 28 18:30:00 CET 2019, armv7l
[20:19:42.913] Starting with no config file.
[20:19:42.914] Output repaint window is 7 ms maximum.
[20:19:42.916] Loading module '/usr/lib/libweston-6/drm-backend.so'
[20:19:42.926] initializing drm backend
[20:19:42.927] logind: not running in a systemd session
[20:19:42.927] logind: cannot setup systemd-logind helper (-61), using legacy fallback

[20:20:23.860] using /dev/dri/card1
[20:20:23.860] DRM: supports universal planes
[20:20:23.860] DRM: supports atomic modesetting
[20:20:23.861] DRM: supports picture aspect ratio
[20:20:23.862] Loading module '/usr/lib/libweston-6/gl-renderer.so'
MESA-LOADER: failed to open kms_swrast (search paths /usr/lib/dri)
failed to load driver: kms_swrast
[20:20:24.664] EGL client extensions: EGL_EXT_client_extensions
               EGL_EXT_device_base EGL_EXT_device_enumeration
               EGL_EXT_device_query EGL_EXT_platform_base
               EGL_KHR_client_get_all_proc_addresses EGL_KHR_debug
               EGL_EXT_platform_wayland EGL_MESA_platform_gbm
               EGL_EXT_platform_device
libEGL warning: did not find extension DRI2_Flush version 1
libEGL warning: did not find extension DRI_IMAGE version 1
[20:20:24.667] failed to initialize display
[20:20:24.667] EGL error state: EGL_NOT_INITIALIZED (0x3001)
[20:20:24.672] failed to initialize egl

[20:21:09.962] fatal: failed to create compositor backend
[20:21:09.962] Internal warning: debug scope 'drm-backend' has not been destroyed.

When I try to run es2gears_wayland:
# es2gears_wayland 
EGLUT: failed to initialize native display


I do not necessarily require to use 3D acceleration or things like
that, framebuffer might be enough, however my understanding is that if
I want to use libgtk3 and libwebkitgtk I need to use Mesa3d/Gallium
VC4, not the proprietary(?) "rpi-userland".
To be more specific in case Mesa3D is not selected (BR2_PACKAGE_MESA3D
[=n]), I am unable to select `libgtk3`:
   *** libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend ***

When I tried to use both Mesa3D and "rpi-userland" the following error
message during make appeared:
   package/rpi-userland/rpi-userland.mk:64: *** Configuration error:
   both "rpi-userland" and "mesa3d" are selected as providers for
   virtual package "libegl". Only one provider can be selected at a
   time. Please fix your configuration.  Stop.

So what is going on?
Am I missing something in my configuration?
What
should I do differently to run my libgtk3+ application on RPi4?

I will appreciate your comments.

Thanks,
Rosty
