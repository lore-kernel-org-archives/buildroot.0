From: Casey Carr <caseyc@cipheroptics.com>
Date: Mon, 10 May 2010 10:54:24 -0400
Subject: [Buildroot] Buildroot rootfs hanging in /sbin/init
Message-ID: <4BE81E20.2010006@cipheroptics.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can anyone help me get by this issue?

I am new to Buildroot.  We are attempting to switch to Buildroot for a 
root fs supplied by a root fs third party vendor.    We have had our 
current root fs running on this device for years.   When I try to boot 
to Compact FLASH partition with the Buildroot generated output/target  
file system installed on it, the boot hangs immediately when the 
/sbin/init process is executed.   I was able to boot this same device on 
our exist root fs and then "chroot" to the Buildroot root fs installed 
on a partition in the Compact FLASH..   Prior  to trying to boot 
directly to the Buildroot roof fs, I was able to executed some basic 
file system commands and it appears that the busybox binary is working 
properly on our target.

Here are some details about my build:

1) Cross compiled for a MIPS target
2) Using uClibc
3) Kernel is configured for ext3
4) Buildroot fs configured for ext2
5) 0:<5>Kernel command line: root=/dev/hda5 console=/dev/ttyS0 
mem=136m at 48m mem=64 at 192m  console=ttyS0,38400  rdinit=/sbin/init
6) Kernel was built with another cross compile tool chain based on GCC 3.4.x
7) I'm using: buildroot-2010.05_rc1


I added some printk() to the kernel code to confirm that /sbin/init is 
being called.  Here is a dump of the boot output:

0:<5>0:Linux version 2.6.21.7 (gcc version 4.2.2) #7 SMP PREEMPT Mon May 
10 09:14:53 EDT 2010
0:Enabling Bridge Workaround
0:Physical Address Map
0:    0000000000 --> 00000fffff ( Memory )
0:    0000100000 --> 000c0fffff ( Memory )
0:    000c100000 --> 000fffffff ( Memory )
0:    0010000000 --> 001bffffff (  *** HOLE *** )
0:    001c000000 --> 001dffffff ( Flash Controller Space )
0:    001e000000 --> 001eefffff (  *** HOLE *** )
0:    001ef00000 --> 001effffff ( Phoenix IO Space )
0:    001f000000 --> 001fffffff (  *** HOLE *** )
0:    0020000000 --> 0027ffffff ( Memory )
0:    0028000000 --> 002bffffff ( Memory )
0:    002c000000 --> 002dffffff ( Memory )
0:    002e000000 --> 002effffff ( Memory )
0:    002f000000 --> 002fffffff ( Memory )
0:    0030000000 --> fffffffffe (  *** HOLE *** )
0:Initializing message ring for cpu_0
0:CPU revision is: 000c0604
0:Determined physical RAM map:
0: memory: 0b700000 @ 00100000 0:(usable)
0: memory: 04000000 @ 0c000000 0:(usable)
0: memory: 10000000 @ 20000000 0:(usable)
0:User-defined physical RAM map:
0: memory: 08800000 @ 03000000 0:(usable)
0: memory: 00000040 @ 0c000000 0:(usable)
0:<6>Wasting 393216 bytes for tracking 12288 unused pages
0:<6>Initrd not found or empty0: - disabling initrd
0:<7>On node 0 totalpages: 49152
0:<7>  DMA zone: 384 pages used for memmap
0:<7>  DMA zone: 0 pages reserved
0:<7>  DMA zone: 48768 pages, LIFO batch:15
0:<7>  Normal zone: 0 pages used for memmap
0:<7>  HighMem zone: 0 pages used for memmap
0:(PROM) CPU present map: ff
0:Phys CPU present map: ff, possible map ff
0:Detected 8 Slave CPU(s)
0:Built 1 zonelists.  Total pages: 48768
0:<5>Kernel command line: root=/dev/hda5 console=/dev/ttyS0 mem=136m at 48m 
mem=64 at 192m  console=ttyS0,38400  rdinit=/sbin/init
0:Primary instruction cache 32kB, 8-way, linesize 32 bytes.
0:Primary data cache 32kB 8-way, linesize 32 bytes.
0:PID hash table entries: 1024 (order: 10, 4096 bytes)
0:Using 66.667 MHz high precision timer. cycles_per_jiffy=800000
0:Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
0:Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
0:<6>Memory: 127232k/139264k available (4342k kernel code, 11920k 
reserved, 872k data, 164k init, 0k highmem)
0:<7>Calibrating delay loop... 0:175.61 BogoMIPS (lpj=87808)
0:<6>Security Framework v1.0.0 initialized
0:<6>Capability LSM initialized
0:Mount-cache hash table entries: 512
1:CPU revision is: 000c0604
1:<7>Calibrating delay loop... 1:186.36 BogoMIPS (lpj=93184)
2:CPU revision is: 000c0604
2:<7>Calibrating delay loop... 2:261.63 BogoMIPS (lpj=130816)
3:CPU revision is: 000c0604
3:<7>Calibrating delay loop... 3:396.28 BogoMIPS (lpj=198144)
4:CPU revision is: 000c0604
4:<7>Calibrating delay loop... 4:177.15 BogoMIPS (lpj=88576)
4:Initializing message ring for cpu_4
5:CPU revision is: 000c0604
5:<7>Calibrating delay loop... 5:194.56 BogoMIPS (lpj=97280)
6:CPU revision is: 000c0604
6:<7>Calibrating delay loop... 6:311.29 BogoMIPS (lpj=155648)
7:CPU revision is: 000c0604
7:<7>Calibrating delay loop... 7:528.38 BogoMIPS (lpj=264192)
0:<6>Brought up 8 CPUs
1:migration_cost=1:10001:
0:<6>NET: Registered protocol family 16
0:<5>SCSI subsystem initialized
0:<7>libata version 2.20 loaded.
0:<6>usbcore: registered new interface driver usbfs
0:<6>usbcore: registered new interface driver hub
0:<6>usbcore: registered new device driver usb
0:<6>Time: MIPS clocksource has been installed.
0:<6>NET: Registered protocol family 2
0:IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
0:TCP established hash table entries: 8192 (order: 5, 131072 bytes)
0:TCP bind hash table entries: 8192 (order: 4, 98304 bytes)
0:<6>TCP: Hash tables configured (established 8192 bind 8192)
0:<6>TCP reno registered
0:created rmi_timer proc fs entry
0:<6>JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat, Inc.
0:<6>io scheduler noop registered
0:<6>io scheduler anticipatory registered (default)
0:<6>io scheduler deadline registered
0:<6>io scheduler cfq registered
0:Registered phoenix msgring driver: major=244
0:<6>RMI RNG registered
0:Registered tracebuffer driver with Major No. [240]
0:RMISEC device registered with major number = 242
0:CO root jumper character driver initialized as co_rootjumper
0:CO selftest character driver initialized as co_selftest
0:<6>Serial: 8250/16550 driver $Revision: 1.1.1.7.2.11 $ 4 ports, IRQ 
sharing disabled
0:<6>serial8250: ttyS0 at MMIO 0x0 (irq = 17) is a 16550A
0:<6>serial8250: ttyS1 at MMIO 0x0 (irq = 18) is a 16550A
0:RAMDISK driver initialized: 16 RAM disks of 32768K size 1024 blocksize
0:<6> sbulla:0: unknown partition table
0:<6>Intel(R) PRO/1000 Network Driver - version 7.3.20-k2
0:<6>Copyright (c) 1999-2006 Intel Corporation.
0:Initializing spi4 ethernet driver
0:<6>This board does not support spi4
0:Initializing Phoenix MAC
0:<7>=============================================
0:<7>Running on XLR platform
0:<7>=============================================
0:Initializing GMAC configuration for CEP-100
0:GMAC_0 initialized as eth0
0:GMAC_1 initialized as eth1
0:GMAC_2 initialized as eth2
0:Registered user_mac driver: major=241
0:<6>Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
0:<6>ide: Assuming 50MHz system bus speed for PIO modes; override with 
idebus=xx
0:Initializing Phoenix PCMCIA IDE...
0:Phoenix PCMCIA configured as IDE interface = 0
0:<7>Probing IDE interface ide0...
0:hda: SanDisk SDCFX3-2048, 0:CFA DISK drive
0:ide0 at 0xbd0001f1-0xbd0001f8,0xbd0003f7 on irq 210:
0:<6>hda: max request size: 128KiB
0:<6>hda: 4001760 sectors (2048 MB)0: w/1KiB Cache0:, CHS=3970/16/630:
0:<6> hda:0: hda10: hda20: hda30: hda40: <0: hda50: hda60: >0:
0:<5>SPS Flash: probing 16-bit flash bus
0:<6>SPS Flash: Found 1 x16 devices at 0x0 in 16-bit bank
0: Intel/Sharp Extended Query Table at 0x0031
0:<6>Using buffer write method
0:<5>cfi_cmdset_0001: Erase suspend on write enabled
0:<7>erase region 0: offset=0x0,size=0x20000,blocks=128
0:<5>Creating 1 MTD partitions on "SPS Flash":
0:<5>0x00800000-0x01000000 : "User FS"
0:<6>mtd: Giving out device 0 to User FS
0:<6>Initializing USB Mass Storage driver...
0:<6>usbcore: registered new interface driver usb-storage
0:<6>USB Mass Storage support registered.
0:Intializing BK-3220 I2C Host Adapter...0:done.
0:i2c-palm-bk3220: Added I2C Bus 0.
0:Intializing BK-3220 I2C Host Adapter...0:done.
0:i2c-palm-bk3220: Added I2C Bus 1.
0:Registering Phoenix I2C based Temperature Sensor driver...
0:<6>: Found MAX6657 on Palm Chip BK3220 Adapter Bus 0
0:Phoenix Chip temperature is 255 degrees Celsius
0:Registering Phoenix I2C based DS1374 RTC driver...
0:<6> : device detected on Palm Chip BK3220 Adapter Bus 0
0:<4>i2c_adapter i2c-1: Client creation failed at 0x68 (-16)
0:Registering CEP I2C based Analog Devices fan driver...
0:<6>: Probing for ADT7463 Fan
0:palm_rx: ACKERR. Aborting...
0:<7>I2C Read Fail.
0:<7>adt7463_read: i2c_transfer failed, ret=-5
0:<7>adt7463_probe: Device ADT7463 not found on Palm Chip BK3220 Adapter 
Bus 0
0:<6>: Probing for ADT7463 Fan
0:Registering CEP I2C based Tx Instruments Temp Monitor driver...
0:<6>: Probing for TMP401 Temp Sensor
0:palm_rx: ACKERR. Aborting...
0:<7>I2C Read Fail.
0:<7>tmp401_read: i2c_transfer failed, ret=-5
0:<7>tmp401_probe: Device TMP401 not found on Palm Chip BK3220 Adapter Bus 0
0:<6>: Probing for TMP401 Temp Sensor
0:palm_rx: ACKERR. Aborting...
0:<7>I2C Read Fail.
0:<7>tmp401_read: i2c_transfer failed, ret=-5
0:<7>tmp401_probe: Device TMP401 not found on Palm Chip BK3220 Adapter Bus 1
0:Registering CEP I2C based EEPROM driver...
0:<6>: Probing for I2C EEPROM
0:Registering Phoenix I2C based DS1678 RTC driver...
0:palm_rx: ACKERR. Aborting...
0:<7>I2C Read Fail.
0:<4>i2c_adapter i2c-0: Client creation failed at 0x4a (-6)
0:palm_rx: ACKERR. Aborting...
0:<7>I2C Read Fail.
0:<4>i2c_adapter i2c-1: Client creation failed at 0x4a (-6)
0:Registering Phoenix I2C based M41ST87 RTC driver...
0:ip_tables: (C) 2000-2006 Netfilter Core Team
0:<6>TCP cubic registered
0:<6>Initializing XFRM netlink socket
0:<6>NET: Registered protocol family 1
0:<6>NET: Registered protocol family 10
0:ip6_tables: (C) 2000-2006 Netfilter Core Team
0:<6>IPv6 over IPv4 tunneling driver
0:<6>NET: Registered protocol family 17
0:<6>NET: Registered protocol family 15
0:[init/do_mounts.c:prepare_namespace:424]
0:[init/do_mounts.c:prepare_namespace:435]
0:[init/do_mounts.c:prepare_namespace:451]
0:[init/do_mounts_initrd.c:initrd_load:119]
0:[init/do_mounts_initrd.c:initrd_load:121]
0:[init/do_mounts.c:prepare_namespace:458]
7:<6>kjournald starting.  Commit interval 5 seconds
0:<6>EXT3-fs: mounted filesystem with ordered data mode.
0:VFS: Mounted root (ext3 filesystem) readonly.
0:<6>Freeing unused kernel memory: 164k freed
0:<4>Warning: unable to open an initial console.
0:KJC
0:Jumping to Userland...
0:calling /sbin/init
0:calling kernel_execve /sbin/init



The information contained in this message may be privileged and confidential and protected from disclosure. If the reader of this message is not the intended recipient, or an employee or agent responsible for delivering this message to the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited. If you have received this communication in error, please notify us immediately by replying to the message and deleting all copies. Thank you.
