From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Nov 2017 23:15:07 +0200
Subject: [Buildroot] vboot-utils issue in Buildroot
In-Reply-To: <20171106204808.52b09e63@windsurf>
References: <20171106172452.4579763b@windsurf.home>
 <20171106184840.GA28366@latitude.localdomain>
 <20171106204808.52b09e63@windsurf>
Message-ID: <20171106211507.GA1361@latitude.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mon, Nov 06, 2017 at 08:48:08PM +0100, Thomas Petazzoni wrote:

> Thanks for your feedback. However, please keep the mailing list in Cc.

Sorry, did not notice it was a list message. This one should go with Cc.

> But it's quite weird to have a dependency on the target architecture
> when building a host tool. Looking at the ARM specific code for
> example, it pokes into /proc/firmware/device-tree/, which obviously has
> no chance to exist on the build machine.

Here's what I think happens there: they have a common library that gets
used both for target-independent tools (futility) and target-specific
tools (crossystem). This library includes some target-specific code that
is only needed for crossystem, but gets built anyway because it's a part
of the library.

Actually within Buildroot this whole problem can be solved with a simple
patch that would delete this line:

	host/arch/${ARCH}/lib/crossystem_arch.c \

crossystem seems to be the only tool that calls anything from that file, 
no idea why it's a part of the library.

> Gentoo defines ARCH == HOST_ARCH. Be careful that if they are
> different, vboot-utils will try to use Qemu.

Looks like qemu is only used there for tests.
Also, the way they choose qemu command:

    ifeq (${ARCH},${HOST_ARCH})
      ...
    else
      QEMU_ARCH := ${ARCH}
    endif

    ...
      QEMU_BIN = qemu-${QEMU_ARCH}

doesn't make any sense if ARCH is HOST_ARCH.
