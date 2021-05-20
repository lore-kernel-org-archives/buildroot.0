From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 20 May 2021 13:49:59 +0300
Subject: [Buildroot] [PATCH 1/2] package/libpsl: new package
In-Reply-To: <999661ba-f9cf-6b66-c442-921595b49176@mind.be>
References: <20210519212637.1282972-1-aperez@igalia.com>
 <20210519212637.1282972-2-aperez@igalia.com>
 <999661ba-f9cf-6b66-c442-921595b49176@mind.be>
Message-ID: <20210520134959.GB1322222@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Thanks for the review, I'll send a v2 soon :)

On Thu, 20 May 2021 09:11:12 +0200 Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Adrian,
> 
> On 19/05/2021 23:26, Adrian Perez de Castro wrote:
> > Package libpsl is a new non-optional dependency of libsoup.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  DEVELOPERS                 |  1 +
> >  package/Config.in          |  1 +
> >  package/libpsl/Config.in   |  5 +++++
> >  package/libpsl/libpsl.hash |  2 ++
> >  package/libpsl/libpsl.mk   | 28 ++++++++++++++++++++++++++++
> >  5 files changed, 37 insertions(+)
> >  create mode 100644 package/libpsl/Config.in
> >  create mode 100644 package/libpsl/libpsl.hash
> >  create mode 100644 package/libpsl/libpsl.mk
> > 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index a90ad1c354..4286ca5baf 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -35,6 +35,7 @@ F:	package/bubblewrap/
> >  F:	package/cage/
> >  F:	package/cog/
> >  F:	package/libepoxy/
> > +F:	package/libpsl/
> >  F:	package/libwpe/
> >  F:	package/webkitgtk/
> >  F:	package/wlroots/
> > diff --git a/package/Config.in b/package/Config.in
> > index 82b28d2835..eaa30ea161 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1788,6 +1788,7 @@ menu "Networking"
> >  	source "package/libpagekite/Config.in"
> >  	source "package/libpcap/Config.in"
> >  	source "package/libpjsip/Config.in"
> > +	source "package/libpsl/Config.in"
> >  	source "package/librelp/Config.in"
> >  	source "package/librsync/Config.in"
> >  	source "package/libshairplay/Config.in"
> > diff --git a/package/libpsl/Config.in b/package/libpsl/Config.in
> > new file mode 100644
> > index 0000000000..cecd12c983
> > --- /dev/null
> > +++ b/package/libpsl/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_LIBPSL
> > +	bool "libpsl"
> > +	depends on BR2_PACKAGE_ICU || BR2_PACKAGE_LIBIDN2 || BR2_PACKAGE_LIBIDN
> 
>  Since the dependency is non-obvious, we prefer select:
> 
> 	select BR2_PACKAGE_LIBIDN2 if !BR2_PACKAGE_ICU && !BR2_PACKAGE_LIBIDN
 
Good idea, this is definitely better.
 
> > +	help
> > +	  C library to handle the Public Suffix List of TLDs.
> 
>  Upstream URL is missing.

I'll add it.

> > diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
> > new file mode 100644
> > index 0000000000..6c1c640e98
> > --- /dev/null
> > +++ b/package/libpsl/libpsl.hash
> > @@ -0,0 +1,2 @@
> > +# Locally generated
> > +sha512  a5084b9df4ff2a0b1f5074b20972efe0da846473396d27b57967c7f6aa190ab3c910b4bfc4f8f03802f08decbbad5820d850c36ad59610262ae37fe77de0c7f5  libpsl-0.21.1.tar.gz
> 
>  For locally generated, we normally use sha256.
> 
>  Also, hash for COPYING is missing.

Okay, will fix.

> > diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
> > new file mode 100644
> > index 0000000000..5a1336d7ce
> > --- /dev/null
> > +++ b/package/libpsl/libpsl.mk
> > @@ -0,0 +1,28 @@
> > +################################################################################
> > +#
> > +# libpsl
> > +#
> > +################################################################################
> > +
> > +LIBPSL_VERSION = 0.21.1
> > +LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
> > +LIBPSL_INSTALL_STAGING = YES
> > +LIBPSL_DEPENDENCIES = host-pkgconf
> > +LIBPSL_LICENSE = MIT
> > +LIBPSL_LICENSE_FILES = COPYING
> 
>  From README.md:
> 
> src/psl-make-dafsa and src/lookup_string_in_fixed_set.c are licensed under the
> term written in src/LICENSE.chromium.
> 
> So that should be included in LICENSE and LICENSE_FILES.

Aye, good catch. The contents of src/LICENSE.chromium seem to be new BSD, with
some ?placeholder? text replacing things like ?the copyright holder? replaced
with ?Google Inc.? so I'll add ?BSD-3-Clause? to the LICENSE variable.

> > +LIBPSL_CONF_OPTS = -Ddocs=false
> > +
> > +ifeq ($(BR2_PACKAGE_ICU),y)
> > +LIBPSL_CONF_OPTS += -Druntime=libicu -Dbuiltin=libicu
> > +LIBPSL_DEPENDENCIES += icu
> > +else
> > +ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> 
>  With
> 
> else ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> 
> you only need one endif at the end.

Ah, nice, thanks for the tip.

>  Also, since it's possible that all three are selected, we need to think a bit
> about the priorities. Preferring libidn2 over libidn is quite obvious, but about
> ICU I'm not so sure if it should be preferred over libidn2. In the select
> statement in Config.in libidn2 should clearly be preferred because it's much
> smaller. If ICU is selected anyway, that doesn't matter of course. So, is there
> any specific reason to prefer ICU over libidn2? I.e., does ICU offer more
> features? If it makes no difference either way, I think we should prefer libidn2
> over ICU to match the select in Config.in.

AFAIU libidn2 has all the functionality needed by libpsl. Checking libpsl's
Meson build config file, it checks for libidn2, then ICU, then libidn, so
let's change the order so we do it in the same way.

As a related note: it is interesting that libpsl can be built against ICU
because it is possible to have a configuration that needs ICU (as a dependency
for WPE WebKit, for example) without any other package needing libidn/libidn2.
So that's neat :)

Cheers,
-Adrian

> > +LIBPSL_CONF_OPTS += -Druntime=libidn2 -Dbuiltin=libidn2
> > +LIBPSL_DEPENDENCIES += libidn2
> > +else
> > +LIBPSL_CONF_OPTS += -Druntime=libidn -Dbuiltin=libidn
> > +LIBPSL_DEPENDENCIES += libidn
> > +endif
> > +endif
> > +
> > +$(eval $(meson-package))
> > 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210520/498de55d/attachment.asc>
