From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 31 Oct 2015 15:10:38 +0100
Subject: [Buildroot] [PATCH v5 24/36] package/enlightenment: bump to
 version 0.19.12
In-Reply-To: <20151025162832.GV11692@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-25-git-send-email-romain.naour@openwide.fr>
 <20151025162832.GV11692@free.fr>
Message-ID: <5634CBDE.3030308@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 25/10/2015 17:28, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
>> Use the newly added libefl package wich provide a new version
>> of efl libraries.
>> This new version needs libelementary dependency.
>>
>> Update upstream url, add hash file and use xz archive.
>>
>> Select png and jpeg image loader since enlightenment_start
>> fail at runtime if png and jpeg image loader are not
>> available in elf libraries.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>> v5: Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
>>     remove comment on dependencies
>> v4: update Config.in to use libefl
>>     improve commit log
>>     keep the dependency on threads
>> v3: bymp to 0.19.12
>>     remove trailing slash (Vicente Bergas)
>> v2: bump to 0.19.9
>>     remove glibc only dependency
>> ---
>>  package/enlightenment/Config.in          | 36 +++++++-------------------------
>>  package/enlightenment/enlightenment.hash |  2 ++
>>  package/enlightenment/enlightenment.mk   | 22 +++++++------------
>>  3 files changed, 17 insertions(+), 43 deletions(-)
>>  create mode 100644 package/enlightenment/enlightenment.hash
>>
>> diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
>> index 58f8f39..4a349fb 100644
>> --- a/package/enlightenment/Config.in
>> +++ b/package/enlightenment/Config.in
>> @@ -1,33 +1,16 @@
>>  config BR2_PACKAGE_ENLIGHTENMENT
>>  	bool "enlightenment"
>> -	select BR2_PACKAGE_EFL
>> -	select BR2_PACKAGE_LIBECORE
>> -	select BR2_PACKAGE_LIBECORE_X
>> -	select BR2_PACKAGE_LIBEINA
>> -	select BR2_PACKAGE_LIBEET
>> -	select BR2_PACKAGE_LIBEVAS
>> -	select BR2_PACKAGE_LIBEVAS_JPEG
>> -	select BR2_PACKAGE_LIBEVAS_PNG
>> -	select BR2_PACKAGE_LIBEVAS_EET
>> -	select BR2_PACKAGE_LIBECORE_EVAS
>> -	select BR2_PACKAGE_LIBEDJE
>> -	select BR2_PACKAGE_LIBEFREET
>> -	select BR2_PACKAGE_LIBEDBUS
>> -	select BR2_PACKAGE_LIBEIO
>> -	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
>> +	select BR2_PACKAGE_LIBEFL_X
>> +	select BR2_PACKAGE_LIBEFL_JPEG # needed at runtime by enlightenment_start
>> +	select BR2_PACKAGE_LIBEFL_PNG # needed at runtime by enlightenment_start
>> +	select BR2_PACKAGE_LIBELEMENTARY
>>  	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
>>  	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
>> -	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
>> -	depends on BR2_USE_WCHAR
>> -	depends on BR2_INSTALL_LIBSTDCPP
>> -	# libedbus -> dbus
>> -	# libedbus -> glib2, libevas
>> -	depends on BR2_TOOLCHAIN_HAS_THREADS
>> -	# libedbus -> dbus, efl libraries
>> -	depends on BR2_USE_MMU
>> -	depends on BR2_PACKAGE_XORG7
>> +	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
>>  	# libevas-generic-loaders-svg -> librsvg -> pango -> cairo
>>  	depends on BR2_ARCH_HAS_ATOMICS
>> +	depends on BR2_PACKAGE_EFL
>> +	depends on BR2_PACKAGE_XORG7
> 
> I really do not like those depends that go after the selects. It is
> more complex to read.
> 
> Even though the ordering has absolutely no consequences in Kconfig, it
> is not logical (when reading). It is more logical and far easier to
> understand when depends come first, followed by the selects.
> 
> (i.e it runs as thus in my head: this stuff needs foo and bar, so it
> depends on them. Then, once dependenecies are fullfilled, I can select
> other stuff.)
> 
> Note: it is not your fault, the code was already laid out thusly before
> your patch. Still, this is looking ugly to me.

Ok, I'll add some clean up patches then.

> 
>> diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
>> index ddebe06..9127099 100644
>> --- a/package/enlightenment/enlightenment.mk
>> +++ b/package/enlightenment/enlightenment.mk
>> @@ -4,24 +4,18 @@
>>  #
>>  ################################################################################
>>  
>> -ENLIGHTENMENT_VERSION = 0.17.6
>> -ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases
>> +ENLIGHTENMENT_VERSION = 0.19.12
>> +ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
>> +ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
>>  ENLIGHTENMENT_LICENSE = BSD-2c
>>  ENLIGHTENMENT_LICENSE_FILES = COPYING
>>  
>> -ENLIGHTENMENT_DEPENDENCIES = 	\
>> -	host-pkgconf 		\
>> -	libecore 		\
>> -	libeet 			\
>> -	libeina 		\
>> -	libevas 		\
>> +ENLIGHTENMENT_DEPENDENCIES = \
>> +	host-pkgconf \
>> +	host-libefl \
>> +	libefl \
>> +	libelementary \
>>  	libevas-generic-loaders \
>> -	libedje 		\
>> -	libefreet 		\
>> -	libedbus 		\
>> -	libeio 			\
>> -	host-libedje 		\
>> -	host-libeet		\
>>  	xcb-util-keysyms
>>  
>>  ENLIGHTENMENT_CONF_OPTS = \
> 
> A bit later in that file, we have:
> 
>     # alsa backend needs mixer support
>     ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
>     ENLIGHTENMENT_DEPENDENCIES += alsa-lib

Probably I should add :
ENLIGHTENMENT_CONF_ENV += enable_alsa=yes

>     else
>     ENLIGHTENMENT_CONF_ENV += enable_alsa=no
>     endif
> 
> However, you previously said, when introducing libefl, that alsa support
> was not working at all (even when alsa-lib was found).
> 
> How does that affect the enlightment package?

It seems that there is a optional module mixer which use alsa.
As far I understand this support doesn't come from efl libraries.

Also I added --disable-pam and --disable-systemd to ENLIGHTENMENT_CONF_OPTS
since the support is auto detected.

Best regards,
Romain
> 
> Regards,
> Yann E. MORIN.
> 
