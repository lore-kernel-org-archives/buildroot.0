From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 21:49:07 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87y6xomehq.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
	<87y6xomehq.fsf@macbook.be.48ers.dk>
Message-ID: <1231274947.32308.260.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 20:16 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> You have not said anything so far, on how you would like
>  Ulf> to support distributions.
> 
> Distributions? What kind of distributions?

Distributions = release.
> 
>  Ulf> If you plan to take the current structure and just 
>  Ulf> start to remove/deprecate and label with BROKEN
>  Ulf> then I am afraid that this will cause a lot of problems.
> 
> Why? More that the current situation?
> 

As I pointed out, the current structure really only
allows you to have one makefile fragment per package.

You need several for distributions (or releases) to work


You need the "stable" makefile
You need a "testing" makefile and you need
a "development" makefile

There is no support for indicating that a package works for one
architecture and is broken for another.

As I see it, you start with the minimum set of packages
in the stable distribution, and then you start
putting a set of packages in the testing part.

People should be able to test building the combined
stable + testing packages with *all* testing packages enabled.

When someone finds that a certain architecture
can build a set of packages, then this fact
can be commited to trunk by setting the enable for each
working package for that architecture.

We should maybe also have separate untested/broken
status for each package/architecture.
Some packages relies on H/W which never is going
to be present. Thinking of PCI etc,
and it we may want to separate broken (whgich theoretically
is fixable) from something that should *never* be tried.

This will allow anyone else to build the stable +
testing packages by including the file containing
the enables for that architecture/distribution combination.

Approaching the end of the testing period,
we will find some packages permanently broke for everything.
We then prune them from the testing set, 
Other packages will work for some architectures,
and they will have the architecture specific enable
removed, while the (hopefully many) packages
that build OK for everything, should have a global enable
set if the distribution is used.

With a system where you define which versions 
of each package you should use, with the possibility
for the user to override this, you get something
which is workable 

You can also allow people to have several versions
of the same package for different architectures. 

With the current structure you cannot work as a team.

-----
So what happens if we jst add BR2_BROKEN.
If you have one package like AVAHI, 
with might builds for 9 out of 10 architectures.
Are we going to mark this as broken, or are
we going to mark the 10th architecture as broken.

No good answer here.


I think our goal should be to help people to 
secure a working build for the things we choose to
support, but to allow them to improve and fix
problems without making it unneccessary hard to do so.

I do not think that we want to block people from
using other versions than the one supported
in the distribution.
They need to be able to test new things.

IMO, It is also important to allow people to
go back and rebuild a stable distribution
years later, but still be able to upgrade
the odd package.

You need to think carefully about the core architecture of
Buildroot, to ensure that this does not become a burden.



>  Ulf> We should also replacing svn with git.
> 
> One thing at the time. git infrastructure on uclibc.org has been
> discussed in connection with the break in / reinstall. It probably
> makes most sense to move buildroot to git when the other uclibc
> projects do.
> 
