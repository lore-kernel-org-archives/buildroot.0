From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 1 Apr 2019 17:32:37 +0000
Subject: [Buildroot] [PATCH] toolchain-external: Fix paths in libstdc++
 gdb python file
In-Reply-To: <20190331144231.13d5b9ca@windsurf>
References: <20190329220445.22941-1-tpiepho@impinj.com>
 <20190331144231.13d5b9ca@windsurf>
Message-ID: <1554139955.7410.73.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2019-03-31 at 14:42 +0200, Thomas Petazzoni wrote:
> 
> > The python file libstdc++.so.6.0.25-gdb.py contains two paths:
> > pythondir = '/share/gcc-8.2.1/python'
> > libdir = '/arm-linux-gnueabihf/lib'
> > 
> > The latter is the location of the file in the toolchain and the
> > former
> > the location of a python module to be used by gdb.  The python code
> > in
> > the file subtracts libdir from the end of the current
> > libstdc++.so.6.0.25-gdb.py location and appends pythondir, to find
> > the
> > current path to the python module.
> > 
> > Buildroot installs this file into the stage, at which point the
> > paths
> > above are no longer correct.
> > 
> > This patch uses sed to fixup the paths to reflect the installed
> > location, relative to HOST_DIR, and the location of the python
> > module
> > relative to HOST_DIR.
> > 
> > and
> 
> And ?

and that's a stray and from a squashed commit I didn't notice.

> Is this problem specific to the ARM ARM toolchain ? I guess other
> toolchains will have the same file, so probably we want a more
> generic
> fix ?

I checked the Linaro ARM 2018.05 toolchain, similar problem, but worse.

pythondir = '/home/tcwg-buildslave/workspace/tcwg-make-
release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-
gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/share/gcc-
7.3.1/python'
libdir = '/home/tcwg-buildslave/workspace/tcwg-make-
release/builder_arch/amd64/label/tcwg-x86_64-build/target/arm-linux-
gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/arm-linux-
gnueabihf/lib'

Path isn't correct at all.  At least the ARM toolchain is ok until
buildroot moves some files around.

I was able to modify my sed script a bit so that it works on this
toolchain too.  The two variables I added in the patch have different
values for this toolchain of course.  That's why I put them there. 
What would be the place to put in a common hook like this?
