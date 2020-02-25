From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 25 Feb 2020 18:30:28 +0100
Subject: [Buildroot] [PATCH/next v2,
 1/1] package/kvm-unit-tests: drop x86_64 workaround
Message-ID: <20200225173028.349643-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This workaround is not needed since commit
0788e921f961e36a50a94f8bb98f7eb75b312245 which disables stack-protector
for all architectures as intended by upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Baruch Siach):
 - Use positive logic

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
 
-- 
2.25.0
