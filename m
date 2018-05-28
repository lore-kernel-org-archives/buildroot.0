From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 May 2018 22:36:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-21
In-Reply-To: <20180528202840.GI2965@scaer>
References: <20180522060038.2D49D20828@mail.bootlin.com>
 <20180522151741.6uqpst3wexs33yh6@tarshish>
 <20180528202840.GI2965@scaer>
Message-ID: <20180528203605.GJ2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-05-28 22:28 +0200, Yann E. MORIN spake thusly:
> On 2018-05-22 18:17 +0300, Baruch Siach spake thusly:
> > On Tue, May 22, 2018 at 08:00:38AM +0200, Thomas Petazzoni wrote:
> > >       mipsel |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb | ORPH
> > 
> > /bin/sh mktokens
> > /bin/sh mktokens
> > /bin/sh mkbuiltins builtins.def
> > /usr/bin/gcc -I. -I..   -g -O2 -Wall    -o mksyntax mksyntax.c
> > In file included from mksyntax.c:43:0:
> > parser.h: In function 'parser_eof':
> > parser.h:100:37: error: 'TEOF' undeclared (first use in this function)
> >   return tokpushback && lasttoken == TEOF;
> >                                      ^
> > 
> > I could not reproduce this one here. Might be a parallel build issue, where 
> > token.h (the generated header that defines TEOF) exists but is still empty 
> > when mksyntax.c compiles. Maybe the two invocations of mktokens are racing 
> > against each other. But I can't see why mktokens runs twice.
> > 
> > Another option is that the content of token.h is not generated correctly for 
> > some reason.
> > 
> > The autobuilder recorded[1] a few occurrences of the same failure (all error 
> > from January and before) not only on your machine.
> > [1] http://autobuild.buildroot.net/?reason=dash-0.5.9.1
> 
> Well, I have no idea. Lemme get a look at the code...

Actually, that's pretty obvious. src/Makefile.am contains this rule:

    token.h token_vars.h: mktokens
        $(SHELL) $^

So, when neither header exist, it can happen that make needs those at
about the same time, it will spawn mktoken twice. And when the first
finishes, the second might still be running, and the files are still
empty by the time a gcc tries to #include them.

It is pretty easy to "fix" this in either one of two possibilities.

The first, simple one, is to build with $(MAKE1).

The second, the cleanest one, is to make the Makefile.am parallel-safe,
using something like:

    token_vars.h: token.h
    token.h: mktokens
        $(SHELL) $^

Or something similar...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
