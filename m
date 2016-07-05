From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 09:48:19 +0200
Subject: [Buildroot] [git commit] arch: define dependencies for the binfmt
	flat formats
Message-ID: <20160705075425.A5EA7821FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49d97993d83f92bb975110a7ff49ea75a84ee2c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The situation looks like following for elf2flt and binfmt FLAT:

 * Only gcc for bfin/m68k implements
   -msep-data (BR2_BINFMT_FLAT_SEP_DATA) and
   -mid-shared-library (BR2_BINFMT_FLAT_SHARED), so the corresponding
   options are made only visible on those architectures.

 * When the default of BR2_BINFMT_FLAT_ONE is used on m68k, broken
   binaries are produced, which mainly end up in SIGILL, so do not use
   it for m68k.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas:
 - also add the dependencies on m68k/bfin to BR2_BINFMT_FLAT_SHARED
 - rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index be37481..b980e05 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -331,17 +331,20 @@ choice
 
 config BR2_BINFMT_FLAT_ONE
 	bool "One memory region"
+	depends on !BR2_m68k
 	help
 	  All segments are linked into one memory region.
 
 config BR2_BINFMT_FLAT_SEP_DATA
 	bool "Separate data and code region"
+	depends on BR2_m68k || BR2_bfin
 	help
 	  Allow for the data and text segments to be separated and placed in
 	  different regions of memory.
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
+	depends on BR2_m68k || BR2_bfin
 	# Even though this really generates shared binaries, there is no libdl
 	# and dlopen() cannot be used. So packages that require shared
 	# libraries cannot be built. Therefore, we don't select
