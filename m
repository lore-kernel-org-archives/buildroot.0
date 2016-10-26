From: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 26 Oct 2016 14:19:15 +1100
Subject: [Buildroot] [PATCH v2 1/2] kvm-unit-tests: Fix x86_64 to use host
	compiler
Message-ID: <20161026031916.17158-1-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kvm-unit-tests requires a multilib compiler for x86_64 as it compiles
32bit boot code.

This patch uses the BR2_HOSTARCH_NEEDS_IA32_COMPILER option to enforce
this and avoids using TARGET_CROSS for x86_64 targets and uses the host
32bit (and 64bit) capable compiler.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
V2: Addressed review comments from Thomas
   - Don't change the KVM_UNIT_TESTS_ARCH block
   - Add space after comment
   - Split version fixes version bump to separate patch

 package/kvm-unit-tests/Config.in         | 1 +
 package/kvm-unit-tests/kvm-unit-tests.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index f771896..d72c734 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS
 	bool "kvm-unit-tests"
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	depends on BR2_arm || BR2_i386 || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_x86_64
 	help
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 7fd03ad..97c8eb8 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -28,9 +28,15 @@ endif
 
 KVM_UNIT_TESTS_CONF_OPTS =\
 	--arch="$(KERNEL_ARCH)" \
-	--cross-prefix="$(TARGET_CROSS)" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
 
+#Use HOSTCC for x86_64 as we'll need to compile 32bit code
+#which buildroot cross compilers often can't do
+
+ifneq ($(BR2_x86_64),y)
+KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
+endif
+
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(KVM_UNIT_TESTS_CONF_OPTS)
 endef
-- 
2.10.1
