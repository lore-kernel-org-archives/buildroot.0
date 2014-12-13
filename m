From: Thierry Bultel <tbultel@free.fr>
Date: Sat, 13 Dec 2014 07:42:59 +0100
Subject: [Buildroot] [PATCH v3 2/2] mpd: group client and libraries
 under the same menu
In-Reply-To: <1418428559.1462.7.camel@posteo.de>
References: <1418419480-7570-1-git-send-email-tbultel@free.fr>	
 <1418419480-7570-2-git-send-email-tbultel@free.fr>
 <1418428559.1462.7.camel@posteo.de>
Message-ID: <548BDFF3.305@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 13/12/2014 00:55, J?rg Krause a ?crit :
> On Fr, 2014-12-12 at 22:24 +0100, Thierry Bultel wrote:
>> diff --git a/package/Config.in b/package/Config.in
>> index 74ac5b1..3339ca5 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -19,11 +19,9 @@ menu "Audio and video applications"
>>          source "package/madplay/Config.in"
>>          source "package/modplugtools/Config.in"
>>          source "package/mpd/Config.in"
>> -       source "package/mpd-mpc/Config.in"
>>          source "package/mpg123/Config.in"
>>          source "package/mplayer/Config.in"
>>          source "package/musepack/Config.in"
>> -       source "package/ncmpc/Config.in"
>>          source "package/on2-8170-libs/Config.in"
>>          source "package/opus-tools/Config.in"
>>          source "package/pulseaudio/Config.in"
>> @@ -31,13 +29,11 @@ menu "Audio and video applications"
>>          source "package/tidsp-binaries/Config.in"
>>          source "package/tstools/Config.in"
>>          source "package/twolame/Config.in"
>> -       source "package/upmpdcli/Config.in"
>>          source "package/vlc/Config.in"
>>          source "package/vorbis-tools/Config.in"
>>          source "package/wavpack/Config.in"
>>          source "package/xbmc/Config.in"
>>          source "package/yavta/Config.in"
>> -       source "package/ympd/Config.in"
>>   endmenu
>>
>>   menu "Compressors and decompressors"
>> @@ -571,8 +567,6 @@ menu "Audio/Sound"
>>          source "package/liblo/Config.in"
>>          source "package/libmad/Config.in"
>>          source "package/libmodplug/Config.in"
>> -       source "package/libmpd/Config.in"
>> -       source "package/libmpdclient/Config.in"
>>          source "package/libreplaygain/Config.in"
>>          source "package/libsamplerate/Config.in"
>>          source "package/libsndfile/Config.in"
>> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
>> index 0e115f6..a885a17 100644
>> --- a/package/mpd/Config.in
>> +++ b/package/mpd/Config.in
>> @@ -1,3 +1,5 @@
>> +menu "mpd"
>> +
>>   menuconfig BR2_PACKAGE_MPD
>>          bool "mpd"
>>          depends on BR2_INSTALL_LIBSTDCPP
>> @@ -309,8 +311,27 @@ config BR2_PACKAGE_MPD_UPNP
>>
>>   endif
>>
>> +
>> +
>>   comment "mpd needs a toolchain w/ C++, threads, wchar"
>>          depends on BR2_USE_MMU
>>          depends on !(BR2_avr32 || BR2_sparc)
>>          depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>>                  !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
>> +
>> +menu "mpd frontends"
>> +       source "package/upmpdcli/Config.in"
>> +endmenu
>> +
>> +menu "mpd libraries"
>> +       source "package/libmpd/Config.in"
>> +       source "package/libmpdclient/Config.in"
>> +endmenu
>> +
>> +menu "mpd clients"
>> +       source "package/mpd-mpc/Config.in"
>> +       source "package/ncmpc/Config.in"
>> +       source "package/ympd/Config.in"
>> +endmenu
>> +
>> +endmenu
>
> Thinking about this again and trying this patch, I suggest we leave it
> as it is. It is not in the sense of Buildroot, because these are
> individual packages and not package options. But many thanks for the
> effort!
>

with the patch, they keep independent, but are just under a "mpd" menu.


> Btw: This patch should be a seperate patch, there was no v1 or v2 for
> this one.
>

yes, I was asking myself how to do, because patch 2 is dependent of 
patch 1 (need the mpd-mpc line).
