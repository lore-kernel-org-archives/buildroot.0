From: Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 18 Aug 2016 09:02:36 +1000
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: new package
Message-ID: <20160817230236.8255-1-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
http://www.linux-kvm.org/page/KVM-unit-tests

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 package/Config.in                        |  1 +
 package/kvm-unit-tests/Config.in         | 17 ++++++++++++
 package/kvm-unit-tests/kvm-unit-tests.mk | 45 ++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 package/kvm-unit-tests/Config.in
 create mode 100644 package/kvm-unit-tests/kvm-unit-tests.mk

diff --git a/package/Config.in b/package/Config.in
index e1ddcea..60f7d6e 100644
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
index 0000000..cf0da58
--- /dev/null
+++ b/package/kvm-unit-tests/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_KVM_UNIT_TESTS
+	bool "kvm-unit-tests"
+	depends on BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || BR2_i386 || BR2_arm
+	help
+	  kvm-unit-tests is a project as old as KVM. As its name suggests,
+	  it's purpose is to provide unit tests for KVM. The unit tests are tiny
+	  guest operating systems that generally execute only tens of lines of C
+	  and assembler test code in order to obtain its PASS/FAIL result. Unit
+	  tests provide KVM and virt hardware functional testing by targeting
+	  the features through minimal implementations of their use per the
+	  hardware specification. The simplicity of unit tests make them easy to
+	  verify they are correct, easy to maintain, and easy to use in timing
+	  measurements. Unit tests are also often used for quick and dirty bug
+	  reproducers. The reproducers may then be kept as regression tests.
+	  It's strongly encouraged that patches implementing new KVM features
+	  are submitted with accompanying unit tests.
+	  http://www.linux-kvm.org/page/KVM-unit-tests
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
new file mode 100644
index 0000000..457e656
--- /dev/null
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -0,0 +1,45 @@
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
+KVM_UNIT_TESTS_ARCH = "$(ARCH)"
+
+ifeq ($(ARCH),powerpc64)
+KVM_UNIT_TESTS_ARCH = "ppc64"
+endif
+ifeq ($(ARCH),powerpc64le)
+KVM_UNIT_TESTS_ARCH = "ppc64"
+endif
+
+ifeq ($(BR2_ENDIAN),"LITTLE")
+KVM_UNIT_TESTS_ENDIAN = "little"
+else
+KVM_UNIT_TESTS_ENDIAN = "big"
+endif
+
+KVM_UNIT_TESTS_CONF_OPTS = --arch="$(KVM_UNIT_TESTS_ARCH)" \
+						   --cross-prefix="$(TARGET_CROSS)" \
+						   --endian="$(KVM_UNIT_TESTS_ENDIAN)" \
+						   --prefix="$(TARGET_DIR)"
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
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+# Does use configure script but not an autotools one
+$(eval $(generic-package))
-- 
2.9.3
