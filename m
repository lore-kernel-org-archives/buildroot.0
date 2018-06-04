From: Bob Beckett <bbeckett@netvu.org.uk>
Date: Mon, 4 Jun 2018 17:51:09 +0100
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <20180604182339.5513583b@windsurf>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
 <20180604182339.5513583b@windsurf>
Message-ID: <CAESO2EJ6ivZvCjKek8da3hJWjkzgP_L2Myjbc05o0Z7Z_=nkOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe a variable _IN_DEVELOPMENT or something could be added to a package's
makefile to indicate that the version is always considered out of date, and
should be re-fetched.
That way development branches for package specs could have the package spec
committed with that, while release branches do not and are expected to have
a non-branch version specifier.

With this strategy you would be acknowledging that you are not getting
reproducibility, but you are still getting reliable builds (the 2 reasons I
use buildroot).
The test for taint would then be to check if any packages have an
_IN_DEVELOPMENT variable set.

Given the current state, if you specify a branch of master, you get a
warning that it doesnt appear to be a special version, but that is all, and
the package doesnt build at all as it failed to get the source in the first
place.
I think if there is going to be an enforcement of not using branches, then
the build should probably fail in a more explicit way e.g. check to see if
the version is a branch. If it is, then fail the build with a message
telling the user that branches are not to be used as versions (perhaps
unless something is set?). When I hit this issue it took me a bit of
hunting to figure out what was going on. The current state neither does
what you would expect nor anything that is usable in this specific setup.




On Mon, Jun 4, 2018 at 5:23 PM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> Yann already answered on some of the aspects, but I wanted to add one
> more thing.
>
> On Mon, 4 Jun 2018 15:59:29 +0100, Bob Beckett wrote:
>
> > If you wanted to make it more predictable, then maybe name the tar
> > based on the version (branch name in this case) plus the sha, this way
> > new tar packages would be created if the branch advances and also if a
> > tag (or other supported refspec) changes via a rebase etc.
>
> But then at every build you need to go and check the Git repository to
> see if a new version on this branch is available. That's clearly not
> something we want to do for all packages.
>
> > The particular thing I like to avoid is multiple version bumps in the
> > package spec and tags in the package source repos during development.
> When
> > many people are working on package project, expecting them all to take
> time
> > to publish tags for every little change gets unrealistic.
>
> During development, we would normally expect people to use
> <pkg>_OVERRIDE_SRCDIR or <pkg>_SITE_METHOD = local, which allows a
> package to use locally available source code instead of fetching it as
> a tarball or from Github.
>
> > Anyway, if this design is locked down, then I will just maintain this
> patch
> > locally for us to use :)
>
> The design is never locked down, Buildroot is open sourced, and
> influenced by all the people who use it and contribute to it. However,
> we are obviously careful to maintain a behavior and semantic that makes
> the most sense. And as Yann pointed out, reproducibility is a key thing.
>
> That being said, Angelo is proposing something like a "taint" flag that
> tells the user "warning, your build is not reproducible". Perhaps we
> could extend the Git logic so that packages can say "always fetch the
> latest commit from this branch", and if they do that mark the build as
> tainted.
>
> But I'm still unsure when should this re-fetch should happen. When you
> completely rebuild from scratch ? When you do "make <pkg>-rebuild" ?
>
> If we want to alter the Buildroot design, we need to agree on a
> behavior that globally makes sense.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/f7f3e071/attachment.html>
