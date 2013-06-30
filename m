From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:28:57 +0200
Subject: [Buildroot] [PATCH 07/23] elf2flt: convert to the package
	infrastructure
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 ++++
 .../Config.in => package/elf2flt/Config.in.host    |  2 +-
 package/elf2flt/elf2flt.mk                         | 28 +++++++++++++
 .../elf2flt => package/elf2flt/src}/LICENSE.TXT    |  0
 .../elf2flt => package/elf2flt/src}/Makefile.in    |  0
 .../elf2flt/elf2flt => package/elf2flt/src}/README |  0
 .../elf2flt => package/elf2flt/src}/config.guess   |  0
 .../elf2flt => package/elf2flt/src}/config.sub     |  0
 .../elf2flt => package/elf2flt/src}/configure      |  0
 .../elf2flt => package/elf2flt/src}/configure.in   |  0
 .../elf2flt => package/elf2flt/src}/cygwin-elf.h   |  0
 .../elf2flt => package/elf2flt/src}/e1-elf2flt.ld  |  0
 .../elf2flt => package/elf2flt/src}/elf2flt.c      |  0
 .../elf2flt => package/elf2flt/src}/elf2flt.ld     |  0
 .../elf2flt/elf2flt => package/elf2flt/src}/flat.h |  0
 .../elf2flt => package/elf2flt/src}/flthdr.c       |  0
 .../elf2flt => package/elf2flt/src}/install-sh     |  0
 .../elf2flt => package/elf2flt/src}/ld-elf2flt.in  |  0
 .../elf2flt => package/elf2flt/src}/maketarball.sh |  0
 .../elf2flt => package/elf2flt/src}/stubs.c        |  0
 toolchain/elf2flt/elf2flt.mk                       | 46 ----------------------
 toolchain/toolchain-buildroot.mk                   |  1 -
 toolchain/toolchain-buildroot/Config.in.2          |  2 +-
 toolchain/toolchain-crosstool-ng.mk                |  1 -
 toolchain/toolchain-external.mk                    |  1 -
 25 files changed, 37 insertions(+), 51 deletions(-)
 rename toolchain/elf2flt/Config.in => package/elf2flt/Config.in.host (91%)
 create mode 100644 package/elf2flt/elf2flt.mk
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/LICENSE.TXT (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/Makefile.in (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/README (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/config.guess (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/config.sub (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/configure (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/configure.in (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/cygwin-elf.h (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/e1-elf2flt.ld (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/elf2flt.c (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/elf2flt.ld (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/flat.h (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/flthdr.c (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/install-sh (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/ld-elf2flt.in (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/maketarball.sh (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/stubs.c (100%)
 delete mode 100644 toolchain/elf2flt/elf2flt.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index cd23492..af1ee7b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -86,6 +86,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
 #
 # Legacy options since 2013.02
 #
+config BR2_ELF2FLT
+	bool "the elf2flt option has been renamed"
+	select BR2_LEGACY
+	help
+	  The BR2_ELF2FLT option has been renamed to
+	  BR2_PACKAGE_HOST_ELF2FLT due to the conversion of elf2flt to
+	  the package infrastructure.
 
 config BR2_sa110
 	bool "sa110 ARM target switched to strongarm"
diff --git a/toolchain/elf2flt/Config.in b/package/elf2flt/Config.in.host
similarity index 91%
rename from toolchain/elf2flt/Config.in
rename to package/elf2flt/Config.in.host
index b4e450a..31a6c7f 100644
--- a/toolchain/elf2flt/Config.in
+++ b/package/elf2flt/Config.in.host
@@ -1,4 +1,4 @@
-config BR2_ELF2FLT
+config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
 	depends on BR2_arm || BR2_sh || BR2_sparc
 	help
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
new file mode 100644
index 0000000..5afa5ca
--- /dev/null
+++ b/package/elf2flt/elf2flt.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# elf2flt
+#
+#############################################################
+
+ELF2FLT_SOURCE =
+HOST_ELF2FLT_SOURCE =
+ELF2FLT_VERSION = cvs
+ELF2FLT_LICENSE = GPLv2+
+ELF2FLT_LICENSE_FILES = LICENSE.TXT
+
+HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
+
+# It is not exactly a host variant, but more a cross variant, which is
+# why we pass a special --target option.
+HOST_ELF2FLT_CONF_OPT = \
+	--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
+	--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
+	--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
+	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
+	--target=$(GNU_TARGET_NAME)
+
+define HOST_ELF2FLT_EXTRACT_CMDS
+	cp -r package/elf2flt/src/* $(@D)
+endef
+
+$(eval $(host-autotools-package))
diff --git a/toolchain/elf2flt/elf2flt/LICENSE.TXT b/package/elf2flt/src/LICENSE.TXT
similarity index 100%
rename from toolchain/elf2flt/elf2flt/LICENSE.TXT
rename to package/elf2flt/src/LICENSE.TXT
diff --git a/toolchain/elf2flt/elf2flt/Makefile.in b/package/elf2flt/src/Makefile.in
similarity index 100%
rename from toolchain/elf2flt/elf2flt/Makefile.in
rename to package/elf2flt/src/Makefile.in
diff --git a/toolchain/elf2flt/elf2flt/README b/package/elf2flt/src/README
similarity index 100%
rename from toolchain/elf2flt/elf2flt/README
rename to package/elf2flt/src/README
diff --git a/toolchain/elf2flt/elf2flt/config.guess b/package/elf2flt/src/config.guess
similarity index 100%
rename from toolchain/elf2flt/elf2flt/config.guess
rename to package/elf2flt/src/config.guess
diff --git a/toolchain/elf2flt/elf2flt/config.sub b/package/elf2flt/src/config.sub
similarity index 100%
rename from toolchain/elf2flt/elf2flt/config.sub
rename to package/elf2flt/src/config.sub
diff --git a/toolchain/elf2flt/elf2flt/configure b/package/elf2flt/src/configure
similarity index 100%
rename from toolchain/elf2flt/elf2flt/configure
rename to package/elf2flt/src/configure
diff --git a/toolchain/elf2flt/elf2flt/configure.in b/package/elf2flt/src/configure.in
similarity index 100%
rename from toolchain/elf2flt/elf2flt/configure.in
rename to package/elf2flt/src/configure.in
diff --git a/toolchain/elf2flt/elf2flt/cygwin-elf.h b/package/elf2flt/src/cygwin-elf.h
similarity index 100%
rename from toolchain/elf2flt/elf2flt/cygwin-elf.h
rename to package/elf2flt/src/cygwin-elf.h
diff --git a/toolchain/elf2flt/elf2flt/e1-elf2flt.ld b/package/elf2flt/src/e1-elf2flt.ld
similarity index 100%
rename from toolchain/elf2flt/elf2flt/e1-elf2flt.ld
rename to package/elf2flt/src/e1-elf2flt.ld
diff --git a/toolchain/elf2flt/elf2flt/elf2flt.c b/package/elf2flt/src/elf2flt.c
similarity index 100%
rename from toolchain/elf2flt/elf2flt/elf2flt.c
rename to package/elf2flt/src/elf2flt.c
diff --git a/toolchain/elf2flt/elf2flt/elf2flt.ld b/package/elf2flt/src/elf2flt.ld
similarity index 100%
rename from toolchain/elf2flt/elf2flt/elf2flt.ld
rename to package/elf2flt/src/elf2flt.ld
diff --git a/toolchain/elf2flt/elf2flt/flat.h b/package/elf2flt/src/flat.h
similarity index 100%
rename from toolchain/elf2flt/elf2flt/flat.h
rename to package/elf2flt/src/flat.h
diff --git a/toolchain/elf2flt/elf2flt/flthdr.c b/package/elf2flt/src/flthdr.c
similarity index 100%
rename from toolchain/elf2flt/elf2flt/flthdr.c
rename to package/elf2flt/src/flthdr.c
diff --git a/toolchain/elf2flt/elf2flt/install-sh b/package/elf2flt/src/install-sh
similarity index 100%
rename from toolchain/elf2flt/elf2flt/install-sh
rename to package/elf2flt/src/install-sh
diff --git a/toolchain/elf2flt/elf2flt/ld-elf2flt.in b/package/elf2flt/src/ld-elf2flt.in
similarity index 100%
rename from toolchain/elf2flt/elf2flt/ld-elf2flt.in
rename to package/elf2flt/src/ld-elf2flt.in
diff --git a/toolchain/elf2flt/elf2flt/maketarball.sh b/package/elf2flt/src/maketarball.sh
similarity index 100%
rename from toolchain/elf2flt/elf2flt/maketarball.sh
rename to package/elf2flt/src/maketarball.sh
diff --git a/toolchain/elf2flt/elf2flt/stubs.c b/package/elf2flt/src/stubs.c
similarity index 100%
rename from toolchain/elf2flt/elf2flt/stubs.c
rename to package/elf2flt/src/stubs.c
diff --git a/toolchain/elf2flt/elf2flt.mk b/toolchain/elf2flt/elf2flt.mk
deleted file mode 100644
index 1462227..0000000
--- a/toolchain/elf2flt/elf2flt.mk
+++ /dev/null
@@ -1,46 +0,0 @@
-################################################################################
-#
-# elf2flt
-#
-################################################################################
-
-# we keep a local checkout of uClinux CVS
-ELF2FLT_SOURCE:=$(ELF2FLT_DIR)/elf2flt
-ELF2FLT_DIR:=$(TOOLCHAIN_DIR)/elf2flt
-ELF2FLT_BINARY:=elf2flt
-
-$(ELF2FLT_DIR)/.unpacked:
-	cp -r toolchain/elf2flt/elf2flt "$(TOOLCHAIN_DIR)/elf2flt"
-	touch $@
-
-$(ELF2FLT_DIR)/.patched: $(ELF2FLT_DIR)/.unpacked
-	$(call CONFIG_UPDATE,$(@D))
-	touch $@
-
-$(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
-	(cd $(ELF2FLT_DIR); rm -rf config.cache; \
-		LDFLAGS="$(HOST_LDFLAGS) -lz" \
-		$(ELF2FLT_DIR)/configure $(QUIET) \
-		--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
-		--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
-		--target=$(GNU_TARGET_NAME) \
-		--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
-		--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
-		--prefix=$(HOST_DIR)/usr)
-	touch $@
-
-$(ELF2FLT_DIR)/$(ELF2FLT_BINARY): $(ELF2FLT_DIR)/.configured
-	$(MAKE) -C $(ELF2FLT_DIR) all
-	$(MAKE) -C $(ELF2FLT_DIR) install
-
-elf2flt: uclibc_target uclibc-configured binutils gcc host-zlib $(ELF2FLT_DIR)/$(ELF2FLT_BINARY)
-
-elf2flt-clean:
-	rm -rf $(ELF2FLT_SOURCE)
-
-elf2flt-dirclean:
-	rm -rf $(ELF2FLT_SOURCE)
-
-ifeq ($(BR2_ELF2FLT),y)
-TARGETS+=elf2flt
-endif
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index 5493177..5b89d56 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -1,6 +1,5 @@
 # Include files required for the internal toolchain backend
 
-include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index f58a4f7..422602e 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -98,7 +98,7 @@ config BR2_PTHREAD_DEBUG
 	help
 	  Build the thread library with debugging enabled.
 
-source "toolchain/elf2flt/Config.in"
+source "package/elf2flt/Config.in.host"
 
 config BR2_VFP_FLOAT
 	bool "Use ARM Vector Floating Point unit"
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index d1e7552..4f9c29c 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -2,7 +2,6 @@
 
 # Explicit ordering:
 include toolchain/helpers.mk
-include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 9999aa2..2aa0141 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -1,7 +1,6 @@
 # Required includes for the external toolchain backend
 
 include toolchain/helpers.mk
-include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/toolchain-external/ext-tool.mk
-- 
1.8.1.2
