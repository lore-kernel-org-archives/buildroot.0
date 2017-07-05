From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Jul 2017 12:25:35 +0200
Subject: [Buildroot] [PATCH 3/5] package/kvm-unit-tests: introduce
	_ARCH_SUPPORTS
In-Reply-To: <cover.1499250321.git.yann.morin.1998@free.fr>
References: <cover.1499250321.git.yann.morin.1998@free.fr>
Message-ID: <9a2c47578e9bb156c2036d437d0b7263b06e4f07.1499250321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move all architecture options to their own symbol, so that it is easier
to add more variants in the future.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cyril Bur <cyrilbur@gmail.com>
---
 package/kvm-unit-tests/Config.in | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 7eab0c25d6..0283e97dfc 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,15 +1,17 @@
-config BR2_PACKAGE_KVM_UNIT_TESTS
-	bool "kvm-unit-tests"
+config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
+	bool
+	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
+		BR2_cortex_a15 || BR2_cortex_a17
+	default y if BR2_powerpc64 || BR2_powerpc64le
 	# on i386 and x86-64, __builtin_reachable is used, so we need
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
 	# On ARM, it uses virtualization extensions
-	depends on BR2_cortex_a7 || BR2_cortex_a12 || \
-		BR2_cortex_a15 || BR2_cortex_a17 || \
-		(BR2_i386 && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5) || \
-		BR2_powerpc64 || \
-		BR2_powerpc64le || \
-		(BR2_x86_64 && BR2_HOST_GCC_AT_LEAST_4_5)
+	default y if (BR2_i386 || BR2_x86_64) && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+
+config BR2_PACKAGE_KVM_UNIT_TESTS
+	bool "kvm-unit-tests"
+	depends on BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
-- 
2.11.0
