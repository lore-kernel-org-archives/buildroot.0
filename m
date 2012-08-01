From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 20:04:50 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: do not
	allow the user to select hard/soft float
Message-ID: <20120802195305.7287396CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f648ad2817b32ea6c89965b82c282cb812bd6646
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit ba92d6ef68eeb37ba435648fcfbd1dbe13212e6d made hard float the
default when Cortex-A8 and Cortex-A9. The problem it was trying to fix
is that the newer Linaro toolchains (2012.05 and 2012.06) are
hard-float, so the default selection of soft-float enabled on ARM
doesn't work for those toolchains.

Unfortunately, not selecting soft-float causes problems with
the Crosstool-NG backend at the moment.

As an intermediate solution, make the soft float option disappear when
using external toolchain: the toolchain will decide by itself whether
to generate hard float or soft float code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 710f2df..6e0d159 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -101,7 +101,7 @@ config BR2_USE_MMU
 
 config BR2_PREFER_SOFT_FLOAT
 	bool
-	default y if (BR2_arm && !BR2_cortex_a8 && !BR2_cortex_a9)
+	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_avr32
 	default y if BR2_mips
@@ -110,6 +110,9 @@ config BR2_PREFER_SOFT_FLOAT
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
 	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc
+	# External toolchains will automatically do soft float or hard
+	# float depending on their configuration
+	depends on BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_CTNG
 	default $(BR2_PREFER_SOFT_FLOAT)
 	help
 	  If your target CPU does not have a Floating Point Unit (FPU) or a
