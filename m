From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Sep 2016 00:33:16 +0200
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <1474889395.4184.8.camel@synopsys.com>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
 <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
 <1474889395.4184.8.camel@synopsys.com>
Message-ID: <6467f1b7-7326-02f1-caf1-671099a34eac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-09-16 13:30, Alexey Brodkin wrote:
> Hi Arnout,
> 
> On Sat, 2016-09-24 at 00:11 +0200, Arnout Vandecappelle wrote:
[snip]
>>  I still don't understand how the -I$(STAGING_DIR)/usr/include gets added, by
>> the way. Isn't pkg-config supposed to suppress those, because they already are
>> in the default search path? For instance, on my system I have a xf86dgaproto.pc
>> which contains Cflags: -I${includedir}, but pkg-config --cflags xf86dgaproto
>> gives empty.

 I mean that it's _our_ pkg-config that does the wrong thing.

------ output/staging/usr/lib/pkgconfig/libpcre.pc --------
# Package Information for pkg-config

prefix=/usr
exec_prefix=/usr
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: libpcre
Description: PCRE - Perl compatible regular expressions C library with 8 bit
character support
Version: 8.39
Libs: -L${libdir} -lpcre
Libs.private:
Cflags: -I${includedir}
------------------------------------------------------------

output/host/usr/bin/pkg-config --cflags libpcre
-IXXX/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include

 According to me, this should have returned empty.

 So I've checked, and it looks like this is a feature of the full-fledged
pkg-config that pkgconf doesn't have:

pkg-config --cflags libpcre
<empty>

output/host/usr/bin/pkgconf --cflags libpcre
-I/usr/include

 So ideally, we should patch pkgconf (and send upstream) to remove the default
search paths.


> 
> That's how:
> --------------------->8--------------------
> export PATH=/XXX/output/host/usr/bin/:$PATH
> /XXX/output/build/qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b/Tools/qmake/config.tests/icu/pkg-config_wrapper.sh
> --libs icu-i18n
> -licui18n -L/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib -licuuc -licudata  
> --------------------->8--------------------
> 
> Looks like .pc files from "XXX/output/host/usr/lib/pkgconfig" are used.

 No, it's from the staging dir
XXX/output/host/usr/<tuple>/sysroot/usr/lib/pkgconfig

> 
> And just FYI contents of "pkg-config_wrapper.sh":
> --------------------->8--------------------
> ccat /XXX/output/build/qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b/Tools/qmake/config.tests/icu/pkg-
> config_wrapper.sh 
> #!/bin/sh
> PKG_CONFIG_SYSROOT_DIR=/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot
> export PKG_CONFIG_SYSROOT_DIR
> PKG_CONFIG_LIBDIR=/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig

 See?

 Regards,
 Arnout

> export PKG_CONFIG_LIBDIR
> exec pkg-config "$@"
> --------------------->8--------------------
> 
> -Alexey
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
