From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Nov 2016 21:28:23 +0200
Subject: [Buildroot] [RFC 1/3] toolchain: workaround musl/kernel headers
 conflict
In-Reply-To: <e321884b-e3ff-bfc2-ceb8-71cbbd2524d3@mind.be>
References: <0cb3afed06c399b9e7d721aa3dafe6ba0eb7e5e5.1478457789.git.baruch@tkos.co.il>
 <e321884b-e3ff-bfc2-ceb8-71cbbd2524d3@mind.be>
Message-ID: <20161109192823.tasqlj4dgrs6zswt@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Nov 09, 2016 at 12:04:37AM +0100, Arnout Vandecappelle wrote:
> On 06-11-16 19:43, Baruch Siach wrote:
> > Rick Felker suggested[1] this hack as a workaround to musl libc conflict with
> > kernel headers. Upstream musl still evaluates[2] a permanent solution.
> 
>  Add an explanation of what the hack does. Actually, quoting Rick's fully
> explanation is probably the best thing to do.

Will do.

[...]

> > diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> > index c22713bfe349..d317e917d032 100644
> > --- a/toolchain/toolchain/toolchain.mk
> > +++ b/toolchain/toolchain/toolchain.mk
> > @@ -12,6 +12,20 @@ endif
> >  
> >  TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
> >  
> > +# Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
> > +# headers and kernel headers. This is a temporary measure until musl finds a
> > +# better solution.
> > +#
> > +# [1] http://www.openwall.com/lists/musl/2015/10/08/2
> > +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> > +define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
> > +	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
> > +		$(STAGING_DIR)/usr/include/linux/libc-compat.h
> > +endef
> > +TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
> > +TOOLCHAIN_INSTALL_STAGING = YES
> 
>  TOOLCHAIN_POST_INSTALL_STAGING is not ideal because it normally doesn't install
> to staging. Can it be moved to musl-compat-headers? It's a bit of work, because
> it requires first to move the musl-compat-headers dependency from musl and
> toolchain-external to toolchain itself, and then to add dependencies in
> musl-compat-headers on linux-headers resp. toolchain-external depending on which
> of the two is selected. But I think it's cleaner in the end.

I think your suggestion is way too complex for this ugly hack. It spreads the 
ugliness all over the place instead of keeping it in its corner.

>  OTOH this is a hack which can hopefully removed at some point so maybe it
> doesn't have to be so clean.

I agree.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
