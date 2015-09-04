From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Sep 2015 10:16:12 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E94CE5.1010308@imgtec.com>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <55E94CE5.1010308@imgtec.com>
Message-ID: <55E9534C.3070708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-09-15 09:48, Vicente Olivert Riera wrote:
> Dear Yann E. MORIN,
> 
> I think you forgot to add "v2" to the subject prefix and also list the
> changes between v1 and v2.
> 
> On 09/04/2015 12:47 AM, Yann E. MORIN wrote:
>> Furthermore, this means we're no longer supporting a split-usr setup, so
>> the corresponding configure options have been removed as well for
>> systemd and, when using a merged /usr, for eudev as well.
> 
> taking the last line of that comment into account...
> 
>> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
>> index 1aa74b3..24fe4ed 100644
>> --- a/package/eudev/eudev.mk
>> +++ b/package/eudev/eudev.mk
>> @@ -22,11 +22,9 @@ EUDEV_CONF_ENV += LIBS=-lrt
>>  EUDEV_CONF_OPTS =		\
>>  	--disable-manpages	\
>>  	--sbindir=/sbin		\
>> -	--with-rootlibdir=/lib	\
>>  	--libexecdir=/lib	\
>>  	--with-firmware-path=/lib/firmware	\
>>  	--disable-introspection			\
>> -	--enable-split-usr			\
>>  	--enable-libkmod
>>  
>>  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> 
> shouldn't you do that _ONLY_ when BR2_ROOTFS_MERGED_USR is selected?

 In addition, are --sbindir and --libexecdir still needed?

[snip]
>> diff --git a/system/Config.in b/system/Config.in
>> index fad829d..735ad62 100644
>> --- a/system/Config.in
>> +++ b/system/Config.in
>> @@ -88,6 +88,7 @@ config BR2_INIT_SYSTEMD
>>  	depends on BR2_USE_MMU
>>  	depends on !BR2_STATIC_LIBS
>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
>> +	select BR2_ROOTFS_MERGED_USR

 Wouldn't it be more appropriate to move this to package/systemd/Config.in,
which already has all the other selects?

 OTOH, this is a system option while package/systemd/Config.in selects only
packages.

 I think we should reason as follows: if we would ever support building the
systemd package without BR2_INIT_SYSTEMD, would we want to select
BR2_ROOTFS_MERGED_USR? Perhaps the answer is yes, because the systemd package
will simply not work in a split /usr unless --enable-split-usr is passed - which
we don't.

 Anyway, it's probably bikeshedding. But perhaps you can put a rationale in the
commit message for future reference. After all, your commit message is a bit
short at the moment :-P

 Regards,
 Arnout


>>  	select BR2_PACKAGE_SYSTEMD


> 
> Regards,
> 
> Vincent.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
