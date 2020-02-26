From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:47:47 +0100
Subject: [Buildroot] [git commit branch/next] package/kvm-unit-tests: drop
 x86_64 workaround
Message-ID: <20200226193548.94B498EA6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d183146b5c7a1a8d1a3c828bd3b6d0660d97efc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This workaround is not needed since commit
0788e921f961e36a50a94f8bb98f7eb75b312245 which disables stack-protector
for all architectures as intended by upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 2637066701..d83d31d2ee 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -35,13 +35,7 @@ KVM_UNIT_TESTS_CONF_OPTS =\
 # compiler. However, for x86-64, we use the host compiler, as
 # kvm-unit-tests builds 32 bit code, which Buildroot toolchains for
 # x86-64 cannot do.
-ifeq ($(BR2_x86_64),y)
-# Arch Linux adds -fstack-protector even when building with -ffreestanding, but
-# it doesn't link with the stack-protector library when -nostdlib is passed,
-# which leads to a link error. Therefore, disable it explicitly to work around
-# this bug in Arch Linux. https://bugs.archlinux.org/task/64270
-KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
-else
+ifeq ($(BR2_x86_64),)
 KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
 endif
 
