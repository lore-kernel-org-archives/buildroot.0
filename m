From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Aug 2017 15:04:10 +0200
Subject: [Buildroot] WIP: glibc 2.16 bump
In-Reply-To: <6125d920-9dd6-71b5-bb88-c4daa9d7c51b@gmail.com>
References: <a24db610-bef2-c2fc-c9af-ba23cf29cc25@gmail.com>
 <20170812134641.7895db19@windsurf>
 <6125d920-9dd6-71b5-bb88-c4daa9d7c51b@gmail.com>
Message-ID: <50207c65-6029-298c-6b69-f5937a107487@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 12/08/2017 ? 15:04, Romain Naour a ?crit :
> Hi Thomas,
> 
> Le 12/08/2017 ? 13:46, Thomas Petazzoni a ?crit :
>> Hello,
>>
>> On Sat, 12 Aug 2017 12:24:50 +0200, Romain Naour wrote:
>>
>>> I started to look at glibc 2.26 bump.
>>
>> Good!
>>
>>> All patches are uptream but the bump trigger some build issue with gcc 7 (older
>>> gcc version are not tested yet).
>>> For now I'm building only the toolchain on several arch, so no runtime test yet.
>>> How the freeelectron farm can help to test new gcc/libc version ?
>>
>> If you submit the patch and/or push it to some branch somewhere, I can
>> apply it on a branch (not to the official Buildroot tree), and run a
>> test build of all the toolchains configurations, and give you the link
>> to the Gitlab CI build results.
> 
> Can you try with this branch ?
> https://github.com/RomainNaour/buildroot/tree/glibc-2.26

I started a build on gcc farm and the only failing build is powerpc64le.

I added this hunk in gcc.mk

# Since Glibc 2.26, poerpc64le requires double/long double.
# See sysdeps/powerpc/powerpc64le/configure.ac
ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_powerpc64le),yy)
HOST_GCC_COMMON_CONF_OPTS += \
	--with-long-double-128
endif

I updated glibc-2.26 branch on github.

Note: float128 require at least gcc 6.2 or gcc 7.1, so we need to disable older
gcc on powerpc64le with glibc.

Best regards,
Romain

> 
> Best regards,
> Romain
> 
>>
>> Best regards,
>>
>> Thomas
>>
> 
