From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 May 2019 21:02:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: fix build without
 ssp
Message-ID: <20190524190243.31508-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile tries to detect stack-protector which will result in build
failures if ssp is not available so disable stack protector is SSP is
not available through EXTRA_CFLAGS

Fixes:
 - http://autobuild.buildroot.org/results/e6f767755ffdb5ecc014eb5ad7519814f075a60e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 92d67fb34b..ac1bb1f7aa 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -39,16 +39,21 @@ ifneq ($(BR2_x86_64),y)
 KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
 endif
 
+# Don't force -fstack-protector when SSP is not available in toolchain
+KVM_UNIT_TESTS_MAKE_OPTS += \
+	EXTRA_CFLAGS=$(if $(BR2_TOOLCHAIN_HAS_SSP),,-fno-stack-protector)
+
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(KVM_UNIT_TESTS_CONF_OPTS)
 endef
 
 define KVM_UNIT_TESTS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) standalone
+	$(TARGET_MAKE_ENV) $(MAKE) $(KVM_UNIT_TESTS_MAKE_OPTS) -C $(@D) \
+		standalone
 endef
 
 define KVM_UNIT_TESTS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(KVM_UNIT_TESTS_MAKE_OPTS) -C $(@D) \
 		DESTDIR=$(TARGET_DIR)/usr/share/kvm-unit-tests/ \
 		install
 endef
-- 
2.20.1
