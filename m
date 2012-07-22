From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:52 +0200
Subject: [Buildroot] [git commit branch/next] Make hard-float the default on
	Cortex-A8 and Cortex-A9
Message-ID: <20120802195258.591918E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba92d6ef68eeb37ba435648fcfbd1dbe13212e6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cortex-A8 and Cortex-A9 ARM cores are guaranteed to provide a hardware
floating point unit, so there's no reason to default to software
floating point for them.

More importantly, the newest Linaro toolchains are hard float
toolchains, so basically an user choosing those toolchains and leaving
the default option of software float would run in compilation issues.

So let's make hard float the default for Cortex-A8 and Cortex-A9.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index cc7b4de..710f2df 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -101,7 +101,11 @@ config BR2_USE_MMU
 
 config BR2_PREFER_SOFT_FLOAT
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel
+	default y if (BR2_arm && !BR2_cortex_a8 && !BR2_cortex_a9)
+	default y if BR2_armeb
+	default y if BR2_avr32
+	default y if BR2_mips
+	default y if BR2_mipsel
 
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
