From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:26:44 +0200
Subject: [Buildroot] [git commit] package/kvm-unit-tests: introduce
	_ARCH_SUPPORTS
Message-ID: <20170722212426.29D84818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e734c633875ae22e2baebe0d8e76d6e10686d804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move all architecture options to their own symbol, so that it is easier
to add more variants in the future.

The dependency on cross-gcc >= 4.5 is only valid for i386, as we use the
host gcc for x86_64. Adapt the dependency accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cyril Bur <cyrilbur@gmail.com>
[Thomas:
 - add comment about host gcc >= 4.5 dependency on x86-64
 - remove bogus "depends on ... if ..." construct.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/Config.in | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 7eab0c2..5c1c04b 100644
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
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
+	depends on BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
@@ -28,3 +32,11 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	  features are submitted with accompanying unit tests.
 
 	  http://www.linux-kvm.org/page/KVM-unit-tests
+
+comment "kvm-unit-tests needs a toolchain w/ gcc >= 4.5"
+	depends on BR2_i386
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+
+comment "kvm-unit-tests needs a host gcc >= 4.5"
+	depends on BR2_x86_64
+	depends on !BR2_HOST_GCC_AT_LEAST_4_5
