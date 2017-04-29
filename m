From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 15:24:55 +0200
Subject: [Buildroot] [PATCH v7 31/31] package/kodi: Add support for more
	archs
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-32-bernd.kuhls@t-online.de>
 <20170429134404.0f6c1442@free-electrons.com>
Message-ID: <7qgetdxnoe.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 29 Apr 2017 13:44:04 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sat, 29 Apr 2017 10:37:51 +0200, Bernd Kuhls wrote:
> 
>>  package/kodi/0003-Add-support-for-sh4.patch     | 108
>>  ++++++++++++++++++++++++
>>  package/kodi/0004-Add-support-for-sparc.patch   |  91
>>  ++++++++++++++++++++ package/kodi/0005-Add-support-for-arc.patch     |
>>   91 ++++++++++++++++++++
>>  package/kodi/0006-Add-support-for-xtensa.patch  |  91
>>  ++++++++++++++++++++
> 
> Have these patches any chance of being merged upstream? Indeed, it's
> very unlikely that Kodi will ever be used on any of those architectures,
> so having to carry forever those patches doesn't seem like a great
> thing. I would prefer to exclude those architectures in Config.in.

the patches are currently under review upstream, based on their decision 
I will sent the next version of this patch.

>>  	depends on BR2_USE_MMU # libcdio, and others
>> -	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) 
||
>> BR2_i386 || BR2_x86_64) \
>> -		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
>> -		&& BR2_TOOLCHAIN_HAS_SYNC_8 +# i386: needs sse (see 
upstream PR
>> 10351)
>> +	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
>> +		&& !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
> 
> Kodi doesn't really support all architectures, since it contains
> architecture-specific definitions in several files...

I am not sure that I understood what you mean here. The result of testpkg 
shows that Kodi is not built for all archs, mostly because of the 
restrictions from BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS and BR2_USE_MMU.

>> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>> +KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi +KODI_DEPENDENCIES +=
>> rpi-userland +ifeq
>> ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
>> +KODI_CONF_OPTS += -DWITH_CPU=$(BR2_GCC_TARGET_CPU)
> 
> Why only for Raspberry Pi ?

These CPU-specific options are only needed for rbpi:
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/
ArchSetup.cmake#L13

>> +endif +else  # BR2_PACKAGE_RPI_USERLAND +ifeq
>> ($(BR2_arceb)$(BR2_arcle),y)
>> +KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc +else ifeq
>> ($(BR2_armeb),y)
>>  KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
>> -else ifeq ($(BR2_mips),y)
> 
> MIPS is handled here...

Not anymore, because I removed the check for mips ...

>> -KODI_CONF_OPTS += -DWITH_ARCH=mips -DWITH_CPU=mips -else ifeq
>> ($(BR2_i386),y)
>> -KODI_CONF_OPTS += -DWITH_ARCH=i486-linux
>> -DWITH_CPU=$(BR2_GCC_TARGET_ARCH)
>> -else ifeq ($(BR2_x86_64),y)
>> -KODI_CONF_OPTS += -DWITH_ARCH=x86_64-linux -DWITH_CPU=x86_64 +else
>> ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> 
> ... and here.

and re-added it here for all mips archs.

>> +KODI_CONF_OPTS += \
>> +	-DWITH_ARCH=mips$(if $(BR2_ARCH_IS_64),64) \
>> +	-DWITH_CPU=mips$(if $(BR2_ARCH_IS_64),64)
>> +else ifeq ($(BR2_powerpc)$(BR2_powerpc64le),y)
>> +KODI_CONF_OPTS += \
>> +	-DWITH_ARCH=powerpc$(if $(BR2_ARCH_IS_64),64) \
>> +	-DWITH_CPU=powerpc$(if $(BR2_ARCH_IS_64),64)
>> +else ifeq ($(BR2_powerpc64)$(BR2_sparc64),y)
>> +KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
>> +else ifeq ($(BR2_sh4),y)
>> +KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
>> +else ifeq ($(BR2_xtensa),y)
>> +KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
> 
> You can refactor those in one single assignment.

Done.

Regards, Bernd
