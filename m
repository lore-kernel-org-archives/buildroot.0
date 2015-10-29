From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 29 Oct 2015 22:38:11 +0100
Subject: [Buildroot] [PATCH v5 17/36] package/efl/libefl: add systemd
 dependency
In-Reply-To: <20151025151349.GO11692@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-18-git-send-email-romain.naour@openwide.fr>
 <20151025151349.GO11692@free.fr>
Message-ID: <563291C3.9040605@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 25/10/2015 16:13, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
>> systemd it one of the "highly recommended" dependecies
>> according to the README [1] but disabling it doesn't need
>> the --enable-i-really-know-what-i-am-doing... option.
>> That's why systemd is not added to
>> BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG.
>>
>> [1] https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n491
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> However, see a comment, below...
> 
>> ---
>> v4: rename to libefl
>>     improve commit log
>> v3: new patch
>> ---
>>  package/efl/libefl/libefl.mk | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
>> index 02c9005..c26c9c5 100644
>> --- a/package/efl/libefl/libefl.mk
>> +++ b/package/efl/libefl/libefl.mk
>> @@ -52,6 +52,13 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
>>  LIBEFL_DEPENDENCIES += util-linux
>>  endif
>>  
>> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>> +LIBEFL_CONF_OPTS += --enable-systemd
>> +LIBEFL_DEPENDENCIES += systemd
>> +else
>> +LIBEFL_CONF_OPTS += --disable-systemd
>> +endif
> 
> You're adding optional dependencies with various patches; that's
> perfectly good.
> 
> However, I woiuld like that all those optional features be forcibly
> disabled form the first patch adding libefl. Then each of your patches
> would transform the hard-coded --disable-XXXX into conditional blocks
> (with or without Config.in options).

There is a very long list of config options that are not handled by the
packaging actually, I'll try to do that at least for the option I use in the
package and for auto detected options.

Speaking of config option, some of them use --disable-XXXX and --enable-XXXX,
but some other use --enable-XXXX=no and --enable-XXXX=yes. I'll unify this by
using --disable-XXXX and --enable-XXXX.

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
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
