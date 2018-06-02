From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 2 Jun 2018 16:19:41 +0200
Subject: [Buildroot] [PATCH RFC] linux: disable attribute alias with gcc
 >= 8.1
In-Reply-To: <20180601231238.3db86d56@windsurf>
References: <20180531203745.4799-1-romain.naour@gmail.com>
 <20180601231238.3db86d56@windsurf>
Message-ID: <cf18b203-bc44-f874-1d1b-d4a7a00bf440@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/06/2018 ? 23:12, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Thu, 31 May 2018 22:37:45 +0200, Romain Naour wrote:
>> gcc-8 started warning about function aliases that have a non-matching
>> prototype. This seems rather useful in general, but it causes tons of
>> warnings in the Linux kernel, where we rely on abusing those aliases
>> for system call entry points, in order to sanitze the arguments passed
>> from user space in registers.
>>
>> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
>>
>> Add a new conditional patch that disable the attribute-alias warning
>> introduced by gcc-8 by adding -Wno-attribute-alias to KBUILD_CFLAGS.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
>>
>> Fixes most of build errors reported by toolchains-builder on Gitlab.
>> https://gitlab.com/free-electrons/toolchains-builder/pipelines/22921464
> 
> Thanks, but unfortunately, it doesn't fix a lot of those build errors,
> because your patch doesn't apply as soon as the Linux kernel version is
> a bit different.
> 
> For example, if you take qemu_mips32r2el_malta_defconfig, which builds
> a 4.11.3 kernel, your patch doesn't apply, and so the bug appears.
> 
> So instead, I would like to suggest something like this:
> 
> ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
> endif
> 
> which works without any patch, and therefore works with potentially all
> kernel versions.

Thanks for KCFLAGS, I missed it and tried to use KBUILD_CFLAGS directly...
I wanted to not override KBUILD_CFLAGS from linux.mk to not lose CFLAGS defined
in the Makefile, that is why I use an conditional patch (which is not great).

I'll resend a v2.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
