From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2014 20:54:05 +0100
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <20140117180935.GB3982@free.fr>
References: <1389111727-11021-1-git-send-email-jeremy.rosen@openwide.fr>
 <20140117175251.GA3982@free.fr> <20140117180935.GB3982@free.fr>
Message-ID: <20140117195405.GC3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2014-01-17 19:09 +0100, Yann E. MORIN spake thusly:
> On 2014-01-17 18:52 +0100, Yann E. MORIN spake thusly:
> > On 2014-01-07 17:22 +0100, J?r?my Rosen spake thusly:
> > > Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> > > 
> > > ---
> > > The following command, run from a clean buildroot checkout
> > > 
> > > make O=.. BR2_EXTERNAL=.. raspberrypi_defconfig
> > > 
> > > cause the following output, and makes stop :
> > > 
> > > 
> > > make: *** Pas de r?gle pour fabriquer la cible ? /home/rosen/tmp/buildroot/
> > > configs/../configs/../configs/../configs/<lots more >/../configs/
> > > raspberrypi_defconfig ?, n?cessaire pour ? /home/rosen/tmp/buildroot/
> > > configs/../configs/../configs/<lots more>/../configs/
> > > raspberrypi_defconfig ?. Arr?t.
> > > 
> > > The problem is that the buildroot makefile has two rules to generate
> > > %_defconfig: One that depends on $(TOPDIR)/configs/%_defconfig and the
> > > other one that depends on $(BR2_EXTERNAL)/configs/%_defconfig.
> > > 
> > > When one rule checks for the file, the other rule becomes an implicit rule
> > > for the dependancy causing an infinite cross-recursion.
> > > 
> > > By overriding the implicit rule, we prevent the infinite recursion.
> > 
> > This breaks defconfigs from BR2_EXTERNAL when used with an out-of-tree
> > build:
> > 
> >     make -C /path/to/buildroot              \
> >          O=/path/to/build                   \
> >          BR2_EXTERNAL=/path/to/br2.external \
> >          yem_defconfig
> >     [--SNIP--]
> >     *** Can't find default configuration "/home/ymorin/dev/buildroot/buildroot/configs/yem_defconfig"!
> 
> It even breaks BR2_EXTERNAL for in-tree builds.
> 
> Reverting that patch fixes both issues, and does not exhibit the
> reported problem.
> 
> Peter, can we just revert that patch (cset 94dd02f) for now, please?
> 
> J?r?my, can you describe your setup, so we can try to reproduce it, and
> find a proper fix?

Out of curiosity, I just installed a make-4.0 to make sure that was not
due to some idiocy of make-4.0 (since it hs changed quite a few
behaviours that were relied on from previous versions, such as the
ordering of files in $(wildcard ...) ).

But no, it works as expected, with make-3.81 and make-4.0 alike.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
