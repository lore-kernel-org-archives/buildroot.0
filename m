From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 24 Jul 2019 10:35:34 -0700
Subject: [Buildroot] [RFC PATCH 0/4] Add Buildroot toolchain support for LLD
Message-ID: <20190724173538.22913-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series adds support for changing the default linker Buildroot uses, and
adds the LLVM project's LLD linker as an alternative to ld.bfd.

LLD offers significantly faster linking compared to GNU Gold and ld.bfd, as well
as features like identical code folding (ICF) for generating smaller binaries.

This patchset does not aim to support the more advanced linking features of LLD,
but rather allows LLD to be used as a drop-in replacement for the standard GNU
linker.

Below are some comparisons with individual package build times with and without
LLD. Tests of individual packages are conducted by building a complete image
without ccache, then doing:

make [package]-dirclean && time make [package]

        BFD:                    LLD:
FFmpeg:
        real    0m49.493s       real    0m48.912s
        user    10m55.617s      user    10m47.596s
        sys     0m40.307s       sys     0m42.746s

Python3:
        real    0m31.480s       real    0m31.273s
        user    1m35.363s       user    1m34.245s
        sys     0m9.554s        sys     0m10.448s

PostgreSQL:
        real    0m40.440s       real    0m40.015s
        user    3m20.186s       user    3m17.695s
        sys     0m22.199s       sys     0m22.656s

Node.js:
        real    1m47.497s       real    1m45.562s
        user    33m57.731s      user    33m55.133s
        sys     2m2.629s        sys     2m3.313s

As you can see, build times are slightly lower with LLD, but are mostly a wash.
Overall build times are not significantly different between the two, however,
debug builds may see a greater difference in link times. Performance may vary
on other systems.

Some packages such as glibc depend on ld.bfd, and a new environment variable
(BR2_NO_LINKER_OVERRIDE) allows disabling the linker override for specific
packages when necessary.

Support is currently only provided for Buildroot's toolchain, and only with
GCC 9.x, which supports the ld.lld linker driver upstream. Support for older
versions of GCC is possible, but it would need to be backported with a trivial
patch [1]. I'm open to discussion about if and how linker override support
should be handled with external toolchains.

[1] https://patchwork.ozlabs.org/patch/987183/

Joseph Kogut (4):
  llvm: disable bindings on host
  package/lld: new package
  toolchain-wrapper: add linker override option
  Add linker override to config options

 Config.in                      | 27 +++++++++++++++++++++++++++
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/gcc/gcc.mk             |  3 ++-
 package/glibc/glibc.mk         |  3 +++
 package/lld/Config.in.host     | 16 ++++++++++++++++
 package/lld/lld.hash           |  3 +++
 package/lld/lld.mk             | 23 +++++++++++++++++++++++
 package/llvm/llvm.mk           |  3 ++-
 toolchain/toolchain-wrapper.c  | 11 +++++++++++
 toolchain/toolchain-wrapper.mk |  4 ++++
 11 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 package/lld/Config.in.host
 create mode 100644 package/lld/lld.hash
 create mode 100644 package/lld/lld.mk

--
2.22.0
