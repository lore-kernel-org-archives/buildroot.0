From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 Sep 2017 23:11:54 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/flex: disable reallocarray
In-Reply-To: <20170927210545.GG2903@scaer>
References: <20170923212414.16744-1-romain.naour@gmail.com>
 <20170923212414.16744-7-romain.naour@gmail.com> <20170927210545.GG2903@scaer>
Message-ID: <f997a6e9-ba13-68f9-9cda-202f52577393@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 27/09/2017 ? 23:05, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2017-09-23 23:24 +0200, Romain Naour spake thusly:
>> This doesn't compile with glibc 2.26 where reallocarray() as been introduced.
>>
>> It's a nasty issue, when reallocarray() is available for the target, flex will
>> build a small tool called stage1flex for the host (using _FOR_BUILD) but with
>> the config.h generated for the target.
>>
>> When the host doesn't have a glibc >= 2.26, reallocarray() is never defined
>> while building stage1flex:
>>
>> misc.c:147:8: warning : implicit declaration of function ? reallocarray ?
>> [-Wimplicit-function-declaration]
>>   mem = reallocarray(NULL, (size_t) size, element_size);
>>         ^~~~~~~~~~~~
>> misc.c:147:6: warning : assignment makes pointer from integer without a cast
>> [-Wint-conversion]
>>   mem = reallocarray(NULL, (size_t) size, element_size);
>>       ^
>>
>> Disable reallocarray for now, reallocarray() support may be
>> enabled in a followup patch.
> 
> What about https://patchwork.ozlabs.org/patch/813474/ which just
> backports a fix from upstream (or I'm mislead)?

No, this patch is fixing host-flex (segfault). not flex (link issue).

I haven't had the time to investigate further but stage1flex seems using the
config result for the target while building a host tool. So the reallocarray()
code is used on a host machine where it is not in the host glibc.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>> stage1flex-misc.o: In function `allocate_array':
>> misc.c:(.text+0x38f): undefined reference to `reallocarray'
>> stage1flex-misc.o: In function `reallocate_array':
>> misc.c:(.text+0xc8a): undefined reference to `reallocarray'
>> collect2: error: ld returned 1 exit status
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/flex/flex.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/flex/flex.mk b/package/flex/flex.mk
>> index b782699..0196624 100644
>> --- a/package/flex/flex.mk
>> +++ b/package/flex/flex.mk
>> @@ -10,7 +10,8 @@ FLEX_INSTALL_STAGING = YES
>>  FLEX_LICENSE = FLEX
>>  FLEX_LICENSE_FILES = COPYING
>>  FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
>> -FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
>> +FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4 \
>> +	ac_cv_func_reallocarray=no
>>  HOST_FLEX_DEPENDENCIES = host-m4
>>  
>>  define FLEX_DISABLE_PROGRAM
>> -- 
>> 2.9.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
