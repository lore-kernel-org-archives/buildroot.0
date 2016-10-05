From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 5 Oct 2016 07:12:24 +0000
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <1475225741.6467.6.camel@synopsys.com>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
 <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
 <1474889395.4184.8.camel@synopsys.com>
 <6467f1b7-7326-02f1-caf1-671099a34eac@mind.be>
 <1475052878.9922.15.camel@synopsys.com>
 <93891dc1-af1d-d6d9-27ae-d2c9c5ae104a@mind.be>
 <ca287fbd-5dbb-dbd4-aadc-61e1aee0da0d@mind.be>
 <1475225741.6467.6.camel@synopsys.com>
Message-ID: <1475651525.5303.9.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

On Fri, 2016-09-30 at 11:55 +0300, Alexey Brodkin wrote:
> Hi?Arnout,
> 
> On Thu, 2016-09-29 at 23:34 +0200, Arnout Vandecappelle wrote:
> > 
> > 
> > On 29-09-16 23:05, Arnout Vandecappelle wrote:
> > > 
> > > 
> > > 
> > > 
> > > On 28-09-16 10:54, Alexey Brodkin wrote:
> > > > 
> > > > 
> > > > So it all boils down to:
> > > > 1) "pkg-config" case:
> > > > --------------------->8--------------------
> > > > PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-/XXX/output/host/usr/arc-buildroot-linux-
> > > > uclibc/sysroot/usr/lib/pkgconfig}
> > > > PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot}
> > > > ./output/host/usr/bin/pkgconf --libs icu-i18n
> > > > -licui18n -L/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib -licuuc -licudata
> > > > --------------------->8--------------------
> > > > 
> > > > 2. Pure "pkgconf" case:
> > > > --------------------->8--------------------
> > > > ./output/host/usr/bin/pkgconf --libs icu-i18n
> > > > -licui18n -licuuc -licudata
> > > > --------------------->8--------------------
> > > 
> > > ?Your pure pkgconf case is using the host icu-i18n, that's why the -L flag is
> > > missing. The host icu-i18n doesn't have a -L bit in its Libs: stanza.
> > 
> > ?Hm, actually, icu-uc.pc *does* have a -L bit in its Libs: stanza. But for the
> > host, I guess it recognizes that ${libdir} == /usr/lib so it can be eliminated.
> > So perhaps that can be extended to cover a sysroot as well.
> > 
> > ?BTW, I did a quick test with pkgconf 1.0.1 and it still behaves the same.
> 
> Shall we then file an issue here?https://github.com/pkgconf/pkgconf/issues??

I'm wondering if there're any other thoughts on this one?
We're seeing more and more instances of that problem, for example with
qt5serialport?here?http://autobuild.buildroot.net/results/b14/b143bc806d45a91d52c43fa49227e88dc8a105d5/

So if there're no objections we may apply this one and see if it breaks anything
while we're far enough from the next BR release and in the worst case we'll just revert it
further down the line.

-Alexey
