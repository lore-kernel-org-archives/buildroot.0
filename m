From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 19:00:51 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain/toolchain-external: add a check
 for D language support
In-Reply-To: <20191102180052.23080-1-eric.le.bihan.dev@free.fr>
References: <20191102180052.23080-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191102180052.23080-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 toolchain/helpers.mk                           | 18 ++++++++++++++++++
 .../pkg-toolchain-external.mk                  |  6 +++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6a4f7223c8..42e5522060 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -340,6 +340,24 @@ check_cplusplus = \
 		exit 1 ; \
 	fi
 
+#
+#
+# Check that the external toolchain supports D language
+#
+# $1: cross-gdc path
+#
+check_dlang = \
+	__CROSS_GDC=$(strip $1) ; \
+	__o=$(BUILD_DIR)/.br-toolchain-test-dlang.tmp ; \
+	printf 'import std.stdio;\nvoid main() { writeln("Hello World!"); }\n' | \
+	$${__CROSS_GDC} -x d -o $${__o} - ; \
+	if test $$? -ne 0 ; then \
+		rm -f $${__o}* ; \
+		echo "D language support is selected but is not available in external toolchain" ; \
+		exit 1 ; \
+	fi ; \
+	rm -f $${__o}* \
+
 #
 #
 # Check that the external toolchain supports Fortran
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 50cfef23f5..1c43409514 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -93,6 +93,7 @@ TOOLCHAIN_EXTERNAL_SUFFIX = \
 TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
+TOOLCHAIN_EXTERNAL_GDC = $(TOOLCHAIN_EXTERNAL_CROSS)gdc$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf
 
@@ -266,7 +267,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		*-ar|*-ranlib|*-nm) \
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc) \
 			ln -sf toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
@@ -551,6 +552,9 @@ define $(2)_CONFIGURE_CMDS
 	if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
 		$$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
 	fi ; \
+	if test "$$(BR2_TOOLCHAIN_HAS_DLANG)" = "y" ; then \
+		$$(call check_dlang,$$(TOOLCHAIN_EXTERNAL_GDC)) ; \
+	fi ; \
 	if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
 		$$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
 	fi ; \
-- 
2.21.0
