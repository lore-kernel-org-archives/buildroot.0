From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 23:31:11 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix use of extensions
In-Reply-To: <20150313221013.GA4391@free.fr>
References: <cover.1426272973.git.yann.morin.1998@free.fr>
 <7a6b64928c074474e7577f762550fe60916ed052.1426272973.git.yann.morin.1998@free.fr>
 <20150313214751.2df5307c@free-electrons.com>
 <20150313221013.GA4391@free.fr>
Message-ID: <20150313233111.3abcb6be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 13 Mar 2015 23:10:13 +0100, Yann E. MORIN wrote:

> > Hum, I am not sure to see why the switch to the kconfig-package
> > infrastructure would have modified this behavior. So I'd like to
> > understand how it used to work, if it ever worked (but I believe it
> > did, no?).
> 
> Fair enough, I'll double-check that it did / did not work back then.

Great.

> > This is a bit problematic because then the dependency is unknown to the
> > package infrastructure. Which means that things like 'make
> > graph-depends' will no longer display this dependency.
> 
> Right. Note however that this was already the case for the RTAI
> externsion, because it was declaring:
> 
>     LINUX_DEPENDENCIES += rtai-patch
> 
> so that was already missed (or at least mis-interpreted) by graph-depends
> anyway.

Indeed, correct. And that's not nice :/


> > I'm not sure to understand how the linux extensions had to delve into
> > the .stamp_patched internals. They were just registering a
> > POST_PATCH hook, no?
> 
> No, they _did not_ have to so far.
> 
> What I meant is that the switch to a dependency of the patch step
> required that they would now all have had to write something like:
> 
>     $(LINUX_DIR)/.stamp_patched: | EXT-patch
> 
> (where EXT is the name of the extension.)
> 
> To avoid such an arcane code that would have to be replicated (and
> potentially tracked down in case we change something in dependency
> handling), I found it would be better to have it all handled in a single
> location.

Ok, understood.

> 
> Anyway, I'll look at your suggestion of introducing FOO_PATCH_DEPENDENCIES.
> However, linux is the sole package that requires such handling, and I
> wonder if it is worth introducing for just a single package (note that
> I rehash your own argument, hehe! ;-) )

Point taken :-)

But my argument about putting things in the infra only if at least a
significant number of packages need it is only valid if there's another
way of doing it that works. For example, if you have three packages
that do --disable-foobar, then it's not a strong argument to put it in
the infra because it can perfectly be done in a per-package fashion.

However, things such making sure that the infra is aware of weird
dependencies is not something you can fix at the per-package level, you
need some support from the infrastructure.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
