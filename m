From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Nov 2016 14:50:06 +0100
Subject: [Buildroot] [PATCH 2/2] kvm-unit-tests: only enable for ARM on
	Cortex-A7 and A15
In-Reply-To: <20161120135006.19498-1-arnout@mind.be>
References: <20161120135006.19498-1-arnout@mind.be>
Message-ID: <20161120135006.19498-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The library uses the hypervisor instruction HVC, which is only
available on ARMv7-A with Hypervisor extensions. According to [1],
this is limited to Cortex-A7 and A15.

In addition the build unconditionally passes -marm so it also needs
ARM instructions to be available, but that is already implied by
the CPU selection.

Implicitly fixes
http://autobuild.buildroot.net/results/53d109fd9055fd20387bb857aced5f89cf3086fd
though it is still not clear why ld doesn't accept the -Ttext=...
option there.

[1] https://en.wikipedia.org/wiki/Comparison_of_ARMv7-A_cores

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kvm-unit-tests/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index f704a8e..a25495a 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# on i386 and x86-64, __builtin_reachable is used, so we need
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
-	depends on BR2_arm || \
+	# On ARM, it uses virtualization extensions
+	depends on (BR2_arm && (BR2_cortex_a7 || BR2_cortex_a15)) || \
 		(BR2_i386 && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5) || \
 		BR2_powerpc64 || \
 		BR2_powerpc64le || \
-- 
2.10.2
