From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 19:51:00 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/nodejs: fix architectural
	dependencies on ARM
In-Reply-To: <cover.1445277033.git.yann.morin.1998@free.fr>
References: <cover.1445277033.git.yann.morin.1998@free.fr>
Message-ID: <03bfe81f7d32e7eb9b032d41d8c720d7ab95cb69.1445277033.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARM, starting with v0.12.x, the V8 JS engine is used, which now
requires at least an armv6 and at least a VFPv2.

Since we're about to introduce the v4.x version, which has the same
requirements, introduce an intermediate variable to hold that condition.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/nodejs/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 329d270..bd63d29 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -25,6 +25,13 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 
 if BR2_PACKAGE_NODEJS
 
+# Starting with 0.12.x, on ARM, V8 (the JS engine)
+# requires an armv6+ and a VFPv2+.
+config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_arm || !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
+
 choice
 	prompt "Node.js version"
 	default BR2_BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
@@ -35,10 +42,9 @@ choice
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
