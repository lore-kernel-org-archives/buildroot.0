From: RR <rob.r374@gmail.com>
Date: Fri, 20 Nov 2020 01:52:02 +0100
Subject: [Buildroot] RTC on STM32 - what is the minimal setup for
 setting&running realtime clock and possibly ntp updating ?
Message-ID: <001401d6bed7$5caa7790$15ff66b0$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I have pretty limited Buildroot build on STM32F769 Discovery board (noMMU
Cortex M7).

 

I have several problems with real time clock on this platform :

-           Clock seems not be running at all (stuck at initial value)

-           Since also openssl based certificate check fails because of
time&date still back on year 2000 I'd at least like to change time to recent
date (even if the clock is nor running). Any way to change this date&time
(log is below) ?

o   I've added hwclock, date and time to busybox config, but it seems I
cannot change time

 

Any similar example, similar experience or any advice regarding rtc on these
devices ?

 

Thanks in advance,

Regards,

Rob.

 

 

Log :

~ # cat /sys/class/rtc/rtc0/time

00:21:01

~ # cat /sys/class/rtc/rtc0/date

2000-01-01

~ # cat /proc/driver/rtc 

rtc_time        : 00:21:01

rtc_date        : 2000-01-01

alrm_time       : 00:00:00

alrm_date       : 2165-01-01

alarm_IRQ       : no

alrm_pending    : no

update IRQ enabled      : no

periodic IRQ enabled    : no

periodic IRQ frequency  : 1

max user IRQ frequency  : 64

24hr            : yes

 

~ # cat /sys/class/rtc/rtc0/date

2000-01-01

 

~ # echo "2020-11-11" > /sys/class/rtc/rtc0/date

sh: write error: Input/output error

 

 

Bootlog :

Starting kernel ...

 

Booting Linux on physical CPU 0x0

Linux version 5.6.15 (robi at Linux) (gcc version 8.4.0 (Buildroot 2020.05)) #1
PREEMPT Thu Nov 19 02:01:35 CET 2020

CPU: ARMv7-M [411fc270] revision 0 (ARMv7M), cr=00000000

CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache

OF: fdt: Machine model: STMicroelectronics STM32F769-DISCO board

Reserved memory: created DMA memory pool at 0xc0ef0000, size 1 MiB

OF: reserved mem: initialized node linux,dma, compatible id shared-dma-pool

Using ARMv7 PMSA Compliant MPU. Region independence: No, Used 6 of 8 regions

Built 1 zonelists, mobility grouping off.  Total pages: 3794

Kernel command line: root=/dev/mmcblk0p1 rootwait rw

Dentry cache hash table entries: 2048 (order: 1, 8192 bytes, linear)

Inode-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)

mem auto-init: stack:off, heap alloc:off, heap free:off

Memory: 12240K/15296K available (1924K kernel code, 166K rwdata, 384K
rodata, 84K init, 115K bss, 3056K reserved, 0K cma-reserved)

rcu: Preemptible hierarchical RCU implementation.

rcu:     RCU event tracing is enabled.

    Tasks RCU enabled.

rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.

NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16

/soc/interrupt-controller at 40013c00: bank0

random: get_random_bytes called from 0xc026953f with crng_init=0

clocksource: arm_system_timer: mask: 0xffffff max_cycles: 0xffffff,
max_idle_ns: 298634427 ns

ARM System timer initialized as clocksource

sched_clock: 32 bits at 100MHz, resolution 10ns, wraps every 21474836475ns

timer at 40000c00: STM32 sched_clock registered

Switching to timer-based delay loop, resolution 10ns

timer at 40000c00: STM32 delay timer registered

clocksource: timer at 40000c00: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 19112604467 ns

/soc/timer at 40000c00: STM32 clockevent driver initialized (32 bits)

Calibrating delay loop (skipped), value calculated using timer frequency..
200.00 BogoMIPS (lpj=1000000)

pid_max: default: 4096 minimum: 301

Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)

Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)

rcu: Hierarchical SRCU implementation.

devtmpfs: initialized

DMA: default coherent area is set

clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
19112604462750000 ns

pinctrl core: initialized pinctrl subsystem

NET: Registered protocol family 16

stm32f769-pinctrl soc:pin-controller: No package detected, use default one

stm32f769-pinctrl soc:pin-controller: GPIOA bank added

stm32f769-pinctrl soc:pin-controller: GPIOB bank added

stm32f769-pinctrl soc:pin-controller: GPIOC bank added

stm32f769-pinctrl soc:pin-controller: GPIOD bank added

stm32f769-pinctrl soc:pin-controller: GPIOE bank added

stm32f769-pinctrl soc:pin-controller: GPIOF bank added

stm32f769-pinctrl soc:pin-controller: GPIOG bank added

stm32f769-pinctrl soc:pin-controller: GPIOH bank added

stm32f769-pinctrl soc:pin-controller: GPIOI bank added

stm32f769-pinctrl soc:pin-controller: GPIOJ bank added

stm32f769-pinctrl soc:pin-controller: GPIOK bank added

stm32f769-pinctrl soc:pin-controller: Pinctrl STM32 initialized

stm32-dma 40026000.dma-controller: STM32 DMA driver registered

stm32-dma 40026400.dma-controller: STM32 DMA driver registered

clocksource: Switched to clocksource timer at 40000c00

NET: Registered protocol family 2

tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes,
linear)

TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)

TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)

TCP: Hash tables configured (established 1024 bind 1024)

UDP hash table entries: 256 (order: 0, 4096 bytes, linear)

UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)

NET: Registered protocol family 1

workingset: timestamp_bits=30 max_order=12 bucket_order=0

io scheduler mq-deadline registered

io scheduler kyber registered

STM32 USART driver initialized

40011000.serial: ttySTM0 at MMIO 0x40011000 (irq = 42, base_baud = 6250000)
is a stm32-usart

printk: console [ttySTM0] enabled

stm32-usart 40011000.serial: rx dma alloc failed

stm32-usart 40011000.serial: interrupt mode used for rx (no dma)

stm32-usart 40011000.serial: tx dma alloc failed

stm32-usart 40011000.serial: interrupt mode used for tx (no dma)

libphy: Fixed MDIO Bus: probed

stm32-dwmac 40028000.ethernet: IRQ eth_wake_irq not found

stm32-dwmac 40028000.ethernet: IRQ eth_lpi not found

stm32-dwmac 40028000.ethernet: PTP uses main clock

stm32-dwmac 40028000.ethernet: User ID: 0x10, Synopsys ID: 0x35

stm32-dwmac 40028000.ethernet:     DWMAC1000

stm32-dwmac 40028000.ethernet: DMA HW capability register supported

stm32-dwmac 40028000.ethernet: RX Checksum Offload Engine supported

stm32-dwmac 40028000.ethernet: COE Type 2

stm32-dwmac 40028000.ethernet: TX Checksum insertion supported

stm32-dwmac 40028000.ethernet: Wake-Up On Lan supported

stm32-dwmac 40028000.ethernet: Enhanced/Alternate descriptors

stm32-dwmac 40028000.ethernet: Enabled extended descriptors

stm32-dwmac 40028000.ethernet: Ring mode enabled

stm32-dwmac 40028000.ethernet: Enable RX Mitigation via HW Watchdog Timer

stm32-dwmac 40028000.ethernet: device MAC address 76:7a:27:74:79:85

libphy: stmmac: probed

stm32_rtc 40002800.rtc: registered as rtc0

stm32_rtc 40002800.rtc: Date/Time must be initialized

mmci-pl18x 40011c00.sdio2: Got CD GPIO

mmci-pl18x 40011c00.sdio2: mmc0: PL180 manf 80 rev8 at 0x40011c00 irq 43,0
(pio)

input: gpio_keys as /devices/platform/gpio_keys/input/input0

stm32_rtc 40002800.rtc: setting system clock to 2000-01-01T00:17:14 UTC
(946685834)

 

Waiting for root device /dev/mmcblk0p1...

mmc0: host does not support reading read-only switch, assuming write-enable

mmc0: new SDHC card at address 0001

mmcblk0: mmc0:0001 EB1QT 29.8 GiB 

mmcblk0: p1 p2

EXT4-fs (mmcblk0p1): mounting ext2 file system using the ext4 subsystem

random: fast init done

EXT4-fs (mmcblk0p1): warning: mounting unchecked fs, running e2fsck is
recommended

EXT4-fs (mmcblk0p1): mounted filesystem without journal. Opts: (null)

VFS: Mounted root (ext2 filesystem) on device 179:1.

devtmpfs: mounted

Freeing unused kernel memory: 84K

This architecture does not have kernel memory protection.

Run /sbin/init as init process

EXT4-fs (mmcblk0p1): re-mounted. Opts: (null)

mount: mounting devpts on /dev/pts failed: No such device

sh: can't execute 'pool_bits/8': No such file or directory

sh: can't execute 'wc': No such file or directory

sh: bad number

Saving random seed: FAIL

Starting network...

stm32-dwmac 40028000.ethernet eth0: PHY [stmmac-0:00] driver [Generic PHY]
(irq=POLL)

stm32-dwmac 40028000.ethernet eth0: No Safety Features support found

stm32-dwmac 40028000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp
supported

stm32-dwmac 40028000.ethernet eth0: configuring for phy/rmii link mode

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201120/cfa7fe16/attachment.html>
