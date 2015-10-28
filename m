From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 28 Oct 2015 23:03:19 +0100
Subject: [Buildroot] [PATCH v5 09/36] package/efl/libefl: add libblkid
 dependency
In-Reply-To: <20151025144010.GF11692@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-10-git-send-email-romain.naour@openwide.fr>
 <20151025144010.GF11692@free.fr>
Message-ID: <56314627.1040903@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 25/10/2015 15:40, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
>> util-linux libblkid is listed as an dependency in the README:
>> https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n478
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>> v4: rename to libefl
>> ---
>>  package/efl/libefl/Config.in | 1 +
>>  package/efl/libefl/libefl.mk | 5 +++++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
>> index 29aef05..5c65744 100644
>> --- a/package/efl/libefl/Config.in
>> +++ b/package/efl/libefl/Config.in
>> @@ -29,6 +29,7 @@ config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
>>  	select BR2_PACKAGE_LIBSNDFILE
>>  	select BR2_PACKAGE_PULSEAUDIO
>>  	select BR2_PACKAGE_UTIL_LINUX
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>>  	default y
>>  	help
>> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
>> index b26f848..c7ecf51 100644
>> --- a/package/efl/libefl/libefl.mk
>> +++ b/package/efl/libefl/libefl.mk
>> @@ -46,6 +46,11 @@ else
>>  LIBEFL_CONF_OPTS += --disable-libmount
>>  endif
>>  
>> +# libblkid is part of required tools, see EFL's README.
> 
> If it is indeed a required dependency, fold this in the patch adding
> libefl.
> 
>> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
>> +LIBEFL_DEPENDENCIES += util-linux
>> +endif
> 
> Besides, no need to make it conditional: it will always be 'y' since you
> select it.

It's only selected with BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG not when the
package is selected.

But I'll add util-linux to the dependency list and always select
BR2_PACKAGE_UTIL_LINUX_LIBBLKID.

I haven't tested much minimal efl configuration.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> +
>>  # If fontconfig is disabled, this is going to make general font
>>  # searching not work, and only some very direct 'load /path/file.ttf'
>>  # will work alongside some old-school ttf file path searching. This
>> -- 
>> 2.4.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
