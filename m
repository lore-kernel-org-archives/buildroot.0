From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 11:41:59 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87zj0oumrg.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk>
Message-ID: <20150915114159.758baca9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2015 10:09:39 +0200, Peter Korsgaard wrote:

>  > On my side, I don't. Some people are still forced to use 2.6.x kernels
>  > older than 2.6.32, and if Luca (who is a knowledgeable and
>  > skilled developer) has such a need, I'm sure it means there is a silent
>  > group of people stuck with prehistoric kernels that would benefit from
>  > this.
> 
> Sure, I get that. I just question the sensibility of combining a 6+ year
> old kernel with modern user space.

Well, it is quite understandable that Luca would like to use a recent
and modern Buildroot for his project. But since Buildroot is a bundle
of a build infrastructure *and* package recipes, you can't get a recent
and modern Buildroot without getting a recent and modern user-space.

>  > In addition, the changes that Luca is proposing are very
>  > self-contained, and often shared with the other /dev management
>  > solutions. So I don't see a lot of additional complexity in what Luca
>  > is proposing.
> 
> I do, it is yet another slightly different variant of the /dev
> handling to confuse new users and complicate the build logic.

Well, the /dev handling already has a number of different options, and
the user must anyway understand a little bit how a Linux system is
working to make a sensible choice between the different options. The
default is sane, and will remain the same, so that clueless users
continue to get the same experience/result.

I don't think a new variant of /dev management is that more complicated
than the "OpenMP support", "stack smashing protection support" or "LTO
support" options we have in the Toolchain menu.

> I agree that it isn't a _LOT_ of complexity, but it isn't non trivial
> either.

If it "isn't non trivial", then it is trivial, right ? :-)

>  >> Is there any reason for NOT using devtmpfs if it is available?
> 
>  > Well the point is precisely that it isn't.
> 
> What I meant is actually if this option is only useful for the (few?)
> Buildroot users with <2.6.32 kernels that want mdev support, or also for
> others?

Yes, it is probably only for people using kernels older than 2.6.32 who
need mdev for automatic module loading, or firmware loading.

There might be more users of such a thing that there are users of some
of our weird packages. Admitted, a package is just a package and
doesn't add any complexity to the core. But the additional complexity
brought by Luca's work is relatively small. And his work has in fact
uncovered a few issues in our existing code (the fact that we redirect
the output of all inittab commands to /dev/null, and that some of them
are in fact failing without us noticing).

>  > I'm not sure how complicated it is to backport devtmpfs. However I
>  > would suspect that it isn't that easy.
> 
> Take a look at 2b2af54a5bb6f7e80ccf78f20084b93c398c3a8b in the
> kernel. To me it looks quite self contained, so backporting it to
> something close to 2.6.32 doesn't look too bad.

Indeed. I wonder how many dependencies on other patches it has, though.
Luca, can you give it a try and see if it would work for you?

>  >> We certainly don't test such old kernel headers in the autobuilders.
> 
>  > Indeed, we don't. But we could ask Luca, as part of this patch series,
>  > to help us add such a toolchain in our autobuilders.
>  
> I'm not sure I'm really interested in seeing a bunch of patches adding
> 'depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6_<old>' / comments to
> packages.

Right, this I understand. We could keep the current state of things:
dependencies are only for >= 3.x kernels. So if something builds with
2.6.38 but not 2.6.32, then we don't care, and we make it depend on >=
3.x. Though I agree some people using 2.6.35 might complain, as they
can technically build that thing.

> But I still need to be convinced that adding this other mdev variant is
> the best tradeoff between:
> 
> - Adding the patches
> 
> - Ask people to backport devtmpfs to their kernel
> 
> - Ask people to handle it in a post-build script
> 
> - Ask people to add a initramfs mounting a tmpfs on /dev + mknod before
>   executing init
> 
> - Asking people to stick with user space of the same "maturity" ;) as
>   their kernel
> 
> If there's other people interested in this feature, then it would be
> nice to hear from you.

I agree getting more feedback from other potential users would be good.
However, I fear that many of the people who are stuck with old crappy
kernels are also in companies that are not necessarily very open, and
we may simply never hear from them.

So, as suggested above, Luca, can you try to backport devtmpfs? If that
solves the problem, then it's probably a good enough solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
