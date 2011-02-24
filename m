From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Wed, 23 Feb 2011 19:55:34 -0700
Subject: [Buildroot] Saving custom configs to buildroot, linux, uclibc,
 ...
In-Reply-To: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
References: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
Message-ID: <1298516134.2712.75.camel@galileo.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-02-21 at 09:48 +0100, Thomas De Schampheleire wrote:
> Is there already an implementation? I have seen there is a
> 'savedefconfig' target, but this only targets the buildroot
> configuration, not the kernel nor uclibc.
> What do you think about such a build target?

I don't know of anything built into Buildroot for this but I solved this
problem by wrapping Buildroot (and Crosstool-NG, u-boot and the kernel)
into higher level metabuild that I call BeagleBox.  It's targeted at a
specific platform (BeagleBoard) but the concept is also at use at work
where it's targeted at a different platform (radar system).  

The idea is that the metabuild downloads, unpacks and patches (as
necessary) a software component and then copies in a saved configuration
from my metabuild tree before running the build.  That configuration can
be updated from my source tree by running 

  make <component>-menuconfig

which launches the menuconfig option of the component, such as
Buildroot.  I make my edits the usual way (curses menuconfig) and save
the configuration as usual, which saves it to .config or similar in the
component source tree.  Then I run

  make <component>-saveconfig

to save the updated component back to my metabuild source tree.  There
is help text (make help) explaining available targets for all
components.  The directory structure looks like this:

top
--src
--bld
--archive
--pkg

Everything is driven by GNU Make and configuration files under top/src.
I work directly out of top/src.  The build downloads archive files (or
clones git trees) into top/archive so I don't have to download them
again even after doing a "make <component>-clobber", which removes the
related directories for the component out of top/bld.  It then unpacks
them into top/bld.  The top/pkg is where the compiled binaries end up
for easy access.  The metabuild itself is just the "src" tree - the
other directories (except top) are created and cleaned up by the build
process.  I use bash functions to bounce around the various directories.

The mechanism works fairly well with multiple configuration files for
multiple repositories or releases.  Command line options specify which
repo configuration to use and which releases or GIT IDs to use.  This
allows me to experiment with different versions of the software to find
the most appropriate baseline for the project.

Anyway, just thought I'd throw that out there.  Feel free to modify
BeagleBox for your own project if it helps.
http://gitorious.org/beaglebox
http://www.graphics-muse.org/wiki/pmwiki.php?n=BeagleBox.BeagleBox

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
