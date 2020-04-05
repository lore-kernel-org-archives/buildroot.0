From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 5 Apr 2020 17:56:46 +0200
Subject: [Buildroot] glibc version choice ?
Message-ID: <ec2476b1-3bb9-1ea4-fa63-6c5d4908a5d9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

All Bootlin toolchains (generated using the Buildroot internal toolchain
backend) has been rebuilt recently [1]. The toolchain-builder project provide
two toolchain versions "stable" and "bleeding-edge" where different versions of
gcc, binutils, linux-headers and gdb are used.

But both toolchain version use the same version of the libc implementation
(glibc, musl and uClibc-ng). I will not talk about musl and uClibc-ng here since
they don't provide stable branches. But the glibc project does [2], even for
very old versions.

It may seem surprising to consider at the moment, a toolchain based on glibc
2.30 or latter "stable".

|  Distro  |  release |  glibc  |
|  Debian  |  Buster  |  2.28   |
|  Ubuntu  |  19.10   |  2.30   |
|  Ubuntu  |  18.04   |  2.27   |
|  Fedora  |  f30     |  2.29   |
|  Fedora  |  f31     |  2.30   |

Glibc (as for musl and uClibc-ng) are critical elements in a Linux system, each
version bump may cause regressions that requires to fix several other projects.
That is also why we use the version N-1 of gcc, binutils and gdb as default
version in Buildroot.

Some example of issues related to glibc:

- The latest version of glibc (2.31) at the time it's released, was not
compiling with existing gcc released version (gcc 8.4 and 9.3 containing a fix
was released after glibc 2.31).

- glibc 2.31 doesn't build with gcc 7.5.0 due to libsanitizer code but the gcc
7.5.0 code will not get maintained anymore.

- openssh needs to be updated to 8.2p1 due to issue with glibc 2.31.

- In the past we had an issue with glibc 2.26 release didn't compile C++ code on
x86 using math function (-Os) [3].

Also recent glibc release increased the requirement on gcc, so we can't compile
glibc 2.30 with gcc < 6.2.

This may be considered as serious issues to consider having a version choice for
glibc package. Some years ago, there was the possibility in Buildroot to choose
among 3 versions, but the choice was removed by [4].

Note: Glibc release two versions per year (Febuary and August), so each version
may not widely used by other Linux distributions.

So what about reintroducing a version choice for glibc,@least a second choice
with the version N-1 ?

[1] https://toolchains.bootlin.com/news.html
[2] https://sourceware.org/pipermail/libc-alpha/2020-March/112367.html
[3] https://lwn.net/Articles/736429/
[4]
https://git.buildroot.net/buildroot/commit/?id=b1ca91c59db667fdd5e59f1a0c8ac11dc0a19816

Best regards,
Romain
