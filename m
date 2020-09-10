From: Robin Jarry <robin.jarry@6wind.com>
Date: Thu, 10 Sep 2020 09:29:10 +0200
Subject: [Buildroot] [PATCH v2 3/4] pycompile: fix .pyc original source
 file paths
In-Reply-To: <20200909203441.GR14354@scaer>
References: <20200908081026.4701-1-robin.jarry@6wind.com>
 <20200908081026.4701-4-robin.jarry@6wind.com>
 <20200909203441.GR14354@scaer>
Message-ID: <20200910072910.lbjjuh2e4ncg5a7i@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2020-09-09, Yann E. MORIN:
[snip]
> I am not python expert, but I tend to be using '{}'.format(..), and
> indeed, it seems that python considers the % formatting to be "old":
> 
>     https://docs.python.org/3/tutorial/inputoutput.html#old-string-formatting
> 
> Do you think you could switch to using str.format() ?

Sure, I have no strong opinion on the matter. I am more used to old
formatting since it is often shorter, but the new str.format() is less
ambiguous. I'll do that in a v3 today.

> So, back to this TARGET and PATH arguments. I find it pretty confusing
> the way they are described.
> 
> First, what TARGET used to be in the previous script is now something
> else, so keeping the naming is confusing. Also, 'target/' is a buildroot
> naming; I think we could get a better generic name: root
> 
> As for PATH, I find it strange that the metavar and variable do not
> match.
> 
>     parser.add_argument('root', metavar='ROOT',
>                         help='Path on the build machine that will be / at runtime')
>     parser.add_argument('dirs', metavar='DIR',
>                         help='Directory, relative to ROOT, to scan for py-files to compile')
> 
> So now, it should be possible to use as thus:
> 
>     python support/scripts/pycompile.py \
>         $(TARGET_DIR) \
>         usr/lib/python$(PYTHON_VERSION_MAJOR)
> 
> Or even (which I like better, because the DIR is absolute as seen at
> runtime too):
> 
>     python support/scripts/pycompile.py \
>         $(TARGET_DIR) \
>         /usr/lib/python$(PYTHON_VERSION_MAJOR)
> 
> But of course, dealing with path concatenation with an intermediate path
> that starts with a '/' is always tricky (I don't understand why upstream
> went that route...).
> 
>     for d in args.dirs:
>         abs = os.path.join(args.root, d[(1 if d[0] == '/' else 0):])
> 
> Thoughts?

I have another suggestion: changing the current TARGET argument into
a --strip-root "optional" argument (which will always be specified
anyway, but if not cross compiling, it can make sense not to use it).
It seems explicit enough to me and it avoids confusion with runtime/host
paths. What do you think?

I'll submit this in a v3 as well so we can discuss on something
concrete.

Thanks for the thorough review.

-- 
Robin
