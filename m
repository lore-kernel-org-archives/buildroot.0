From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 14:41:26 +0100
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <20180403220132.GA20271@itchy>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
 <20180402004857.7e7e46c1@windsurf>
 <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
 <20180402005738.1d603538@windsurf>
 <1B48158D-B250-46BC-A4B8-7A2816D2573A@storagecraft.com>
 <7E1DAB3C-F973-4E41-8E6F-E603021DCFF9@storagecraft.com>
 <20180402083828.54d43b63@windsurf>
 <911E1AE2-32AB-4DE4-89B2-49F68BFE20BF@storagecraft.com>
 <20180403220132.GA20271@itchy>
Message-ID: <20181216144126.325f6ad1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

Sorry for the very slow feedback.

On Wed, 4 Apr 2018 00:01:32 +0200, Eric Le Bihan wrote:

> Building Rust for x86_64 on a x86_64 is indeed tricky!
> 
> As seen in the build section of src/bootstrap/config.toml.example, Rust
> manages "build", "host" and "target" parameters, which all default to
> "x86_64-unknown-linux-gnu".
> 
> When building, the compiler is built for the host and the standard
> library for the host and the target.
> 
> So when the target is the same as the host, only the compiler and the
> standard library for the host should be built.

When you are talking about "target" and "host", are you talking just
about the CPU architecture, or about the full target and host
definition, which includes the C library ?

If you build on x86-64, targeting a x86-64 platform, you have host
arch == target arch, but you still can't use the cross-compiler to
build programs and expect them to run on the host:

 - The C library might be different: uClibc or musl for the target,
   glibc available on the host

 - The kernel headers version may be different: the C library for the
   target may be built to use very recent/modern kernel headers and
   therefore meant to run on a system that uses a recent kernel, while
   the host machine may be running an older kernel.

So basically, using the cross-compiler to build something that will be
executed on the host machine is always wrong.

So the initial patch from Charles, that does this:

+		if [ "x$(RUSTC_HOST_NAME)" != "x$(RUSTC_TARGET_NAME)" ]; then \
+			echo 'cc = "$(TARGET_CROSS)gcc"'; \
+			echo 'cxx = "$(TARGET_CROSS)g++"'; \
+		fi; \

is clearly not good, because:

RUSTC_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)

So when you target x86-64 and build on x86-64, RUSTC_HOST_NAME ==
RUSTC_TARGET_NAME, and therefore it will continue to use the target
compiler to build programs meant to run on the host, which is very
wrong.

> As the compiler is built on LLVM, coded in C++, a C++ compiler for the
> host is indeed required. It happens that in the build of LLVM, a host
> tool named FileCheck is built and run for test.
> 
> IIUC, the C compiler is only used for building the standard library
> (this is what I've seen when cross-compiling for ARM).
> 
> So when the target is the same as the host, it might be sensible to
> avoid defining c and cxx in the target configuration file, as suggested
> by your patch.
> 
> I'll poke upstream for clarifications on this special case, though.

Did you get some feedback ?

I'll mark the patch as Changes Requested. We need at least the
following things to be changed:

 - Split into two patches the addition of "cxx" vs. the target != host condition

 - A detailed and documented commit log

Charles, ?ric, could you work on a new version of this patch ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
