From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Date: Thu, 21 Nov 2019 15:31:20 +0300
Subject: [Buildroot] [PATCH v2] glibc: install glibc utils to target
Message-ID: <20191121123120.12443-1-Nikita.Sobolev@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this patch we introduce an option for glibc, which
installs getconf, ldconfig and ldd utilities on target, that
may be useful in debugging. By default these utilities are
built, but not installed to the target.
ldd is a bash script, so it has bash dependency.

Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
---
Changes for v2:
    - delete unnecessary dependences and conditional statements
    - correct descriptions
    - change loop used in script
    - correct destination paths

 package/glibc/Config.in | 10 ++++++++++
 package/glibc/glibc.mk  |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 7821251087..323767fc8a 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,3 +8,13 @@ config BR2_PACKAGE_GLIBC
 	help
 	  https://www.gnu.org/software/libc/
 endif
+
+config BR2_PACKAGE_GLIBC_UTILS
+	bool "Install glibc utilities"
+	depends on BR2_PACKAGE_BASH
+	help
+	  Enabling this option will compile and install the getconf,
+	  ldconfig and ldd glibc utilities for the target.
+
+comment "glibc utilities need bash"
+	depends on !BR2_PACKAGE_BASH
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 68c6670007..f3f9bc109b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -143,10 +143,17 @@ ifeq ($(BR2_PACKAGE_GDB),y)
 GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
+ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
+GLIBC_TARGET_UTILS_BIN = posix/getconf elf/ldconfig elf/ldd
+endif
+
 define GLIBC_INSTALL_TARGET_CMDS
 	for libpattern in $(GLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$$libpattern) ; \
 	done
+	$(foreach util,$(GLIBC_TARGET_UTILS_BIN), \
+		$(INSTALL) -D -m 0755 $(@D)/build/$(util) $(TARGET_DIR)/bin/$(notdir $(util))
+	)
 endef
 
 $(eval $(autotools-package))
-- 
2.16.2
