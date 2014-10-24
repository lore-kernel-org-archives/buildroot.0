From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Sat, 25 Oct 2014 00:22:20 +0200
Subject: [Buildroot] [PATCH 1/1] shairplay-sync: new package
In-Reply-To: <20141020173137.GF3742@free.fr>
References: <1413811309-16019-1-git-send-email-jkrause@posteo.de>
 <20141020173137.GF3742@free.fr>
Message-ID: <544AD11C.5050704@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Hi All,

On 10/20/2014 07:31 PM, Yann E. MORIN wrote:
> J?rg, All,
>
> On 2014-10-20 15:21 +0200, J?rg Krause spake thusly:
>> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> [--SNIP--]
>> diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
>> new file mode 100644
>> index 0000000..2eab88d
>> --- /dev/null
>> +++ b/package/shairport-sync/Config.in
>> @@ -0,0 +1,72 @@
>> +config BR2_PACKAGE_SHAIRPORT_SYNC
>> +	bool "shairport-sync"
>> +	depends on BR2_USE_MMU # libdaemon
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa_lib
>> +	select BR2_PACKAGE_ALSA_LIB
>> +	select BR2_PACKAGE_LIBDAEMON
>> +	select BR2_PACKAGE_POPT
>> +	help
>> +	  Shairport Sync emulates an AirPort Express for the purpose of
>> +	  streaming audio from iTunes, iPods, iPhones, iPads and AppleTVs.
>> +	  Audio played by a Shairport Sync-powered device stays in synchrony
>> +	  with the source and thus with other devices that are playing the same
>> +	  source synchronously. Thus, for example, synchronised multi-room
>> +	  audio is possible without difficulty.
>> +
>> +	  https://github.com/mikebrady/shairport-sync
>> +
>> +if BR2_PACKAGE_SHAIRPORT_SYNC
>> +
>> +choice
>> +	prompt "Choose SSL encryption backend"
>> +	default BR2_PACKAGE_SHAIRPORT_SYNC_OPENSSL
>> +
>> +config BR2_PACKAGE_SHAIRPORT_SYNC_OPENSSL
>> +	bool "OpenSSL"
>> +	select BR2_PACKAGE_OPENSSL
>> +
>> +config BR2_PACKAGE_SHAIRPORT_SYNC_POLARSSL
>> +	bool "PolarSSL"
>> +	select BR2_PACKAGE_POLARSSL
>> +endchoice
> Since this is a choice, either one is selected. Which means SSL support
> seems to be not optional.

You're right! SSL support is mandatory, but you can choose between 
OpenSSL and PolarSSL.

> In that case I would prefer we use something like:
>
>      config BR2_PACKAGE_SHAIRPORT_SYNC
>          bool "shairport-sync"
>          # Dependencies and selects as above
>          select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
>
> This way, we ensure at least one SSL implementation is available, and do
> not bother the user with a useless prompt.

Ok

>> +choice
>> +	prompt "Choose mDNS backend"
>> +	default BR2_PACKAGE_SHAIRPORT_SYNC_AVAHI
>> +
>> +config BR2_PACKAGE_SHAIRPORT_SYNC_AVAHI
>> +	bool "Avahi"
>> +	depends on BR2_USE_WCHAR # avahi -> gettext
>> +	depends on !BR2_PREFER_STATIC_LIB
>> +	select BR2_PACKAGE_AVAHI
>> +	select BR2_PACKAGE_AVAHI_DAEMON
>> +	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
>> +
>> +comment "Avahi support needs a toolchain w/ wchar, dynamic library"
>> +	depends on !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
>> +
>> +config BR2_PACKAGE_SHAIRPORT_SYNC_TINYSVCMDNS
>> +	bool "tinysvcmdns"
>> +	help
>> +	  tinysvcmdns is a tiny mDNS responder which is only concerned with
>> +	  publishing services, without a system-wide daemon like Bonjour or
>> +	  Avahi. Its other goal is to be extremely small, embeddable, and have
>> +	  no external dependencies.
>> +endchoice
> There is no tinysvcmdns packaged in Buildroot. Does shairport-sync
> bundles its own version? Otherwise, I've seen there is a tinysvcmdns
> package on bitbucket: https://bitbucket.org/geekman/tinysvcmdns
> Maybe it would be interesting to package it in Buildroot?
>
> If so, I would just remove the choice altogether, and just use
> tinysvcmdns if avahi is not enabled.

Shairport bundles its own version of tinysvcmdns which is based on the 
one you've found on bitbucket. I will do the following: if avahi is not 
selected as a package, shairport-sync builds with tinysvcmdns support.

>
>> +config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
>> +	bool "libsoxr support"
> There, you need to select BR2_PACKAGE_LIBSOXR.

Oops!

>
> Obviously, adapt the .mk to the above comments.
>

Many thanks for the review!

J?rg
