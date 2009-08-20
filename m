From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 19 Aug 2009 22:29:04 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA4D6@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 19, 2009 6:50 PM, Kelvin Cheung wrote: 
>>>> The kernel and rootfs are both created with Buildroot.
>>>> 
>>>> For the kernel config I have:
>>>> 
>>>> CONFIG_AEABI=y
>>>> CONFIG_OABI_COMPAT=y
>>>> 
>>>> For buildroot's config I have:
>>>> 
>>>> # BR2_ARM_OABI is not set
>>>> BR2_ARM_EABI=y
>>>
>>> That's correct. When I fall into similar issue, I usually end up
>>> writing a very simple init program that does:
>>>
>>> int main(void)
>>> {
>>>	write(1, "Hello\n", 6);
>>>	while(1);
>>> }
>>>
>>> Compile it statically and put it in /sbin/init. Getting this first
>>> basic program to work is a first step.
>>
>> I just tried that and get the same results.  Maybe I didn't compile
>> it statically?  I just did:
>>
>> $ arm-none-linux-gnueabi-gcc init.c -o init
>>
>> Then replaced the /sbin/init link to busybox with the file.  I also
>> loop mounted the rootfs.arm.ext2 filesystem to verify that the file
>> was indeed replaced.
>>
>>>> Is there a similar configuration that needs to be set in Busybox?
>>>
>>> Not that I'm aware of.
>
> This problem happened to me before.
>
> You could use arm-linux-readelf to check out whether the kernel(vmlinux)
> and busybox were compiled with the same architecture version.
>
> In my case, the kernel was v4 while busybox was v5.

Ok.  That "seems" to be the problem.

$ arm-none-linux-gnueabi-readelf -A project_build_arm/ep9307/linux-2.6.30.5/vmlinux
Attribute Section: aeabi
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

$ arm-none-linux-gnueabi-readelf -A project_build_arm/ep9307/busybox-1.13.4/busybox
Attribute Section: aeabi
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

The question is how to fix it...

I tried setting:

BR2_TARGET_OPTIMIZATION="-march=armv4t"

Which is what I think the kernel build does.  The build went along for a while the
gave me an error about a lib file being the wrong version.

Arrgh... Any help?

Thanks,
Hartley
