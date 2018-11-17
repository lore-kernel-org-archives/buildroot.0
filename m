From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 17 Nov 2018 22:49:58 +0200
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add connmarktos
 build option
In-Reply-To: <25f6955b-c3f1-28a1-2a51-6ad90f391c9c@corp.ovh.com>
References: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
 <87o9aq5hcb.fsf@tkos.co.il>
 <25f6955b-c3f1-28a1-2a51-6ad90f391c9c@corp.ovh.com>
Message-ID: <871s7jh1jd.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

Please keep the list on Cc.

DUPONCHEEL S?bastien writes:
> it's nice to see you here :)
> Thank you for your review and comments.
>
> See my proposal below :
>
> Le 15/11/2018 ? 19:24, Baruch Siach a ?crit:
>> Thanks for your contribution. A few comments below.
>>
>> DUPONCHEEL S?bastien writes:
>>
>>> Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
>>> ---
>>>   package/shadowsocks-libev/Config.in            | 7 +++++++
>>>   package/shadowsocks-libev/shadowsocks-libev.mk | 4 ++++
>>>   2 files changed, 11 insertions(+)
>>>
>>> diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
>>> index f58abdb..acd9a67 100644
>>> --- a/package/shadowsocks-libev/Config.in
>>> +++ b/package/shadowsocks-libev/Config.in
>>> @@ -15,6 +15,13 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
>>>
>>>   	  https://github.com/shadowsocks/shadowsocks-libev
>>>
>>> +config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
>>> +	bool "enable connmarktos feature"
>>> +	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
>>> +	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>>> +	help
>>> +	  Build with the connmark to TOS feature
>> If the size increase of enabling this feature is not huge we usually
>> just enable it unconditionally when the required dependencies are
>> enabled. This reduced the number of config options that the user has to
>> go through.
>
> For now, this feature only concerns ss-server and requires the operation of
> advanced iptables and tc rules. This is a very specific feature that will not
> be widely used, I think it is better to disable it by default
>
> So, i propose to be more verbose on what this feature implies :
>
> config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
> - bool "enable connmarktos feature"
> + bool "ss-server: enable connmarktos feature"
>  depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
>  select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>  help
> - Build with the connmark to TOS feature
> + Build ss-server with the connmark to TOS feature.
> + This feature require advanced tc, iptables and conntrac
> + rules to perform QoS on the server side.
> + if unsure say N.

Sounds reasonable to me. Let's see what others think.

>>>   comment "shadowsocks-libev needs a toolchain w/ threads"
>>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
>>> diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
>>> index 7fdcd3f..34d95ca 100644
>>> --- a/package/shadowsocks-libev/shadowsocks-libev.mk
>>> +++ b/package/shadowsocks-libev/shadowsocks-libev.mk
>>> @@ -21,4 +21,8 @@ ifeq ($(BR2_riscv),y)
>>>   SHADOWSOCKS_LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
>>>   endif
>>>
>>> +ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
>> So instead of that do
>>
>> ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
>>
>>> +SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
>> If libnetfilter_conntrack is a build time dependency you also need to
>> add it to SHADOWSOCKS_LIBEV_DEPENDENCIES here to make sure it build
>> before shadowsocks-libev.
>
> As seen in "squid.mk", i propose to do something like this :
>
> -SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
> +SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre \
> + $(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)

The _OPTS and _DEPENDENCIES additions are usually grouped together. The
squid case is spacial because there is no _OPTS change there.

>>> +endif
>> You should also add --disable-connmarktos (or the equivalent option) in
>> the 'else' part of this condition.
>
> Unfortunately there is no such option.

The AC_ARG_ENABLE macro in configure.ac automatically provides
--enable-foo and --disable-foo.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
