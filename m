From: Ilya Kuzmich <ilya.kuzmich@gmail.com>
Date: Mon, 20 Mar 2017 08:56:10 +0300
Subject: [Buildroot] [PATCH 1/1] toolchain-external: improve musl external
	check
Message-ID: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test whether musl used or not: compile minimal C program and check if
interpreter contains /lib/ld-musl.

Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
---
 toolchain/helpers.mk                                   | 13 +++++++++----
 toolchain/toolchain-external/pkg-toolchain-external.mk |  4 +++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 2f73ebb..77303a8 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -197,13 +197,18 @@ check_glibc = \
 #
 # Check that the selected C library really is musl
 #
-# $1: sysroot directory
+# $1: cross-gcc path
+# $2: cross-readelf path
 check_musl = \
-	SYSROOT_DIR="$(strip $1)"; \
-	if test ! -f $${SYSROOT_DIR}/lib/libc.so -o -e $${SYSROOT_DIR}/lib/libm.so ; then \
+	__CROSS_CC=$(strip $1) ; \
+	__CROSS_READELF=$(strip $2) ; \
+	echo 'void main(void) {}' | $${__CROSS_CC} -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - >/dev/null 2>&1; \
+	if ! $${__CROSS_READELF} -l $(BUILD_DIR)/.br-toolchain-test.tmp 2> /dev/null | grep 'program interpreter: /lib/ld-musl' -q; then \
+		rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*; \
 		echo "Incorrect selection of the C library" ; \
 		exit -1; \
-	fi
+	fi ; \
+	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
 
 #
 # Check the conformity of Buildroot configuration with regard to the
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 77b7bbb..8a774eb 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -565,7 +565,9 @@ define $(2)_CONFIGURE_CMDS
 	if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
 	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
-		$$(call check_musl,$$$${SYSROOT_DIR}) ; \
+		$$(call check_musl,\
+			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)",\
+			$$(TOOLCHAIN_EXTERNAL_READELF)) ; \
 	else \
 		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
 	fi
-- 
2.7.4
