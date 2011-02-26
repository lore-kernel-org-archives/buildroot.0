From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Fri, 25 Feb 2011 20:12:55 -0700
Subject: [Buildroot] Saving custom configs to buildroot, linux, uclibc,
 ...
In-Reply-To: <AANLkTiniUe6OoYvh=M1SdEf=HjXtH7SoqBiRc8MG45ub@mail.gmail.com>
References: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
	<1298516134.2712.75.camel@galileo.graphics-muse.org>
	<AANLkTiniUe6OoYvh=M1SdEf=HjXtH7SoqBiRc8MG45ub@mail.gmail.com>
Message-ID: <1298689975.2712.133.camel@galileo.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-02-24 at 08:55 +0100, Thomas De Schampheleire wrote:
> This description sounds very similar to Buildroot: 

It is.  Very similar.  BeagleBox doesn't have the nice menuconfig
capability, of course.  Since BeagleBox is targeted at both a specific
platform and a specific product (set top box), it isn't quite as
generically oriented.  But it is flexible through custom configuration
files.

> you have a system
> that is in charge of building a set of packages, based on certain
> configurations. Packages are automatically downloaded, and configured
> using make or scripts.

That's correct.  No scripts, however.  I had one, but recent Buildroot
releases required me to remove a post-configuration script so I could
easily rebuild the rootfs image.  In BeagleBox, to rebuild the rootfs
image you run "make buildroot-rebuild" and any packages removed from the
<BUILDDIR>/buildroot-<version>/output/build get recompiled and the image
regenerated.  I just moved the post-configuration stuff into the rootfs
init scripts which is where they really belong anyway.

> Do I understand correctly that you are not using Buildroot for
> building u-boot and the kernel, 

That's correct.  These are separate components within BeagleBox's
metabuild.

> but that these components rather are
> built through BeagleBox? Why is that?

Because I want tighter control of how I build each component, when I can
rebuild them, how I rebuild them, how I package them, which versions I
use and how I configure them.  I find Buildroot adequate for building
all these components but I'd rather have full control of the various
"important" pieces (cross compiler, bootloader, kernel and rootfs)
without any dependencies between them.  Buildroot does an excellent job
with the rootfs so I use it specifically for that.  But it doesn't, for
example, build an RPM of the cross toolchain (well, it didn't before and
I don't *think* it does now).  I also had problems understanding how to
rebuild just one component after changing a configuration (not a
buildroot "package" but the configuration, like the Crosstool-NG config
file).  Or how I could rerun mkimage for u-boot to generate boot
scripts.  

More importantly, I can swap out configurations for components easily by
using their own menuconfigs.  So I can easily rerun Crosstools-NG
menuconfig and Buildroot's menuconfig and the kernel menuconfig all with
nothing more than "make <component>-menuconfig".  And I can save those
configs in a similar fashion.  And while BeagleBox doesn't currently
have this, the related build at work actually generates kernel patches
for me too.  

I used to have Buildroot building the cross toolchain for me but ran
into some problems on a PowerPC based build at work so switched to
Crosstool-NG.  Also, the cross toolchain needed to be pulled out of the
"single metabuild" tree so that it could be used externally.  At work I
build the cross toolchain into an RPM so other developers (mostly
hardware guys) could use it for application builds without having to
build the other components.  BeagleBox has the cross toolchain included
in the metabuild to make it easier (I hope) for others to get started
using the build. 

One important aspect of my metabuild is that it can switch Buildroot
versions easily.  Buildroot has changed a bit since last year and I can
easily test the updates (including checking which patches are now in the
mainline).  If Buildroot were just the metabuild of all these major
components that would be fine.  But it's a metabuild of the major
components plus a build of the rootfs too.  I want the rootfs to be a
major component on its own so I can switch it out with a new revision
(from whomever is developing it) without having it affect the kernel,
cross compiler or bootloader.

Don't get me wrong - I learned a lot of how to do this by understanding
how to work with Buildroot and Busybox.  I have Buildroot packages
integrated into BeagleBox that get installed after it unpacks and
patches (if necessary) Buildroot, things I need to eventually submit as
patches, like the surf browser.  I just feel having these components
split out makes it easier to work with them individually.  

Think of it as a cross between doing it the Buildroot way and doing it
the OpenEmbedded way, except without all that Python stuff. 

Keep in mind that Buildroot is an excellent swiss-army-knife of build
systems.  But not everyone uses every tool in a swiss-army-knife, and
sometimes its just a matter a preference.

And of course, there is the vital knowledge I get by doing each piece by
itself.  I understand the "whole" a lot better now.

> Have you considered making Buildroot the 'master', and building
> everything from inside there?

Yes.  It started that way.  In fact, I started that way, then switched
to using Buildroot just to build the cross toolchain and then again
(with a separate config file) to build the rootfs.  I changed it when I
realized it wasn't as easy as I would like to work with the individual
components.  But you really can't beat the ease at which Buildroot lets
you build the rootfs.  That's the swiss-army-knife corkscrew I can't
live without.

Hope that helps.

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
