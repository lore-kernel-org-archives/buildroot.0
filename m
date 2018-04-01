From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 12:43:15 +0200
Subject: [Buildroot] [git commit] openblas: drop SSE_GENERIC target
Message-ID: <20180401104615.4B7BD815C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e6fa93483caac317ab8844feb2ae9c07078a6c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
covered by a more specific openblas target is the default variant, nocona
and jaguar.

Nocona was a Xeon variant of the P4 "Prescott" architecture, so use the
PRESCOTT openblas target:

https://en.wikipedia.org/wiki/Xeon#Nocona_and_Irwindale

Jaguar is from the Bobcat family, so use the BOBCAT openblas target:

https://en.wikipedia.org/wiki/List_of_AMD_microprocessors#Bobcat_core_architecture_(APU)

[Peter: add Jaguar as pointed out by Arnout]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index eb93e319e4..8e71a43f98 100644
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
@@ -14,9 +14,9 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "OPTERON"      if BR2_x86_opteron
 	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
 	default "BARCELONA"    if BR2_x86_barcelona
+	default "JAGUAR"       if BR2_x86_jaguar
 	default "STEAMROLLER"  if BR2_x86_steamroller
 	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
-	default "SSE_GENERIC"  if BR2_X86_CPU_HAS_SSE
 	default "POWER4"       if BR2_powerpc_power4
 	default "POWER5"       if BR2_powerpc_power5
 	default "POWER6"       if BR2_powerpc_power6
