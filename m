From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 14:14:37 +0200
Subject: [Buildroot] [git commit] package/kvm-unit-tests: new package
Message-ID: <20160919141841.104C581F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddcb1e4e92a426b935aa169466658d2041b9ebcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The unit tests are tiny guest operating systems that generally execute
only tens of lines of C and assembler test code in order to obtain its
PASS/FAIL result. Unit tests provide KVM and virt hardware functional
testing by targeting the features through minimal implementations of
their use per the hardware specification. The simplicity of unit tests
make them easy to verify they are correct, easy to maintain, and easy
to use in timing measurements. Unit tests are also often used for
quick and dirty bug reproducers. The reproducers may then be kept as
regression tests. It's strongly encouraged that patches implementing
new KVM features are submitted with accompanying unit tests.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
[Thomas:
 - order architecture dependencies in Config.in alphabetically.
 - rewrap Config.in help text, lines were too long
 - add an empty line between the package description and the upstream
   project URL in the Config.in help text
 - don't make KVM_UNIT_TESTS_ARCH default to $(ARCH). This was not
   correct for i386 for example. Instead, just handle the few
   architectures that the package supports.
 - remove useless double quotes in variable definitions.
 - remove --prefix="$(TARGET_DIR)" from CONF_OPTS. It was installing
   everything in /share/ and not /usr/share/, and setting the prefix to
   TARGET_DIR at configure time is not good. Instead, pass DESTDIR at
   installation time.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/kvm-unit-tests/Config.in         | 21 ++++++++++++++
 package/kvm-unit-tests/kvm-unit-tests.mk | 49 ++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e30ce22..78573f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -82,6 +82,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/ktap/Config.in"
+	source "package/kvm-unit-tests/Config.in"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
 	source "package/lmbench/Config.in"
diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
new file mode 100644
index 0000000..f771896
--- /dev/null
+++ b/package/kvm-unit-tests/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_KVM_UNIT_TESTS
+	bool "kvm-unit-tests"
+	depends on BR2_arm || BR2_i386 || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_x86_64
+	help
+	  kvm-unit-tests is a project as old as KVM. As its name
+	  suggests, it's purpose is to provide unit tests for KVM. The
+	  unit tests are tiny guest operating systems that generally
+	  execute only tens of lines of C and assembler test code in
+	  order to obtain its PASS/FAIL result. Unit tests provide KVM
+	  and virt hardware functional testing by targeting the
+	  features through minimal implementations of their use per
+	  the hardware specification. The simplicity of unit tests
+	  make them easy to verify they are correct, easy to maintain,
+	  and easy to use in timing measurements. Unit tests are also
+	  often used for quick and dirty bug reproducers. The
+	  reproducers may then be kept as regression tests.  It's
+	  strongly encouraged that patches implementing new KVM
+	  features are submitted with accompanying unit tests.
+
+	  http://www.linux-kvm.org/page/KVM-unit-tests
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
new file mode 100644
index 0000000..989d398
--- /dev/null
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# kvm-unit-tests
+#
+################################################################################
+
+KVM_UNIT_TESTS_VERSION = 682187afcc998bc3dd25061e98b43792cc340b33
+KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
+KVM_UNIT_TESTS_SITE_METHOD = git
+KVM_UNIT_TESTS_LICENSE = LGPLv2
+KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
+
+ifeq ($(BR2_arm),y)
+KVM_UNIT_TESTS_ARCH = arm
+else ifeq ($(BR2_i386),y)
+KVM_UNIT_TESTS_ARCH = i386
+else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+KVM_UNIT_TESTS_ARCH = ppc64
+else ifeq ($(BR2_x86_64),y)
+KVM_UNIT_TESTS_ARCH = x86_84
+endif
+
+ifeq ($(BR2_ENDIAN),"LITTLE")
+KVM_UNIT_TESTS_ENDIAN = little
+else
+KVM_UNIT_TESTS_ENDIAN = big
+endif
+
+KVM_UNIT_TESTS_CONF_OPTS =\
+	--arch="$(KERNEL_ARCH)" \
+	--cross-prefix="$(TARGET_CROSS)" \
+	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
+
+define KVM_UNIT_TESTS_CONFIGURE_CMDS
+	cd $(@D) && ./configure $(KVM_UNIT_TESTS_CONF_OPTS)
+endef
+
+define KVM_UNIT_TESTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) standalone
+endef
+
+define KVM_UNIT_TESTS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR)/usr/share/kvm-unit-tests/ \
+		install
+endef
+
+# Does use configure script but not an autotools one
+$(eval $(generic-package))
