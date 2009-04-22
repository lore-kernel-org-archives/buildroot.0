From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 22 Apr 2009 18:14:56 +0200
Subject: [Buildroot] PXA270 and gcc-4.3.3 for iwMMXt
In-Reply-To: <dfb660300904220908x17502c02xad3358a6c64cb3f9@mail.gmail.com>
References: <dfb660300904220908x17502c02xad3358a6c64cb3f9@mail.gmail.com>
Message-ID: <20090422161456.GD19863@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 22, 2009 at 09:08:28AM -0700, Laine Walker-Avina wrote:
> I've been trying to build a busybox system with buildroot for a
> PXA270-based system. I tried to use the latest gcc version in svn to
> generate the kernel and rootfs, however when I try to run the system I
> can't login and it doesn't run any of the init scripts in init.d. I
> tried to chroot to the new rootfs from a previously built rootfs
> compiled for a armv4 arch and it gave me a "Illegal Instruction" error
> when trying to run ash. Most other commands from that busybox run
> fine. And ash runs fine if i don't do the chroot and use the shared
> libs from the other rootfs. Any thoughts?

Check that your kernel and toolchain binaries are both built for EABI
and check for the following entries in your busybox .config:

BR2_iwmmxt=y
BR2_ARM_TYPE="ARM_IWMMXT"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="iwmmxt"
BR2_GCC_TARGET_ARCH="iwmmxt"
BR2_GCC_TARGET_ABI="aapcs-linux"

What you describe to see is very likely that kind of problem, we had
that many times already. The above settings should do well, though.

Daniel
