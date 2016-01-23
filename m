From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 23:21:21 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: detect circular
	dependencies
In-Reply-To: <1453586685-24190-1-git-send-email-yann.morin.1998@free.fr>
References: <1453586685-24190-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160123232121.10d1ffe3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 23 Jan 2016 23:04:45 +0100, Yann E. MORIN wrote:
> Currently, if there is a circular dependency in the packages, the
> graph-depends script just errors out with a Python RunteimError which is

RuntimeError

> We fix that by recusrsing the dependency chain of each package, until we

recursing

> We need to introduce a new function, check_circular_deps(), because we
> can't re-use the existing ones:
> 
>   - remove_mandatory_deps() does not iterate,
> 
>   - remove_transitive_deps() does iterate, but we do not call it for the
>     top-level package if it is not 'all'
> 
>   - it does not make sense to use those functions anyway, as they were
>     not designed to _check_ but to _at_ on the dependency chain.

at -> act

Isn't kconfig already detecting such situations ? It normally spits out
a warning when you have a circular dep, no ?

> +# This function will check that there is no loop in the dependency chain
> +# As a side effect, it builds up the dependency cache.
> +def check_circular_deps(deps):
> +    def recurse(pkg):
> +        if not pkg in list(deps.keys()):
> +            return
> +        chain.append(pkg)
> +        for p in deps[pkg]:
> +            if p in chain:
> +                sys.stderr.write("\nRecursion detected for  : %s\n" % (p))
> +                while True:
> +                    _p = chain.pop()
> +                    sys.stderr.write("which is a dependency of: %s\n" % (_p))
> +                    if p == _p:
> +                        sys.exit(1)
> +            recurse(p)
> +        chain.pop()
> +
> +    chain = []
> +    for pkg in list(deps.keys()):
> +        recurse(pkg)

I am a bit worried about the algorithmic complexity of this new
function. As you know, we had issues with other parts of graph-depends
having a too high algorithmic complexity to handle large
configurations, or configurations having specific patterns of
dependencies.

Have you measured the time impact of this new check on a very large
configuration (like allyespackageconfig) ?

I'm Cc'ing also Gustavo, who has access to a configuration that was
even worse than allyespackageconfig for the previous speed problem
which we fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
