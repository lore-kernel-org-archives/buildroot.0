From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Dec 2014 00:28:07 +0100
Subject: [Buildroot] [RFC v2] linux: add fbtft kernel extension
In-Reply-To: <20141230223603.GC3928@free.fr>
References: <1419969494-9615-1-git-send-email-ps.report@gmx.net>
 <20141230223603.GC3928@free.fr>
Message-ID: <20141230232807.GD3928@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-12-30 23:36 +0100, Yann E. MORIN spake thusly:
> On 2014-12-30 20:58 +0100, Peter Seiderer spake thusly:
> > My first attempt was using the out of tree kernel modules compile
> > (as suggested by Yann E. MORIN [1]) which is already (partly)
> > supported by the fbtft source, but I failed to enable some
> > needed kernel configurations e.g FB_DEFERRED_IO (did not survive
> > the oldconfig/silentoldconfig step when not referenced in tree,
> > workaround is to enable a built in feature with the same
> > preferences [2]).
> 
> OK, I'll be looking at it, to see why it fails. Don't expect much before
> next week-end (actually, that will be next year, too! :-) ) because,
> well, New Year celebrations, boring stuff like that, which I'm socially
> obliged to attend... ;-)

OK, so it seems it will not be possible to biuld it as an out-of-tree
module, after all. DAmn, that's really, really bad... :-(

So, here's why: the code uses FB-related functions that are built from
separate source files, most of them conditionalised to a Kconfig symbol.
But those symbols are promptless, and can only be selected.

Thus, unless another frambuffer implementation is enabled, that selects
them, they wonlt be enabled, and thus the corresponding source files
will not be built, and the needed functions will not be in the Kernel
(neither built-in, nor in a module).

Moreover, one of the symbol, CONFIG_FB_BACKLIGHT, can only be selected
by PCI-dependent symbols (DRM stuff, like radeon or nouvea), or SuperH
dependent symbols (for some SuperH framebuffers).

Almost all needed symbols can be selected by cheating, and selecting the
virtual framebuffer, but that's not a real sane option. And we'd still
miss two symbols anyway.

So, for now, I'd say we can only use it as a linux-extension.

That's sad, real sad... :-(

The proper solution would be to patch the kernel to add a kind of
"framebuffer library for external FB drivers" (a bit like we have in the
"Library routines" sub-menu for CRC and a few other functions, that
would select all the hidden knobs for helper functions, and build them
(built-in or module), and send that patch upstream.

But I'll have a deeper look later this week-end.

Happy New Year, have nice celebrations in the coming days! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
