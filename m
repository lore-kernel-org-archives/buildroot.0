From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:36:46 +0100
Subject: [Buildroot] [PATCH 00/13] MIPS: improve architecture support and
	add specific cores
Message-ID: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series aims to improve the MIPS architecture support and add
a small starting set of MIPS cores.

Currently you can build root file systems for mips32, mips32r2,
mips32r6, mips64, mips64r2 and mips64r6 ISAs. These are all generic
-march options so the compiler will not activate any core specific
optimizations.

The first thing we do in this series is to add some blind options to
specify which CPU ISA is gonna be used.

Then we make the current target architecture variants to select those
new added CPU ISA options. We do this in preparation for the addition
of specific cores that are also based on some ISA, so the will also
select the appropriate one. This will still allow us to apply ISA
specific tweaks as we already do.

After that, we replace any occurrences of BR2_mips_* by the appropriate
CPU ISA option so this will still be valid when the user select an
specific core instead of a generic variant.

The next step is to make the options of the "Target Architecture
Variant" menu more explicit by specifying they are generic. This is just
a cosmetic change but also useful so people will not get confused.

After that we add new generic variants for R5 ISAs.

The Codescape MTI external toolchain currently depends on R2 ISAs, but
it also has support for R5, so we enable that.

Finally we add suport for some specific MIPS cores, disabling the
unsuported GCC versions and external toolchains when appropriate.

Vicente Olivert Riera (13):
  MIPS: add default CPU ISAs
  MIPS: target architecture variants select the appropriate CPU ISA
  MIPS: replace every BR2_mips_* with the new MIPS CPU options
  MIPS: state that the current architecture variants are generic
  MIPS: add mips32r5 generic architecture variant
  MIPS: add mips64r5 generic architecture variant
  MIPS: enable Codescape MTI toolchain for R5
  MIPS: add support for interAptiv cores
  MIPS: add support for M5100 cores
  MIPS: add support for M5101 cores
  MIPS: add support for I6400 cores
  MIPS: add support for P5600 cores
  MIPS: add support for P6600 cores

 arch/Config.in.mips                     | 80 +++++++++++++++++++++++++++++----
 package/binutils/Config.in.host         |  2 +-
 package/gcc/Config.in.host              | 23 ++++++++--
 package/glibc/glibc.mk                  |  2 +-
 package/gmp/gmp.mk                      |  2 +-
 package/go/Config.in.host               |  2 +-
 package/gstreamer/gst-ffmpeg/Config.in  |  2 +-
 package/luajit/Config.in                |  2 +-
 package/mbedtls/mbedtls.mk              |  2 +-
 package/mongrel2/mongrel2.mk            |  2 +-
 package/nodejs/nodejs.mk                |  6 +--
 package/openblas/Config.in              |  6 +--
 package/polarssl/polarssl.mk            |  2 +-
 package/uclibc/Config.in                |  6 +--
 toolchain/toolchain-buildroot/Config.in |  4 +-
 toolchain/toolchain-external/Config.in  | 13 ++++--
 16 files changed, 121 insertions(+), 35 deletions(-)

-- 
2.10.0
