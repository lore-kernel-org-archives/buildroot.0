From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:53:47 +0100
Subject: [Buildroot] [git commit] package/nodejs: properly pass the
 --with-arm-float-abi on ARM
Message-ID: <20191128155150.9DB4F818E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78c8d6902ddb17e7a9ae3eafdecec34ff5e20914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/nodejs/nodejs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 6e595b32c5..be13a0da37 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -110,10 +110,10 @@ else ifeq ($(BR2_mipsel),y)
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
