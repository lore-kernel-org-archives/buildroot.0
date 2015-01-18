From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 19:57:31 +0100
Subject: [Buildroot] [PATCH 2/3] package/rpm: use external xz library
In-Reply-To: <20150118145937.GH4275@free.fr>
References: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
 <1421580900-15186-2-git-send-email-romain.naour@openwide.fr>
 <20150118145937.GH4275@free.fr>
Message-ID: <54BC021B.7070809@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all

Le 18/01/2015 15:59, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-01-18 12:34 +0100, Romain Naour spake thusly:
>> Fixes:
>> http://autobuild.buildroot.net/results/2c6/2c61562008418ff58fa3085a3342b0e304923073/
> 
> Weird, this build error is about being unable to link with libintl.so
> (indeed while building the xz backend, but still about libintl).

I seems that the internal xz backend is statically linked and needs libintl
library when BR2_NEEDS_GETTEXT_IF_LOCALE is set. But since it's a shared only
build, there is no static libintl available in the sysroot.

> 
> Igues I could use that autobuild failure to test your patch 1/3,
> though...

Yes.

> 
> Otherwise, I have some comments, see below...
> 
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/rpm/Config.in | 1 +
>>  package/rpm/rpm.mk    | 5 ++++-
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
>> index 5ec4167..fe7a38a 100644
>> --- a/package/rpm/Config.in
>> +++ b/package/rpm/Config.in
>> @@ -31,6 +31,7 @@ config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
>>  config BR2_PACKAGE_RPM_XZ_PAYLOADS
>>  	bool "support for xz payloads"
>>  	depends on BR2_INSTALL_LIBSTDCPP
>> +	select BR2_PACKAGE_XZ
> 
> I know you are fixing existing code, but we usually do not have such
> sub-options, and we instead rely entirely on the dependant package in
> the .mk, without adding such sub-options...

OK, I will update this series and remove BR2_PACKAGE_RPM_BZIP2_PAYLOADS and
BR2_PACKAGE_RPM_XZ_PAYLOADS in Config.in, then modify
BR2_PACKAGE_RPM_XZ_PAYLOADS by BR2_PACKAGE_XZ (the same for bzip2) in the .mk

By the way, what's the use case for rpm and opkg for a rootfs build with Buildroot ?

Best regards,
Romain

> 
>>  	help
>>  	  Support for xz payloads in RPM.
>>  
>> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
>> index 74f5b88..ce7189e 100644
>> --- a/package/rpm/rpm.mk
>> +++ b/package/rpm/rpm.mk
>> @@ -45,7 +45,10 @@ RPM_CONF_OPTS += --with-file=no
>>  endif
>>  
>>  ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
>> -RPM_CONF_OPTS += --with-xz
>> +RPM_CONF_OPTS += --with-xz=external
>> +RPM_DEPENDENCIES += xz
>> +else
>> +RPM_CONF_OPTS += --with-xz=none
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
>>  endif
>>  
>>  ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
>> -- 
>> 1.9.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
