From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 20 Feb 2018 09:56:38 +0100
Subject: [Buildroot] [2018.02] check-bin-arch fails for PowerPC 32-bit
 userland, 64-bit kernel
Message-ID: <20180220085638.GB11289@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a defconfig with a multilib toolchain for PowerPC e6500 which is a 64-bit
architecture. The toolchain builds 32-bit by default, which is used for
userland. The kernel forces 64-bit anyway.
BR2_ARCH is set to "powerpc".

With the introduction of check-bin-arch, I now see failures after the kernel
compilation:
    ERROR: architecture for "/lib/modules/3.12.37-rt51/kernel/lib/libcrc32c.ko" is "PowerPC64", should be "PowerPC"
and same for other modules.
For actual userland binaries, readelf does show PowerPC as expected.

According to me, the situation is normal and check-bin-arch should accept it.
However, how to deal with it?

We could add a second variable BR2_READELF_ARCH_NAME_KERNEL.
Its value would be the same as the existing BR2_READELF_ARCH_NAME in case we are
dealing with a 32-bit arch, but the 64-bit equivalent in case of a 64-bit arch.
However, we don't currently mark all 64-bit powerpc architectures as such, so
we'd need some more knowledge about them (or could add them case by case as
required).
In the check-bin-arch script, or its caller, we then need to special case the
linux package.

Alternatively, the new variable could be user-facing and be set by the user in
the defconfig.

Other thoughts? Feedback?

Thanks,
Thomas
