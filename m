From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 15:48:10 +0100
Subject: [Buildroot] [git commit] kvm-unit-tests: only enable for ARM on
	Cortex-A{7, 12, 15, 17}
Message-ID: <20161120144913.6AD667FFEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=592188e34b8790ecdb249803318270857dab1d13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The library uses the hypervisor instruction HVC, which is only
available on ARMv7-A with Hypervisor extensions. This is limited to
Cortex-A{7,12,15,17}.

In addition the build unconditionally passes -marm so it also needs
ARM instructions to be available, but that is already implied by the
CPU selection.

Implicitly fixes
http://autobuild.buildroot.net/results/53d109fd9055fd20387bb857aced5f89cf3086fd
though it is still not clear why ld doesn't accept the -Ttext=...
option there.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: A12 and A17 also have the virtualization extensions.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index f704a8e..7265646 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -4,7 +4,9 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# on i386 and x86-64, __builtin_reachable is used, so we need
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
-	depends on BR2_arm || \
+	# On ARM, it uses virtualization extensions
+	depends on BR2_cortex_a7 || BR2_cortex_a12 || \
+		BR2_cortex_a15 || BR2_cortex_a17 || \
 		(BR2_i386 && BR2_TOOLCHAIN_GCC_AT_LEAST_4_5) || \
 		BR2_powerpc64 || \
 		BR2_powerpc64le || \
