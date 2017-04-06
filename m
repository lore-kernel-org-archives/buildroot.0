From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 17:13:23 +0200
Subject: [Buildroot] [PATCH v4 1/1] syslinux: build with the target
 toolchain
In-Reply-To: <1491473086-16647-1-git-send-email-benoit.allard@greenbone.net>
References: <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
 <1491473086-16647-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170406171323.13d11cc6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Apr 2017 12:04:46 +0200, Beno?t Allard wrote:
> Until now, the host toolchain was used to build syslinux, as it was
> not possible to build a 32-bit syslinux with a x86-64 toolchain.
> 
> However, syslinux requires gnu-efi, and gnu-efi is built using the
> target toolchain. Mixing different toolchains doesn't work well, so
> this commit changes the syslinux package to use the target toolchain
> for syslinux as well. This is made possible by patches
> 0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch and
> 0004-memdisk-Force-ld-output-format-to-32-bits.patch.
> 
> Since syslinux also contains some utilities that have to run on the
> host, those have to continue being built with the host toolchain,
> which requires patch 0005-utils-Use-the-host-toolchain-to-build.patch.
> 
> This was tested using a Buildroot's built x86_64 toolchain, and
> checked that the output binaries are 32-bits. It was tested as well if
> they actually boot on hardware.
> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Thanks, this now builds fine. However, in output/host/usr/bin, I still
have a program built with the target toolchain:

$ file output/host/usr/bin/syslinux
output/host/usr/bin/syslinux: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-musl-x86_64.so.1, not stripped

See the /lib/ld-musl-x86_64 interpreter? This means it has been built
against the musl C library, and therefore with the target toolchain.

What is this program useful for?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
