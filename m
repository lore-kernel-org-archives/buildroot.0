From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2013 23:35:43 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <52B0CE36.5000400@mind.be>
References: <52A730B0.3020104@orange.com> <52AA41FE.6060705@mind.be>
 <20131217071100.04b7b3a7@skate>
 <201312170858.13393.yann.morin.1998@free.fr>
 <20131217100414.551a3832@skate> <52B0CE36.5000400@mind.be>
Message-ID: <20131217223543.GC3352@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-12-17 23:20 +0100, Arnout Vandecappelle spake thusly:
> On 17/12/13 10:04, Thomas Petazzoni wrote:
> >Dear Yann E. MORIN,
> >
> >On Tue, 17 Dec 2013 08:58:13 +0100, Yann E. MORIN wrote:
> >
> >>>  1. Since the .mk part is centralized in opengl/libgles, but the
> >>>     Config.in is not (spread in each OpenGL implementation doing the
> >>>     select BR2_PACKAGE_HAS_OPENGL_ES), we can centralize the
> >>>Config.in logic by removing the "select BR2_PACKAGE_HAS_OPENGL_ES"
> >>>in each OpenGL implementation, and define BR2_PACKAGE_HAS_OPENGL_EL
> >>>as something like:
> >>>
> >>>config BR2_PACKAGE_HAS_OPENGL_ES
> >>>	bool
> >>>	default y if BR2_PACKAGE_RPI_FIRMWARE
> >>>	default y if BR2_PACKAGE_THIS_OTHER_OPENGL_IMPLEMENTATION
> >>>	default y if BR2_PACKAGE_...
> >>
> >>With this first proposal, it becomes a bit more complex to
> >>implement providers in BR2_EXTERNAL.
> >
> >Ah, true.
> 
>  Also it feels inconvenient to me that the virtual package should "know"
> about all its providers.

Agreed.

> >>>  2. Or, we can take the opposite route by pushing the currently
> >>>     centralized libgles.mk logic that adds each OpenGL
> >>>implementation in LIBGLES_DEPENDENCIES down into each OpenGL
> >>>implementation .mk file. But that requires a late evaluation of
> >>>$(generic-package), so that all OpenGL implementations can be
> >>>registered in LIBGLES_DEPENDENCIES before the generic-package macro
> >>>of libgles.mk is evaluated. This would require something like
> >>>Yann's patch.
> >>
> >>Needless to say I would highly prefer this second solution.
> >
> >Right. In principle, I have nothing against this solution. It's just
> >that I am not sure to fully grasp the consequences of the change you're
> >proposing. I'm a bit worried about "weird" consequences that we may not
> >be thinking of at this time. But maybe we should simply apply the
> >patch, and see if it causes problems for some specific use cases.
> 
>  I'm also a bit afraid of the consequences. It also makes make processing,
> which is already difficult to understand, even more obfuscated.
> 
> 
>  Here's a wild idea...
> 
> In rpi-userland/Config.in:
> 
> if BR2_PACKAGE_RPI_USERLAND
> config BR2_PACKAGE_LIBEGL_PROVIDER
> 	string
> 	default "rpi-userland"
> endif
> 
> In opengl/libegl/libegl.mk:
> 
> LIBEGL_DEPENDENCIES = $(call qstrip,$(BR2PACKAGE_LIBEGL_PROVIDER))
> 

That's about what I am experimenting right now! :-p

But I've done it slightly differently:

package/opengl/libegl/Config.in:
    config BR2_LIBEGL_PROVIDER
        string

package/rpi-userland/Config.in:
    config BR2_LIBEGL_PROVIDER
        default "rpi-userland" if BR2_PACKAGE_RPI_USERLAND

And the same .mk fragment you suggested for libegl.

My solution is a little bit more compact, and since it does not use a
package-named variable, we can say that packages do not step on
one-another's feet. Yet, a bit hackish, I have to concede...

> 
>  It's still hackish of course, because:
> 
> - rpi-userland/Config.in defines a symbol "belonging" to the libegl package;
> 
> - only one provider can be defined, Kconfig will scream if it's defined
> twice;

Is it even valid to have two providers of the same functioanlity? What
would happen: what libEGL.so would be used? Probably the last one
installed, ie. the one from the alphabetically-last provider.

> - it may not work at all :-).

I'll tell you when I'm done with my checks... ;-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
