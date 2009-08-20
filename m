From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 20 Aug 2009 12:59:28 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090820143514.7c5e56a2@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
	<20090820143514.7c5e56a2@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, August 20, 2009 5:35 AM, Thomas Petazzoni wrote:
>> I just tried that and get the same results.  Maybe I didn't compile
>> it statically?  I just did:
>> 
>> $ arm-none-linux-gnueabi-gcc init.c -o init
>
> Add -static
>
> And verify with "file" that it is indeed statically compiled:
>
> thomas at surf:/tmp$ arm-linux-gcc -o hello hello.c
> thomas at surf:/tmp$ file hello
> hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
> thomas at surf:/tmp$ arm-linux-gcc -o hello hello.c -static
> thomas at surf:/tmp$ file hello
> hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), statically linked, not stripped

Ok.  That works.

rtc-isl1208 0-006f: setting system clock to 2009-08-20 09:31:48 UTC (1250760708)
RAMDISK: gzip image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 120K
run_init_process: /sbin/init
Hello
usb 1-1: configuration #1 chosen from 1 choice
input: HID 04d9:1203 as /devices/platform/ep93xx-ohci/usb1/1-1/1-1:1.0/input/input2
generic-usb 0003:04D9:1203.0001: input: USB HID v1.11 Keyboard [HID 04d9:1203] on usb-ep93xx-1/input0
input: HID 04d9:1203 as /devices/platform/ep93xx-ohci/usb1/1-1/1-1:1.1/input/input3
generic-usb 0003:04D9:1203.0002: input: USB HID v1.11 Device [HID 04d9:1203] on usb-ep93xx-1/input1

But I had to comile the test init as:

$ arm-none-linux-gnueabi-gcc -static -march=armv4t -mcpu=arm920t init.c -o init
$ file init
init: ELF 32-bit LSB executable, ARM, version 1 (SYSV), for GNU/Linux 2.6.14, statically linked, for GNU/Linux 2.6.14, not stripped
$ arm-none-linux-gnueabi-readelf -A init Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "4T"
  Tag_CPU_arch: v4T
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-1
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align8_needed: Yes
  Tag_ABI_enum_size: int

If I compile it without the -march=armv4t -mcpu=arm920t flags I get:

$ arm-none-linux-gnueabi-gcc -static init.c -o init
$ arm-none-linux-gnueabi-readelf -A init Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "ARM10TDMI"
  Tag_CPU_arch: v5T
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-1
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align8_needed: Yes
  Tag_ABI_enum_size: int

Can I just add the -march=armv4t -mcpu=arm920t to BR2_TARGET_OPTIMIZATION?  I 
previously just tried setting it to -march=armv4t but got a linker error about
a lib file being the wrong version.

The CodeSourcery compiler has a strange directory structure, probably due to
supporting various arm cpu's.  I'm not sure how to configure buildroot so that
the correct library files are used.

The directory tree looks something like this:

$ tree arm-none-linux-gnueabi/ -d -L 3
arm-none-linux-gnueabi/
|-- bin
|-- include
|   `-- c++
|       `-- 4.3.3
|-- lib
|   |-- armv4t
|   |-- boards
|   |-- ldscripts
|   `-- thumb2
`-- libc
    |-- armv4t
    |   |-- etc
    |   |-- lib
    |   |-- sbin
    |   `-- usr
    |-- etc
    |-- lib
    |-- sbin
    |-- thumb2
    |   |-- etc
    |   |-- lib
    |   |-- sbin
    |   `-- usr
    `-- usr
        |-- bin
        |-- include
        |-- info
        |-- lib
        |-- libexec
        |-- man
        |-- sbin
        `-- share

Regards,
Hartley
