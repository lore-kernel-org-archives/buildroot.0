From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Nov 2015 23:17:37 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <564117BE.4050300@mind.be>
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <564117BE.4050300@mind.be>
Message-ID: <20151109221737.GD5162@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-09 23:01 +0100, Arnout Vandecappelle spake thusly:
> On 09-11-15 20:00, Yann E. MORIN wrote:
> > Currently, we set HOSTARCH to the output of `uname -m`. This gives us
> > the architecture as seen by the running kernel. For example, we would
> > end up with 'x86_64' for a 64-bit kernel running on an x86_64 processor.
[--SNIP--]
> > So, instead of relying on the output of `uname -r`, look for the host
> > gcc and extract the target it was configured to generate code for.
[--SNIP--]
> > +export HOSTARCH := $(shell gcc -v 2>&1 | \
> > +	sed -e '/^Target: \([^-]*\).*/!d' \
> > +	    -e 's//\1/' \
> > +	    -e 's/i.86/x86/' \
> > +	    -e 's/sun4u/sparc64/' \
> > +	    -e 's/arm.*/arm/' \
> > +	    -e 's/sa110/arm/' \
> > +	    -e 's/ppc64/powerpc64/' \
> > +	    -e 's/ppc/powerpc/' \
> > +	    -e 's/macppc/powerpc/' \
> > +	    -e 's/sh.*/sh/' )
> 
>  Since what we get here already are gcc tuples, the de-mangling shouldn't be
> needed, right?

I am not sure either way. Note that I only constrained the check on how
to retrieve the value, and expressely did not address the way we played
with it, so as to follow the path of least surprise.

However, we still have to de-mangle i.86 into x86 because that what
we're using everywhere. Also, we need to demangle arm.* into arm,
because arm may have some trailing stuff (like armv6) which still means
it's an arm. Ditto sh I guess. macppc I would guess (y the name of it)
that we really don't care about. sa110: are we really expecting to run
on that machine anyway?

We can further reduce the de-mangling in a later patch, however, it that
makes sense...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
