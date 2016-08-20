From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:47:46 +0200
Subject: [Buildroot] [git commit] bfin: fix issues with internal toolchain,
	re-enable C++ support
Message-ID: <20160820094805.2C2C0802BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d8a05c38e58b4c9240e882e0184bc10ec4f6eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The three patches allow to compile applications using TLS emulation from
libgcc or C++ applications.

The patches 892-libgcc-mkmap-symver-support-skip_underscore.patch and
893-libgcc-config-bfin-use-the-generic-linker-version-in.patch fixes how
libgcc is generated, by making the necessary libgcc symbols declared
"GLOBAL", and therefore visible outside of libgcc. This fixes a large
number of undefined reference issues (for either C++ applications or
applications using TLS emulation). This was reported as gcc PR74748.

The patch 894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
allows to build DWARF in FDPIC mode. This patch replaces the older
892-disable-dwarf-bfin.patch, as instead of disabling DWARF support, it
fixes it. This was reported as gcc PR68468.

In order to get C++ working without unresolved symbols, we also need to
disable symbol versioning (--disable-symvers). This is a remaining issue
in gcc which will be investigated at a later point.

Since this commit fixes C++ support in Blackfin, it re-enables the
selection of C++ support for this architecture.

Fixes:
  (alsa-lib emutls)
  http://autobuild.buildroot.net/results/8544ce58d75820666579db93a25ca5656a8efa8e/
  (cairo emutls)
  http://autobuild.buildroot.net/results/88b02a5dd5408318941ccbfcea0a9cbaa331500a/
  (audiofile c++)
  http://autobuild.buildroot.net/results/394e530c5dcd9ccb590eb151aeaadb37d11e0e39/
  (assimp c++)
  http://autobuild.buildroot.net/results/01f4be126c2d786a5ad7f220c2cf60539888a480/
  (bellagio c++)
  http://autobuild.buildroot.net/results/ada/ada44228bf13ec05382275bd6571396f5ba2b1f7/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/6.1.0/892-disable-dwarf-bfin.patch     |   24 -
 ...bgcc-mkmap-symver-support-skip_underscore.patch |   74 +
 ...ig-bfin-use-the-generic-linker-version-in.patch | 1962 ++++++++++++++++++++
 ...-fix-DWARF-compilation-with-FDPIC-targets.patch |   73 +
 package/gcc/Config.in.host                         |    3 -
 package/gcc/gcc-final/gcc-final.mk                 |    4 +
 6 files changed, 2113 insertions(+), 27 deletions(-)

Patch is too large, so refusing to show it
