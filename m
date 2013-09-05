From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:38 +0200
Subject: [Buildroot] [RFCv1 00/11] Convert toolchain backends to packages to
	fix source/external-deps/legal-info
Message-ID: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The final goal of this patch set is to get 'make source' and 'make
external-deps' to behave properly after the conversion of the internal
toolchain backend to the package infrastructure.

To do so, the idea of this patch is to:

 (1) Create a 'toolchain' virtual package, which will depend on the
     particular toolchain backend depending on the configuration.

 (2) Turn the toolchain backends into normal packages. In this patch
     set, only the internal and external backends are converted, the
     Crosstool-NG backend is removed. If we feel it's too early or not
     desirable to remove the Crosstool-NG backend, it can be converted
     to the package infrastructure as well.

 (3) Rely on new package infrastructure targets <pkg>-all-source and
     <pkg>-all-legal-info to properly get the complete list of sources
     (or legal informations).

Note that I am not sure that this patch set is fully bisectable. When
touching such core stuff, it's quite hard to ensure that things work
at every step of the patch series.

With an internal toolchain:

$ make external-deps
binutils-2.21.1.tar.bz2
busybox-1.21.1.tar.bz2
gcc-4.7.3.tar.bz2
gmp-5.1.2.tar.bz2
linux-3.11.tar.xz
mpc-1.0.1.tar.gz
mpfr-3.1.2.tar.bz2
uClibc-0.9.33.2.tar.xz
$ make legal-info
[...]
$ cat output/legal-info/manifest.csv
"PACKAGE","VERSION","LICENSE","LICENSE FILES","SOURCE ARCHIVE"
"buildroot","2013.11-git-00096-g7756e14","GPLv2+","COPYING","not saved"
"busybox","1.21.1","GPLv2","LICENSE","busybox-1.21.1.tar.bz2"
"binutils","2.21.1","GPLv3+, libiberty LGPLv2.1+","COPYING3 COPYING.LIB","binutils-2.21.1.tar.bz2"
"gmp","5.1.2","LGPLv3+","COPYING.LIB","gmp-5.1.2.tar.bz2"
"mpfr","3.1.2","LGPLv3+","COPYING.LESSER","mpfr-3.1.2.tar.bz2"
"mpc","1.0.1","LGPLv3+","COPYING.LESSER","mpc-1.0.1.tar.gz"
"gcc-initial","4.7.3","unknown","not saved","gcc-4.7.3.tar.bz2"
"linux-headers","3.11","unknown","not saved","linux-3.11.tar.xz"
"uclibc","0.9.33.2","unknown","not saved","uClibc-0.9.33.2.tar.xz"
"gcc-final","4.7.3","unknown","not saved","gcc-4.7.3.tar.bz2"

This patch set is sent as an RFC for now, since it really needs some
testing from various people. The dependencies of this core stuff are
pretty tricky to get right, it's pretty likely that I have overlooked
something.

In the long term, I'm thinking of:

 (1) Making 'toolchain' a dependency of all target packages, because
     it's really what it is.

 (2) Maybe create a 'host-toolchain' package which would encapsulate
     the logic to ensure that the host toolchain is ready to be used
     by Buildroot, especially the fact of building ccache if
     needed. All host packages woudl depend on host-toolchain, and
     some target packages could also depend on it (for example the
     busybox-menuconfig target could depend on host-toolchain to
     ensure that ccache is built before the menuconfig interface of
     Busybox gets built).

This of course remains to be discussed and implemented. I do not
intend to implement this until this series (or the evolutions of it)
are merged.

Best regards,

Thomas

Thomas Petazzoni (11):
  Makefile: make $(BUILD_DIR)/.root rule idempotent
  toolchain-crosstool-ng: remove support
  toolchain-external: make ext-tool.mk includable in all cases
  toolchain: move helpers.mk into toolchain-external/
  toolchain: introduce a virtual package
  toolchain-buildroot: convert to the package infrastructure
  toolchain: intermediate .mk files no longer needed
  package: package-based implementation of source, external-deps and
    legal-info
  package: add a <pkg>_SOURCE_ADDONS variable
  toolchain-external: convert to the package infrastructure
  dependencies: remove useless targets

 Makefile                                           |  61 +--
 package/pkg-generic.mk                             |   5 +
 support/dependencies/dependencies.mk               |   8 -
 toolchain/Config.in                                |  13 -
 toolchain/toolchain-buildroot.mk                   |   9 -
 .../toolchain-buildroot/toolchain-buildroot.mk     |  17 +
 toolchain/toolchain-common.in                      |   4 -
 toolchain/toolchain-crosstool-ng.mk                |   5 -
 toolchain/toolchain-crosstool-ng/Config.in         | 133 ------
 .../crosstool-ng.config-eglibc                     | 502 ---------------------
 .../crosstool-ng.config-glibc                      | 491 --------------------
 .../crosstool-ng.config-uClibc                     | 473 -------------------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   | 396 ----------------
 toolchain/toolchain-external.mk                    |   4 -
 toolchain/{ => toolchain-external}/helpers.mk      |   4 +-
 .../{ext-tool.mk => toolchain-external.mk}         | 155 +++----
 toolchain/toolchain/toolchain.mk                   |  18 +
 17 files changed, 124 insertions(+), 2174 deletions(-)
 delete mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-buildroot/toolchain-buildroot.mk
 delete mode 100644 toolchain/toolchain-crosstool-ng.mk
 delete mode 100644 toolchain/toolchain-crosstool-ng/Config.in
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 delete mode 100644 toolchain/toolchain-external.mk
 rename toolchain/{ => toolchain-external}/helpers.mk (99%)
 rename toolchain/toolchain-external/{ext-tool.mk => toolchain-external.mk} (86%)
 create mode 100644 toolchain/toolchain/toolchain.mk

-- 
1.8.1.2
