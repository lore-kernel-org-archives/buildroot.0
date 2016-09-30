From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 30 Sep 2016 08:54:30 +0000
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <93891dc1-af1d-d6d9-27ae-d2c9c5ae104a@mind.be>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
 <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
 <1474889395.4184.8.camel@synopsys.com>
 <6467f1b7-7326-02f1-caf1-671099a34eac@mind.be>
 <1475052878.9922.15.camel@synopsys.com>
 <93891dc1-af1d-d6d9-27ae-d2c9c5ae104a@mind.be>
Message-ID: <1475225656.6467.4.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi?Arnout,

On Thu, 2016-09-29 at 23:05 +0200, Arnout Vandecappelle wrote:
> 
> On 28-09-16 10:54, Alexey Brodkin wrote:
> > 
> > So it all boils down to:
> > 1) "pkg-config" case:
> > --------------------->8--------------------
> > PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig}
> > PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot}
> > ./output/host/usr/bin/pkgconf --libs icu-i18n
> > -licui18n -L/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib -licuuc -licudata
> > --------------------->8--------------------
> > 
> > 2. Pure "pkgconf" case:
> > --------------------->8--------------------
> > ./output/host/usr/bin/pkgconf --libs icu-i18n
> > -licui18n -licuuc -licudata
> > --------------------->8--------------------
> 
> ?Your pure pkgconf case is using the host icu-i18n, that's why the -L flag is
> missing. The host icu-i18n doesn't have a -L bit in its Libs: stanza.
> 
> ?You should compare:
> 
> 1) pkgconf case
> PKG_CONFIG_LIBDIR=$STAGING_DIR/usr/lib/pkgconfig
> PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR/sysroot output/host/usr/bin/pkgconf --libs
> icu-i18n
> -licui18n -L$STAGING_DIR/usr/lib -licuuc -licudata
> 
> 2) Real pkg-config case:
> PKG_CONFIG_LIBDIR=$STAGING_DIR/usr/lib/pkgconfig
> PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR/sysroot /usr/bin/pkg-config --libs icu-i18n
> -licui18n -licuuc -licudata
> 
> ?We switched from pkg-config to pkgconf because it builds a whole lot faster
> (pkg-config has a whole lot of dependencies). Obviously we give up features with
> that, but this is the first one where I think it is an important feature that
> we're missing.

Thanks for explanation that definitely makes sense.

-Alexey
