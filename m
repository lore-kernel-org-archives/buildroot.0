From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  1 Apr 2018 10:46:41 +0200
Subject: [Buildroot] [PATCH 1/2] openblass: drop SSE_GENERIC target
Message-ID: <20180401084642.15199-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes #10856

The SSE_GENERIC target fails to build with a "sgemm_kernel.o: No such file
or directory" error. Several upstream bug reports exist for this:

https://github.com/xianyi/OpenBLAS/issues/502
https://github.com/xianyi/OpenBLAS/issues/685

In both cases, upstream suggests using a different target definition
instead.  E.G.  from issue 685:

You may use NORTHWOOD on x86: make TARGET=NORTHWOOD that uses SSE2
instructions.  It's very hard to find non-SSE2 x86 CPUs today.  For x86-64
use the PRESCOTT target

So drop the SSE_GENERIC target.  The only x86_64 variant we support not
covered by a more specific openblas target is the default variant, nocona.

Nocona was a Xeon variant of the P4 "Prescott" architecture, so use the
PRESCOTT openblas target:

https://en.wikipedia.org/wiki/Xeon#Nocona_and_Irwindale

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index eb93e319e4..8f514685a1 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "P2"           if BR2_x86_pentium2
 	default "KATMAI"       if BR2_x86_pentium3
 	default "NORTHWOOD"    if BR2_x86_pentium4
-	default "PRESCOTT"     if BR2_x86_prescott
+	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
 	default "BANIAS"       if BR2_x86_pentium_m
 	default "CORE2"        if BR2_x86_core2
 	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont
@@ -16,7 +16,6 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "BARCELONA"    if BR2_x86_barcelona
 	default "STEAMROLLER"  if BR2_x86_steamroller
 	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
-	default "SSE_GENERIC"  if BR2_X86_CPU_HAS_SSE
 	default "POWER4"       if BR2_powerpc_power4
 	default "POWER5"       if BR2_powerpc_power5
 	default "POWER6"       if BR2_powerpc_power6
-- 
2.11.0
