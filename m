From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Mar 2017 22:28:27 +0100
Subject: [Buildroot] [PATCH v5 11/19] infra-libtool: pass sysroot
 information to libtool
In-Reply-To: <b9674e85-d4dc-47e1-1bd1-84d5ca676968@mind.be>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <8e7692b2-4ebc-d533-8eda-d4a92fd2a7f8@mind.be>
 <20170322091437.7ebd63bf@free-electrons.com> <3486005.igxPQ1hGml@sagittae>
 <b9674e85-d4dc-47e1-1bd1-84d5ca676968@mind.be>
Message-ID: <ec738de2-eb06-2db5-1e20-c78c10ceff21@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-03-17 11:05, Arnout Vandecappelle wrote:
> 
> 
> On 22-03-17 10:20, J?r?me Pouiller wrote:
>> Hello,
>>
>> On Wednesday 22 March 2017 09:14:37 CET Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Wed, 22 Mar 2017 00:57:39 +0100, Arnout Vandecappelle wrote:
>>>
>>>>> So are you sure that this feature didn't appear in libtool 2.4 ?  
>>>>
>>>>  Yeah, looks like it. E.g. speex has libtool 1.5, and it doesn't have any
>>>> sysroot support (not in configure, not in ltmain.sh).
>>>>
>>>>  Obviously, *this* patch is not affected by it - it certainly doesn't hurt
>>>>  to pass the --with-sysroot configure option. It's only patches 12+13 that
>>>>  we wouldn't be able to remove.
>>>>
>>>>  However, considering:
>>>>
>>>> - most packages install things in /usr/lib, which is already searched by
>>>> default;
>>>>
>>>> - most packages use libtool 2.4 or later,
>>>>
>>>> I think we can take the risk. The autobuilders will discover any issues,
>>>> which we can fix per package (e.g. with AUTORECONF = YES).

 By the way, this series also *fixes* issues. E.g. I couldn't reproduce
http://autobuild.buildroot.net/results/e8c6bdc314b9a8d5de303633a3abd7b7e44beb2e
after applying this series, whereas I could reproduce it before.

 Regards,
 Arnout

>>>
>>> Since I would prefer to avoid autoreconfiguring many packages, it would
>>> be useful to know how many packages are still using libtool versions
>>> earlier than 2.4.
>>
>> This is precisely what I wanted to known before to replying.
>>
>> I extracted all (or nearly all) packages existing in Buildroot. I found 269 
>> packages that use libool:
>>
>> $ grep -ho 'VERSION="[0-9.]*' */ltmain.sh  | sort | uniq -c | sort -n
>>       1 VERSION="1.5.24
>>       1 VERSION="2.2.4
>>       3 VERSION="1.5.22
>>       5 VERSION="1.5.26
>>      13 VERSION="2.2.6
>>      29 VERSION="2.4.6
>>      67 VERSION="2.4.2
> 
>  Your command isn't good enough... It skips ltmain.sh which are not in the top
> directory, and it skips the ones where VERSION isn't quoted. I got quite a few more:
> 
> $ for i in *.tar*; do tar tf $i | grep ltmain.sh | xargs -r tar -xf $i
> --to-command="grep ^VERSION= | { grep -v '[^.]2\.4' && printf ' @@$i\\r'; } | tr
> '\\n\\r' ' \\n'"; done
> 
> VERSION=1.5.26  @@CEGUI-0.6.2b.tar.gz
> VERSION="1.5.26 Debian 1.5.26-1ubuntu1"  @@LiTE-0.8.10.tar.gz
> VERSION=2.2.6  @@SDL-1.2.15.tar.gz
> VERSION=2.2.6  @@SDL2_image-2.0.1.tar.gz
> VERSION=2.2.6  @@SDL2_ttf-2.0.14.tar.gz
> VERSION=2.2.6  @@SDL_image-1.2.12.tar.gz
> VERSION=2.2.6  @@SDL_mixer-1.2.12.tar.gz
> VERSION=2.2.6  @@SDL_net-1.2.8.tar.gz
> VERSION="1.5.24 Debian 1.5.24-1ubuntu1"  @@SDL_sound-1.0.3.tar.gz
> VERSION=2.2.6  @@SDL_ttf-2.0.11.tar.gz
> VERSION="1.5.22 Debian 1.5.22-2"  @@apache-log4cxx-0.10.0.tar.gz
> VERSION=2.2.6b  @@arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
> VERSION=2.2.6b  @@arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@argtable2-13.tar.gz
> VERSION=2.2.10  @@axfsutils-64886703fdff6cfc64eb20fbe7d7295bbeec867b.tar.gz
> VERSION=2.2.6  @@beecrypt-4.2.1.tar.gz
> VERSION=2.2.6b  @@bind-9.11.0-P3.tar.gz
> VERSION=1.3.5  @@bind-9.11.0-P3.tar.gz
> VERSION=2.2.7a  @@binutils-2.26.1.tar.bz2
> VERSION=2.2.7a  @@binutils-2.27.tar.bz2
> VERSION=1.5.22  @@boost_1_63_0.tar.bz2
> VERSION="1.5.26 Debian 1.5.26-4"  @@celt-0.5.1.3.tar.gz
> VERSION=1.5.22  @@clamav-0.99.2.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@collectd-5.5.1.tar.bz2
> VERSION="1.5.26 Debian 1.5.26-1ubuntu1"  @@curlftpfs-0.9.2.tar.gz
> VERSION=2.2.6b  @@db-5.3.28.NC.tar.gz
> VERSION=2.2.6  @@db-5.3.28.NC.tar.gz
> VERSION=1.5.22  @@db-5.3.28.NC.tar.gz
> VERSION="2.2.6 Debian-2.2.6a-1ubuntu1"  @@eventlog_0.2.12.tar.gz
> VERSION="1.5.22 Debian 1.5.22-4"  @@faad2-2.7.tar.gz
> VERSION=1.4  @@fcgi-2.4.0.tar.gz
> VERSION=1.5.24  @@gamin-0.1.10.tar.gz
> VERSION=2.2.7a  @@gcc-4.9.4.tar.bz2
> VERSION=2.2.7a  @@gcc-4.9.4.tar.bz2
> VERSION=2.2.7a  @@gcc-4.9.4.tar.bz2
> VERSION=1.5.16  @@gcc-4.9.4.tar.bz2
> VERSION=2.2.7a  @@gcc-5.4.0.tar.bz2
> VERSION=2.2.7a  @@gcc-5.4.0.tar.bz2
> VERSION=2.2.7a  @@gcc-5.4.0.tar.bz2
> VERSION=1.5.16  @@gcc-5.4.0.tar.bz2
> VERSION=2.2.7a  @@gcc-6.2.0.tar.bz2
> VERSION=2.2.7a  @@gcc-6.2.0.tar.bz2
> 
> 
> VERSION=2.2.7a  @@gcc-6.2.0.tar.bz2
> 
> 
> VERSION=1.5.16  @@gcc-6.2.0.tar.bz2
> 
> 
> VERSION=2.2.7a  @@gdb-7.10.1.tar.xz
> VERSION=2.2.7a  @@gdb-7.11.1.tar.xz
> VERSION="1.5.26 Debian 1.5.26-4"  @@genpart-1.0.2.tar.bz2
> VERSION=1.4e  @@gettext-0.19.8.1.tar.xz
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu3"  @@gmpc-11.8.16.tar.gz
> VERSION=2.2.6b  @@google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2"  @@gtk-engines-2.20.2.tar.bz2
> VERSION=1.5.2  @@ijs-0.35.tar.bz2
> VERSION=1.5.20  @@ipkg-0.99.163.tar.gz
> VERSION=1.5.22  @@jasper-1.900.1.tar.bz2
> VERSION=2.2.6b  @@json-c-0.11.tar.gz
> VERSION="1.5.26 Debian 1.5.26-4"  @@kodi-16.1-Jarvis.tar.gz
> VERSION=2.2.10  @@lame-3.99.5.tar.gz
> VERSION=2.2.6  @@libart_lgpl-2.3.21.tar.gz
> VERSION=2.2.4  @@libass-0.13.1.tar.xz
> VERSION=1.5.6  @@libcdaudio-0.99.12p2.tar.gz
> VERSION=2.2.6  @@libcddb-1.3.2.tar.bz2
> VERSION=2.2.6  @@libdaemon-0.14.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@libdbus-c++-0.9.0.tar.gz
> VERSION=2.2.10  @@libdmtx-0.7.4.tar.gz
> VERSION=1.5.6  @@libdnet-1.11.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2"  @@libeXosip2-3.6.0.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu3"  @@libee-0.4.1.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@libesmtp-1.0.6.tar.bz2
> VERSION=1.5.6  @@libfakekey-0.1.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@libgeotiff-1.4.0.tar.gz
> VERSION=1.5.26  @@libglade-2.6.4.tar.bz2
> VERSION=1.5.22  @@libhid-0.2.16.tar.gz
> VERSION=1.5.2  @@libid3tag-0.15.1b.tar.gz
> VERSION="2.2.4 Debian-2.2.4-0ubuntu4"  @@liblo-0.26.tar.gz
> VERSION=1.5.22  @@liblog4c-localtime-v1.0.tar.gz
> VERSION=1.5.2  @@libmad-0.15.1b.tar.gz
> VERSION="1.5.22 Debian 1.5.22-2"  @@libmatchbox-1.9.tar.bz2
> VERSION=1.5.22  @@libmcrypt-2.5.8.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2"  @@libmnl-1.0.3.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu3"  @@libmpd-11.8.17.tar.gz
> VERSION="1.5.26 Debian 1.5.26-4"  @@libmpeg2-0.5.1.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2"  @@libnetfilter_conntrack-1.0.6.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2"  @@libnetfilter_log-1.0.1.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2"  @@libnetfilter_log-1.0.1.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2"  @@libnfnetlink-1.0.1.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2"  @@libosip2-3.6.0.tar.gz
> VERSION="2.2.6 Debian-2.2.6a-4"  @@libpthread-stubs-0.3.tar.bz2
> VERSION=1.5.6  @@librsync-0.9.7.tar.gz
> VERSION="1.5.22 Debian 1.5.22-2"  @@libsexy-0.1.11.tar.gz
> VERSION=1.5.14  @@libsvg-0.1.4.tar.gz
> VERSION=1.5.14  @@libsvg-cairo-0.1.6.tar.gz
> VERSION=2.2.6  @@libtheora-1.1.1.tar.xz
> VERSION=1.4.3  @@libunwind-1.1.tar.gz
> VERSION=2.2.10  @@lzop-1.03.tar.gz
> VERSION=1.5.2  @@madplay-0.15.2b.tar.gz
> VERSION=1.5.6  @@mb-applet-startup-monitor-0.1.tar.bz2
> VERSION="2.2.4 Debian-2.2.4-0ubuntu4"  @@mcrypt-2.6.8.tar.gz
> VERSION=2.2.6b  @@msgpack-0.5.4.tar.gz
> VERSION=2.2.6  @@mysql-5.1.73.tar.gz
> VERSION=1.5.8  @@ngrep-1.45.tar.bz2
> VERSION=1.5.26  @@php-7.1.3.tar.xz
> VERSION=1.5.22  @@pjproject-2.4.5.tar.bz2
> VERSION=2.2.6  @@popt-1.16.tar.gz
> VERSION=1.3.4  @@privoxy-3.0.26-stable-src.tar.gz
> VERSION="2.2.6 Debian-2.2.6a-1ubuntu1"  @@proftpd-1.3.5d.tar.gz
> VERSION=1.5.26  @@proftpd-1.3.5d.tar.gz
> VERSION="2.2.6 Debian-2.2.6a-1ubuntu1"  @@proftpd-1.3.5d.tar.gz
> VERSION=2.2.6  @@pthsem_2.0.8.tar.gz
> VERSION=2.2.6  @@qt-everywhere-opensource-src-4.8.7.tar.gz
> VERSION=2.2.7a  @@rustc-1.10.0-src.tar.gz
> VERSION=1.5.6  @@sidplay-libs-2.1.1.tar.gz
> VERSION=1.5.6  @@sidplay-libs-2.1.1.tar.gz
> VERSION=1.5.6  @@sidplay-libs-2.1.1.tar.gz
> VERSION=1.4  @@sidplay-libs-2.1.1.tar.gz
> VERSION=1.5.6  @@sidplay-libs-2.1.1.tar.gz
> VERSION=1.5.6  @@sidplay-libs-2.1.1.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@sofia-sip-1.12.11.tar.gz
> VERSION="1.5.22 Debian 1.5.22-4"  @@speex-1.2rc1.tar.gz
> VERSION=2.2.6  @@sqlcipher-v3.2.0.tar.gz
> VERSION=1.5.6  @@startup-notification-0.9.tar.gz
> VERSION=1.5.22  @@sysfsutils-2.1.0.tar.gz
> VERSION=1.5.22  @@szip-2.1.tar.gz
> VERSION=1.5.24  @@tn5250-0.17.4.tar.gz
> VERSION=1.5.6  @@ucl-1.03.tar.gz
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@unixODBC-2.3.2.tar.gz
> VERSION="2.2.6 Debian-2.2.6a-4"  @@vorbis-tools-1.4.0.tar.gz
> VERSION=1.4.3  @@xcursor-transparent-theme-0.1.1.tar.gz
> VERSION="1.5.26 Debian 1.5.26-4"  @@xf86-input-tslib-0.0.6.tar.bz2
> VERSION="2.2.6b Debian-2.2.6b-2ubuntu1"  @@xinput_calibrator-0.7.5.tar.gz
> 
>  That's 109 tarballs with some older libtool.
> 
>  Note that this just iterates over the tarballs that I have in my download
> directory, there may be some old versions of packages in there. Anyway, I think
> 109 out of the 2150 tarballs in that directory is still extremely small.
> 
>  Note also that in many of these, the ltmain will be in some subdirectory
> containing bundled source that we don't even use.
> 
>  Note, finally, that there are also quite a few host-only packages in there
> (e.g. gcc, but that one is special because it also builds stuff for the target.
> It doesn't seem to install .la files, however).
> 
> 
>> There 23 packages that use libtool < 2.4:
>>   - bellagio
>>   - celt051
>>   - dbus-cpp
>>   - eventlog
>>   - gtk2-engines
>>   - lesstif
>>   - libargtable2
>>   - libesmtp
>>   - liblo
>>   - libmhash
>>   - libnetfilter_conntrack
>>   - libnetfilter_log
>>   - libnfnetlink
>>   - libpthread-stubs
>>   - lite
>>   - log4cxx
>>   - matchbox-lib
>>   - metacity
>>   - sdl_sound
>>   - sylpheed
>>   - xapp_xinput-calibrator
>>   - xdriver_xf86-input-tslib
>>   - xdriver_xf86-video-imx
>>
>> 4 of them already call autoreconf: bellagio, dbus-cpp, libnetfilter_log, 
>> libnfnetlink.
>>
>> I am going to create a configuration with all of these packages.
> 
>  That's not necessarily sufficient: the generated .la file could be wrong, so
> you have to check if packages that use it are still working correctly.
> Alternatively, just check all the .la files.
> 
>  Regards,
>  Arnout
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
