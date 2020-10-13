From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 17:56:55 +0200
Subject: [Buildroot] ELFUTILS - only build for the target architecture...
In-Reply-To: <CACxOKo+x_2v9eF0TukkToGBi4Ng6Hf=LGnWSFDrFY3BQez69wA@mail.gmail.com>
References: <CACxOKoKEi0OnY+aq1i6S=zX5XnDnu_pMVWtGmEpnDB7CrdW2cw@mail.gmail.com>
 <20201013134712.023269ac@windsurf>
 <CACxOKo+x_2v9eF0TukkToGBi4Ng6Hf=LGnWSFDrFY3BQez69wA@mail.gmail.com>
Message-ID: <20201013175655.307a62f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Oct 2020 09:25:53 -0600
Maurice Smulders <maurice.smulders@genevatech.net> wrote:

> I am using a (slightly) modified version of 2020.02. It is a hybrid
> form of a custom tree and a few patches.
> 
> I patched the crosstool section to allow GLIBC to be used for our PPC
> e500v2 architecture - isn't that hard, but it requires an older
> version of GLIBC (2.29.1) - as the newest version doesn't support PPC
> e500 anymore - just like GCC 7.5 is the end of the line for it too
> and I made a patch to support compiling cborruby - as the ruby
> developers haven't thought at all about cross compiling for other than
> Windows on Linux...

Hm, we still have e500v2 supported in Buildroot but indeed only in the
"Classic" PowerPC ABI, and not the SPE ABI which indeed is no longer
supported since gcc 8.x.

I assume you're not able to use the Classic PowerPC ABI for some reason?

> I can likely upgrade buildroot to the latest LTS and apply these
> patches to be at the same state...

So indeed, in elfutils 0.177, I do see all those per-architecture
shared libraries. I looked at upstream elfutils, and they changed
things in commit 4f937e24dc7ad1820fc7c99a6dd6422657f14666, which says:

    Don't use dlopen() for libebl modules
    
    Currently, architecture-specific code for libebl exists in separate
    libebl_$ARCH.so libraries which libebl loads with dlopen() at runtime.
    This makes it impossible to have standalone, statically-linked binaries
    which use libdwfl if they depend on any architecture-specific
    functionality. Additionally, when these libraries cannot be found, the
    failure modes are non-obvious. So, let's get rid of libebl_$arch.so and
    move it all into libdw.so/libdw.a, which simplifies things considerably.
    
    Signed-off-by: Omar Sandoval <osandov@fb.com>

So prior to that commit (for example elfutils 0.177), libebl what
dlopen-ing those per-architecture .so files. Now, all the code is built
into the libebl library directly.

And there's indeed no way to selectively compile support for only a
subset of the CPU architectures. But again, this is not about the CPU
architecture we run on: all those shared libraries are compiled for
your selected CPU architecture. However, they contain code to
manipulate ELF binaries that have been compiled for other CPU
architectures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
