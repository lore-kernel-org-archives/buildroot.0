From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:17:05 +0100
Subject: [Buildroot] [git commit] package/binutils: remove special case
 version selection for ARM Thumb
Message-ID: <20190314211546.0BFC48EEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b11a7fbea79accb1853dd6c15b63e76675e31794
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils 2.29 and 2.30 are affected by a bug in ADR and ADRL
pseudo-instruction [1] that was fixed in Binutils 2.31 [2].

  * The ADR and ADRL pseudo-instructions supported by the ARM assembler
    now only set the bottom bit of the address of thumb function symbols
    if the -mthumb-interwork command line option is active.

Due to this issue, we were default to binutils 2.28 for ARM Thumb. But
now that the issue has been fixed in binutils 2.31 and that this
version is the default, the special casing to use 2.28 is no longer
needed.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=21458
[2] https://sourceware.org/ml/binutils/2018-07/msg00213.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8485568170..ec1e0d8dd7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,8 +8,6 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB
-	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB2
 	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
