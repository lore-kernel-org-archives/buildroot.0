From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 15:44:54 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/nodejs: properly
 pass the --with-arm-float-abi on ARM
Message-ID: <20191203152545.E309B84CDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36acbc2091c20880dd6ae09c1de338690efa2b22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

When commit 0064132ba032da39cefa4fffe59c31a71d1f1ddb introduced ARM64
support in nodejs.mk, it incorrectly kept the NODEJS_ARM_FP
definition. This variable is used to pass --with-arm-float-abi, which
in NodeJS's configure.py script is only used when --dest-cpu=arm, and
not when --dest-cpu=arm64.

So we are passing --with-arm-float-abi=<something> for ARM64, which
has no effect, and we are no longer passing it on ARM.

This commit fixes that by putting the NODEJS_ARM_FP definition back at
the right location.

Fixes:

   0064132ba032da39cefa4fffe59c31a71d1f1ddb

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 78c8d6902ddb17e7a9ae3eafdecec34ff5e20914)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5a143845d1..349205407f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -98,10 +98,10 @@ else ifeq ($(BR2_mipsel),y)
 NODEJS_CPU = mipsel
 else ifeq ($(BR2_arm),y)
 NODEJS_CPU = arm
-else ifeq ($(BR2_aarch64),y)
-NODEJS_CPU = arm64
 # V8 needs to know what floating point ABI the target is using.
 NODEJS_ARM_FP = $(GCC_TARGET_FLOAT_ABI)
+else ifeq ($(BR2_aarch64),y)
+NODEJS_CPU = arm64
 endif
 
 # MIPS architecture specific options
