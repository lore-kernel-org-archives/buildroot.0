From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 17:24:52 +0100
Subject: [Buildroot] vboot-utils issue in Buildroot
Message-ID: <20171106172452.4579763b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

I'm contacting you because you are listed in Buildroot's DEVELOPERS
file for the vboot-utils package.

We recently started to have build failures of host-vboot-utils:

  http://autobuild.buildroot.net/?reason=host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656

These all happen because we have enabled a new ppc64le build machine.
To be clear: it is not about building *for* a ppc64le target, it's
about the machine running Buildroot using a ppc64le processor.

The build fails with:

make[2]: *** No rule to make target `/home/peko/autobuild/instance-0/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/host/arch/ppc64le/lib/crossystem_arch.o', needed by `/home/peko/autobuild/instance-0/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/libvboot_util.a'.  Stop.

And obviously, host/arch/ppc64le/lib/crossystem_arch.c doesn't exist in
the vboot-utils source code, there's only a file for x86, x86_64, arm
and mips.

However, reading the logic in Makefile, it is not entirely clear what
this list of supported architectures is. It does this:

_machname := $(shell uname -m)
HOST_ARCH ?= ${_machname}

# ARCH and/or FIRMWARE_ARCH are defined by the Chromium OS ebuild.
# Pick a sane target architecture if none is defined.
ifeq (${ARCH},)
  ARCH := ${HOST_ARCH}
[...]

So it has some concept of HOST_ARCH vs. ARCH. But later on in the
Makefile, it apparently wants to use Qemu if ARCH != HOST_ARCH.

The problematic file being used is:

          host/arch/${ARCH}/lib/crossystem_arch.c \

Could you have a look at what this architecture specific code is doing?
It's somewhat weird in a set of host utilities to have something that
would depend on the target architecture.

It would be nice to see what the right solution is, as this package is
causing a significant number of build failures at the moment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
