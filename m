From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 24 Feb 2011 10:48:48 +0100
Subject: [Buildroot] Unable to login to buildroot
Message-ID: <201102241048.48537.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I just compiled 2011.02-rc1 because I wish to use oprofile and it doesn't 
compile in previous versions (known bug). I kept my previous kernel compiled 
with the toolchain from 2010.08 (maybe that's the problem).

I had no problem creating a new system, but I cannot login (there's no 
password in /etc/shadow):

Welcome to the Gandalf acquisition
gandalf login: root
Jan  1 00:00:10 login[254]: root login on 'ttyUL0'

Welcome to the Gandalf acquisition
gandalf login:

And it repeats... I also cannot login via ssh (I configured dropbear) and I 
have a feeling none of the init.d scripts got started. I use the default 
inittab.
The drive is mounted via nfs, and there are some missing stuff (when looking at 
them from the NFS server side):
 
$ ll proc tmp
proc:
total 8
drwxr-xr-x  2 root root 4096 Feb 24 08:31 ./
drwxr-xr-x 16 root root 4096 Feb 24 09:19 ../

tmp:
total 12
drwxrwxrwt  3 root root 4096 Feb 24 09:24 ./
drwxr-xr-x 16 root root 4096 Feb 24 09:19 ../
drwxr-xr-x  2 root root 4096 Feb 24 08:54 ldconfig/
-rw-r--r--  1 root root    0 Feb 24 09:24 utmp

$ cat etc/inittab
null::sysinit:/bin/mount -o remount,rw /
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mkdir -p /dev/pts
null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Set up a couple of getty's
tty1::respawn:/sbin/getty 38400 tty1
tty2::respawn:/sbin/getty 38400 tty2

# Put a getty on the serial port
ttyUL0::respawn:/sbin/getty -L ttyUL0 115200 vt100 # GENERIC_SERIAL

# Logging junk
null::sysinit:/bin/touch /var/log/messages
null::respawn:/sbin/syslogd -n -m 0
null::respawn:/sbin/klogd -n
tty3::respawn:/usr/bin/tail -f /var/log/messages

# Stuff to do for the 3-finger salute
#::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
null::shutdown:/usr/bin/killall klogd
null::shutdown:/usr/bin/killall syslogd
null::shutdown:/bin/umount -a -r
null::shutdown:/sbin/swapoff -a

Anything I overlooked ?

For what it's worth, here's my full boot sequence:

*** Command line edit ***
zImage starting: loaded at 0x00400000 (sp: 0x00561fb0)
Allocating 0x2e65c8 bytes for kernel ...
gunzipping (0x00000000 <- 0x0040d000:0x00560f9a)...done 0x2d08d0 bytes

Linux/PowerPC load: console=ttyUL0,115200 root=/dev/nfs rw ip=bootp
Finalizing device tree... flat tree at 0x56e300
[    0.000000] Using Xilinx Virtex machine description
[    0.000000] Linux version 2.6.35+ (dargaud@lpsc0174x) (gcc version 4.3.5 
(Buildroot 2010.08) ) #22 Wed Feb 23 17:32:1
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000000 -> 0x00007000
[    0.000000]   Normal   empty
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[1] active PFN ranges
[    0.000000]     0: 0x00000000 -> 0x00007000
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total 
pages: 28448
[    0.000000] Kernel command line: console=ttyUL0,115200 root=/dev/nfs rw 
ip=bootp
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 110672k/114688k available (2708k kernel code, 4016k 
reserved, 176k data, 85k bss, 108k init)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xfffdf000..0xfffff000  : fixmap
[    0.000000]   * 0xfde00000..0xfe000000  : consistent mem
[    0.000000]   * 0xfde00000..0xfde00000  : early ioremap
[    0.000000]   * 0xc8000000..0xfde00000  : vmalloc & ioremap
[    0.000000] SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, 
Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  Verbose stalled-CPUs detection is disabled.
[    0.000000] NR_IRQS:512
[    0.000000] clocksource: timebase mult[d55555] shift[22] registered
[    0.000000] Console: colour dummy device 80x25
[   42.950231] pid_max: default: 32768 minimum: 301
[   42.950522] Mount-cache hash table entries: 512
[   42.960539] NET: Registered protocol family 16
[   43.015617] bio: create slab <bio-0> at 0
[   43.024397] Switching to clocksource timebase
[   43.036232] NET: Registered protocol family 2
[   43.037227] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[   43.039215] TCP established hash table entries: 4096 (order: 3, 32768 
bytes)
[   43.039909] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[   43.040303] TCP: Hash tables configured (established 4096 bind 4096)
[   43.040340] TCP reno registered
[   43.040393] UDP hash table entries: 256 (order: 0, 4096 bytes)
[   43.040700] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[   43.041714] NET: Registered protocol family 1
[   43.042979] RPC: Registered udp transport module.
[   43.043035] RPC: Registered tcp transport module.
[   43.043061] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   43.146725] alg: No test for stdrng (krng)
[   43.267337] io scheduler noop registered
[   43.267403] io scheduler deadline registered (default)
[   43.267899] io scheduler cfq registered
[   43.365390] 84000000.serial: ttyUL0 at MMIO 0x84000000 (irq = 16) is a 
uartlite
[   43.624127] console [ttyUL0] enabled
[   43.628764] 84020000.serial: ttyUL1 at MMIO 0x84020000 (irq = 17) is a 
uartlite
[   43.638900] Device Tree Probing 'ethernet'
[   43.642905] xilinx_lltemac 81c00000.ethernet: MAC address is now  0: 
a:35:72:43: 0
[   43.649501] xilinx_lltemac 81c00000.ethernet: XLlTemac: using DMA mode.
[   43.655956] XLlTemac: Dma base address: phy: 0x84600100, virt: 0xc8020100
[   43.662703] XLlTemac: buffer descriptor size: 32768 (0x8000)
[   43.668243] XLlTemac: Allocating DMA descriptors with kmalloc
[   43.673867] XLlTemac: (buffer_descriptor_init) phy: 0x68c8000, virt: 
0xc68c8000, size: 0x8000
[   43.687084] XTemac: PHY detected at address 7.
[   43.693445] xilinx_lltemac 81c00000.ethernet: eth0: Xilinx TEMAC at 
0x81C00000 mapped to 0xC801A000, irq=18
[   43.706689] mice: PS/2 mouse device common for all mice
[   43.710867] oprofile: using timer interrupt.
[   43.717704] TCP cubic registered
[   43.719678] NET: Registered protocol family 17
[   44.233653] eth0: XLlTemac: Options: 0x3fa
[   44.236720] eth0: XLlTemac: allocating interrupt 20 for dma mode tx.
[   44.242989] eth0: XLlTemac: allocating interrupt 19 for dma mode rx.
[   46.259742] eth0: XLlTemac: speed set to 1000Mb/s
[   46.263281] eth0: XLlTemac: Send Threshold = 24, Receive Threshold = 4
[   46.269791] eth0: XLlTemac: Send Wait bound = 254, Receive Wait bound = 254
[   47.280597] Sending BOOTP requests . OK
[   47.288685] IP-Config: Got BOOTP answer from 192.168.1.185, my address is 
192.168.1.233
[   47.296618] IP-Config: Complete:
[   47.298761]      device=eth0, addr=192.168.1.233, mask=255.255.255.0, 
gw=192.168.1.185,
[   47.306625]      host=gandalf, domain=, nis-domain=(none),
[   47.312157]      bootserver=192.168.1.185, rootserver=192.168.1.185, 
rootpath=/media/gandalf,v3,rsize=1024,wsize=3275
[   47.338961] Looking up port of RPC 100005/3 on 192.168.1.185
[   47.381957] VFS: Mounted root (nfs filesystem) on device 0:10.
[   47.386801] Freeing unused kernel memory: 108k init

Welcome to the Gandalf acquisition
gandalf login: 



Bonus question: if you configure buildroot without an FPU, then what is the 
difference between hard floats and soft floats ? Why can you have both and what 
is preferable ?

Thanks
-- 
Guillaume Dargaud
http://www.gdargaud.net/
