From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 18:23:39 +0200
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
Message-ID: <20180604182339.5513583b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yann already answered on some of the aspects, but I wanted to add one
more thing.

On Mon, 4 Jun 2018 15:59:29 +0100, Bob Beckett wrote:

> If you wanted to make it more predictable, then maybe name the tar
> based on the version (branch name in this case) plus the sha, this way
> new tar packages would be created if the branch advances and also if a
> tag (or other supported refspec) changes via a rebase etc.

But then at every build you need to go and check the Git repository to
see if a new version on this branch is available. That's clearly not
something we want to do for all packages.

> The particular thing I like to avoid is multiple version bumps in the
> package spec and tags in the package source repos during development. When
> many people are working on package project, expecting them all to take time
> to publish tags for every little change gets unrealistic.

During development, we would normally expect people to use
<pkg>_OVERRIDE_SRCDIR or <pkg>_SITE_METHOD = local, which allows a
package to use locally available source code instead of fetching it as
a tarball or from Github.

> Anyway, if this design is locked down, then I will just maintain this patch
> locally for us to use :)

The design is never locked down, Buildroot is open sourced, and
influenced by all the people who use it and contribute to it. However,
we are obviously careful to maintain a behavior and semantic that makes
the most sense. And as Yann pointed out, reproducibility is a key thing.

That being said, Angelo is proposing something like a "taint" flag that
tells the user "warning, your build is not reproducible". Perhaps we
could extend the Git logic so that packages can say "always fetch the
latest commit from this branch", and if they do that mark the build as
tainted.

But I'm still unsure when should this re-fetch should happen. When you
completely rebuild from scratch ? When you do "make <pkg>-rebuild" ?

If we want to alter the Buildroot design, we need to agree on a
behavior that globally makes sense.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
