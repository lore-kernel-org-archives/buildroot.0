From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 00:44:52 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix use of extensions
In-Reply-To: <20150313214751.2df5307c@free-electrons.com>
References: <cover.1426272973.git.yann.morin.1998@free.fr>
 <7a6b64928c074474e7577f762550fe60916ed052.1426272973.git.yann.morin.1998@free.fr>
 <20150313214751.2df5307c@free-electrons.com>
Message-ID: <20150313234452.GC4391@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-13 21:47 +0100, Thomas Petazzoni spake thusly:
> On Fri, 13 Mar 2015 19:57:29 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > Fix that:
> > 
> >   - first, the dependency on extensions is moved to a dependency of the
> >     patch step;
> 
> This is a bit problematic because then the dependency is unknown to the
> package infrastructure. Which means that things like 'make
> graph-depends' will no longer display this dependency.
> 
> To solve this, we would have to add a <pkg>_PATCH_DEPENDENCIES variable
> in pkg-generic, or something like that.

OK, so I tried to implement your proposal, but I stumbled against
various issues:

 1- what should be done with a patch-dependency: must it be handled like
    a normal dependency, i.e. be fully built and installed? Or should it
    just be extracted and patched itself?

    We're trying to introduce this new type of dependency to solve the
    linux extension case. So, we do not really require the extension to
    be built in the first place; we only need their files so we can
    vampirise them, so simply extracting and patching is all we currently
    need. The RTAI extension so far goes as far as explicitly adding a
    dependency on "rtai-patch" instead of just "rtai", as rtai depends
    on linux. So, to use this new feature for linux extensions, we
    really want *not* to build the extension.

    However, introducing this new feature in the pkg-generic infra means
    it is available to other packages as well, and we can not predict
    what packages could use it for. Would there be packages that
    want/need a built patch-dependency?

    There's a kind of discrepancy in there, as normal dependencies are
    dependencies to be built, while patch-dependencies are dependencies
    that only need to be, well, patched...  (I find it odd.)

 2- extensions are really not supported for _OVERRIDE_SRCDIR, since they
    are handled as pre-patch hooks, and _OVERRIDE_SRCDIR does not do
    patches.

    Is that something we want to live by, or do we want to support
    extensions even in the _OVERRIDE_SRCDIR?

    Note that this is not a new issue: it has always been the case so
    far, even before the migration to kconfig-package.

[Though this be madness, yet there is method in't.]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
