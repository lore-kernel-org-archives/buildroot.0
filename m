From: Ed Blake <ed.blake@sondrel.com>
Date: Thu, 28 Mar 2019 18:48:15 +0000
Subject: [Buildroot] [PATCH 2/2] toolchain-external: add a check for OpenMP
 support
In-Reply-To: <cover.1553798445.git.ed.blake@sondrel.com>
References: <cover.1553798445.git.ed.blake@sondrel.com>
Message-ID: <bf2d5c127caf50fab732ff1c420bc2d46a8888c7.1553798445.git.ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
---
 toolchain/helpers.mk                           | 18 ++++++++++++++++++
 .../pkg-toolchain-external.mk                  |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index e5520c00c3..03355f56dd 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -359,6 +359,24 @@ check_fortran = \
 	fi ; \
 	rm -f $${__o}* \
 
+#
+#
+# Check that the external toolchain supports OpenMP
+#
+# $1: cross-gcc path
+#
+check_openmp = \
+	__CROSS_CC=$(strip $1) ; \
+	__o=$(BUILD_DIR)/.br-toolchain-test-openmp.tmp ; \
+	printf '\#include <omp.h>\nint main(void) { return omp_get_thread_num(); }' | \
+	$${__CROSS_CC} -fopenmp -x c -o $${__o} - ; \
+	if test $$? -ne 0 ; then \
+		rm -f $${__o}* ; \
+		echo "OpenMP support is selected but is not available in external toolchain"; \
+		exit 1 ; \
+	fi ; \
+	rm -f $${__o}* \
+
 #
 # Check that the cross-compiler given in the configuration exists
 #
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 747837fdc6..baf719ad1f 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -545,6 +545,9 @@ define $(2)_CONFIGURE_CMDS
 	if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
 		$$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
 	fi ; \
+	if test "$$(BR2_TOOLCHAIN_HAS_OPENMP)" = "y" ; then \
+		$$(call check_openmp,$$(TOOLCHAIN_EXTERNAL_CC)) ; \
+	fi ; \
 	if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
 	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
-- 
2.17.1
