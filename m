From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:03:32 +0200
Subject: [Buildroot] [PATCH v3 04/11] board/qemu: add IBM s390x and Z
 arch support
In-Reply-To: <a79e13e6-902e-c351-c292-383660e06451@gmail.com>
References: <20200916055934.609436-1-egorenar@linux.ibm.com>
 <20200916055934.609436-5-egorenar@linux.ibm.com>
 <a79e13e6-902e-c351-c292-383660e06451@gmail.com>
Message-ID: <87wo0t2gob.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain Naour <romain.naour@gmail.com> writes:

> Other qemu_*_defconfig select host-qemu to build qemu-system-<arch> for gitlab
> runtime testing:
>
> # host-qemu for gitlab testing
> BR2_PACKAGE_HOST_QEMU=y
> BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
>
> But this require to add s309x to BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS:
>
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index 7ccf768d15..a7c0f7bf59 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_powerpc64
>  	default y if BR2_powerpc64le
>  	default y if BR2_riscv
> +	default y if BR2_s390x
>  	default y if BR2_sh
>  	default y if BR2_sparc
>  	default y if BR2_sparc64
>

Fixed.

> While testing with QEMU emulator version 5.1.0 built by Buildroot I get:
>
> VFIO - User Level meta-driver version: 0.3
> illegal operation: 0001 ilc:1 [#1] SMP
> Modules linked in: s390_trng(+) rng_core aes_s390 des_s390 libdes virtio_net
> net_failover failover vfio_ccw vfio_mdev mdev vfio_iommu_type1 sha_common vfio
> CPU: 0 PID: 135 Comm: udevd Not tainted 5.8.7 #1
> Hardware name: QEMU 2964 QEMU (KVM/Linux)
> Krnl PSW : 0704f00180000000 000003ff8001d078 (trng_init+0x78/0x190 [s390_trng])
>            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:3 PM:0 RI:0 EA:3
> Krnl GPRS: 000000008fcb9458 0000000000000000 00000000fcbf3614 0000000000000001
>            0000000000000000 0000000000000002 0000000000000004 0000000002ad35c0
>            0000000000000ac0 000003ff8001d190 0000000000000000 000003ff8000e300
>            00000000fcb14000 0000000000001b78 000003ff8001d056 000003e0007cfc90
> Krnl Code: 000003ff8001d06c: a714fffe		brc	1,000003ff8001d068
>            000003ff8001d070: 9120f0ae		tm	174(%r15),32
>           #000003ff8001d074: a774001b		brc	7,000003ff8001d0aa
>           >000003ff8001d078: c010ffff8bc8	larl	%r1,000003ff8000e808
>            000003ff8001d07e: e32010000002	ltg	%r2,0(%r1)
>            000003ff8001d084: a7840073		brc	8,000003ff8001d16a
>            000003ff8001d088: e55c20180004	chsi	24(%r2),4
>            000003ff8001d08e: a7c4006e		brc	12,000003ff8001d16a
> Call Trace:
> [<000003ff8001d078>] trng_init+0x78/0x190 [s390_trng]
> ([<000003ff8001d056>] trng_init+0x56/0x190 [s390_trng])
>  [<0000000000100818>] do_one_initcall+0x40/0x1f0
>  [<0000000000207cd2>] do_init_module+0x6a/0x290
>  [<000000000020950a>] __do_sys_finit_module+0xaa/0xc8
>  [<0000000000b9801c>] system_call+0xe0/0x2b0
> Last Breaking-Event-Address:
>  [<000003ff8001d05c>] trng_init+0x5c/0x190 [s390_trng]
> Kernel panic - not syncing: Fatal exception: panic_on_oops
>
>
> I'm not sure it's a kernel or qemu issue because I can't reproduce with qemu
> installed on a Fedora 31 (QEMU emulator version 4.1.1 (qemu-4.1.1-1.fc31)).
>
> Best regards,
> Romain

Hmm, i also built now qemu with build root and it worked on my Fedora 32:
(both x86_64 w/o KVM and s390x arch w/ KVM). I assume you tested it on
x86_64 ?

$ $O/host/bin/qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 8G -smp 2     -kernel $O/images/bzImage -drive file=$O/images/rootfs.ext2,if=virtio,format=raw     -append "rootwait root=/dev/vda net.ifnames=0 biosdevn
ame=0" -display none -serial mon:stdio     -net nic,model=virtio -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22
qemu-system-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
qemu-system-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
qemu-system-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
qemu-system-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
KASLR disabled: CPU has no PRNG
[    0.366192] Linux version 5.8.7 (egorenar at oc8242746057.ibm.com) (s390x-buildroot-linux-gnu-gcc.br_real (Buildroot 2020.08-440-gd397680877) 9.3.0, GNU ld (GNU Binutils) 2.33.1) #1 SMP Thu Sep 17 05:40:47 CEST 2020
[    0.367132] setup: Linux is running under KVM in 64-bit mode
[    0.378878] setup: The maximum memory size is 8192MB
[    0.381460] cpu: 2 configured CPUs, 0 standby CPUs
[    0.549806] Write protected kernel read-only data: 13692k
[    0.702248] Zone ranges:
[    0.703255]   DMA      [mem 0x0000000000000000-0x000000007fffffff]
[    0.703551]   Normal   [mem 0x0000000080000000-0x00000001ffffffff]
[    0.703572] Movable zone start for each node
[    0.703600] Early memory node ranges
[    0.703690]   node   0: [mem 0x0000000000000000-0x00000001ffffffff]
[    0.704078] Initmem setup node 0 [mem 0x0000000000000000-0x00000001ffffffff]
[    0.845299] percpu: Embedded 33 pages/cpu s97536 r8192 d29440 u135168
[    0.847210] Built 1 zonelists, mobility grouping on.  Total pages: 2064384
[    0.847231] Policy zone: Normal
[    0.847376] Kernel command line: rootwait root=/dev/vda net.ifnames=0 biosdevname=0
[    0.855783] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.858843] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.859540] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.937081] Memory: 2338108K/8388608K available (10588K kernel code, 2040K rwdata, 3104K rodata, 3984K init, 868K bss, 181584K reserved, 0K cma-reserved)
[    0.940272] SLUB: HWalign=256, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.940847] ftrace: allocating 32039 entries in 126 pages
[    1.061896] ftrace: allocated 126 pages with 6 groups
[    1.068028] rcu: Hierarchical RCU implementation.
[    1.068048] rcu:     RCU event tracing is enabled.
[    1.068090] rcu:     RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=2.
[    1.068166]  Trampoline variant of Tasks RCU enabled.
[    1.068178]  Rude variant of Tasks RCU enabled.
[    1.068191]  Tracing variant of Tasks RCU enabled.
[    1.068238] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    1.068268] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    1.093052] NR_IRQS: 3, nr_irqs: 3, preallocated irqs: 3
[    1.096730] clocksource: tod: mask: 0xffffffffffffffff max_cycles: 0x3b0a9be803b0a9, max_idle_ns: 1805497147909793 ns
[    1.099514] Console: colour dummy device 80x25
[    1.104248] printk: console [ttyS1] enabled
[    1.105646] pid_max: default: 32768 minimum: 301
[    1.106518] LSM: Security Framework initializing
[    1.109539] SELinux:  Initializing.
[    1.110262] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    1.110368] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    1.140651] rcu: Hierarchical SRCU implementation.
[    1.144236] smp: Bringing up secondary CPUs ...
[    1.152450] smp: Brought up 1 node, 2 CPUs
[    1.515206] node 0 deferred pages initialised in 350ms
[    1.530903] devtmpfs: initialized
[    1.538658] random: get_random_u32 called from bucket_table_alloc.isra.0+0x82/0x120 with crng_init=0
[    1.543445] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.543607] futex hash table entries: 512 (order: 5, 131072 bytes, linear)
[    1.545667] xor: automatically using best checksumming function   xc
[    1.548274] NET: Registered protocol family 16
[    1.550071] audit: initializing netlink subsys (disabled)
[    1.551922] audit: type=2000 audit(1600315128.497:1): state=initialized audit_enabled=0 res=1
[    1.553782] Spectre V2 mitigation: execute trampolines
[    1.814726] random: fast init done
[    1.987222] raid6: vx128x8  gen()  1011 MB/s
[    2.157294] raid6: vx128x8  xor()   547 MB/s
[    2.157351] raid6: using algorithm vx128x8 gen() 1011 MB/s
[    2.157372] raid6: .... xor() 547 MB/s, rmw enabled
[    2.157421] raid6: using s390xc recovery algorithm
[    2.159340] iommu: Default domain type: Translated
[    2.161263] SCSI subsystem initialized
[    2.683143] VFS: Disk quotas dquot_6.6.0
[    2.683353] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    2.684534] hugetlbfs: disabling because there are no supported hugepage sizes
[    2.732575] NET: Registered protocol family 2
[    2.737609] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
[    2.737836] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    2.738519] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    2.740623] TCP: Hash tables configured (established 65536 bind 65536)
[    2.742981] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    2.743274] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    2.745077] NET: Registered protocol family 1
[    2.757493] alg: No test for crc32be (crc32be-vx)
[    2.762879] hypfs: The hardware system does not support hypfs
[    2.764030] hypfs: Initialization of hypfs failed with rc=-61
[    2.769089] Initialise system trusted keyrings
[    2.770831] workingset: timestamp_bits=45 max_order=21 bucket_order=0
[    2.788848] zbud: loaded
[    2.794585] fuse: init (API version 7.31)
[    2.795653] SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
[    2.905985] Key type asymmetric registered
[    2.906073] Asymmetric key parser 'x509' registered
[    2.906342] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    2.907547] io scheduler mq-deadline registered
[    2.907631] io scheduler kyber registered
[    2.908075] io scheduler bfq registered
[    2.910166] atomic64_test: passed
[    2.911657] hvc_iucv: The z/VM IUCV HVC device driver cannot be used without z/VM
[    2.948459] brd: module loaded
[    2.951788] NET: Registered protocol family 10
[    2.958401] Segment Routing with IPv6
[    2.958456] RPL Segment Routing with IPv6
[    2.958788] NET: Registered protocol family 17
[    2.959937] Key type dns_resolver registered
[    2.961092] cio: Channel measurement facility initialized using format extended (mode autodetected)
[    2.966237] Discipline DIAG cannot be used without z/VM
[    2.969156] sclp_sd: Store Data request failed (eq=2, di=3, response=0x40f0, flags=0x00, status=0, rc=-5)
[    2.970659] ap: The hardware system does not support AP instructions
[    2.970722] qeth: loading core functions
[    2.971417] qeth: register layer 2 discipline
[    2.971449] qeth: register layer 3 discipline
[    2.974893] registered taskstats version 1
[    2.975016] Loading compiled-in X.509 certificates
[    3.001380] virtio_blk virtio0: [vda] 122880 512-byte logical blocks (62.9 MB/60.0 MiB)
[    3.001570] vda: detected capacity change from 0 to 62914560
[    3.151745] Loaded X.509 cert 'Build time autogenerated kernel key: f969dcdeea2f380a65e90408b4162836b4f4bd54'
[    3.152559] zswap: loaded using pool lzo/zbud
[    3.155266] Key type ._fscrypt registered
[    3.155305] Key type .fscrypt registered
[    3.155326] Key type fscrypt-provisioning registered
[    3.162518] Btrfs loaded, crc32c=crc32c-vx
[    3.163798] ima: No TPM chip found, activating TPM-bypass!
[    3.163951] ima: Allocated hash algorithm: sha256
[    3.165442] ima: No architecture policies found
[    3.170318] md: Waiting for all devices to be available before autodetect
[    3.170343] md: If you don't use raid, use raid=noautodetect
[    3.173128] md: Autodetecting RAID arrays.
[    3.173164] md: autorun ...
[    3.173182] md: ... autorun DONE.
[    3.180925] EXT4-fs (vda): mounting ext2 file system using the ext4 subsystem
[    3.189583] EXT4-fs (vda): mounted filesystem without journal. Opts: (null)
[    3.189814] VFS: Mounted root (ext2 filesystem) readonly on device 253:0.
[    3.192099] devtmpfs: mounted
[    3.202738] Freeing unused kernel memory: 3984K
[    3.229208] Write protected read-only-after-init data: 68k
[    3.229418] Run /sbin/init as init process
[    3.422295] EXT4-fs (vda): re-mounted. Opts: (null)
[    3.422803] ext2 filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Populating /dev using udev: [    4.347761] udevd[123]: starting version 3.2.9
[    4.370370] random: udevd: uninitialized urandom read (16 bytes read)
[    4.374602] random: udevd: uninitialized urandom read (16 bytes read)
[    4.375309] random: udevd: uninitialized urandom read (16 bytes read)
[    4.450209] udevd[124]: starting eudev-3.2.9
[    5.055589] VFIO - User Level meta-driver version: 0.3
done
Saving random seed: [    6.566095] urandom_read: 4 callbacks suppressed
[    6.566122] random: dd: uninitialized urandom read (512 bytes read)
OK
Starting network: udhcpc: started, v1.32.0
udhcpc: sending discover
udhcpc: sending select for 10.0.2.15
udhcpc: lease of 10.0.2.15 obtained, lease time 86400
deleting routers
adding dns 10.0.2.3
OK

Welcome to Buildroot
buildroot login: QEMU: Terminated



Thanks for review
Regards
Alex
