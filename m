From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2013 21:43:21 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <52B325BE.1030307@mind.be>
References: <52A730B0.3020104@orange.com> <52AA41FE.6060705@mind.be>
 <20131217071100.04b7b3a7@skate>
 <201312170858.13393.yann.morin.1998@free.fr>
 <20131217100414.551a3832@skate> <52B0CE36.5000400@mind.be>
 <20131217223543.GC3352@free.fr> <52B325BE.1030307@mind.be>
Message-ID: <20131219204321.GA14241@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-12-19 17:58 +0100, Arnout Vandecappelle spake thusly:
> On 17/12/13 23:35, Yann E. MORIN wrote:
> >Arnout, All,
> >
> >On 2013-12-17 23:20 +0100, Arnout Vandecappelle spake thusly:
> [snip]
> >>  Here's a wild idea...
> >>
> >>In rpi-userland/Config.in:
> >>
> >>if BR2_PACKAGE_RPI_USERLAND
> >>config BR2_PACKAGE_LIBEGL_PROVIDER
> >>	string
> >>	default "rpi-userland"
> >>endif
> >>
> >>In opengl/libegl/libegl.mk:
> >>
> >>LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2PACKAGE_LIBEGL_PROVIDER))
> >>
> >
> >That's about what I am experimenting right now! :-p
> >
> >But I've done it slightly differently:
> >
> >package/opengl/libegl/Config.in:
> >     config BR2_LIBEGL_PROVIDER
> >         string
> >
> >package/rpi-userland/Config.in:
> >     config BR2_LIBEGL_PROVIDER
> >         default "rpi-userland" if BR2_PACKAGE_RPI_USERLAND
> >
> >And the same .mk fragment you suggested for libegl.
> 
>  Nice! I'm all for it! I didn't know it was allowed in Kconfig to define the
> same symbol twice. But indeed, we already do that in arch/

In fact, you can define a symbol only once: the moment you give it a
type is when the symbol is actually 'defined'.

You can however use the symbol in different places, to set a default
value or other properties (depends, selecti, options...)

There are a few properties of a symbol that can only be set once:
  - the type  (obviously)
  - the prompt, even if it is conditional
  - the help text

> >My solution is a little bit more compact, and since it does not use a
> >package-named variable, we can say that packages do not step on
> >one-another's feet. Yet, a bit hackish, I have to concede...
> >
> >>
> >>  It's still hackish of course, because:
> >>
> >>- rpi-userland/Config.in defines a symbol "belonging" to the libegl package;
> >>
> >>- only one provider can be defined, Kconfig will scream if it's defined
> >>twice;
> >
> >Is it even valid to have two providers of the same functioanlity? What
> >would happen: what libEGL.so would be used? Probably the last one
> >installed, ie. the one from the alphabetically-last provider.
> 
>  Completely true. With your construct, if somehow two providers are
> selected, Kconfig will probably just give you the first-sourced provider.

No, we can't know which one is used: the symbols are stored in buckets,
indexed by the hash of each symbol.

So, there is no (simple) way to know what symbols takes precedence, since
we can't easily predict what bucket they'll end up, so what symbol will
be hit first/last.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
