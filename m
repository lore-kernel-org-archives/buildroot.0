From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 08:18:14 +0100
Subject: [Buildroot] [PATCH v4 2/6] qt5: Provide generic qmake package
 infrastructure
In-Reply-To: <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-3-anaumann@ultratronik.de>
 <e5be61b9-45e1-ddea-2b8a-9ba7511383b3@mind.be>
Message-ID: <20190326081814.0109d351@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Mar 2019 00:16:47 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > This is done by re-running the install step of the qmake generated Makefile
> > with the package build directory prepended (to the staging/host path). Even
> > though this does create lengthy pathes it allows for easy separation of the
> > staging files from the host destined files by just omitting the resulting
> > BUILD_DIR+HOST_DIR path from the following rsync call to the real target folder.  
> 
>  We have not converged yet on whether this is the right approach. So maybe, in
> order to move forward, it would be better to split the patch up into a first bit
> that creates the qmake package but does not define target install steps, then
> convert the relevant packages to qmake packages, and finally change the qmake
> infra to do target install and changes all the packages again. It's more work to
> do it this way, obviously, but it would allow us to already commit part of the
> series before we have converged on it completely.

While I understand your idea of splitting things up further in terms of
patches, I think we can try to agree on how the target installation
step should be done and use the approach proposed by Andreas to
directly have the qmake infrastructure use this target installation
logic. Andreas has already done lots of work on this (and building Qt5
modules takes a lot of time, so I suppose this patch series is annoying
like hell to build-test), so I'd like to not raise the barrier too high
here.

> > In addition, rsync excludes all header-, documentation- and cmake-pathes as well
> > as libtool and prl files in order to avoid unnecessary files accumulating in
> > target.  
> 
>  All of these (except *.prl) are anyway cleaned up in target finalize, so by
> itself it's not that useful.

Yes, I also felt that all those exclusions were not really needed, we
should probably keep things simple: rsync everything, and really on
target-finalize for doing the cleanup.

> > Getting rid of the many conditional install commands is possible because qmake
> > already takes care of this when generating the Makefile install targets with the
> > given or autodetected configure options of each package.
> > 
> > However, custom install steps may have to remain in cases where a particular
> > buildroot option has no corresponding setting in the packages configuration
> > options.  
> 
>  This is also something that probably will need more discussion.

Why ?

> > +	$$(MAKE) -C $$($$(PKG)_SRCDIR) INSTALL_ROOT=$$($$(PKG)_SRCDIR)/tmp-target-install $$($(2)_INSTALL_STAGING_OPTS)  
> 
>  This part really needs some explanation in the comment above, because it is
> *very* counter-intuitive. You should explain why INSTALL_ROOT is used here and
> not for staging install, and what its effect is exactly, i.e. that qmake
> configures things with STAGING_DIR as the prefix and that INSTALL_ROOT goes
> before it, so you end up with everything under
> $(@D)/tmp-target-install/$(STAGING_DIR)
> 
>  However, I'm not sure that this is the way we want to go. What is wrong with
> the pkg-files-list? You said before that it was incorrect, but if that is the
> case, it should be fixed.

At this point, I find the approach proposed by Andreas to be pretty
nice. We don't yet use pkg-files-list really as part of the build
process anywhere, I feel a bit more comfortable at this point with what
Andreas is proposing. No strong argument on this, just a general
feeling.

One advantage of Andreas approach is that it does not create a
dependency between the target installation step and the staging
installation step. They can happen in whatever order, or even in
parallel (think top-level parallel build). Indeed our package
infrastructure does not enforce any dependency between target
installation and staging installation. The solution of doing staging
installation, and then use the pkg-file-list of files installed to
staging for the target installation would require adding such a
dependency between the target installation and staging installation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
