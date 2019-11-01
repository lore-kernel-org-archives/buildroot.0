From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 1 Nov 2019 14:15:56 +0100
Subject: [Buildroot] Raspberrypi4: Unable to run Weston?
In-Reply-To: <d6e80828979625a2bb2689e73cae1fed84fdc10c.camel@r7-engineering.com>
References: <d6e80828979625a2bb2689e73cae1fed84fdc10c.camel@r7-engineering.com>
Message-ID: <20191101141556.39366063@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rosty,

On Mon, 28 Oct 2019 21:34:54 +0100, Rostislav Lisovy <rostislav.lisovy@r7-engineering.com> wrote:

> Hi everyone,
> I am building system for my RPi4 using Buildroot (master branch).
>

Sorry, no RPi4 available (yet) for testing...., but tried VC4 with my RPi3
(Raspberry Pi 3 Model B Plus Rev 1.3)...

> I would like to run simple libgtk3 (libwebkitgtk) application with
> graphical output shown on a display connected through HDMI.
>
> I did following in the configuration (based on raspberrypi4_defconfig):
> * glibc
> * systemd
> * Mesa3D Gallium VC4
> * *not using* rpi-userland
> * Weston & Wayland
>
> Exact content of my custom defconfig (created using `make
> savedefconfig`) is following (interesting/important lines start with
> exclamation mark):
>
>    BR2_arm=y
>    BR2_cortex_a72=y
>    BR2_ARM_FPU_NEON_VFPV4=y
>    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>    BR2_TOOLCHAIN_BUILDROOT_CXX=y
>    BR2_INIT_SYSTEMD=y
>    BR2_TARGET_GENERIC_ROOT_PASSWD="aaa"
>    BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>    BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>    BR2_SYSTEM_DHCP="eth0"
>    BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
>    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
>    BR2_LINUX_KERNEL=y
>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>    BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
>    BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>    BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
>    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>    BR2_PACKAGE_KMSCUBE=y
>    BR2_PACKAGE_MESA3D_DEMOS=y
>    BR2_PACKAGE_MESA3D=y
>    BR2_PACKAGE_MESA3D_LLVM=y

Did not enable BR2_PACKAGE_MESA3D_LLVM in my config...

>    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
>    ! BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
>    BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y

BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST not needed...

>    BR2_PACKAGE_MESA3D_OPENGL_ES=y
>    ! BR2_PACKAGE_WESTON=y
>    ! BR2_PACKAGE_WESTON_DRM=y
>    BR2_PACKAGE_WESTON_FBDEV=y

BR2_PACKAGE_WESTON_FBDEV not needed...

>    BR2_PACKAGE_WESTON_DEMO_CLIENTS=y
>    ! BR2_PACKAGE_RPI_FIRMWARE=y
>    ! BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
>    BR2_PACKAGE_OPENSSL=y
>    BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
>    BR2_PACKAGE_DROPBEAR=y
>    BR2_TARGET_ROOTFS_EXT2=y
>    BR2_TARGET_ROOTFS_EXT2_4=y
>    BR2_TARGET_ROOTFS_EXT2_SIZE="1G"
>    # BR2_TARGET_ROOTFS_TAR is not set
>    BR2_PACKAGE_HOST_DOSFSTOOLS=y
>    BR2_PACKAGE_HOST_GENIMAGE=y
>    BR2_PACKAGE_HOST_MTOOLS=y
>
> My "config.txt" contains:
>    dtoverlay=vc4-kms-v3d

O.k., my config.txt contains (to enable the serial console):
dtoverlay=pi3-miniuart-bt
dtoverlay=vc4-kms-v3d

>
> and default
>    gpu_mem_256=100
>    gpu_mem_512=100
>    gpu_mem_1024=100

The page https://wiki.gentoo.org/wiki/Raspberry_Pi_VC4 states you
should use (but makes no difference for the RPi3 case):

gpu_mem_256=128
gpu_mem_512=128
gpu_mem_1024=128

>
>
> When I power on my RPi4 (with my LG 4k display connected to HDMI) I can
> definitely see some testing (?) color pattern and then kernel console
> (in a decent resolution), then there is just black screen and nothing
> else...
>
> Kernel log (dmesg) contains following at its end:
>    [    8.443019] rpivid-mem feb00000.hevc-decoder: rpivid-hevcmem initialised: Registers at 0xfeb00000 length 0x0000ffff
>    [    8.464522] rpivid-mem feb10000.rpivid-local-intc: rpivid-intcmem initialised: Registers at 0xfeb10000 length 0x00000fff
>    [    8.478300] rpivid-mem feb20000.h264-decoder: rpivid-h264mem initialised: Registers at 0xfeb20000 length 0x0000ffff
>    [    8.493534] vc_sm_cma: module is from the staging directory, the quality is unknown, you have been warned.
>    [    8.501060] media: Linux media interface: v0.10
>    [    8.513475] bcm2835_vc_sm_cma_probe: Videocore shared memory driver
>    [    8.527433] rpivid-mem feb30000.vp9-decoder: rpivid-vp9mem initialised: Registers at 0xfeb30000 length 0x0000ffff
>    [    8.527966] [vc_sm_connected_init]: start
>    [    8.562646] [vc_sm_connected_init]: installed successfully
>    [    8.563267] videodev: Linux video capture interface: v2.00
>    [    8.712772] cfg80211: Loading compiled-in X.509 certificates for regulatory database
>    [    9.032843] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>    [    9.039723] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
>    [    9.048565] cfg80211: failed to load regulatory.db
>    [    9.055761] bcm2835_mmal_vchiqRosty: module is from the staging directory, the quality is unknown, you have been warned.
>    [    9.055765] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
>    [    9.106096] [drm] Initialized v3d 1.0.0 20180419 for fec00000.v3d on minor 0
>    [    9.127611] bcm2835_v4l2: module is from the staging directory, the quality is unknown, you have been warned.
>    [    9.133626] brcmfmac: F1 signature read @0x18000000=0x15264345
>    [    9.138893] bcm2835_codec: module is from the staging directory, the quality is unknown, you have been warned.
>    [    9.157000] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-sdio for chip BCM4345/6
>    [    9.166491] bcm2835-codec bcm2835-codec: Device registered as /dev/video10
>    [    9.173639] bcm2835-codec bcm2835-codec: Loaded V4L2 decode
>    [    9.173945] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.bin failed with error -2
>    [    9.176065] bcmgenet: Skipping UMAC reset
>    [    9.195449] usbcore: registered new interface driver brcmfmac
>    [    9.197317] bcm2835-codec bcm2835-codec: Device registered as /dev/video11
>    [    9.209475] bcm2835-codec bcm2835-codec: Loaded V4L2 encode
>    [    9.218436] bcm2835-codec bcm2835-codec: Device registered as /dev/video12
>    [    9.225648] bcm2835-codec bcm2835-codec: Loaded V4L2 isp
>    [    9.272020] bcmgenet fd580000.genet: configuring instance for external RGMII (no delay)
>    [    9.280828] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
>    [    9.352593] vc4_hdmi fe902000.hdmi: ASoC: Failed to create component debugfs directory
>    [    9.362087] vc4_hdmi fe902000.hdmi: vc4-hdmi-hifi <-> fe902000.hdmi mapping ok
>    [    9.370166] vc4-drm soc:gpu: bound fe902000.hdmi (ops vc4_hdmi_ops [vc4])
>    [    9.377413] vc4-drm soc:gpu: bound fe806000.vec (ops vc4_vec_ops [vc4])
>    [    9.384399] vc4-drm soc:gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
>    [    9.391219] vc4-drm soc:gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>    [    9.398416] vc4-drm soc:gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
>    [    9.406845] vc4-drm soc:gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
>    [    9.414938] vc4-drm soc:gpu: bound fe807000.pixelvalve (ops vc4_crtc_ops [vc4])
>    [    9.423624] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 1
>    [    9.430791] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>    [    9.438240] [drm] Driver supports precise vblank timestamp query.
>    [   10.212853] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
>    [   10.311665] bcmgenet fd580000.genet eth0: Link is Down
>    [   10.471468] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   11.511476] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   12.551453] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   13.591464] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   14.471688] bcmgenet fd580000.genet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
>    [   14.479770] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>    [   14.631460] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   24.791538] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
>    [   24.791647] Console: switching to colour frame buffer device 90x30
>    [   35.031547] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
>    [   45.271542] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] [  853.517889] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    *ERROR* [CONNECTOR:44:Composite-1] flip_done timed out
>    [   55.511538] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [PLANE:113:plane-20] flip_done timed out
>    [   65.751603] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
>    [   65.842171] vc4-drm soc:gpu: fbRosty0: DRM emulated frame buffer device
>    [   67.991534] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   69.031556] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   70.071556] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   71.111566] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   72.151559] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   73.191558] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   74.231562] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   75.271566] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   76.311569] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   77.351572] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [   87.511686] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
>    [   97.751695] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CONNECTOR:44:Composite-1] flip_done timed out
>    [  104.826916] random: crng init done
>    [  104.833185] random: 7 urandom warning(s) missed due to ratelimiting
>    [  107.991704] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [PLANE:113:plane-20] flip_done timed out
>    [  118.231702] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR* [CRTC:116:crtc-2] flip_done timed out
>    [  129.511825] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  130.551854] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  131.591879] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  132.631909] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  133.671934] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  144.872175] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  145.912191] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  146.952244] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>    [  147.992231] i2c-bcm2835 fe805000.i2c: i2c transfer timed out
>
>
> and the "i2c-bcm2835 fe805000.i2c: i2c transfer timed out" goes on and
> on... approx. 1 times per second...
>
> When I ssh to the RPi4 and try to run Weston, following happens:
> # mkdir /tmp/wayland
> # chmod 0700 /tmp/wayland
> # export XDG_RUNTIME_DIR=/tmp/wayland
> # weston --backend=drm-backend.so --tty=2
> Date: 2019-10-28 UTC
> [20:19:42.911] weston 6.0.1
>                https://wayland.freedesktop.org
>                Bug reports to: https://gitlab.freedesktop.org/wayland/weston/issues/
>                Build: unknown (not built from git or tarball)
> [20:19:42.911] Command line: weston --backend=drm-backend.so --tty=2
> [20:19:42.912] OS: Linux, 4.19.66-v7l, #1 SMP Mon Oct 28 18:30:00 CET 2019, armv7l
> [20:19:42.913] Starting with no config file.
> [20:19:42.914] Output repaint window is 7 ms maximum.
> [20:19:42.916] Loading module '/usr/lib/libweston-6/drm-backend.so'
> [20:19:42.926] initializing drm backend
> [20:19:42.927] logind: not running in a systemd session
> [20:19:42.927] logind: cannot setup systemd-logind helper (-61), using legacy fallback
>
> [20:20:23.860] using /dev/dri/card1

In my case there is only a /dev/dri/card0 which is used...

> [20:20:23.860] DRM: supports universal planes
> [20:20:23.860] DRM: supports atomic modesetting
> [20:20:23.861] DRM: supports picture aspect ratio
> [20:20:23.862] Loading module '/usr/lib/libweston-6/gl-renderer.so'
> MESA-LOADER: failed to open kms_swrast (search paths /usr/lib/dri)
> failed to load driver: kms_swrast
> [20:20:24.664] EGL client extensions: EGL_EXT_client_extensions
>                EGL_EXT_device_base EGL_EXT_device_enumeration
>                EGL_EXT_device_query EGL_EXT_platform_base
>                EGL_KHR_client_get_all_proc_addresses EGL_KHR_deRostislavbug
>                EGL_EXT_platform_wayland EGL_MESA_platform_gbm
>                EGL_EXT_platform_device
> libEGL warning: did not find extension DRI2_Flush version 1
> libEGL warning: did not find extension DRI_IMAGE version 1
> [20:20:24.667] failed to initialize display
> [20:20:24.667] EGL error state: EGL_NOT_INITIALIZED (0x3001)
> [20:20:24.672] failed to initialize egl
>
> [20:21:09.962] fatal: failed to create compositor backend
> [20:21:09.962] Internal warning: debug scope 'drm-backend' has not been destroyed.
>

My defconfig:

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_GDB_VERSION_8_3=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_KMSCUBE=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WESTON=y
BR2_PACKAGE_WESTON_DRM=y
BR2_PACKAGE_WESTON_DEMO_CLIENTS=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

My dmesg:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.19.66-v7 (seiderer at localhost) (gcc version 8.3.0 (Buildroot 2019.11-git-01454-gf8f4c01652-dirty)) #1 SMP Fri Nov 1 13:27:11 CET 2019
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Raspberry Pi 3 Model B Plus Rev 1.3
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 256 MiB at 0x1ec00000
[    0.000000] On node 0 totalpages: 236544
[    0.000000]   Normal zone: 2079 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 236544 pages, LIFO batch:63
[    0.000000] random: get_random_bytes called from start_kernel+0xb0/0x4b4 with crng_init=0
[    0.000000] percpu: Embedded 17 pages/cpu s39436 r8192 d22004 u69632
[    0.000000] pcpu-alloc: s39436 r8192 d22004 u69632 alloc=17*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 234465
[    0.000000] Kernel command line: coherent_pool=1M 8250.nr_uarts=1 cma=256M video=HDMI-A-1:1920x1200 at 60 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 660280K/946176K available (8192K kernel code, 629K rwdata, 2176K rodata, 1024K init, 820K bss, 23752K reserved, 262144K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xba000000 - 0xff800000   (1112 MB)
[    0.000000]     lowmem  : 0x80000000 - 0xb9c00000   ( 924 MB)
[    0.000000]     modules : 0x7f000000 - 0x80000000   (  16 MB)
[    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (9184 kB)
[    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
[    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 630 kB)
[    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 821 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] ftrace: allocating 26340 entries in 78 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] arch_timer: cp15 timer(s) running at 19.20MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000007] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.000022] Switching to timer-based delay loop, resolution 52ns
[    0.000281] Console: colour dummy device 80x30
[    0.000894] console [tty1] enabled
[    0.000952] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=192000)
[    0.000998] pid_max: default: 32768 minimum: 301
[    0.001336] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.001371] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.002289] CPU: Testing write buffer coherency: ok
[    0.002765] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.003432] Setting up static identity map for 0x100000 - 0x10003c
[    0.003598] rcu: Hierarchical SRCU implementation.
[    0.004412] smp: Bringing up secondary CPUs ...
[    0.005265] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.006191] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.007059] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.007180] smp: Brought up 1 node, 4 CPUs
[    0.007262] SMP: Total of 4 processors activated (153.60 BogoMIPS).
[    0.007286] CPU: All CPU(s) started in HYP mode.
[    0.007306] CPU: Virtualization extensions available.
[    0.008276] devtmpfs: initialized
[    0.020940] VFP support v0.3: implementor 41 architecture 3 part 40 variant 3 rev 4
[    0.021212] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.021260] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.032063] pinctrl core: initialized pinctrl subsystem
[    0.033050] NET: Registered protocol family 16
[    0.035916] DMA: preallocated 1024 KiB pool for atomic coherent allocations
[    0.041385] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
[    0.041420] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.041637] Serial: AMBA PL011 UART driver
[    0.044235] bcm2835-mbox 3f00b880.mailbox: mailbox enabled
[    0.079861] bcm2835-dma 3f007000.dma: DMA legacy API manager at (ptrval), dmachans=0x1
[    0.081785] SCSI subsystem initialized
[    0.082031] usbcore: registered new interface driver usbfs
[    0.082107] usbcore: registered new interface driver hub
[    0.082220] usbcore: registered new device driver usb
[    0.100344] raspberrypi-firmware soc:firmware: Attached to firmware from 2019-08-15 12:06, variant start
[    0.110175] raspberrypi-firmware soc:firmware: Firmware hash is 0e6daa5106dd4164474616408e0dc24f997ffcf3
[    0.121697] clocksource: Switched to clocksource arch_sys_counter
[    0.213310] VFS: Disk quotas dquot_6.6.0
[    0.213417] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.213626] FS-Cache: Loaded
[    0.213852] CacheFiles: Loaded
[    0.214426] simple-framebuffer 3e795000.framebuffer: framebuffer at 0x3e795000, 0x465000 bytes, mapped to 0x(ptrval)
[    0.214470] simple-framebuffer 3e795000.framebuffer: format=r5g6b5, mode=1920x1200x16, linelength=3840
[    0.232172] Console: switching to colour frame buffer device 240x75
[    0.248626] simple-framebuffer 3e795000.framebuffer: fb0: simplefb registered!
[    0.258349] NET: Registered protocol family 2
[    0.259203] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes)
[    0.259352] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    0.259563] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    0.259840] TCP: Hash tables configured (established 8192 bind 8192)
[    0.260065] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.260199] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.260598] NET: Registered protocol family 1
[    0.261254] RPC: Registered named UNIX socket transport module.
[    0.261350] RPC: Registered udp transport module.
[    0.261425] RPC: Registered tcp transport module.
[    0.261500] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.262851] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 7 counters available
[    0.265987] Initialise system trusted keyrings
[    0.266254] workingset: timestamp_bits=14 max_order=18 bucket_order=4
[    0.276058] FS-Cache: Netfs 'nfs' registered for caching
[    0.276715] NFS: Registering the id_resolver key type
[    0.276818] Key type id_resolver registered
[    0.276888] Key type id_legacy registered
[    0.276966] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.279309] Key type asymmetric registered
[    0.279387] Asymmetric key parser 'x509' registered
[    0.279520] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.279785] io scheduler noop registered
[    0.279856] io scheduler deadline registered
[    0.280093] io scheduler cfq registered (default)
[    0.280173] io scheduler mq-deadline registered
[    0.280247] io scheduler kyber registered
[    0.283583] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    0.285452] bcm2835-rng 3f104000.rng: hwrng registered
[    0.285915] vc-mem: phys_addr:0x00000000 mem_base=0x3ec00000 mem_size:0x40000000(1024 MiB)
[    0.286541] vc-sm: Videocore shared memory driver
[    0.286959] gpiomem-bcm2835 3f200000.gpiomem: Initialised: Registers at 0x3f200000
[    0.297669] brd: module loaded
[    0.307576] loop: module loaded
[    0.308280] Loading iSCSI transport class v2.0-870.
[    0.309036] libphy: Fixed MDIO Bus: probed
[    0.309204] usbcore: registered new interface driver lan78xx
[    0.309353] usbcore: registered new interface driver smsc95xx
[    0.314506] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    0.347458] dwc_otg 3f980000.usb: base=(ptrval)
[    0.552755] Core Release: 2.80a
[    0.557766] Setting default values for core params
[    0.562812] Finished setting default values for core params
[    0.768101] Using Buffer DMA mode
[    0.773064] Periodic Transfer Interrupt Enhancement - disabled
[    0.778018] Multiprocessor Interrupt Enhancement - disabled
[    0.782992] OTG VER PARAM: 0, OTG VER FLAG: 0
[    0.787941] Dedicated Tx FIFOs mode
[    0.793649] WARN::dwc_otg_hcd_init:1045: FIQ DMA bounce buffers: virt = 9ed04000 dma = 0xded04000 len=9024
[    0.798680] FIQ FSM acceleration enabled for :
[    0.798680] Non-periodic Split Transactions
[    0.798680] Periodic Split Transactions
[    0.798680] High-Speed Isochronous Endpoints
[    0.798680] Interrupt/Control Split Transaction hack enabled
[    0.823622] dwc_otg: Microframe scheduler enabled
[    0.823681] WARN::hcd_init_fiq:457: FIQ on core 1
[    0.828660] WARN::hcd_init_fiq:458: FIQ ASM at 80652d6c length 36
[    0.833604] WARN::hcd_init_fiq:497: MPHI regs_base at ba010000
[    0.838513] dwc_otg 3f980000.usb: DWC OTG Controller
[    0.843436] dwc_otg 3f980000.usb: new USB bus registered, assigned bus number 1
[    0.848358] dwc_otg 3f980000.usb: irq 56, io mem 0x00000000
[    0.853279] Init: Port Power? op_state=1
[    0.858096] Init: Power Port (0)
[    0.863169] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.19
[    0.868068] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.872952] usb usb1: Product: DWC OTG Controller
[    0.877766] usb usb1: Manufacturer: Linux 4.19.66-v7 dwc_otg_hcd
[    0.882591] usb usb1: SerialNumber: 3f980000.usb
[    0.887984] hub 1-0:1.0: USB hub found
[    0.892774] hub 1-0:1.0: 1 port detected
[    0.898027] dwc_otg: FIQ enabled
[    0.898033] dwc_otg: NAK holdoff enabled
[    0.898039] dwc_otg: FIQ split-transaction FSM enabled
[    0.898050] Module dwc_common_port init
[    0.898325] usbcore: registered new interface driver usb-storage
[    0.903222] mousedev: PS/2 mouse device common for all mice
[    0.908842] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    0.913768] bcm2835-cpufreq: min=600000 max=1400000
[    0.918916] sdhci: Secure Digital Host Controller Interface driver
[    0.923590] sdhci: Copyright(c) Pierre Ossman
[    0.928636] mmc-bcm2835 3f300000.mmcnr: could not get clk, deferring probe
[    0.933723] sdhost-bcm2835 3f202000.mmc: could not get clk, deferring probe
[    0.938561] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.944870] ledtrig-cpu: registered to indicate activity on CPUs
[    0.949783] hidraw: raw HID events driver (C) Jiri Kosina
[    0.954778] usbcore: registered new interface driver usbhid
[    0.959512] usbhid: USB HID core driver
[    0.965049] vchiq: vchiq_init_state: slot_zero = (ptrval), is_master = 0
[    0.971366] [vc_sm_connected_init]: start
[    0.978846] [vc_sm_connected_init]: end - returning 0
[    0.984685] Initializing XFRM netlink socket
[    0.989377] NET: Registered protocol family 17
[    0.994205] Key type dns_resolver registered
[    0.999172] Registering SWP/SWPB emulation handler
[    1.004627] registered taskstats version 1
[    1.009274] Loading compiled-in X.509 certificates
[    1.021073] uart-pl011 3f201000.serial: cts_event_workaround enabled
[    1.025889] 3f201000.serial: ttyAMA0 at MMIO 0x3f201000 (irq = 81, base_baud = 0) is a PL011 rev2
[    2.033149] console [ttyAMA0] enabled
[    2.043272] Indeed it is in host mode hprt0 = 00021501
[    2.113390] 3f215040.serial: ttyS0 at MMIO 0x0 (irq = 53, base_baud = 50000000) is a 16550
[    2.127648] mmc-bcm2835 3f300000.mmcnr: mmc_debug:0 mmc_debug2:0
[    2.138528] mmc-bcm2835 3f300000.mmcnr: DMA channel allocated
[    2.142756] random: fast init done
[    2.183626] sdhost: log_buf @ (ptrval) (ded03000)
[    2.229507] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
[    2.241346] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    2.251552] mmc0: sdhost-bcm2835 loaded - DMA enabled (>1)
[    2.263109] of_cfs_init
[    2.270346] of_cfs_init: OK
[    2.278414] uart-pl011 3f201000.serial: no DMA platform data
[    2.281969] usb 1-1: new high-speed USB device number 2 using dwc_otg
[    2.295542] Waiting for root device /dev/mmcblk0p2...
[    2.300332] Indeed it is in host mode hprt0 = 00001101
[    2.379671] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    2.392769] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
[    2.463484] mmc0: host does not support reading read-only switch, assuming write-enable
[    2.479621] mmc1: new high speed SDIO card at address 0001
[    2.490962] mmc0: new high speed SDHC card at address aaaa
[    2.502331] mmcblk0: mmc0:aaaa SL32G 29.7 GiB
[    2.517276]  mmcblk0: p1 p2
[    2.550647] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
[    2.562029] usb 1-1: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[    2.563716] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    2.576577] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.591425] devtmpfs: mounted
[    2.608163] hub 1-1:1.0: USB hub found
[    2.617005] hub 1-1:1.0: 4 ports detected
[    2.618750] Freeing unused kernel memory: 1024K
[    2.635522] Run /sbin/init as init process
[    2.766324] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
[    2.930909] udevd[108]: starting version 3.2.9
[    2.941753] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
[    2.975752] random: udevd: uninitialized urandom read (16 bytes read)
[    2.991161] random: udevd: uninitialized urandom read (16 bytes read)
[    3.002548] random: udevd: uninitialized urandom read (16 bytes read)
[    3.039701] udevd[109]: starting eudev-3.2.9
[    3.082170] usb 1-1.1: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[    3.095939] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    3.110711] hub 1-1.1:1.0: USB hub found
[    3.119739] hub 1-1.1:1.0: 3 ports detected
[    3.259952] vc_sm_cma: module is from the staging directory, the quality is unknown, you have been warned.
[    3.280202] bcm2835_vc_sm_cma_probe: Videocore shared memory driver
[    3.292648] [vc_sm_connected_init]: start
[    3.301683] media: Linux media interface: v0.10
[    3.306534] [vc_sm_connected_init]: installed successfully
[    3.356937] videodev: Linux video capture interface: v2.00
[    3.454309] usb 1-1.1.2: new low-speed USB device number 4 using dwc_otg
[    3.482335] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    3.495741] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
[    3.495783] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
[    3.562673] bcm2835_v4l2: module is from the staging directory, the quality is unknown, you have been warned.
[    3.575729] bcm2835_codec: module is from the staging directory, the quality is unknown, you have been warned.
[    3.602033] bcm2835-codec bcm2835-codec: Device registered as /dev/video10
[    3.614194] bcm2835-codec bcm2835-codec: Loaded V4L2 decode
[    3.628041] bcm2835-codec bcm2835-codec: Device registered as /dev/video11
[    3.640135] bcm2835-codec bcm2835-codec: Loaded V4L2 encode
[    3.652974] usb 1-1.1.2: New USB device found, idVendor=046d, idProduct=c05b, bcdDevice=54.00
[    3.654593] bcm2835-codec bcm2835-codec: Device registered as /dev/video12
[    3.666600] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.666619] usb 1-1.1.2: Product: USB Optical Mouse
[    3.678545] bcm2835-codec bcm2835-codec: Loaded V4L2 isp
[    3.691044] usb 1-1.1.2: Manufacturer: Logitech
[    3.726290] input: Logitech USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:046D:C05B.0001/input/input0
[    3.745908] hid-generic 0003:046D:C05B.0001: input,hidraw0: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
[    3.871810] usb 1-1.1.3: new low-speed USB device number 5 using dwc_otg
[    3.877136] vc4_hdmi 3f902000.hdmi: ASoC: Failed to create component debugfs directory
[    3.900263] vc4_hdmi 3f902000.hdmi: vc4-hdmi-hifi <-> 3f902000.hdmi mapping ok
[    3.914152] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
[    3.926845] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
[    3.939021] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
[    3.951210] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
[    3.958262] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    3.963591] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops [vc4])
[    3.975087] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    3.987842] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops [vc4])
[    4.001258] cfg80211: failed to load regulatory.db
[    4.014605] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops [vc4])
[    4.059680] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
[    4.070028] usb 1-1.1.3: New USB device found, idVendor=046d, idProduct=c31d, bcdDevice=66.01
[    4.072065] checking generic (3e795000 465000) vs hw (0 ffffffff)
[    4.079614] brcmfmac: F1 signature read @0x18000000=0x15264345
[    4.086247] usb 1-1.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.086258] usb 1-1.1.3: Product: USB Keyboard
[    4.087231] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-sdio for chip BCM4345/6
[    4.087551] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.bin failed with error -2
[    4.089838] usbcore: registered new interface driver brcmfmac
[    4.099276] fb: switching to vc4drmfb from simple
[    4.109115] usb 1-1.1.3: Manufacturer: Logitech
[    4.170159] Console: switching to colour dummy device 80x30
[    4.177360] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
[    4.184052] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.190686] [drm] Driver supports precise vblank timestamp query.
[    4.195283] input: Logitech USB Keyboard as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.3/1-1.1.3:1.0/0003:046D:C31D.0002/input/input1
[    4.250144] Console: switching to colour frame buffer device 240x75
[    4.272852] hid-generic 0003:046D:C31D.0002: input,hidraw1: USB HID v1.10 Keyboard [Logitech USB Keyboard] on usb-3f980000.usb-1.1.3/input0
[    4.298710] input: Logitech USB Keyboard Consumer Control as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.3/1-1.1.3:1.1/0003:046D:C31D.0003/input/input2
[    4.302544] vc4-drm soc:gpu: fb0: DRM emulated frame buffer device
[    4.402222] input: Logitech USB Keyboard System Control as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.3/1-1.1.3:1.1/0003:046D:C31D.0003/input/input3
[    4.417504] hid-generic 0003:046D:C31D.0003: input,hidraw2: USB HID v1.10 Device [Logitech USB Keyboard] on usb-3f980000.usb-1.1.3/input1
[    4.662983] urandom_read: 2 callbacks suppressed
[    4.662992] random: dd: uninitialized urandom read (512 bytes read)
[    4.721852] usb 1-1.1.1: new high-speed USB device number 6 using dwc_otg
[    4.852189] usb 1-1.1.1: New USB device found, idVendor=0424, idProduct=7800, bcdDevice= 3.00
[    4.861026] usb 1-1.1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    5.092499] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
[    5.133904] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized): No External EEPROM. Setting MAC Speed
[    5.144960] libphy: lan78xx-mdiobus: probed
[    5.209524] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized): int urb period 64
[    8.837490] random: crng init done


And my weston debug output:

weston --tty 2
Date: 1970-01-01 UTC
[00:19:03.682] weston 6.0.1
               https://wayland.freedesktop.org
               Bug reports to: https://gitlab.freedesktop.org/wayland/weston/issues/
               Build: unknown (not built from git or tarball)
[00:19:03.682] Command line: weston --tty 2
[00:19:03.682] OS: Linux, 4.19.66-v7, #1 SMP Fri Nov 1 13:27:11 CET 2019, armv7l
[00:19:03.682] warning: XDG_RUNTIME_DIR "/tmp" is not configured
correctly.  Unix access mode must be 0700 (current mode is 777),
and must be owned by the user (current owner is UID 0).
Refer to your distribution on how to get it, or
http://www.freedesktop.org/wiki/Specifications/basedir-spec
on how to implement it.
[00:19:03.682] Starting with no config file.
[00:19:03.683] Output repaint window is 7 ms maximum.
[00:19:03.683] Loading module '/usr/lib/libweston-6/drm-backend.so'
[00:19:03.686] initializing drm backend
[00:19:03.690] using /dev/dri/card0
[00:19:03.690] DRM: supports universal planes
[00:19:03.690] DRM: supports atomic modesetting
[00:19:03.690] DRM: supports picture aspect ratio
[00:19:03.690] Loading module '/usr/lib/libweston-6/gl-renderer.so'
[00:19:03.760] EGL client extensions: EGL_EXT_client_extensions
               EGL_EXT_device_base EGL_EXT_device_enumeration
               EGL_EXT_device_query EGL_EXT_platform_base
               EGL_KHR_client_get_all_proc_addresses EGL_KHR_debug
               EGL_EXT_platform_wayland EGL_MESA_platform_gbm
               EGL_EXT_platform_device
[00:19:03.763] EGL version: 1.4
[00:19:03.763] EGL vendor: Mesa Project
[00:19:03.763] EGL client APIs: OpenGL OpenGL_ES
[00:19:03.763] EGL extensions: EGL_ANDROID_blob_cache
               EGL_ANDROID_native_fence_sync EGL_EXT_buffer_age
               EGL_EXT_image_dma_buf_import
               EGL_EXT_image_dma_buf_import_modifiers EGL_KHR_cl_event2
               EGL_KHR_config_attribs EGL_KHR_create_context
               EGL_KHR_create_context_no_error EGL_KHR_fence_sync
               EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace
               EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image
               EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image
               EGL_KHR_image EGL_KHR_image_base EGL_KHR_image_pixmap
               EGL_KHR_no_config_context EGL_KHR_reusable_sync
               EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float
               EGL_KHR_wait_sync EGL_MESA_configless_context
               EGL_MESA_drm_image EGL_MESA_image_dma_buf_export
               EGL_WL_bind_wayland_display
[00:19:03.764] EGL_KHR_surfaceless_context available
[00:19:03.770] GL version: OpenGL ES 2.0 Mesa 19.2.2
[00:19:03.770] GLSL version: OpenGL ES GLSL ES 1.0.16
[00:19:03.770] GL vendor: Broadcom
[00:19:03.770] GL renderer: VC4 V3D 2.1
[00:19:03.770] GL extensions: GL_EXT_blend_minmax GL_EXT_multi_draw_arrays
               GL_EXT_texture_format_BGRA8888
               GL_OES_compressed_ETC1_RGB8_texture GL_OES_depth24
               GL_OES_element_index_uint GL_OES_fbo_render_mipmap
               GL_OES_mapbuffer GL_OES_rgb8_rgba8 GL_OES_stencil8
               GL_OES_texture_3D GL_OES_texture_npot GL_OES_vertex_half_float
               GL_OES_EGL_image GL_OES_depth_texture
               GL_AMD_performance_monitor GL_OES_packed_depth_stencil
               GL_OES_get_program_binary GL_APPLE_texture_max_level
               GL_EXT_discard_framebuffer GL_EXT_read_format_bgra
               GL_EXT_frag_depth GL_NV_fbo_color_attachments
               GL_OES_EGL_image_external GL_OES_EGL_sync
               GL_OES_vertex_array_object GL_EXT_occlusion_query_boolean
               GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_buffer
               GL_NV_read_depth GL_NV_read_depth_stencil GL_NV_read_stencil
               GL_EXT_draw_buffers GL_EXT_map_buffer_range GL_KHR_debug
               GL_KHR_texture_compression_astc_ldr
               GL_OES_required_internalformat GL_OES_surfaceless_context
               GL_EXT_separate_shader_objects
               GL_EXT_compressed_ETC1_RGB8_sub_texture
               GL_EXT_draw_elements_base_vertex GL_EXT_texture_border_clamp
               GL_KHR_context_flush_control GL_OES_draw_elements_base_vertex
               GL_OES_texture_border_clamp GL_KHR_no_error
               GL_KHR_texture_compression_astc_sliced_3d
               GL_KHR_parallel_shader_compile GL_MESA_tile_raster_order
[00:19:03.771] GL ES 2 renderer features:
               read-back format: BGRA
               wl_shm sub-image to texture: yes
               EGL Wayland extension: yes
[00:19:03.855] event0  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
[00:19:03.855] event0  - Logitech USB Optical Mouse: device is a pointer
[00:19:03.862] event1  - Logitech USB Keyboard: is tagged by udev as: Keyboard
[00:19:03.862] event1  - Logitech USB Keyboard: device is a keyboard
[00:19:03.868] event2  - Logitech USB Keyboard Consumer Control: is tagged by udev as: Keyboard
[00:19:03.869] event2  - Logitech USB Keyboard Consumer Control: device is a keyboard
[00:19:03.875] event3  - Logitech USB Keyboard System Control: is tagged by udev as: Keyboard
[00:19:03.875] event3  - Logitech USB Keyboard System Control: device is a keyboard
[00:19:03.876] libinput: configuring device "Logitech USB Optical Mouse".
[00:19:03.933] libinput: configuring device "Logitech USB Keyboard".
[00:19:03.933] libinput: configuring device "Logitech USB Keyboard Consumer Control".
[00:19:03.933] libinput: configuring device "Logitech USB Keyboard System Control".
[00:19:03.974] DRM: head 'HDMI-A-1' found, connector 29 is connected, EDID make 'ACI', model 'PA246', serial 'B4LMQS058764'
[00:19:03.975] DRM: head 'Composite-1' found, connector 44 is disconnected.
[00:19:03.975] Registered plugin API 'weston_drm_output_api_v1' of size 12
[00:19:03.975] Registered plugin API 'weston_drm_virtual_output_api_v1' of size 24
[00:19:03.976] Chosen EGL config details:
               RGBA bits: 8 8 8 0
               swap interval range: 1 - 1
[00:19:03.977] Output HDMI-A-1 (crtc 116) video modes:
               1920x1080 at 60.0 16:9, current, 148.5 MHz
               1920x1080 at 59.9 16:9, 148.4 MHz
               1920x1080 at 60.0, 138.5 MHz
               1920x1080 at 60.0, 74.2 MHz
               1920x1080 at 60.0 16:9, 74.2 MHz
               1920x1080 at 59.9 16:9, 74.2 MHz
               1920x1080 at 50.0 16:9, 148.5 MHz
               1920x1080 at 50.0 16:9, 74.2 MHz
               1680x1050 at 59.9, 119.0 MHz
               1280x1024 at 75.0, 135.0 MHz
               1280x1024 at 60.0, 108.0 MHz
               1440x900 at 59.9, 88.8 MHz
               1280x960 at 60.0, 108.0 MHz
               1366x768 at 59.8, 85.5 MHz
               1152x864 at 75.0, 108.0 MHz
               1280x720 at 60.0, 74.2 MHz
               1280x720 at 60.0 16:9, 74.2 MHz
               1280x720 at 59.9 16:9, 74.2 MHz
               1280x720 at 50.0 16:9, 74.2 MHz
               1024x768 at 75.0, 78.8 MHz
               1024x768 at 70.1, 75.0 MHz
               1024x768 at 60.0, 65.0 MHz
               832x624 at 74.6, 57.3 MHz
               800x600 at 75.0, 49.5 MHz
               800x600 at 72.2, 50.0 MHz
               800x600 at 60.3, 40.0 MHz
               800x600 at 56.2, 36.0 MHz
               720x576 at 50.0 4:3, 27.0 MHz
               720x576 at 50.0 16:9, 27.0 MHz
               720x480 at 60.0 4:3, 27.0 MHz
               720x480 at 60.0 16:9, 27.0 MHz
               720x480 at 59.9, 27.0 MHz
               720x480 at 59.9 16:9, 27.0 MHz
               720x480 at 59.9 4:3, 27.0 MHz
               640x480 at 75.0, 31.5 MHz
               640x480 at 72.8, 31.5 MHz
               640x480 at 66.7, 30.2 MHz
               640x480 at 60.0 4:3, 25.2 MHz
               640x480 at 59.9, 25.2 MHz
               640x480 at 59.9 4:3, 25.2 MHz
               720x400 at 70.1, 28.3 MHz
[00:19:04.311] associating input device event0 with output HDMI-A-1 (none by udev)
[00:19:04.311] associating input device event1 with output HDMI-A-1 (none by udev)
[00:19:04.311] associating input device event2 with output HDMI-A-1 (none by udev)
[00:19:04.311] associating input device event3 with output HDMI-A-1 (none by udev)
[00:19:04.311] Output 'HDMI-A-1' enabled with head(s) HDMI-A-1
[00:19:04.311] Compositor capabilities:
               arbitrary surface rotation: yes
               screen capture uses y-flip: yes
               presentation clock: CLOCK_MONOTONIC, id 1
               presentation clock resolution: 0.000000001 s
[00:19:04.312] Loading module '/usr/lib/weston/desktop-shell.so'
[00:19:04.314] launching '/usr/libexec/weston-keyboard'
[00:19:04.316] launching '/usr/libexec/weston-desktop-shell'
could not load cursor 'dnd-move'
could not load cursor 'dnd-move'
could not load cursor 'dnd-copy'
could not load cursor 'dnd-copy'
could not load cursor 'dnd-none'
could not load cursor 'dnd-none'
xkbcommon: ERROR: couldn't find a Compose file for locale "C"
could not create XKB compose table for locale 'C'.  Disabiling compose
xkbcommon: ERROR: couldn't find a Compose file for locale "C"
could not create XKB compose table for locale 'C'.  Disabiling compose

Maybe try with an 'normal' FullHD 1920x1080 or 1920x1200 Display?

Did you do a complete re-build after changing the Buildroot configuration?

Regards,
Peter

> When I try to run es2gears_wayland:Rosty
> # es2gears_wayland
> EGLUT: failed to initialize native display
>
>
> I do not necessarily require to use 3D acceleration or things like
> that, framebuffer might be enough, however my understanding is that if
> I want to use libgtk3 and libwebkitgtk I need to use Mesa3d/Gallium
> VC4, not the proprietary(?) "rpi-userland".
> To be more specific in case Mesa3D is not selected (BR2_PACKAGE_MESA3D
> [=n]), I am unable to select `libgtk3`:
>    *** libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend ***
>
> When I tried to use both Mesa3D and "rpi-userland" the following error
> message during make appeared:
>    package/rpi-userland/rpi-userland.mk:64: *** Configuration error:
>    both "rpi-userland" and "mesa3d" are selected as providers for
>    virtual package "libegl". Only one provider can be selected at a
>    time. Please fix your configuration.  Stop.
>
> So what is going on?
> Am I missing something in my configuration?
> What
> should I do differently to run my libgtk3+ application on RPi4?
>
> I will appreciate your comments.
>
> Thanks,
> Rosty
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
