From: =?UTF-8?Q?DUPONCHEEL_S=c3=a9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Tue, 20 Nov 2018 14:56:17 +0100
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add connmarktos
 build option
In-Reply-To: <871s7jh1jd.fsf@tkos.co.il>
References: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
 <87o9aq5hcb.fsf@tkos.co.il>
 <25f6955b-c3f1-28a1-2a51-6ad90f391c9c@corp.ovh.com>
 <871s7jh1jd.fsf@tkos.co.il>
Message-ID: <da5a2951-731f-d529-f32d-a7437041ca30@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Please see my feedback below :

Le 17/11/2018 ? 21:49, Baruch Siach a ?crit?:
> Hi S?bastien,
>
> Please keep the list on Cc.
>
> DUPONCHEEL S?bastien writes:
>> it's nice to see you here :)
>> Thank you for your review and comments.
>>
>> See my proposal below :
>>
>> Le 15/11/2018 ? 19:24, Baruch Siach a ?crit:
>>> Thanks for your contribution. A few comments below.
>>>
>>> DUPONCHEEL S?bastien writes:
>>>
>>>> Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
>>>> ---
>>>>    package/shadowsocks-libev/Config.in            | 7 +++++++
>>>>    package/shadowsocks-libev/shadowsocks-libev.mk | 4 ++++
>>>>    2 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
>>>> index f58abdb..acd9a67 100644
>>>> --- a/package/shadowsocks-libev/Config.in
>>>> +++ b/package/shadowsocks-libev/Config.in
>>>> @@ -15,6 +15,13 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
>>>>
>>>>    	  https://github.com/shadowsocks/shadowsocks-libev
>>>>
>>>> +config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
>>>> +	bool "enable connmarktos feature"
>>>> +	depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
>>>> +	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>>>> +	help
>>>> +	  Build with the connmark to TOS feature
>>> If the size increase of enabling this feature is not huge we usually
>>> just enable it unconditionally when the required dependencies are
>>> enabled. This reduced the number of config options that the user has to
>>> go through.
>> For now, this feature only concerns ss-server and requires the operation of
>> advanced iptables and tc rules. This is a very specific feature that will not
>> be widely used, I think it is better to disable it by default
>>
>> So, i propose to be more verbose on what this feature implies :
>>
>> config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
>> - bool "enable connmarktos feature"
>> + bool "ss-server: enable connmarktos feature"
>>   depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
>>   select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>>   help
>> - Build with the connmark to TOS feature
>> + Build ss-server with the connmark to TOS feature.
>> + This feature require advanced tc, iptables and conntrac
>> + rules to perform QoS on the server side.
>> + if unsure say N.
> Sounds reasonable to me. Let's see what others think.
>
>>>>    comment "shadowsocks-libev needs a toolchain w/ threads"
>>>>    	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>>>    	depends on BR2_TOOLCHAIN_HAS_SYNC_8 || !BR2_ARCH_IS_64
>>>> diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
>>>> index 7fdcd3f..34d95ca 100644
>>>> --- a/package/shadowsocks-libev/shadowsocks-libev.mk
>>>> +++ b/package/shadowsocks-libev/shadowsocks-libev.mk
>>>> @@ -21,4 +21,8 @@ ifeq ($(BR2_riscv),y)
>>>>    SHADOWSOCKS_LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
>>>>    endif
>>>>
>>>> +ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
>>> So instead of that do
>>>
>>> ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
>>>
>>>> +SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
>>> If libnetfilter_conntrack is a build time dependency you also need to
>>> add it to SHADOWSOCKS_LIBEV_DEPENDENCIES here to make sure it build
>>> before shadowsocks-libev.
>> As seen in "squid.mk", i propose to do something like this :
>>
>> -SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
>> +SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre \
>> + $(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
> The _OPTS and _DEPENDENCIES additions are usually grouped together. The
> squid case is spacial because there is no _OPTS change there.
>
>>>> +endif
>>> You should also add --disable-connmarktos (or the equivalent option) in
>>> the 'else' part of this condition.
>> Unfortunately there is no such option.
> The AC_ARG_ENABLE macro in configure.ac automatically provides
> --enable-foo and --disable-foo.

The AC_ARG_ENABLE statement in shadowsocks looks broken, neither --disable-connmarktos
nor --enable-connmarktos=no are working. In fact, it activates the feature.

ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
SHADOWSOCKS_LIBEV_DEPENDENCIES += libnetfilter_conntrack
SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
else
SHADOWSOCKS_LIBEV_CONF_OPTS += --disable-connmarktos
endif

seb at compile:src/buildroot ?shadowsocks?$ cat .config | grep CONNMARK
# BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS is not set
seb at compile:src/buildroot ?shadowsocks*?$ ldd ./output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/bin/ss-server | grep libnetfilter_conntrack.so.3
	libnetfilter_conntrack.so.3 => /home/seb/src/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnetfilter_conntrack.so.3 (0x00006f816dde4000)

Best regards,
DUPONCHEEL S?bastien.

> baruch
>
> --
>       http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>     - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181120/04ab28d9/attachment.html>
