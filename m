From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Nov 2019 21:36:46 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: properly pass the
 --with-arm-float-abi on ARM
In-Reply-To: <20191127203648.291701-1-thomas.petazzoni@bootlin.com>
References: <20191127203648.291701-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191127203648.291701-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.23.0
