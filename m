From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 May 2019 00:22:09 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/kvm-unit-tests: fix build without ssp on x86_64
Message-ID: <20190525222209.14372-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile tries to detect stack-protector which will result in build
failure on x86_64 if ssp is not available on host compiler so disable
stack protector through EXTRA_CFLAGS

Fixes:
 - http://autobuild.buildroot.org/results/e6f767755ffdb5ecc014eb5ad7519814f075a60e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Always disable stack-protector on x86_64 as we're using host compiler

 package/kvm-unit-tests/kvm-unit-tests.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 92d67fb34b..72762d21f2 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -37,6 +37,8 @@ KVM_UNIT_TESTS_CONF_OPTS =\
 # x86-64 cannot do.
 ifneq ($(BR2_x86_64),y)
 KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
+# Don't force -fstack-protector as we don't know if host compiler supports ssp 
+KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
 endif
 
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
@@ -44,11 +46,12 @@ define KVM_UNIT_TESTS_CONFIGURE_CMDS
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
