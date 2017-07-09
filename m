From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Jul 2017 11:29:59 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/kvm-unit-tests: introduce
	_ARCH_SUPPORTS
In-Reply-To: <cover.1499592591.git.yann.morin.1998@free.fr>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
Message-ID: <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move all architecture options to their own symbol, so that it is easier
to add more variants in the future.

The dependency on cross-gcc >= 4.5 is only valid for i386, as we use the
host gcc for x86_64. Adapt the dependency accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cyril Bur <cyrilbur@gmail.com>

---
Changes v2 -> v3:
  - move gcc dependency back to the main symbol  (Arnout)
  - add comment  (Arnout)
  - fix dependency on gcc version
---
 package/kvm-unit-tests/Config.in | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 7eab0c25d6..3db10fc820 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,15 +1,19 @@
+config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
+	bool
+	# On ARM, it uses virtualization extensions
+	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
+		BR2_cortex_a15 || BR2_cortex_a17
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc64 || BR2_powerpc64le
+
 config BR2_PACKAGE_KVM_UNIT_TESTS
 	bool "kvm-unit-tests"
+	depends on BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	# on i386 and x86-64, __builtin_reachable is used, so we need
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
-	# On ARM, it uses virtualization extensions
-	depends on BR2_cortex_a7 || BR2_cortex_a12 || \
-		BR2_cortex_a15 || BR2_cortex_a17 || \
-		(BR2_i386 && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5) || \
-		BR2_powerpc64 || \
-		BR2_powerpc64le || \
-		(BR2_x86_64 && BR2_HOST_GCC_AT_LEAST_4_5)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 if BR2_i386
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 if BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
@@ -28,3 +32,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	  features are submitted with accompanying unit tests.
 
 	  http://www.linux-kvm.org/page/KVM-unit-tests
+
+comment "kvm-unit-tests needs a toolchain w/ gcc >= 4.5"
+	depends on BR2_i386
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-- 
2.11.0
