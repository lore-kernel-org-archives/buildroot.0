From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Nov 2016 14:50:05 +0100
Subject: [Buildroot] [PATCH 1/2] kvm-unit-tests: pass the --processor
	configure argument
Message-ID: <20161120135006.19498-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script uses this to set the -mcpu option. If nothing is
passed, it defaults to -mcpu=cortex-a15 for arm, and -mcpu=cortex-a57
for aarch64, which may conflict with the actual architecture.

The --processor option is only really used for arm and aarch64, but it
doesn't hurt to also pass it for the other arches.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 6e1c2df..0ddb017 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -28,6 +28,7 @@ endif
 
 KVM_UNIT_TESTS_CONF_OPTS =\
 	--arch="$(KVM_UNIT_TESTS_ARCH)" \
+	--processor="$(call qstrip,$(BR2_GCC_TARGET_CPU))" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
 
 # For all architectures but x86-64, we use the target
-- 
2.10.2
