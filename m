From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Nov 2013 18:18:46 +0200
Subject: [Buildroot] [PATCH] perf: libelf is required to compile perf
In-Reply-To: <OFB695B6D2.ECE9BEB8-ON86257C1A.004FD92A-86257C1A.005239BF@rockwellcollins.com>
References: <1383660387-31193-1-git-send-email-andi@etezian.org>
 <OFB695B6D2.ECE9BEB8-ON86257C1A.004FD92A-86257C1A.005239BF@rockwellcollins.com>
Message-ID: <20131105161846.GC20511@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi rjbarnet at rockwellcollins.com,

On Tue, Nov 05, 2013 at 08:58:10AM -0600, rjbarnet at rockwellcollins.com wrote:
> Andi Shyti <andi@etezian.org> wrote on 11/05/2013 08:06:27 AM:
> 
> > Point this out in the related Config.in in the perf directory.
> > 
> > Mute the following error by selecting BR2_PACKAGE_LIBELF:
> > 
> > The perf tool in your kernel cannot be built without libelf.
> > Either upgrade your kernel to >= 3.7, or enable the elfutils package.
> > make: *** [/home/andi/repo/buildroot-snowball/output/build/perf-
> > stable-linux-ux500-3.4/.stamp_built] Error 1
> > 
> > Signed-off-by: Andi Shyti <andi@etezian.org>
> > ---
> >  package/perf/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/perf/Config.in b/package/perf/Config.in
> > index 88dce93..4b651b3 100644
> > --- a/package/perf/Config.in
> > +++ b/package/perf/Config.in
> > @@ -2,6 +2,7 @@ config BR2_PACKAGE_PERF
> >     bool "perf"
> >     depends on BR2_LINUX_KERNEL
> >     depends on BR2_LARGEFILE
> > +   depends on BR2_PACKAGE_LIBELF
> 
> Wouldn't you want this to be a select since LIBELF is required by this 
> package? Also in the perf.mk you want to ensure that the libelf package is 
> built before by adding a dependancy to the makefile.
> 
> ifeq ($(BR2_PACKAGE_LIBELF),y)
> PERF_DEPENDENCIES += libelf
> endif

When you select BR2_PACKAGE_LIBELF in Config.in there should be no need for 
the 'ifeq' condition. Just add 'libelf' to PERF_DEPENDENCIES unconditionally.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
