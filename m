From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 9 Feb 2017 22:16:35 +0100
Subject: [Buildroot] [PATCH 3/7] core: add generic support for lz
 archives
In-Reply-To: <20170209211128.ssawhi6brgz7dh5q@tarshish>
References: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
 <0fe191c3ce1294b21d01067eac0ec83e543ec97c.1486669818.git.baruch@tkos.co.il>
 <20170209212612.6ef24427@gmx.net>
 <20170209210037.sdsevsypvfsgjbw3@tarshish>
 <20170209211128.ssawhi6brgz7dh5q@tarshish>
Message-ID: <20170209221635.2c003010@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Thu, 9 Feb 2017 23:11:28 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Peter,
> 
> On Thu, Feb 09, 2017 at 11:00:37PM +0200, Baruch Siach wrote:
> > On Thu, Feb 09, 2017 at 09:26:12PM +0100, Peter Seiderer wrote:
> > > On Thu,  9 Feb 2017 21:50:14 +0200, Baruch Siach <baruch@tkos.co.il> wrote:
> > > > This commit teaches the generic code how to extract .tar.lz archives. When
> > > > lzip is not installed on the host, host-lzip gets built automatically.
> > > > 
> > > 
> > > On my host there is no lzip installed, with your patches applied I get the following
> > > error message:
> > > 
> > > which: no lzip in (/home/seiderer/Work/build_arm_qt5_stdcpp11_001/host/usr/bin)
> > > You must install '/home/seiderer/Work/build_arm_qt5_stdcpp11_001/host/usr/bin/lzip' on your build machine
> > > support/dependencies/dependencies.mk:22: recipe for target 'core-dependencies' failed
> > > make[1]: *** [core-dependencies] Error 1
> > > Makefile:16: recipe for target '_all' failed
> > > make: *** [_all] Error 2
> > 
> > Thanks for testing.
> > 
> > Does this fixes your problem?
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 303dda090daa..eb01c2fa0e2f 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -930,7 +930,7 @@ endif # SITE_METHOD
> >  # ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
> >  # Remove xzcat/lzip from the list of required dependencies, as they get built
> >  # automatically if they're not found.
> > -DL_TOOLS_DEPENDENCIES += $$(filter-out xzcat lzip,$$(firstword $$(call suitable-extractor,$$($(2)_SOURCE))))
> > +DL_TOOLS_DEPENDENCIES += $$(filter-out xzcat lzip,$$(notdir $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))))


Fixes my test case too, I tried:

DL_TOOLS_DEPENDENCIES += $$(filter-out $(HOST_DIR)/usr/bin/xzcat $(HOST_DIR)/usr/bin/lzip,$$(firstword $$(call suitable-extractor,$$($(2)_SOURCE))))

Regards,
Peter


> >  
> >  # Ensure all virtual targets are PHONY. Listed alphabetically.
> >  .PHONY:	$(1) \
> 
> Thinking about it again, this is clearly not the right solution. It breaks 
> custom BR2_LZCAT. I'll try to come up with something better.
> 
> baruch
> 
