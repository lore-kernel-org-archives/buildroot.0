From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 23:59:07 +0200
Subject: [Buildroot] [PATCH 1/2 v3] package/nodejs: fix architectural
	dependencies on ARM
In-Reply-To: <cover.1445291882.git.yann.morin.1998@free.fr>
References: <cover.1445291882.git.yann.morin.1998@free.fr>
Message-ID: <771e97289eb59ef5423dc5cd625a336e33afadac.1445291882.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARM, starting with v0.12.x, the V8 JS engine is now requires at least
an armv6 and at least a VFPv2.

Since we're about to introduce the v4.x version, which has the same
requirements, introduce an intermediate variable to hold that condition.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Martin Bark <martin@barkynet.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v2 -> v3:
  - use simpler default conditions  (Thomas)
  - fix commit log  (J?rg)
---
 package/nodejs/Config.in | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 329d270..034557b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -25,6 +25,15 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 
 if BR2_PACKAGE_NODEJS
 
+# Starting with 0.12.x, on ARM, V8 (the JS engine)
+# now requires an armv6+ and a VFPv2+.
+config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	bool
+	# On supported architectures other than ARM, no special requirement
+	default y if !BR2_arm
+	# On ARM, at least ARMv6+ with VFPv2+ is needed
+	default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
+
 choice
 	prompt "Node.js version"
 	default BR2_BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
@@ -35,10 +44,9 @@ choice
 config BR2_BR2_PACKAGE_NODEJS_0_10_X
 	bool "v0.10.40"
 
-# V8 included with v0.12.5 requires at least ARMv6
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	bool "v0.12.7"
-	depends on !BR2_ARM_CPU_ARMV5
+	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 endchoice
 
-- 
1.9.1
