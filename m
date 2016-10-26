From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 21:13:54 +0200
Subject: [Buildroot] [git commit] kvm-unit-tests: add gcc version
	dependencies
Message-ID: <20161026191410.C660D8172D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bde0250f069d80a6f823766566d9b146d7559dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On x86 (both i386 and x86_64), the kvm-unit-tests code uses
__builtin_reachable, which appeared in gcc 4.5. This commit adds the
relevant dependencies to kvm-unit-tests:

 - on i386, we need gcc 4.5 as the target compiler

 - on x86-64, we need gcc 4.5 as the host compiler, because we use the
   host compiler to build kvm-unit-tests for this architecture

Fixes:

  http://autobuild.buildroot.net/results/21340a7e6494e23adb2fe8dc6253ab220c380fec/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index d72c734..f704a8e 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS
 	bool "kvm-unit-tests"
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
-	depends on BR2_arm || BR2_i386 || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_x86_64
+	# on i386 and x86-64, __builtin_reachable is used, so we need
+	# gcc 4.5 at least. on i386, we use the target gcc, while on
+	# x86-64 we use the host gcc (see .mk file for details)
+	depends on BR2_arm || \
+		(BR2_i386 && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5) || \
+		BR2_powerpc64 || \
+		BR2_powerpc64le || \
+		(BR2_x86_64 && BR2_HOST_GCC_AT_LEAST_4_5)
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
 	  suggests, it's purpose is to provide unit tests for KVM. The
