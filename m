From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Date: Wed, 20 Nov 2019 15:16:43 +0300
Subject: [Buildroot] [PATCH] glibc: install glibc utils to target
Message-ID: <20191120121643.21943-1-Nikita.Sobolev@synopsys.com>
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
 package/glibc/Config.in | 15 +++++++++++++++
 package/glibc/glibc.mk  |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 7821251087..43d6445177 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,3 +8,18 @@ config BR2_PACKAGE_GLIBC
 	help
 	  https://www.gnu.org/software/libc/
 endif
+
+if BR2_TOOLCHAIN_BUILDROOT_GLIBC
+
+config BR2_PACKAGE_GLIBC_UTILS
+	bool "Compile and install glibc utilities"
+	depends on BR2_PACKAGE_GLIBC
+	depends on BR2_PACKAGE_BASH
+	help
+	  Enabling this option will compile and install the getconf,
+	  ldconfig and ldd glibc utilities for the target.
+
+comment "Glibc utilities need bash"
+	depends on !BR2_PACKAGE_BASH
+
+endif
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 68c6670007..db82792c2e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -143,10 +143,17 @@ ifeq ($(BR2_PACKAGE_GDB),y)
 GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
+ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
+GLIBC_TARGET_UTILS_BIN = /build/posix/getconf /build/elf/ldconfig /build/elf/ldd
+endif
+
 define GLIBC_INSTALL_TARGET_CMDS
 	for libpattern in $(GLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$$libpattern) ; \
 	done
+	for util in $(GLIBC_TARGET_UTILS_BIN); do \
+		$(INSTALL) -D -m 0755 $(@D)/$$util $(TARGET_DIR)/bin/ ;\
+	done
 endef
 
 $(eval $(autotools-package))
-- 
2.16.2
