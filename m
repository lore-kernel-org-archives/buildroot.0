From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 20 Jul 2011 15:38:14 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <20110715143053.558a756a@skate>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
Message-ID: <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Jul 15, 2011 at 2:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 15 Jul 2011 08:34:34 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> > The depend statement causes the vmlinux target only to be available
>> > for mips processors.
>> > For powerpc for example, only uImage and zImage are selectable.
>> >
>> > However, I'd like to have vmlinux in the output/images directory.
>> > First of all because I am directly loading this on target, rather than
>> > uImage or zImage.
>
> If vmlinux is useful on powerpc platforms, then it should be added to
> the list of architectures for which vmlinux is proposed.
>
>> In fact I have more problems with this version encoding in the output
>> build/linux-X directory:
>> * I need to get to the vmlinux file (mentioned above)
>
> Just need to add "|| BR2_powerpc" as you suggested.

I'm not sure why you want to restrict this to specific architectures
instead of allowing it for all.
What is wrong with the following?

diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -131,7 +131,6 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN

 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
-	depends on BR2_mips || BR2_mipsel

 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"


It will be up to the user/developer to decide what kind of output he
wants. The linux kernel Makefile will always generate vmlinux. Whether
it is of direct use for a certain architecture is another question.
Most developers will select e.g. uImage for use with U-boot, but some
(like us) may want to do our own transformations on vmlinux to package
it in another way (e.g. with a proprietary bootloader).

>
>> * I need to get to the dtc (device tree compiler) which resides in
>> <linux>/scripts/dtc/dtc
>
> This tool looks like a useful host tool built by the kernel. Maybe we
> should install it in $(HOST_DIR)/usr/bin ?

Yes, I agree. How do you do that?

>
>> * I need to be able to compile external kernel modules, so in that
>> Makefile I need to point to the right kernel directory.
>
> Ok. Those could be integrated as Buildroot packages, in which case
> getting access to the Linux source directory is easy.

Good point. I'll have to add Mercurial support in buildroot to get there though.

>
>> If you stick with one kernel version, then you can hardcode it in the
>> relevant scripts and Makefiles. However, when switching to another
>> version, you have to update all of these files.
>> One approach to solve all of this would be to create a symbolic link
>> output/build/linux, pointing to the output/build/linux-X directory
>> corresponding to the actually configured version.
>
> I think I'd prefer something like :
>
> $ make <pkg>-show-srcdir
>
> which would be implemented at the package infrastructure, and which
> would return the source directory of a particular package. This way,
> you can easily ask where a given package source code has been extracted
> by Buildroot.

I like this as well. It's simple and generic.
I'm not sure whether it still is needed after I include the .config though.

Thanks,
Thomas
