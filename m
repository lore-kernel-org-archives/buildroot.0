From: Ralph Siemsen <ralphs@netwinder.org>
Date: Thu, 19 Jul 2007 09:40:24 -0400
Subject: [Buildroot] Buildroot Build Procedure
In-Reply-To: <000b01c7c968$39211680$2c48a8c0@greyhawk.tonecommander.com>
References: <000b01c7c968$39211680$2c48a8c0@greyhawk.tonecommander.com>
Message-ID: <20070719134024.GA23483@marvin.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 18, 2007 at 11:19:46AM -0700, Jerry Richards wrote:

> My understanding is my buildroot/Makefile will re-build the toolchain and
> the
> buildroot/build_mipsel_nofpu/linux-2.6.10_dev-malta-mips2_fp_len/Makefile
> will re-build my kernel.  This is correct?

Not quite.  The top-level makefile will rebuild any targets that 
are required.  The first time through, this will include the toolchain,
but once that is built (in toolchain_build_mipsel_nofpu in your case)
then running top-level make again will not rebuilt it again.

Similarly for the "packages".  They will get built in subdirectories
of build_mipsel_nofpu (or more generally, build_<arch> directory).
Once a package has copied its binary into the root filesystem area,
then "make" knows it does not have to rebuilt the target anymore.

To force a rebuild of certain packages, you generally need to delete
the corresponding subdirectory under build_<arch>, or at least run
"make clean" in that directory.  Note that the top-level make allows
you to do this conveniently on a per-package basis by running, for example:

   make busybox-clean   (cleans up build_<arch>/busybox-1.x.y)

If you want to rebuild all your applications (but not the toolchain)
then you can remove the build_<arch> directory completely, this is
supposed to happen when you run "make dirclean" though that usually has 
some hiccups.

> I also want to write some applications to the root filesystem prior to
> compressing it (i.e. to CRAMFS or SQUASHFS).
>
> Since the buildroot make creates the compressed filesystem, I find I must
> run it twice (steps 2 & 7, below) as shown in the following complete
> re-build:
>    [...]
> Is this the correct procedure?  Is there a shortcut I'm missing?

Well you *could* do the very complicated process you described,
and hope that you get each step right every time you make a change.
You could even write a little batch file to help you out...

However, I would recommend you instead look at the documentation
at http://buildroot.uclibc.org/buildroot.html in particular the
section on Extending Buildroot with more Software.  This will show
you how to add your own software easily to buildroot, and take part
in the "normal" build process.  You won't have to run make twice,
and you won't have to go through any complicated shell commands
each time you want to change something.

-R
