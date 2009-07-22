From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 22 Jul 2009 10:34:39 +0200
Subject: [Buildroot] kernel built by buildroot won't boot
Message-ID: <1248251679.3933.11.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we are developing for an ARM platform. Here are the relevant parts of
our buildroot .config:

BR2_ARM=Y
BR2_iwmmxt=y
BR2_ARM_TYPE="ARM_IWMMXT"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="iwmmxt"
BR2_GCC_TARGET_ARCH="iwmmxt"
BR2_GCC_TARGET_ABI="aapcs-linux"

So far we did compile the kernel ourselves, using the gcc from the
buildroot toolchain. Now we have changed our setup to have buildroot
create the kernel for us. The build succeeds, but the resulting kernel
can not be booted.

We tracked this down to the fact that buildroot passes the TARGET_CFLAGS
(with some minor adjustments) to the kernel build as CFLAGS_KERNEL. The
problem is that the TARGET_CFLAGS contain "-mtune=iwmmxt -march=iwmmxt",
which is fine for the user-space, but you can't build a working kernel
with these flags. Not passing any CFLAGS at all solved the problem for
us and buildroot now creates a kernel that boots and works nicely.

Is there a particular reason for passing the TARGET_CFLAGS to the kernel
build? Could this perhaps be dropped entirely or at least be made
optional?


Sven
