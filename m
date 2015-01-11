From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sun, 11 Jan 2015 22:04:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix hard float error
Message-ID: <1421010259-10281-1-git-send-email-jkrause@posteo.de>
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
 package/nodejs/nodejs.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index ad598d9..3389c3c 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -56,14 +56,16 @@ else ifeq ($(BR2_mipsel),y)
 NODEJS_CPU = mipsel
 else ifeq ($(BR2_arm),y)
 NODEJS_CPU = arm
-# V8 needs to know what floating point ABI the target is using.  There's also
-# a 'hard' option which we're not exposing here at the moment, because
-# buildroot itself doesn't really support it at present.
+# V8 needs to know what floating point ABI the target is using.
+ifeq ($(BR2_ARM_EABIHF),y)
+NODEJS_ARM_FP = hard
+else
 ifeq ($(BR2_SOFT_FLOAT),y)
 NODEJS_ARM_FP = soft
 else
 NODEJS_ARM_FP = softfp
-endif
+endif # BR2_SOFT_FLOAT
+endif # BR2_ARM_EABIHF
 endif
 
 define NODEJS_CONFIGURE_CMDS
-- 
2.2.1
