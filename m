From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 14:17:04 +0100
Subject: [Buildroot] [PATCH v2 01/15] package/pkg-autotools.mk:
 Factorize hooks.
In-Reply-To: <54620920.5050203@mind.be>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-2-git-send-email-johan.oudinet@gmail.com>
 <20141110221323.GF22119@free.fr> <54620920.5050203@mind.be>
Message-ID: <20141111131704.GG4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-11-11 14:03 +0100, Arnout Vandecappelle spake thusly:
>  I'm mostly going to negate Yann's comments :-)

Meh... :-)

> >>  $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
> >> +else
> >> +# default values are not evaluated yet, so don't rely on this defaulting to YES
> >> +ifneq ($$($(2)_LIBTOOL_PATCH),NO)
> >> +$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
> >> +endif
> >>  endif
> > 
> > I think you got the order wrong here: we want the libtool patch to be
> > applied _before_ we autoreconf.
> 
>  No, we don't. We want it to be done after the autoreconf, because autoreconf
> generates the libtool scripts.
> 
>  In the original, there was a shell condition that evaluates that AUTORECONF is
> not YES in the LIBTOOL_PATCH_HOOK. So you would get the message that libtool is
> patched before the autoreconf, but the actual patching only happens after the
> reconf.

Well, both of us are partialy wrong, I think. LIBTOOL_PATCH_HOOK is a
post-patch hook, while GETTEXTIZE_HOOK and AUTORECONF_HOOK are pre-configure
hooks. So, the order at which they are defined is irrelevant, as it is done
right now.

But I agree with Arnout, we need to rework this.

The issue I can see is that, in case we're not autoreconfiguring, we can
only apply the libtool patch once, and that has to be as a post-patch.
But if we do autoreconf, it only makes sense to apply it after the
autoreconf.

One obvious thing to do would be to always apply it at post-patch,
whether we autoreconf or not, and if we do autoreconf, also apply it
after the autoreconf. After all, patching is not something that takes a
lot of time, is it?

That way, the code path is a bit more obvious.

And move the 13-or-so lines that do the conditional patching out to a
single function, so we can share it more easily.

Sigh, I need some more coffee...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
