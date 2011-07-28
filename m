From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Jul 2011 09:52:09 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
	method
In-Reply-To: <20110725110016.76f0fef0@skate>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LVq=6i-D6N2n1u0mAzEKufBMhXRaq5FaY=tSfa12jE0pA@mail.gmail.com>
 <20110725110016.76f0fef0@skate>
Message-ID: <201107280952.09973.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 25 July 2011 11:00:16, Thomas Petazzoni wrote:
> > then using a per-package indication about whether it supports
> > out-of-tree  building could be helpful. I mentioned it in the other
> > thread.
> >
> > 
> >
> > For those packages that do not support it, too bad, compilation from
> > multiple buildroot installations wouldn't work. If someone requires
> > this, he'll have to make a copy of the local package himself, or make
> > sure the package's out-of-tree building gets supported.
> 
> I don't like the idea of having a different behaviour for different
> packages. The whole purpose of the package infrastructures was to
> standardize the build process/behavior of all packages. So adding a
> feature that makes different packages behave differently is not
> something I would really be happy with.

 Alternatively, you could fall back onto a copy (or rsync) if out-of-tree 
building is not supported.

 I'm using rsync for my local packages, but without common infrastructure.  
It looks like this:

RT_APP_VERSION      = local
RT_APP_SRCDIR       = $(call qstrip,$(BR2_RT_APP_SRCDIR))
RT_APP_SOURCE       = # Defined empty, so it won't be downloaded
RT_APP_EXTRACT_CMDS = rsync -v -rltODx --exclude=.svn --exclude=.git $(RT_APP_SRCDIR)/ $(RT_APP_DIR)

 In addition, I _always_ want to rebuild this package (because that's what's
changing all the time).  Note that my rsync command above doesn't delete
anything, so the object files are still there.  So I add the following to
my rt_app.mk as well:

# Force re-extraction, re-building and re-installation
$(RT_APP_TARGET_EXTRACT): RT_APP_FORCE
$(RT_APP_TARGET_BUILD): RT_APP_FORCE
$(RT_APP_TARGET_INSTALL_TARGET): RT_APP_FORCE
RT_APP_FORCE:
.PHONY: RT_APP_FORCE


 
 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
