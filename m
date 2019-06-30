From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Jun 2019 18:32:51 +0200
Subject: [Buildroot] [PATCH 2/4] infra/pkg-meson: allow packages to pass
 custom compiler/linker flags
In-Reply-To: <09229b6e-31fd-bf51-bd5d-060c9b87c477@mind.be>
References: <cover.1561407936.git.yann.morin.1998@free.fr>
 <48a9daf25e9ca7335b0a09b8cd7f67974ad7c572.1561407936.git.yann.morin.1998@free.fr>
 <09229b6e-31fd-bf51-bd5d-060c9b87c477@mind.be>
Message-ID: <20190630163251.GA3606@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-06-30 18:12 +0200, Arnout Vandecappelle spake thusly:
>  Hi Yann,
> 
> On 24/06/2019 22:25, Yann E. MORIN wrote:
> [snip]
> > +$(2)_MESON_SED_CFLAGS = $$(if $$(strip $$($(2)_CFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CFLAGS)`)
> > +$(2)_MESON_SED_LDFLAGS = $$(if $$(strip $$($(2)_LDFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_LDFLAGS)`)
> > +$(2)_MESON_SED_CXXFLAGS = $$(if $$(strip $$($(2)_CXXFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CXXFLAGS)`)
> 
>  This is ridiculous - why not the much simpler make construct

Look, I know I do a lot of crap, granted, but your often calling things
"ridiculous" or "bullshit" or other nasty qualifiers is starting to be
a little bit unnerving...

> 	-e "s%@TARGET_CFLAGS@%$$(foreach flag,$$($(2)_CFLAGS),"$$(flag)"$(comma))%g" \

Because it does not work as you think it works?

Consider the following:

    FOO_CFLAGS = -DMEH='foo bar' -DBLEH="buz baz"

I'll leave it up to you to think what it gives in either case...

>  Note that this would also fix the issue from patch 1. Obviously untested,
> because that's just the kind of person I am :-). If it does need to be a little
> bit complicated, then I'd still prefer it to be managed by a macro rather than
> defining additional variables for each kind of flag. E.g. quoted-comma-list.
> 
>  Then again, this is the way it's already done in meson.mk, so why not. Maybe
> something to fix in a follow-up patch.

Nope, there is nothing to fix.

If there were anything to fix, that would have been the commit log of
5cd8afbd, which failed to explain this pecularity.

>  If you haven't sent a v2 that applies this technique by the next time I'm
> applying stuff, I'll apply it as is.

I will definitely *not* send a v2.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> 
> > +
> >  # Configure package for target
> >  #
> >  #
> > @@ -67,9 +75,9 @@ define $(2)_CONFIGURE_CMDS
> >  	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
> >  	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
> >  	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
> > -	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
> > -	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
> > -	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
> > +	    -e "s%@TARGET_CFLAGS@%$$($(2)_MESON_SED_CFLAGS)%g" \
> > +	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
> > +	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
> >  	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
> >  	    package/meson/cross-compilation.conf.in \
> >  	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
