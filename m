From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 30 Nov 2006 11:14:14 +0000 (UTC)
Subject: [Buildroot] Impossible to build EABI ARM gcc toolchain using
	Buildroot ?
References: <loom.20061129T130728-811@post.gmane.org>
	<1164848869.23643.60.camel@dv>
Message-ID: <loom.20061130T112254-849@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pavel Roskin <proski@...> writes:
>
> Hello!
>
> On Wed, 2006-11-29 at 13:25 +0000, MikeW wrote:
>
> > If I set the target suffix to 'elf-linux' the toolchain build
> > completes, but objects created with it have EABI version=0 (= no EABI).
> > (These will not link with a 3rd-party-built library with EABI version=4.)
>
> How do you check that?

objdump -x objectfile.o

> 
> You don't need the CPU part in the target, only the OS and the kernel
> part.  In other word, you need something like "linux", "linux-gnu",
> "linux-uclibc" etc.

I *do* miss out the CPU part in the menuconfig option field.
I have also tried using the default setting for the field,
which is linux-uclibcgnueabi, as you suggest.

>
> > I can't see any other likely setting to change ...
> > 
> > Any ideas ?
> > Or do a need a newer version of Buildroot ... or a patch ?
>
> Remove BR2_GNU_TARGET_SUFFIX from .config and run "make oldconfig".  The
> suggested value will be "linux-uclibcgnueabi" and it should work.
>
> To make sure the suffix would work, run recent config.sub with the
> arm-unknown-SUFFIX argument and make sure it's accepted.  Sometimes
> config.sub can become confused if it doesn't know how to insert "gnu"
> after "linux" :)
>
> I still see it failing with gcc 3.4.6 and binutils 2.17.50.0.7:
>

[As per my other post] You also need to specify software FP.

> 
> Maybe you can fix it.  You can try another compiler.
> 

It appears that (most of) the toolchain *is* built correctly.
The relevant directory in staging_dir/bin contains files like
arm-linux-uclibcgnueabi-gcc - correct !

If I build an object file with this compiler after the aborted
Buildroot make, it has EABI version=4, as required.

The problem seems to be with the step in building the gcc package
which checks for 'supported emulations' using ld.

Something seems to cause a mismatch between what is seen,
and what is expected - this looks like a gcc/ld problem, at least
with the configuration that Buildroot gives to it.
