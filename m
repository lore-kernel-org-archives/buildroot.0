From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 8 Dec 2015 23:50:33 +0100
Subject: [Buildroot] [PATCH v7 33/33]
 package/libemotion-generic-players: new package
In-Reply-To: <20151208142734.GM4188@free.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-34-git-send-email-romain.naour@openwide.fr>
 <20151208142734.GM4188@free.fr>
Message-ID: <56675EB9.8010308@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 08/12/2015 15:27, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> I wonder why libemotion-generic-players and libevas-generic-loaders are
> not in the EFL submenu.

Because I moved them to Package -> libraries -> Graphics.

> Is it possible to use either without EFL?

I don't think so.

> 
> Also, libevas-generic-loaders is still talking about Evas:
> 
>     These are additional "generic" loaders for Evas that are
>     stand-alone executables that evas may run from its generic
>     loader module.
> 
> Should we not change that to refer to EFL instead?

I think we can keep Evas otherwise the package would be named
libefl-generic-loaders. But we can say that Evas is provided by the libefl
package ?

> 
> Ditto for this package, see below...
> 
> [--SNIP--]
>> diff --git a/package/libemotion-generic-players/Config.in b/package/libemotion-generic-players/Config.in
>> new file mode 100644
>> index 0000000..f6dd45d
>> --- /dev/null
>> +++ b/package/libemotion-generic-players/Config.in
>> @@ -0,0 +1,19 @@
>> +config BR2_PACKAGE_LIBEMOTION_GENERIC_PLAYERS
>> +	bool "libemotion generic players"
>> +	depends on BR2_PACKAGE_EFL
>> +	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) # vlc
>> +	depends on BR2_INSTALL_LIBSTDCPP # vlc
>> +	depends on BR2_USE_WCHAR # vlc
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # vlc
>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # vlc
>> +	select BR2_PACKAGE_VLC # needs libvlc
>> +	help
>> +	  A media object library for Evas and Ecore.
> 
> Since we dropped libevas and libecore now that they are included in
> libefl, shouldn't we change that to refer to just "EFL" instead?

I think this comments speak about EFL internal libraries precisely.
Not the old libevas and libecore Buildroot packages.

> 
> Otherwise;
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> To be noted, I also build-tested this series in various combinations
> (but all on ARM), enabling/disabling various options. This was not ment
> to be an exhaustive test, but the obvious all-off and all-on sceanrii do
> build OK.
> 
> I'll just try another biuld-test, with no X11 support but with full
> OpenGL (see my comments in the GL patch).

Thanks for the build testing. I hope this series won't break too many build ;-)

Best regards,
Romain

> 
> Regards,
> Yann E. MORIN.
> 
>> +	  https://www.enlightenment.org
>> +	  https://docs.enlightenment.org/stable/efl/emotion_main.html
>> +
>> +comment "libemotion generic players needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, wchar, threads, headers >= 3.7"
>> +	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) \
>> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>> +		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>> diff --git a/package/libemotion-generic-players/libemotion-generic-players.hash b/package/libemotion-generic-players/libemotion-generic-players.hash
>> new file mode 100644
>> index 0000000..80c8123
>> --- /dev/null
>> +++ b/package/libemotion-generic-players/libemotion-generic-players.hash
>> @@ -0,0 +1,2 @@
>> +# From https://download.enlightenment.org/rel/libs/emotion_generic_players/emotion_generic_players-1.15.0.tar.xz.sha256
>> +sha256	9f6d5e9041ac7c014d663dac56d1b39ac42a45abe954d09d0edbf6e759e55f5f	emotion_generic_players-1.15.0.tar.xz
>> diff --git a/package/libemotion-generic-players/libemotion-generic-players.mk b/package/libemotion-generic-players/libemotion-generic-players.mk
>> new file mode 100644
>> index 0000000..ef41b2e
>> --- /dev/null
>> +++ b/package/libemotion-generic-players/libemotion-generic-players.mk
>> @@ -0,0 +1,17 @@
>> +################################################################################
>> +#
>> +# libemotion-generic-players
>> +#
>> +################################################################################
>> +
>> +LIBEMOTION_GENERIC_PLAYERS_VERSION = 1.15.0
>> +LIBEMOTION_GENERIC_PLAYERS_SOURCE = emotion_generic_players-$(LIBEMOTION_GENERIC_PLAYERS_VERSION).tar.xz
>> +LIBEMOTION_GENERIC_PLAYERS_SITE = http://download.enlightenment.org/rel/libs/emotion_generic_players
>> +LIBEMOTION_GENERIC_PLAYERS_LICENSE = BSD-2c
>> +LIBEMOTION_GENERIC_PLAYERS_LICENSE_FILES = COPYING
>> +
>> +LIBEMOTION_GENERIC_PLAYERS_INSTALL_STAGING = YES
>> +
>> +LIBEMOTION_GENERIC_PLAYERS_DEPENDENCIES = host-pkgconf libefl vlc
>> +
>> +$(eval $(autotools-package))
>> -- 
>> 2.4.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
