From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 12 Jan 2015 21:52:01 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: fix hard float error
Message-ID: <1421095921-2816-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for building nodejs with hard floating ABI if supported by the
target and remove bogus comment. Buildroot does propose this tuning.

Basically, you have three cases of floating point strategies:

 * soft float, i.e 'soft' in nodejs speak. This is enabled in Buildroot
   when BR2_ARM_EABI=y and BR2_SOFT_FLOAT=y.

 * hard float using integer registers to pass floating point arguments,
   i.e 'softfp' in nodejs speak. This is enabled in Buildroot when
   BR2_ARM_EABI=y and BR2_SOFT_FLOAT is disabled.

 * hard float using floating pointer registers to pass floating point
   arguments, i.e 'hard' in nodejs speak. This is enabled in Buildroot
   when BR2_ARM_EABIHF=y.

This patch fixes "[Buildroot] Float error on SAMA5D3 Xplained using nodejs":
http://lists.busybox.net/pipermail/buildroot/2014-December/114254.html

Tested at run-time by me on a TI Beaglebone Black.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
Reported-by: C?dric Heyman <c.heyman@til-technologies.fr>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v1 -> v2:
  - simplify logic by using the floating point ABI value from
    BR2_GCC_TARGET_FLOAT_ABI (Thomas)
---
 package/nodejs/nodejs.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index ad598d9..5f7d005 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -56,14 +56,8 @@ else ifeq ($(BR2_mipsel),y)
 NODEJS_CPU = mipsel
 else ifeq ($(BR2_arm),y)
 NODEJS_CPU = arm
-# V8 needs to know what floating point ABI the target is using.  There's also
-# a 'hard' option which we're not exposing here at the moment, because
-# buildroot itself doesn't really support it at present.
-ifeq ($(BR2_SOFT_FLOAT),y)
-NODEJS_ARM_FP = soft
-else
-NODEJS_ARM_FP = softfp
-endif
+# V8 needs to know what floating point ABI the target is using.
+NODEJS_ARM_FP = $(BR2_GCC_TARGET_FLOAT_ABI)
 endif
 
 define NODEJS_CONFIGURE_CMDS
-- 
2.2.1
