From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Oct 2014 10:52:03 +0300
Subject: [Buildroot] [PATCH] bandwidthd: fix static build
In-Reply-To: <542CFECE.9020103@gmail.com>
References: <7d38491011008b60f8ad91ec0261af046d453685.1412232567.git.baruch@tkos.co.il>
 <542CFECE.9020103@gmail.com>
Message-ID: <20141002075203.GG3006@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

On Thu, Oct 02, 2014 at 03:29:18PM +0800, Nathaniel Roach wrote:
> On 02/10/14 14:49, Baruch Siach wrote:
> > Build against libpng requires -lz when built statically. Patch configure.ac to
> > get the needed information from pkg-config.
> > 
> > This patch can not be directly upstreamed as it conflicts with upstream
> > changes, but a proper fix would be based on the same idea.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/e49/e496cc4315c06de61379222d3e842d4cd05b2f71/
> > 
> > Cc: Nathaniel Roach <nroach44@gmail.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  ...ac-fix-libpng-check-when-built-statically.patch | 29 ++++++++++++++++++++++
> >  package/bandwidthd/bandwidthd.mk                   |  2 +-
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> >  create mode 100644 package/bandwidthd/0001-configure.ac-fix-libpng-check-when-built-statically.patch
> > 
> > diff --git a/package/bandwidthd/0001-configure.ac-fix-libpng-check-when-built-statically.patch b/package/bandwidthd/0001-configure.ac-fix-libpng-check-when-built-statically.patch
> > new file mode 100644
> > index 000000000000..f444ba70d513
> > --- /dev/null
> > +++ b/package/bandwidthd/0001-configure.ac-fix-libpng-check-when-built-statically.patch
> > @@ -0,0 +1,29 @@
> > +From 97998f008f5d900619194d80051dee1be68e4ace Mon Sep 17 00:00:00 2001
> > +Message-Id: <97998f008f5d900619194d80051dee1be68e4ace.1412231990.git.baruch@tkos.co.il>
> > +From: Baruch Siach <baruch@tkos.co.il>
> > +Date: Thu, 2 Oct 2014 09:12:28 +0300
> > +Subject: [PATCH] configure.ac: fix libpng check when built statically
> > +
> > +Find libpng library dependencies using pkg-config.
> > +
> > +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > +---
> > + configure.ac | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 3a2d0ba97bdf..9c2fa83cc93c 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -30,6 +30,8 @@ AC_CHECK_LIB(m, pow)
> > + AC_CHECK_LIB(iconv, libiconv_open)
> > + 
> > + # Required Libraries
> > ++PKG_CHECK_MODULES([libpng], libpng)
> > ++LIBS="$LIBS $libpng_LIBS"
> > + AC_CHECK_LIB(png, png_read_info, ,[AC_MSG_ERROR([Bandwidthd requires but cannot libpng])])
> > + AC_CHECK_LIB(gd, gdImageCreate, ,[AC_MSG_ERROR([Bandwidthd requires but cannot find libgd])])
> > + AC_CHECK_LIB(pcap, pcap_open_live, ,
> > +-- 
> > +2.1.0
> > +
> > diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
> > index 3e11d6abb1e5..0b03b0b70278 100644
> > --- a/package/bandwidthd/bandwidthd.mk
> > +++ b/package/bandwidthd/bandwidthd.mk
> > @@ -11,7 +11,7 @@ BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
> >  # download" by upstream.
> >  BANDWIDTHD_LICENSE = GPL
> >  
> > -BANDWIDTHD_DEPENDENCIES = gd libpng libpcap
> > +BANDWIDTHD_DEPENDENCIES = gd libpng libpcap host-pkgconf
> >  
> >  BANDWIDTHD_AUTORECONF = YES
> 
> Hi Baruch, I've already put a patch through [1] that bumps the version
> in BR, which AFAIK fixes the issues that we've had on the autobuilders.

Well, I should have been aware to this patch since it seems I also commented 
on it, but I forgot. I still think this is the right solution, since it would 
also work if libpng changes its dependencies. Assuming, of course, that 
bandwidthd doesn't use libz directly.

Note that I also tried to upgrade to -r10, but build fails with this specific 
non-thread defconfig because bandwidthd now requires a toolchain supporting 
-lpthread. So technically this specific configuration is still broken after 
applying http://patchwork.ozlabs.org/patch/381899/.

baruch

> I'm not sure what to do in this situation but I thought I'd just note
> this here in case my patch had been forgotten.
> 
> [1] http://patchwork.ozlabs.org/patch/381899/

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
