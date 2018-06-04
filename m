From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 4 Jun 2018 22:45:42 +0000
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <CAESO2EKCoO3rZjLHnag3Ag-_WnMSgHcWbv8tnPW0z8GQ89azGA@mail.gmail.com>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
 <20180604154433.GA3700@scaer>
 <CAESO2EJ7pwkrsrmarwBkpS7SswumuepmCYo01x2j0xpMmhGUCg@mail.gmail.com>
 <20180604165210.GA23325@g751.home>
 <CAESO2EKCoO3rZjLHnag3Ag-_WnMSgHcWbv8tnPW0z8GQ89azGA@mail.gmail.com>
Message-ID: <1528152340.28705.39.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-06-04 at 17:54 +0100, Bob Beckett wrote:
> > 
> > > 
> > > Regarding not knowing the sha before a checkout, would git ls-
> > remote not
> > > suffice for this? e.g.
> > > 
> > > $ git ls-remote git at gitlab.com:adhlinux/buildroot/buildroot.git
> > master
> > > 407fb2fe202aaeb273e4986dc88c30596a7fe8db    refs/heads/master
> > > 407fb2fe202aaeb273e4986dc88c30596a7fe8db   
> > refs/remotes/upstream/master
> > 
> > Yes 'ls-remote' is actually a good option. You could have the
> > following
> > package version during development:
> > FOO_VERSION = $(shell git ls-remote URL branch | awk '{ print $$1
> > }')
> > 
> > Then it would pick up any change automatically until you finish
> > your dev
> > and change the FOO_VERSION to a proper ID.
> > 
> > 
> 
> Thats actually a cracking idea. I like it (and I'm not sure why I
> didnt think of it when suggesting it for detecting outdated named
> head versions :) )

You will lose reproducibility of course.  There won't be any way to
recreate last week's nightly build since you'll get the current master
of every package when you try.  I would hate to try to track down a
regression in such a setup.

You'll also get builds that change from minute to minute as new commits
appear on any package's master branch.  I would think this would be
very annoying for developers.  I expect that my source code is only
changed when I run git pull, not every time I run make.

I also find that integration is not so easy as this.  Often commits in
one package require changes to another package.  Pulling in new commits
 to the product the instant they are merged in one package will often
break.

If you don't like updating package versions, here's a design that
avoids that and also doesn't suffer from the above problems.

product
-mypackage
--source code
-br-extern
--packages
---mypackage
----mypackage.mk
-----[MYPACKAGE_SITE_METHOD = local]
-----[MYPACKAGE_SITE = ../mypackage]
--configs
---myproduct_defconfig
-buildroot (submodule)
Makefile

The top level, "product", is a git repo.  There is a sub-directory for
each of the product's packages that contains the source.  One develops
the code by editing it in this location, and git commit/pull operations
on done on the code here as part of the product repo.

The by-extern directory is also part of the product repo.  It has the
buildroot files for the packages.  They are setup to use the "local"
SITE_METHOD and a relative path that points to the mypackage directory
that is part of the product repo, described previously.

buildroot itself is a git submodule of the product repo.

There is (probably) a top-level Makefile that has targets to do the
initial make command to buildroot, e.g. make -C buildroot
BR2_EXTERNAL=$(CURDIR)/br-extern O=$(CURDIR)/output/myproduct
myproduct_defconfig

To build, one git clones (recursively) the product repo.  This gives
you all the product source code and the buildroot version that will
build it.

Checking out an old version gives you the old code (any maybe an older
buildroot version too).

One develops by editing the source in this repo check out.  There is
nothing to setup (e.g. srcdir_override) to be in development mode.  One
commits to git directly from the checkout.

Once a commit is merged to master, it's part of the product.  There is
no additional step to update a git hash in a .mk file.

There is no difficulty if a single commit, or a series of commits part
of a single pull request, touch multiple packages (assume mypackage is
not the only package..).  This is how integration is done.  Multiple
commits to multiple packages could get merged into a topic branch, then
merged to master when the whole thing is ready.

A drawback here is that buildroot will not automatically rebuild a
package when the code is updated.  It's necessary to use the target
"mypackage-rebuild" to get that to happen.  A target that does this for
every package with SIT_METHOD == "local" is very handy.

I think buildroot could be made automatically detect changes by
comparing the timestamp of the .stamp_rsynced file vs the local
MYPACKAGE_SITE directory's timestamp.
