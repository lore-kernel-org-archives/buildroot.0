From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 28 Sep 2016 08:54:51 +0000
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <6467f1b7-7326-02f1-caf1-671099a34eac@mind.be>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
 <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
 <1474889395.4184.8.camel@synopsys.com>
 <6467f1b7-7326-02f1-caf1-671099a34eac@mind.be>
Message-ID: <1475052878.9922.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi?Arnout,

On Wed, 2016-09-28 at 00:33 +0200, Arnout Vandecappelle wrote:
> 
> On 26-09-16 13:30, Alexey Brodkin wrote:
> > 
> > Hi Arnout,
> > 
> > On Sat, 2016-09-24 at 00:11 +0200, Arnout Vandecappelle wrote:
> [snip]
> > 
> > > 
> > > ?I still don't understand how the -I$(STAGING_DIR)/usr/include gets added, by
> > > the way. Isn't pkg-config supposed to suppress those, because they already are
> > > in the default search path? For instance, on my system I have a xf86dgaproto.pc
> > > which contains Cflags: -I${includedir}, but pkg-config --cflags xf86dgaproto
> > > gives empty.
> 
> ?I mean that it's _our_ pkg-config that does the wrong thing.
> 
> ------ output/staging/usr/lib/pkgconfig/libpcre.pc --------
> # Package Information for pkg-config
> 
> prefix=/usr
> exec_prefix=/usr
> libdir=${exec_prefix}/lib
> includedir=${prefix}/include
> 
> Name: libpcre
> Description: PCRE - Perl compatible regular expressions C library with 8 bit
> character support
> Version: 8.39
> Libs: -L${libdir} -lpcre
> Libs.private:
> Cflags: -I${includedir}
> ------------------------------------------------------------
> 
> output/host/usr/bin/pkg-config --cflags libpcre
> -IXXX/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include
> 
> ?According to me, this should have returned empty.
> 
> ?So I've checked, and it looks like this is a feature of the full-fledged
> pkg-config that pkgconf doesn't have:
> 
> pkg-config --cflags libpcre
> <empty>
> 
> output/host/usr/bin/pkgconf --cflags libpcre
> -I/usr/include

Well note in our case pkg-config is just a wrapper script
that is created out of BR's "package/pkgconf/pkg-config.in":
--------------------->8--------------------
cat ./output/host/usr/bin/pkg-config
#!/bin/sh
PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-/XXX/output/host/usr/arc-buildroot-linux-
uclibc/sysroot/usr/lib/pkgconfig:/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/share/pkgconfig}
PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot} $(dirname
$0)/pkgconf??$@
--------------------->8--------------------

So it all boils down to:
1) "pkg-config" case:
--------------------->8--------------------
PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig}
PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot}
./output/host/usr/bin/pkgconf --libs icu-i18n
-licui18n -L/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib -licuuc -licudata
--------------------->8--------------------

2. Pure "pkgconf" case:
--------------------->8--------------------
./output/host/usr/bin/pkgconf --libs icu-i18n
-licui18n -licuuc -licudata
--------------------->8--------------------

> ?So ideally, we should patch pkgconf (and send upstream) to remove the default
> search paths.

Given my comments above I'm not really sure it's pkgconf who's guilty.

Any thoughts?

-Alexey
