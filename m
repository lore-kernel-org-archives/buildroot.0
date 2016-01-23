From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2016 23:31:12 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: detect circular
	dependencies
In-Reply-To: <20160123232121.10d1ffe3@free-electrons.com>
References: <1453586685-24190-1-git-send-email-yann.morin.1998@free.fr>
 <20160123232121.10d1ffe3@free-electrons.com>
Message-ID: <20160123223112.GD3363@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-23 23:21 +0100, Thomas Petazzoni spake thusly:
> On Sat, 23 Jan 2016 23:04:45 +0100, Yann E. MORIN wrote:
[--SNIP--]
> Isn't kconfig already detecting such situations ? It normally spits out
> a warning when you have a circular dep, no ?

No, because the ones I'm concerned with are optional dependencies:
libgtk2 and libgtk3 have an optional dependency on cups, like so;

    ifeq ($(BR2_PKG_CUPS),y)
    FOO_DEPENDENCIES += cups
    endif

And this is not caught at the Kconfig level, because there is actually
no circular deps there.

> > +# This function will check that there is no loop in the dependency chain
> > +# As a side effect, it builds up the dependency cache.
> > +def check_circular_deps(deps):
> > +    def recurse(pkg):
> > +        if not pkg in list(deps.keys()):
> > +            return
> > +        chain.append(pkg)
> > +        for p in deps[pkg]:
> > +            if p in chain:
> > +                sys.stderr.write("\nRecursion detected for  : %s\n" % (p))
> > +                while True:
> > +                    _p = chain.pop()
> > +                    sys.stderr.write("which is a dependency of: %s\n" % (_p))
> > +                    if p == _p:
> > +                        sys.exit(1)
> > +            recurse(p)
> > +        chain.pop()
> > +
> > +    chain = []
> > +    for pkg in list(deps.keys()):
> > +        recurse(pkg)
> 
> I am a bit worried about the algorithmic complexity of this new
> function. As you know, we had issues with other parts of graph-depends
> having a too high algorithmic complexity to handle large
> configurations, or configurations having specific patterns of
> dependencies.
> 
> Have you measured the time impact of this new check on a very large
> configuration (like allyespackageconfig) ?

I have an allyespackageconfig with an recent toolchain so I get a lot
of packages, and I tweaked the config to disable a few to enable others.

And no, the speed impact is not measurable for me. I'll come up with
numbers (of course, when there's no loop!) a bit later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
