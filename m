From: Ted Salazar <ted.salazar@maximintegrated.com>
Date: Sun, 24 May 2015 00:26:27 -0700 (PDT)
Subject: [Buildroot] Help for another newbie,
 AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi
Message-ID: <1432452387471-101939.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm designing a board that is based on the sam9x25-ek but I am using the ek
until my board is assembled. I installed Code Sourcery 2014 and have built
the following:

1. Built the At91Bootstrap Ver 3.7.2:
location: tsalazar at Ubuntu14-64:~/at91bootstrap/binaries/
Output file: at91sam9x5ek-nandflashboot-uboot-3.7.2.bin

2. Built Uboot ver 2015.01:
location: tsalazar at Ubuntu14-64:~/u-boot-at91/
Output file: u-boot.bin

3. Built the Kernel ver 3.6.9  (I plan to upgrade to 3.18 but I'm trying to
duplicate a working demo first)
location: tsalazar at Ubuntu14-64:~/linux-at91/arch/arm/boot/
Output file: at91sam9x25ek.dtb  
location: tsalazar at Ubuntu14-64:~/linux-at91/arch/arm/boot/
Output file: zImage

4. Built buildroot-at91 ver 2014.05 ( This is where I have all my problems)

https://github.com/linux4sam/buildroot-at91/tree/buildroot-2014.05-at91/configs

I can't find a at91sam9x25ek_defconfig file to use. I was told that any
at91sam9 would work for my file system so I tried using
at91sam9263ek_defconfig.

at91rm9200df_defconfig	configs: update boards to u-boot custom version
option	2 years ago
at91sam9260dfc_defconfig	at91sam9260dfc_defconfig: fix linux defconfig name
2 years ago
at91sam9260eknf_defconfig	defconfigs: add the _AT_LEAST_X_Y headers options
a year ago
at91sam9261ek_defconfig	at91sam9261ek_defconfig: fix linux defconfig name	2
years ago
at91sam9263ek_defconfig	at91sam92*: update defconfigs to use latest u-boot	3
years ago
at91sam9g20dfc_defconfig	defconfigs: add the _AT_LEAST_X_Y headers options	a
year ago
at91sam9g45m10ek_defconfig	at91sam9m10g45ek: add gst-launch preview support

After I do the following commands I get a .ubi file

$ make at91sam9263ek_defconfig
$ make menuconfig
$ make

location: tsalazar at Ubuntu14-64:~/buildroot-at91/output/images
Output file: rootfs.ubi

When I replace all the files in Atmel's NandFlash Demo script with all of
these output files the debug hangs here at the rootfs. 
 
UBIFS error (pid 1): ubifs_mount: cannot open "ubi0:rootfs", error -19
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0): error -19
Please append a correct "root=" boot option; here are the available
partitions:
1f00             256 mtdblock0  (driver?)
1f01             512 mtdblock1  (driver?)
1f02             256 mtdblock2  (driver?)
1f03             256 mtdblock3  (driver?)
1f04             256 mtdblock4  (driver?)
1f05             512 mtdblock5  (driver?)
1f06            6144 mtdblock6  (driver?)
1f07          253952 mtdblock7  (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

Q1) Does someone know where I can get an at91sam9x25ek_defconfig file for
BuildRoot-at91 Ver 2014.05?

Q2)Maybe even more importantly, I know I need to understand how much each
bootloader stage and the file system uses up the in NandFlash. What is best
practices way of setting up the memory map? I assume this is done at every
build stage in menuconfig?

I grabbed this from the debug on boot but I am just using defaults at this
point and need to know where I set the memory map and best practices and
what I should watch out for.

Creating 8 MTD partitions on "atmel_nand":
0x000000000000-0x000000040000 : "bootstrap"
0x000000040000-0x0000000c0000 : "uboot"
0x0000000c0000-0x000000100000 : "env"
0x000000100000-0x000000140000 : "env_redundant"
0x000000140000-0x000000180000 : "spare"
0x000000180000-0x000000200000 : "dtb"
0x000000200000-0x000000800000 : "kernel"
0x000000800000-0x000010000000 : "rootfs"

I'm going to call it day and try to learn more about ubi tomorrow.

Any words of wisdom even if it is a link to must have reading is welcome.

Thanks,
Ted Salazar

PS: I am also not sure what the env and env_redundant is for. If someone is
familiar with that terminology please tell.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Help-for-another-newbie-AT91sam9x25-incorrect-defconfig-or-incorrect-rootfs-ubi-tp101939.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
