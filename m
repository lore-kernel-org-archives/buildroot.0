From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 15:42:10 +0100
Subject: [Buildroot] [git commit] liquid-dsp: work-around compiler bug on
	SuperH
Message-ID: <20151108144227.E84E780E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=226d23c3f9a77bdf432ef240ae917a20a012edb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On SuperH, the BR2_PACKAGE_LIQUID_DSP_FAST option of the liquid-dsp
package causes triggers a compiler bug with the Sourcery CodeBench
toolchains:

  src/filter/src/firdes.c:406:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:859

This commit works around this problem by simply making this option
unavailable with the problematic toolchains.

Fixes:

  http://autobuild.buildroot.net/results/d43/d43574b8f487648bc440fbe0b63b2a08b309dfc7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liquid-dsp/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index 834496c..95233da 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -18,6 +18,9 @@ if BR2_PACKAGE_LIQUID_DSP
 
 config BR2_PACKAGE_LIQUID_DSP_FAST
 	bool "optimize for speed over accuracy"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	help
 	  Optimize for speed over accuracy.
 
