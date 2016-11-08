From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Nov 2016 18:15:05 +0100
Subject: [Buildroot] [PATCH 1/6] core: export a variable with the host's
 bitness
In-Reply-To: <f245bad7-abf5-2b14-e512-87ef48a3fe42@mind.be>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <103fbc9d355da745c4a5a8ba34c7dbae2ea4c07a.1478553802.git.yann.morin.1998@free.fr>
 <f245bad7-abf5-2b14-e512-87ef48a3fe42@mind.be>
Message-ID: <20161108171505.GB3554@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-07 23:15 +0100, Arnout Vandecappelle spake thusly:
> On 07-11-16 22:23, Yann E. MORIN wrote:
> > Some host packages (e.g. host-pseudo) wants to know the host bitness,
> > and they can fail to detect it in some corner cases (as reported by a
> > few users on IRC).
> > 
> > Export a variable with the bitness of the host, so that those packages
>   ^^^^^^ You're not actually exporting it - fortunately.

Unfortunate choice of wording. Indeed, we need not 'export' it. We just
need to make it available.

Arguably, HOSTARCH itself should not be exported. But we need it in
Kconfig, we could add it to COMMON_CONFIG_ENV instead.

Note that gnu-efi is using HOSTARCH )package/gnu-efi/0001-*.patch), so
exporting our own may interfere with its buildsystem (to be confirmed).

> > can be made to behave.
> 
>  I'm a bit hesitant to introduce a global infra variable like this (which makes
> top-level Makefile longer - not the direction we want to go to) with just one
> consumer, and where we hope the package can be fixed to not need this hack
> anymore...

I will drop this patch and only use that in pseduo.
Thanks! :-)

Regards,
Yann E. MORIN.

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> > Cc: Erico Nunes <nunes.erico@gmail.com>
> > Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> > ---
> >  Makefile | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 4ea64b3..78f72bc 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -340,6 +340,12 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
> >  	    -e 's/macppc/powerpc/' \
> >  	    -e 's/sh.*/sh/' )
> >  
> > +ifeq ($(filter %64,$(HOSTARCH)),)
> > +HOSTARCH_BITS := 32
> 
>  There is no need to use := here, just use =
> 
> > +else
> > +HOSTARCH_BITS := 64
> 
>  And here of course.
> 
>  Regards,
>  Arnout
> 
> > +endif
> > +
> >  HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
> >  	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p')
> >  
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
