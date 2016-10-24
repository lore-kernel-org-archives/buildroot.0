From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 14:28:40 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <874m42lztg.fsf@dell.be.48ers.dk>
 <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
Message-ID: <20161024142840.4c398e72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 13:19:30 +0100, Vicente Olivert Riera wrote:

> Do we want to do that? It looks better and cleaner to have a variable
> that holds flags suitable for building packages but not for building
> kernels/bootloaders. I think that's what Arnout means with the
> TARGET_EXTRA_CFLAGS.
> 
> My question is, if that TARGET_EXTRA_CFLAGS is not added to the wrapper,
> what will happen with those packages that have a crappy build system
> that doesn't respect the env variables?

Well, then they will of course not see the TARGET_EXTRA_CFLAGS. That's
the *whole* point of having the wrapper in the first place: to make
sure a given set of flags gets passed to the compiler, regardless of
the package build system. The very first option for which we added the
wrapper was --sysroot, for external toolchains. If it isn't passed, then
the compiler will not use the Buildroot sysroot.

So of course, if a set of flags is left out of the wrapper, and kept
only in a TARGET_EXTRA_CFLAGS passed in the environment, then those
broken packages will not use such flags.

You can't say at the same time:

 - I don't want those flags encoded in the wrapper, because they break
   the kernel/bootloader build

 - I want those flags encoded in the wrapper, because otherwise broken
   packages will not use them.

> And another question. What happen if we use the real compiler to build
> kernels and bootloaders? Would that be a problem? I don't know other
> architectures, but for MIPS the only variable we need to pass to the
> make program for building a kernel is ARCH=mips. The defconfig will set
> all the rest (float, endian, etc.).

Could be an approach to investigate, but I'm afraid is not as simple as
it looks. "perf" for example is part of the kernel, built with our
cross-compiler, but we would need to go through the wrapper because
"perf" is user-space code, and it does need to link with a bunch of
libraries available in our sysroot (so the --sysroot flag is important).

Perhaps we need an environment variable in the wrapper that tells it
"use all your flags" vs. "use only the flags that are really important,
such as --sysroot". We could then set this environment variable when
building specific packages such as the kernel and bootloaders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
