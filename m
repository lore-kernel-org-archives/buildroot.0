From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jun 2013 10:51:39 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: wrap 'ld' so that a ld
 emulation can be specified
In-Reply-To: <CAG2jQ8jst0KgN9q5mEeGeeucctcr4g+-sCqQxaTguNFa7Mwh1Q@mail.gmail.com>
References: <1370469543-20677-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAG2jQ8jst0KgN9q5mEeGeeucctcr4g+-sCqQxaTguNFa7Mwh1Q@mail.gmail.com>
Message-ID: <20130606105139.267eb78d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Thu, 6 Jun 2013 09:31:25 +0100, Markos Chandras wrote:

> My understanding is that this is also a problem with buildroot
> toolchains as well. So whilst your patch fixes the problem with
> external
> toolchains, MIPS64/n64 buildroot toolchains will still have the same
> problem.

Yes, I do remember your patch
http://patchwork.ozlabs.org/patch/244694/. Normally, for internal
toolchains, the idea is that the tools (gcc, ld) are configured, at
build time, to produce the 'right' code by default, without requiring
any tuning. The man page of 'ld' says:

       -m emulation
           Emulate the emulation linker.  You can list the available
           emulations with the --verbose or -V options.

           If the -m option is not used, the emulation is taken from the
           "LDEMULATION" environment variable, if that is defined.

           Otherwise, the default emulation depends upon how the linker
           was configured.

The last paragraph being the important one here. See what OpenEmbedded
is doing:
https://github.com/openembedded/oe-core/blob/master/meta/recipes-devtools/binutils/binutils-2.23.2/mips64-default-ld-emulation.patch.

The problem here is that the MIPS tuples do not contain the ABI, so the
ld/configure.tgt and bfd/config.bfd scripts of binutils have no way of
knowing which emulation you would like to have by default. Maybe we
need to improve binutils to make this configurable?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
