From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 12 Jul 2013 09:26:14 -0500
Subject: [Buildroot] About using ti-gfx package with custom kernel
In-Reply-To: <51E00313.8090205@linkas.com.tr>
References: <51DEC9F8.7010800@linkas.com.tr>
 <CAEBucnBBL0t4+wmLkWEu1ot+a1Ut6f9kz9r81-zh939yEwM5wA@mail.gmail.com>
 <51E00313.8090205@linkas.com.tr>
Message-ID: <CAEBucnC4DXNHatBhJY0YUUZua5fEeCTwENvyvsfYr6TgCXc4CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sinan,

> I had a problem with toolchain binary. I am using a custom toolchain but
> ti-gfx package was trying to compile with default toolchain
> (linux-arm-none-gnueabi- I guess). I changed the toolchain binary name in
> output/build/ti-gfx-4_09_00_01/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxARMV7/make_platform.mak
> and in makefile located at
> output/build/ti-gfx-4_09_00_01/GFX_Linux_SDK/OGLES2/SDKPackage/Tools/OGLES2/Build/LinuxARMV7/
> (I can't find exact paths and filenames since I'm rebuilding whole
> filesystem right now)

Yes, I have seen this problem and have a fix in the next version of
this patch series.  I'll push that out today.

> I couldn't change it from the makefile in output/build/ti-gfx or any other
> place higher in filesystem hierarchy. According to the makefiles above
> setting CROSS_COMPILER variable should be ok but that doesn't help somehow.
>
> Just wanted to say I'm able to build powervr driver right now. I will try to
> solve the toolchain problem within buildroot's config/makefiles and send you
> what I did.

^^ see above.

> Also I can't seem to send mail to buildroot maillist. I guessed adding
> buildroot at busybox.net should be enough. Any ideas?
>
> Thanks again for your help;
> Sinan Akpolat
>
> 11.7.2013 18:59 tarihinde, Spenser Gilliland yazd?:
>>
>> On Thu, Jul 11, 2013 at 10:06 AM, Sinan Akpolat <sinan@linkas.com.tr>
>> wrote:
>>>
>>> Hi,
>>>
>>> I want to thank Spenser for his great work on TI's PowerVR driver
>>> package.
>>>
>>> I couldn't test it yet and I need to ask something about that.
>>>
>>> The package needs Linux kernel to be selected. However I'm using a custom
>>> kernel provided by the board manufacturer. How can I make buildroot use
>>> that
>>> kernel? Or what is the correct way?
>>>
>>> Should I copy my custom kernel directory to output/build and change
>>> version
>>> to suffix of the directory name
>>>
>>> Or should I edit the makefiles and make buildroot (TI_GFX package more
>>> specifically) use my custom kernel's path while compiling PowerVR
>>> drivers?
>>>
>>> I guess this was discussed last month but I couldn't see how that
>>> discussion
>>> ended.
>>>
>>> Thanks again for the package,
>>> Sinan Akpolat
>>
>> Sinan,
>>
>> The best way to do this is to use the Kernel menu to configure a
>> source for your kernel (e.g. download a tarball, git tree, or patch on
>> top of a specific kernel version.) However, if the vendor does not
>> provide any of these methods, you can use the
>> LINUX_OVERRIDE_SRCDIR=<path/to/kernelsrc> which will override the
>> settings in the Kernel menu and use the local directory on your
>> machine.
>>
>> FWIW: <PKG>_OVERRIDE_SRCDIR is a way to provide a source tree to
>> Buildroot for any package and is a useful variable for many other
>> packages.
>>
>> The kernel menu will need to know the defconfig you are intending to
>> build and the load address (if version > 3.7).  If you need a custom
>> defconfig, the common solution is to create a directory in
>> board/<vendor>/<boardname>  with the kernel defconfig you would like
>> to use. This defconfig can then be referenced by the kernel menu by
>> setting BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG to y and
>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE to
>> board/<vendor>/<boardname>/linux_defconfig.
>>
>> A good reference on using Buildroot for custom projects is
>> http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf
>> and the buildroot manual at
>> http://buildroot.uclibc.org/downloads/manual/manual.html .
>>
>> Hope this information helps and thanks for reviewing this patch!
>>
>> Thanks,
>> Spenser
>>
>> --
>> Spenser Gilliland
>> Computer Engineer
>> Doctoral Candidate
>
>



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
