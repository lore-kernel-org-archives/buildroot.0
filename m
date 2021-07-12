From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 12 Jul 2021 21:55:32 +0200
Subject: [Buildroot] [RFC] board/mx6cubox: Switch to extlinux.conf
In-Reply-To: <20210712162703.2937572-1-festevam@gmail.com>
References: <20210712162703.2937572-1-festevam@gmail.com>
Message-ID: <CAB0FRstB6+32=F-JmTs4RS70A3uUt0feCa9VtF3rgX2GD1tOjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210712195532.I_sqoX18PCaWZjX0N6Q2H-0z-iNR2ZVzfQIyvDTmbxk@z>

Le lun. 12 juil. 2021 ? 18:27, Fabio Estevam <festevam@gmail.com> a ?crit :

> Currently mx6cubox uses a custom boot.scr.txt script
> and custom image generation scripts: genimage.cfg, post-build.sh
> and post-image.sh.
>
> Switch to using the more standard extlinux.conf solution
> and remove the custom scripts in favor of the standard
> board/freescale/common/imx/post-image.sh one.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Francois,
>
> I don't have access to a mx6cubox to try this.
>
> Is it possible for you to test this patch, please?
>
> Thanks
>
>

Hi Fabio,

Currently, I got a kernel panic after:
[    6.761962] VFS: Cannot open root device "PARTUUID=" or
unknown-block(0,0): error -6
[    6.899508] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

looks like, ${uuid} was not correct.
boot.scr.txt starts with:
    setenv finduuid "part uuid mmc 1:1 uuid"
    run finduuid

perhaps, extlinux does something like:
    setenv finduuid "part uuid mmc 0:1 uuid"
    run finduuid

(see
https://git.busybox.net/buildroot/commit/board/solidrun/mx6cubox?id=a59973f116c6a360ed787ae9e7a00fc54a3df20a
)

Here, the full log:

U-Boot SPL 2021.07 (Jul 12 2021 - 21:25:10 +0200)
WDT:   Not found!
Trying to boot from MMC1


U-Boot 2021.07 (Jul 12 2021 - 21:25:10 +0200)

CPU:   Freescale i.MX6DL rev1.3 996 MHz (running at 792 MHz)
CPU:   Commercial temperature grade (0C to 95C) at 32C
Reset cause: POR
Board: MX6 Cubox-i
DRAM:  1 GiB
MMC:   FSL_SDHC: 1, FSL_SDHC: 2
Loading Environment from MMC... *** Warning - bad CRC, using default
environment

In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet at 2188000
Hit any key to stop autoboot:  0
switch to partitions #0, OK
mmc1 is current device
Scanning mmc 1:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
134 bytes read in 1 ms (130.9 KiB/s)
1:      imx6qdl-cubox Buildroot
Retrieving file: /boot/extlinux/../zImage
9502536 bytes read in 457 ms (19.8 MiB/s)
append: root=PARTUUID= rootwait rw console=ttymxc0,115200,115200
Retrieving file: /boot/extlinux/../imx6dl-cubox-i-emmc-som-v15.dtb
37002 bytes read in 4 ms (8.8 MiB/s)
Kernel image @ 0x12000000 [ 0x000000 - 0x90ff48 ]
## Flattened Device Tree blob at 18000000
   Booting using the fdt blob at 0x18000000
   Loading Device Tree to 1fff3000, end 1ffff089 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.10.48 (user at vm-user)
(arm-none-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
10.2-2020.11 (1
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7),
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: SolidRun Cubox-i Solo/DualLite
(1.5som+emmc)
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 64 MiB at 0x4c000000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
[    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
[    0.000000] Initmem setup node 0 [mem
0x0000000010000000-0x000000004fffffff]
[    0.000000] percpu: Embedded 20 pages/cpu s51692 r8192 d22036 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260608
[    0.000000] Kernel command line: root=PARTUUID= rootwait rw
console=ttymxc0,115200,115200
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 943528K/1048576K available (14336K kernel code,
2026K rwdata, 4832K rodata, 1024K init, 6662K bss, 39512K reserved, 655)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Running RCU self tests
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU lockdep checking is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=2.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is
10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] L2C-310 erratum 769419 enabled
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9
[    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
[    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
[    0.000000] L2C-310 cache controller enabled, 16 ways, 512 kB
[    0.000000] L2C-310: CACHE_ID 0x410000c8, AUX_CTRL 0x76450001
[    0.000000] random: get_random_bytes called from
start_kernel+0x348/0x574 with crng_init=0
[    0.000000] Switching to timer-based delay loop, resolution 333ns
[    0.000009] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps
every 715827882841ns
[    0.000039] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 637086815595 ns
[    0.001686] Console: colour dummy device 80x30
[    0.001740] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc.,
Ingo Molnar
[    0.001765] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.001788] ... MAX_LOCK_DEPTH:          48
[    0.001810] ... MAX_LOCKDEP_KEYS:        8192
[    0.001833] ... CLASSHASH_SIZE:          4096
[    0.001855] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.001877] ... MAX_LOCKDEP_CHAINS:      65536
[    0.001897] ... CHAINHASH_SIZE:          32768
[    0.001920]  memory used by lock dependency info: 4061 kB
[    0.001941]  memory used for stack traces: 2112 kB
[    0.001961]  per task-struct memory footprint: 1536 bytes
[    0.002085] Calibrating delay loop (skipped), value calculated using
timer frequency.. 6.00 BogoMIPS (lpj=30000)
[    0.002130] pid_max: default: 32768 minimum: 301
[    0.002539] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes,
linear)
[    0.002590] Mountpoint-cache hash table entries: 2048 (order: 1, 8192
bytes, linear)
[    0.006242] CPU: Testing write buffer coherency: ok
[    0.006385] CPU0: Spectre v2: using BPIALL workaround
[    0.007427] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.010874] Setting up static identity map for 0x10100000 - 0x10100078
[    0.011688] rcu: Hierarchical SRCU implementation.
[    0.014022] smp: Bringing up secondary CPUs ...
[    0.017509] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.017527] CPU1: Spectre v2: using BPIALL workaround
[    0.018946] smp: Brought up 1 node, 2 CPUs
[    0.018986] SMP: Total of 2 processors activated (12.00 BogoMIPS).
[    0.019018] CPU: All CPU(s) started in SVC mode.
[    0.022057] devtmpfs: initialized
[    0.063493] VFP support v0.3: implementor 41 architecture 3 part 30
variant 9 rev 4
[    0.066465] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.066553] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.070688] pinctrl core: initialized pinctrl subsystem
[    0.077076] NET: Registered protocol family 16
[    0.107065] DMA: preallocated 256 KiB pool for atomic coherent
allocations
[    0.113522] thermal_sys: Registered thermal governor 'step_wise'
[    0.114089] cpuidle: using governor menu
[    0.114287] CPU identified as i.MX6DL, silicon rev 1.3
[    0.558214] vdd1p1: supplied by regulator-dummy
[    0.582288] vdd3p0: supplied by regulator-dummy
[    0.605599] vdd2p5: supplied by regulator-dummy
[    0.628714] vddarm: supplied by regulator-dummy
[    0.653073] vddpu: supplied by regulator-dummy
[    0.675519] vddsoc: supplied by regulator-dummy
[    1.452530] No ATAGs?
[    1.452970] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
watchpoint registers.
[    1.453087] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    1.456969] debugfs: Directory 'dummy-iomuxc-gpr at 20e0000' with parent
'regmap' already present!
[    1.458726] imx6dl-pinctrl 20e0000.pinctrl: initialized IMX pinctrl
driver
[    1.590610] mxs-dma 110000.dma-apbh: initialized
[    1.593096] reg-fixed-voltage regulator-vcc-3v3: Failed to register
regulator: -517
[    1.593659] reg-fixed-voltage regulator-nvcc-sd1: Failed to register
regulator: -517
[    1.596634] v_usb2: supplied by v_5v0
[    1.602189] v_usb1: supplied by v_5v0
[    1.607638] vgaarb: loaded
[    1.610307] SCSI subsystem initialized
[    1.613252] usbcore: registered new interface driver usbfs
[    1.613571] usbcore: registered new interface driver hub
[    1.613773] usbcore: registered new device driver usb
[    1.614276] usb_phy_generic usbphynop1: supply vcc not found, using
dummy regulator
[    1.615620] usb_phy_generic usbphynop2: supply vcc not found, using
dummy regulator
[    1.620939] i2c i2c-1: IMX I2C adapter registered
[    1.624277] i2c i2c-2: IMX I2C adapter registered
[    1.625422] mc: Linux media interface: v0.10
[    1.625593] videodev: Linux video capture interface: v2.00
[    1.626325] pps_core: LinuxPPS API ver. 1 registered
[    1.626362] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    1.626452] PTP clock support registered
[    1.628533] Advanced Linux Sound Architecture Driver Initialized.
[    1.632805] Bluetooth: Core ver 2.22
[    1.633008] NET: Registered protocol family 31
[    1.633044] Bluetooth: HCI device and connection manager initialized
[    1.633197] Bluetooth: HCI socket layer initialized
[    1.633252] Bluetooth: L2CAP socket layer initialized
[    1.633457] Bluetooth: SCO socket layer initialized
[    1.636389] clocksource: Switched to clocksource mxc_timer1
[    3.144167] VFS: Disk quotas dquot_6.6.0
[    3.144388] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096
bytes)
[    3.188123] NET: Registered protocol family 2
[    3.188775] IP idents hash table entries: 16384 (order: 5, 131072 bytes,
linear)
[    3.192616] tcp_listen_portaddr_hash hash table entries: 512 (order: 2,
22528 bytes, linear)
[    3.192758] TCP established hash table entries: 8192 (order: 3, 32768
bytes, linear)
[    3.192943] TCP bind hash table entries: 8192 (order: 6, 327680 bytes,
linear)
[    3.194062] TCP: Hash tables configured (established 8192 bind 8192)
[    3.194849] UDP hash table entries: 512 (order: 3, 49152 bytes, linear)
[    3.195070] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes,
linear)
[    3.195837] NET: Registered protocol family 1
[    3.198949] RPC: Registered named UNIX socket transport module.
[    3.199073] RPC: Registered udp transport module.
[    3.199110] RPC: Registered tcp transport module.
[    3.199143] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    3.201109] PCI: CLS 0 bytes, default 64
[    3.203910] hw perfevents: no interrupt-affinity property for /pmu,
guessing.
[    3.204674] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7
counters available
[    3.211751] Initialise system trusted keyrings
[    3.212746] workingset: timestamp_bits=30 max_order=18 bucket_order=0
[    3.242972] NFS: Registering the id_resolver key type
[    3.243181] Key type id_resolver registered
[    3.243302] Key type id_legacy registered
[    3.243721] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    3.243853] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    3.244067] jffs2: version 2.2. (NAND) ?? 2001-2006 Red Hat, Inc.
[    3.246547] fuse: init (API version 7.32)
[    3.343801] Key type asymmetric registered
[    3.343982] Asymmetric key parser 'x509' registered
[    3.344395] bounce: pool size: 64 pages
[    3.344569] io scheduler mq-deadline registered
[    3.344609] io scheduler kyber registered
[    3.374083] imx-sdma 20ec000.sdma: Direct firmware load for
imx/sdma/sdma-imx6q.bin failed with error -2
[    3.374216] imx-sdma 20ec000.sdma: Falling back to sysfs fallback for:
imx/sdma/sdma-imx6q.bin
[    3.390467] 2020000.serial: ttymxc0 at MMIO 0x2020000 (irq = 33,
base_baud = 5000000) is a IMX
[    4.290520] printk: console [ttymxc0] enabled
[    4.301043] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq = 74,
base_baud = 5000000) is a IMX
[    4.310572] serial serial0: tty port ttymxc3 registered
[    4.355253] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    4.362207] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    4.367947] etnaviv-gpu 130000.gpu: model: GC880, revision: 5106
[    4.374854] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    4.384613] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on
minor 0
[    4.404128] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
ipu_crtc_ops)
[    4.412455] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
ipu_crtc_ops)
[    4.421413] dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.31a
with HDCP (DWC HDMI 3D TX PHY)
[    4.439377] imx-drm display-subsystem: bound 120000.hdmi (ops
dw_hdmi_imx_ops)
[    4.450307] [drm] Initialized imx-drm 1.0.0 20120507 for
display-subsystem on minor 1
[    4.460341] imx-drm display-subsystem: [drm] Cannot find any crtc or
sizes
[    4.468745] imx-ipuv3 2400000.ipu: IPUv3H probed
[    4.517139] brd: module loaded
[    4.568763] loop: module loaded
[    4.586082] libphy: Fixed MDIO Bus: probed
[    4.592465] CAN device driver interface
[    4.606720] pps pps0: new PPS source ptp0
[    4.616054] libphy: fec_enet_mii_bus: probed
[    4.627300] mdio_bus 2188000.ethernet-1: MDIO device at address 4 is
missing.
[    4.637090] fec 2188000.ethernet eth0: registered PHC device 0
[    4.646910] usbcore: registered new interface driver r8152
[    4.652589] usbcore: registered new interface driver lan78xx
[    4.658586] usbcore: registered new interface driver asix
[    4.664151] usbcore: registered new interface driver ax88179_178a
[    4.670630] usbcore: registered new interface driver cdc_ether
[    4.676786] usbcore: registered new interface driver smsc95xx
[    4.682697] usbcore: registered new interface driver net1080
[    4.688735] usbcore: registered new interface driver cdc_subset
[    4.694832] usbcore: registered new interface driver zaurus
[    4.700657] usbcore: registered new interface driver MOSCHIP
usb-ethernet driver
[    4.708492] usbcore: registered new interface driver cdc_ncm
[    4.714186] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    4.720839] ehci-pci: EHCI PCI platform driver
[    4.725462] ehci-mxc: Freescale On-Chip EHCI Host driver
[    4.732164] usbcore: registered new interface driver usb-storage
[    4.764349] rtc-pcf8523 2-0068: registered as rtc0
[    4.772548] rtc-pcf8523 2-0068: setting system clock to
2021-07-12T19:31:34 UTC (1626118294)
[    4.787791] snvs_rtc 20cc000.snvs:snvs-rtc-lp: registered as rtc1
[    4.794474] i2c /dev entries driver
[    4.802539] Registered IR keymap rc-empty
[    4.807579] rc rc0: gpio_ir_recv as /devices/platform/ir-receiver/rc/rc0
[    4.815037] input: gpio_ir_recv as
/devices/platform/ir-receiver/rc/rc0/input0
[    4.838945] Bluetooth: HCI UART driver ver 2.3
[    4.843437] Bluetooth: HCI UART protocol H4 registered
[    4.849054] Bluetooth: HCI UART protocol LL registered
[    4.861476] sdhci: Secure Digital Host Controller Interface driver
[    4.867800] sdhci: Copyright(c) Pierre Ossman
[    4.872192] sdhci-pltfm: SDHCI platform and OF driver helper
[    4.881185] sdhci-esdhc-imx 2190000.mmc: allocated mmc-pwrseq
[    4.887542] caam 2100000.crypto: Entropy delay = 3200
[    4.899481] sdhci-esdhc-imx 2194000.mmc: Got CD GPIO
[    4.948362] caam 2100000.crypto: Instantiated RNG4 SH0
[    5.009120] caam 2100000.crypto: Instantiated RNG4 SH1
[    5.014320] caam 2100000.crypto: device ID = 0x0a16010000000100 (Era 4)
[    5.021039] caam 2100000.crypto: job rings = 2, qi = 0
[    5.057178] caam algorithms registered in /proc/crypto
[    5.068003] caam 2100000.crypto: registering rng-caam
[    5.086379] Bluetooth: hci0: Failed to get CTS
[    5.200178] usbcore: registered new interface driver usbhid
[    5.205790] usbhid: USB HID core driver
[    5.214679] ipu1_csi0: Registered ipu1_csi0 capture as /dev/video0
[    5.222948] ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as
/dev/video1
[    5.231171] ipu1_ic_prpvf: Registered ipu1_ic_prpvf capture as
/dev/video2
[    5.239654] ipu1_csi1: Registered ipu1_csi1 capture as /dev/video3
[    5.377884] random: fast init done
[    5.499641] random: crng init done
[    5.973687] NET: Registered protocol family 10
[    5.982786] Segment Routing with IPv6
[    5.987555] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    5.996511] NET: Registered protocol family 17
[    6.001039] can: controller area network core
[    6.005708] NET: Registered protocol family 29
[    6.010342] can: raw protocol
[    6.013593] can: broadcast manager protocol
[    6.018063] can: netlink gateway - max_hops=1
[    6.023127] Key type dns_resolver registered
[    6.043909] Registering SWP/SWPB emulation handler
[    6.049478] Loading compiled-in X.509 certificates
[    6.200377] vcc_3v3: supplied by v_5v0
[    6.207777] nvcc_sd1: supplied by vcc_3v3
[    6.214828] imx_usb 2184000.usb: No over current polarity defined
[    6.231603] ci_hdrc ci_hdrc.0: EHCI Host Controller
[    6.237082] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus
number 1
[    6.267069] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[    6.275202] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.10
[    6.283835] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    6.291190] usb usb1: Product: EHCI Host Controller
[    6.296109] usb usb1: Manufacturer: Linux 5.10.48 ehci_hcd
[    6.301702] usb usb1: SerialNumber: ci_hdrc.0
[    6.312343] hub 1-0:1.0: USB hub found
[    6.316695] hub 1-0:1.0: 1 port detected
[    6.327894] imx_usb 2184200.usb: No over current polarity defined
[    6.339158] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    6.344150] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus
number 2
[    6.376963] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    6.383880] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.10
[    6.392311] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    6.399675] usb usb2: Product: EHCI Host Controller
[    6.404596] usb usb2: Manufacturer: Linux 5.10.48 ehci_hcd
[    6.410193] usb usb2: SerialNumber: ci_hdrc.1
[    6.418167] hub 2-0:1.0: USB hub found
[    6.422123] hub 2-0:1.0: 1 port detected
[    6.442087] imx-media: Registered ipu_ic_pp csc/scaler as /dev/video4
[    6.453000] imx_thermal 20c8000.anatop:tempmon: Commercial CPU
temperature grade - max:95C critical:90C passive:85C
[    6.470307] sdhci-esdhc-imx 2190000.mmc: allocated mmc-pwrseq
[    6.471652] sdhci-esdhc-imx 2194000.mmc: Got CD GPIO
[    6.490474] input: gpio-keys as /devices/platform/gpio-keys/input/input1
[    6.499189] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    6.513500] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    6.517298] mmc1: SDHCI controller on 2194000.mmc [2194000.mmc] using
ADMA
[    6.522053] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[    6.527175] mmc2: SDHCI controller on 2198000.mmc [2198000.mmc] using
ADMA
[    6.535696] platform regulatory.0: Falling back to sysfs fallback for:
regulatory.db
[    6.551309] ALSA device list:
[    6.554567]   #0: Integrated SPDIF
[    6.596867] mmc1: host does not support reading read-only switch,
assuming write-enable
[    6.609357] mmc1: new high speed SDHC card at address e624
[    6.619699] mmcblk1: mmc1:e624 SU08G 7.40 GiB
[    6.635306]  mmcblk1: p1
[    6.644400] mmc2: new DDR MMC card at address 0001
[    6.653869] mmcblk2: mmc2:0001 8GTF4R 7.28 GiB
[    6.659312] mmcblk2boot0: mmc2:0001 8GTF4R partition 1 4.00 MiB
[    6.666051] mmcblk2boot1: mmc2:0001 8GTF4R partition 2 4.00 MiB
[    6.673264] mmcblk2rpmb: mmc2:0001 8GTF4R partition 3 512 KiB, chardev
(243:0)
[    6.684266]  mmcblk2:
[    6.729418] mmc0: SDHCI controller on 2190000.mmc [2190000.mmc] using
ADMA
[    6.743785] VFS: PARTUUID= is invalid.
[    6.743785] Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%d]
[    6.753671] Disabling rootwait; root= is invalid.
[    6.761962] VFS: Cannot open root device "PARTUUID=" or
unknown-block(0,0): error -6
[    6.769977] Please append a correct "root=" boot option; here are the
available partitions:
[    6.778524] 0100           65536 ram0
[    6.778543]  (driver?)
[    6.784711] 0101           65536 ram1
[    6.784728]  (driver?)
[    6.791006] 0102           65536 ram2
[    6.791024]  (driver?)
[    6.797252] 0103           65536 ram3
[    6.797271]  (driver?)
[    6.803435] 0104           65536 ram4
[    6.803451]  (driver?)
[    6.809681] 0105           65536 ram5
[    6.809698]  (driver?)
[    6.815859] 0106           65536 ram6
[    6.815875]  (driver?)
[    6.822127] 0107           65536 ram7
[    6.822144]  (driver?)
[    6.828373] 0108           65536 ram8
[    6.828390]  (driver?)
[    6.834553] 0109           65536 ram9
[    6.834570]  (driver?)
[    6.840803] 010a           65536 ram10
[    6.840820]  (driver?)
[    6.847161] 010b           65536 ram11
[    6.847178]  (driver?)
[    6.853432] 010c           65536 ram12
[    6.853450]  (driver?)
[    6.859770] 010d           65536 ram13
[    6.859788]  (driver?)
[    6.866038] 010e           65536 ram14
[    6.866055]  (driver?)
[    6.872372] 010f           65536 ram15
[    6.872390]  (driver?)
[    6.878728] b300         7761920 mmcblk1
[    6.878750]  driver: mmcblk
[    6.885610]   b301           61440 mmcblk1p1 00000000-01
[    6.885628]
[    6.892570] b308         7634944 mmcblk2
[    6.892591]  driver: mmcblk
[    6.899508] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
[    6.908210] CPU0: stopping
[    6.911158] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.48 #1
[    6.917193] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    6.923772] [<c0111484>] (unwind_backtrace) from [<c010bbfc>]
(show_stack+0x10/0x14)
[    6.931560] [<c010bbfc>] (show_stack) from [<c0e3dd70>]
(dump_stack+0xdc/0x104)
[    6.938904] [<c0e3dd70>] (dump_stack) from [<c010f2c0>]
(do_handle_IPI+0x348/0x3a0)
[    6.946592] [<c010f2c0>] (do_handle_IPI) from [<c010f32c>]
(ipi_handler+0x14/0x20)
[    6.954194] [<c010f32c>] (ipi_handler) from [<c01a06a0>]
(handle_percpu_devid_fasteoi_ipi+0xc4/0x2f4)
[    6.963450] [<c01a06a0>] (handle_percpu_devid_fasteoi_ipi) from
[<c0199c30>] (__handle_domain_irq+0x84/0xfc)
[    6.973313] [<c0199c30>] (__handle_domain_irq) from [<c060169c>]
(gic_handle_irq+0x8c/0xb4)
[    6.981704] [<c060169c>] (gic_handle_irq) from [<c0100b30>]
(__irq_svc+0x70/0x98)
[    6.989213] Exception stack(0xc1601ed8 to 0xc1601f20)
[    6.994292] 1ec0:
00000001 ffffe000
[    7.002501] 1ee0: 00000001 00002947 00000001 00000001 9bbfa37b c16101d8
ef7be0b8 00000001
[    7.010706] 1f00: c17ef0ce c16093d4 00000000 c1601f28 c0a1d42c c0a1d430
20000013 ffffffff
[    7.018923] [<c0100b30>] (__irq_svc) from [<c0a1d430>]
(cpuidle_enter_state+0x150/0x5d0)
[    7.027050] [<c0a1d430>] (cpuidle_enter_state) from [<c0a1d8f4>]
(cpuidle_enter+0x30/0x40)
[    7.035358] [<c0a1d8f4>] (cpuidle_enter) from [<c0162fec>]
(do_idle+0x224/0x304)
[    7.042792] [<c0162fec>] (do_idle) from [<c01634a8>]
(cpu_startup_entry+0x18/0x1c)
[    7.050402] [<c01634a8>] (cpu_startup_entry) from [<c1500dcc>]
(start_kernel+0x494/0x574)
[    7.058612] [<c1500dcc>] (start_kernel) from [<00000000>] (0x0)
[    7.064595] ---[ end Kernel panic - not syncing: VFS: Unable to mount
root fs on unknown-block(0,0) ]---


>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210712/f62459e0/attachment-0002.html>
