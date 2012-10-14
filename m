From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 14:55:39 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <507A9742.7030301@mind.be>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121014103518.4fb1089d@skate> <20121014104601.568a3d10@skate>
 <507A9742.7030301@mind.be>
Message-ID: <20121014145539.4f456877@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, 14 Oct 2012 12:43:14 +0200, Arnout Vandecappelle wrote:

> > All what this stuff is adding can already be done with the current
> > Buildroot, by putting the configuration files in a board/something/foo
> > directory, and adjusting the Buildroot configuration.
> 
>   It doesn't even have to be in a board/something/foo directory, it can
> easily be out of tree.  The only problem is that you have to write down
> a fairly long path for each of the relevant config options.

Come on, it's just something like:

	$(TOPDIR)/../myproject/linux.config

> >  It just adds a
> > useless layer with a fuzzy concept of "project" that we had in the
> > past, and was a terrible idea.
> 
>   That it didn't work in the past doesn't mean it's a terrible idea :-)

Except that what you're proposing is almost exactly what we had at the
time, so to me it sounds like the same terrible idea :)

> > Moreover, the introduction text states that "Many buildroot users
> > prefer to keep their project's customizations separate from buildroot
> > itself", but the patch set doesn't solve this problem at all:
> 
>   It's not a "problem", because it is already possible now - I've done
> it for my last four buildroot projects (without any modification to
> stock buildroot), and I find it _much_ more convenient than before to
> upgrade buildroot - particularly if I just want to test that particular
> project against current master.  But the main advantage is that you can
> nicely separate the things which are proprietary from the things that
> are potentially upstreamable (because those are still applied in the
> buildroot tree itself).

I still don't get what this patch set adds that you can't do with the
existing Buildroot infrastructure.

> >   * Custom packages are not taken into account
> 
>   In $(PROJECT_DIR)/project.mk, add:
> 
> BR2_PACKAGE_FOO=y
> include package/foo/foo.mk

Then you can just use the "local.mk" mechanism similarly, it already
exists.

> >   * Additional patches added to existing packages are not taken into
> >     account
> 
>   You can add a post-patch hook in project.mk.  It's a bit more involved,
> that's why I propose to automate that in the package infrastructure.
> But I haven't needed that up to now so I don't have a solution ready,
> and I'm not going to spend time on it if it will be NAK'd anyway :-)
> 
>   For the things that do frequently need patches (linux, u-boot, ...)
> we already have config options, so we could just add PROJECT_DIR-based
> defaults for those as well.

I really would prefer to _document_ how to properly use the existing
Buildroot infrastructure to cleanly separate custom stuff from
Buildroot, rather than introducing more mechanisms on top of it.

> >   * Modification to the recipes of existing packages are not taken into
> >     account. And it is very common for a project that you need to
> >     slightly upgrade or adjust the recipe of a few existing packages.
> 
>   Indeed.  Those changes should still go in the buildroot tree itself.

And those are the most annoying ones to maintain and upgrade when you
want to upgrade to a new Buildroot version. So basically, it seems to
me like your patch set solves problems that are already solved
(specifying a custom location of kernel config, uClibc config, kernel
patches, U-Boot patches, etc.), while it doesn't solve any of the real
problems that aren't solved today.

> > So even with this additional complexity,
> 
>   Complexity? The diffstat of patches 1-7 is:
>   8 files changed, 30 insertions(+), 2 deletions(-)
> 
>   The ones after that are more involved, I agree.

It's not a question of diffstat. It's a question of "is this mechanism
easy to grasp for newcomers and can it be immediately understood" and
"does this mechanism adds any value over what Buildroot already
provides"?

> > the most annoying problems are
> > not solved. So I really do prefer to keep things as it is: people have
> > to use version control systems to keep their changes cleanly separated
> > from the base Buildroot version.
> 
>   Version control doesn't really solve it, in my experience.

Why so?

> >A half-working solution is not going
> > to help our users to understand how to properly use Buildroot.
> >
> > If we want to really separate the project specificities, then we need
> > to introduce a real concept of "layers" like OpenEmbedded has, which
> > allows to also override package recipes, add new custom packages, etc.
> > But I am not sure we want to go down this road.
> 
>   I'm pretty sure we don't want to go down that road.  I don't believe
> the possibility of overriding package recipes is warranted.  I also
> don't think it's very useful in our context to have several layers.
> The only thing I want is to keep the customizations (i.e. configuration,
> skeleton, etc.) in a separate directory tree from buildroot.

And this is all already possible:

BR2_ROOTFS_SKELETON_CUSTOM=y
BR2_ROOTFS_SKELETON_CUSTOM_PATH="$(TOPDIR)/../foo"

BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/../kernel.config"

etc, etc.

So, sorry, but still not convinced. But I'm not the only Buildroot
developer and user, and I'm not the maintainer. So my voice is just one
amongst many others.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
