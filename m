From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 21 Nov 2016 10:18:43 +1100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
Message-ID: <20161120231843.GA2896@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 19, 2016 at 08:23:23PM +0100, Arnout Vandecappelle wrote:
>  Hi all,
> 
>  Here's an analysis of autobuild failures. It looks a bit different from what
> Thomas usually sends because I based it on the website rather than the mail. I
> eliminated the ones that are already fixed in git, and also the powerpc64le
> failures that are due to libtool.m4.
> 
>  I'm not putting the people from get-developers in Cc, because they already get
> these mails.

[snip]

> http://autobuild.buildroot.net/results/35b43039ee050a62966c6f104ad4b5816ebfc310
> powerpc64 / power7	mpv-0.20.0	glibc	
> 
> > ../audio/out/ao_sdl.c: In function 'init':
> > ../audio/out/ao_sdl.c:178:18: error: incompatible types when assigning to type '__vector __bool int' from type 'int'
> >      priv->paused = 1;
> >                   ^
> > ../audio/out/ao_sdl.c: In function 'reset':
> > ../audio/out/ao_sdl.c:186:9: error: wrong type argument to unary exclamation mark
> >      if (!priv->paused)
> >          ^
> > ../audio/out/ao_sdl.c:188:18: error: incompatible types when assigning to type '__vector __bool int' from type 'int'
> >      priv->paused = 1;
> >                   ^
> > ../audio/out/ao_sdl.c: In function 'resume':
> > ../audio/out/ao_sdl.c:194:9: error: used vector type where scalar is required
> >      if (priv->paused)
> >          ^
> > ../audio/out/ao_sdl.c:196:18: error: incompatible types when assigning to type '__vector __bool int' from type 'int'
> >      priv->paused = 0;
> >                   ^
> 
>  This was supposed to be fixed by 64904f0 which is already included in this
> build. Sam?

Hmm. I'm not sure what happend when I tested this; it seemed to work at
the time but I can replicate the problem now. What's happening is that
the patch relies on including stdbool.h to define "bool", but it's not
working because stdbool.h has been included somewhere before where the
patch adds it, so stdbool.h is seeing _STDBOOL_H already defined, and
the #ifndef guard is preventing the file from being re-included.

How about we go back to my original suggestion of changing the bool
field to an int? It's not as nice but it's safer since it doesn't depend
on include ordering and it would work in this situation.

Really, the right approach would probably be to change the compiler
flags so that it's not combining altivec with -std=c99 (e.g. change
-std=c99 to -std=gnu99, which also fixes the issue for me) but I'm
concerned that doing it that way might have unintended side effects
since I don't know exactly what those flags change or why the package is
setting c99 in the first place.

Comments?

[snip]

Cheers,
Sam.
