From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 12:33:31 +0200
Subject: [Buildroot] [git commit] kvm-unit-tests: Fix x86_64 to use host
	compiler
Message-ID: <20161026103355.00C7C81EB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1b344070c607f9a3f0a7004650f00c9e6e83c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kvm-unit-tests requires a multilib compiler for x86_64 as it compiles
32bit boot code.

This patch uses the BR2_HOSTARCH_NEEDS_IA32_COMPILER option to enforce
this and avoids using TARGET_CROSS for x86_64 targets and uses the host
32bit (and 64bit) capable compiler.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
[Thomas: reword comment in .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/Config.in         | 1 +
 package/kvm-unit-tests/kvm-unit-tests.mk | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

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
index 7fd03ad..1ace2e7 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -28,9 +28,16 @@ endif
 
 KVM_UNIT_TESTS_CONF_OPTS =\
 	--arch="$(KERNEL_ARCH)" \
-	--cross-prefix="$(TARGET_CROSS)" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
 
+# For all architectures but x86-64, we use the target
+# compiler. However, for x86-64, we use the host compiler, as
+# kvm-unit-tests builds 32 bit code, which Buildroot toolchains for
+# x86-64 cannot do.
+ifneq ($(BR2_x86_64),y)
+KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
+endif
+
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(KVM_UNIT_TESTS_CONF_OPTS)
 endef
