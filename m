From: Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 25 Oct 2016 16:42:40 +1100
Subject: [Buildroot] [PATCH] kvm-unit-tests: Fix x86_64 to use host compiler
Message-ID: <20161025054240.10957-1-cyrilbur@gmail.com>
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
Patch was sent as an RFC initally with the note:

Should be able to be merged as is but I hope the RFC might attract
more eyes as this has me in an x86 caveat world that I'm utterly
unfamilair with.

With this patch my Power build machine fails to build kvm-unit-tests
for x86_64 (expected, I see the message about
BR2_HOSTARCH_NEEDS_IA32_COMPILER) and has no problems building for
ARM. My x86_64 build machine can build for x86_64 and still build
other architectures.

It has been over three weeks and no comments, I believe it would fix
the repeated build breakage of kvm-unit-tests x86_64

 package/kvm-unit-tests/Config.in         |  1 +
 package/kvm-unit-tests/kvm-unit-tests.mk | 14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

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
index 7fd03ad..cdce1e4 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,20 +4,25 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 0b04ed0610035792514fd8499eb4dacc185520d9
+KVM_UNIT_TESTS_VERSION = 9111ccab0bb42d93d9f2b84c9089b5790e763056
 KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
 KVM_UNIT_TESTS_LICENSE = LGPLv2
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
+#Use HOSTCC for x86_64 as we'll need to compile 32bit code
+#which buildroot cross compilers often can't do
+ifeq ($(BR2_x86_64),y)
+KVM_UNIT_TESTS_ARCH = x86_84
+else
+KVM_UNIT_TESTS_CONF_OPTS = --cross-prefix="$(TARGET_CROSS)"
+endif
 ifeq ($(BR2_arm),y)
 KVM_UNIT_TESTS_ARCH = arm
 else ifeq ($(BR2_i386),y)
 KVM_UNIT_TESTS_ARCH = i386
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 KVM_UNIT_TESTS_ARCH = ppc64
-else ifeq ($(BR2_x86_64),y)
-KVM_UNIT_TESTS_ARCH = x86_84
 endif
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
@@ -26,9 +31,8 @@ else
 KVM_UNIT_TESTS_ENDIAN = big
 endif
 
-KVM_UNIT_TESTS_CONF_OPTS =\
+KVM_UNIT_TESTS_CONF_OPTS +=\
 	--arch="$(KERNEL_ARCH)" \
-	--cross-prefix="$(TARGET_CROSS)" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
 
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
-- 
2.10.1
