From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 09:57:35 +0200
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <b474912f-1e1c-7329-bdbe-6305225529a8@mind.be>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
 <20180604182339.5513583b@windsurf>
 <CAESO2EJ6ivZvCjKek8da3hJWjkzgP_L2Myjbc05o0Z7Z_=nkOw@mail.gmail.com>
 <b474912f-1e1c-7329-bdbe-6305225529a8@mind.be>
Message-ID: <20180605095735.62e563bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 00:18:39 +0200, Arnout Vandecappelle wrote:

> On 04-06-18 18:51, Bob Beckett wrote:
> > Maybe a variable _IN_DEVELOPMENT or something could be added to a package's
> > makefile to indicate that the version is always considered out of date, and
> > should be re-fetched.  
> 
>  We're never going to consider something *always* out of date, I think. We might
> only consider it out-of-date when you do an explicit foo-rebuild.

Well, never say "never" :-)

During the development phase, if you have 50 or 100 in-house
components, it may be annoying to do a "foo-rebuild" for all of them in
order to get their latest version. But this can probably be resolved by
having a custom target (implemented locally by people who want that)
that triggers the rebuild of all packages they are interested in.

> > That way development branches for package specs could have the package spec
> > committed with that, while release branches do not and are expected to have a
> > non-branch version specifier.
> > 
> > With this strategy you would be acknowledging that you are not getting
> > reproducibility, but you are still getting reliable builds (the 2 reasons I use
> > buildroot).
> > The test for taint would then be to check if any packages have an
> > _IN_DEVELOPMENT variable set.  
> 
>  I'm not so fond of the _IN_DEVELOPMENT idea. What I like more is to extend
> _OVERRIDE_SRCDIR to support repositories in addition to local files. It would
> then check out directly into the build directory, without passing through DL_DIR
> or a tarball.
> 
>  This would probably be a rather complicated change however.

Is it that complicated to add a:

	cd $(pkg_OVERRIDE_SRCDIR); git pull

before doing the rsync of the source code ? Of course, we don't want to
do this unconditionally as soon as <pkg>_OVERRIDE_SRCDIR is set, so
perhaps a separate boolean variable is needed.

> > Given the current state, if you specify a branch of master, you get a warning
> > that it doesnt appear to be a special version, but that is all, and the package
> > doesnt build at all as it failed to get the source in the first place> I think if there is going to be an enforcement of not using branches, then the
> > build should probably fail in a more explicit way e.g. check to see if the
> > version is a branch. If it is, then fail the build with a message telling the
> > user that branches are not to be used as versions  
> 
>  I completely agree with this one, we should simply fail on branches.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
