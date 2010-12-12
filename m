From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Dec 2010 11:56:25 -0500
Subject: [Buildroot] [PATCH] toolchain: glibc: improve library checking
Message-ID: <1292172985-8647-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the source sysroot has symlinks to the ldso, the globs might match more
than one file, and test fails due to too many arguments.  So move the glob
into a for loop and test each result that way.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/helpers.mk |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 674e7b4..166f290 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -150,10 +150,13 @@ check_glibc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld-linux*.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \
-		echo "Incorrect selection of the C library"; \
-		exit -1; \
-	fi; \
+	for l in $${SYSROOT_DIR}/lib/ld-linux*.so.* $${SYSROOT_DIR}/lib/ld.so.* ""; do \
+		if test -z "$$l"; then \
+			echo "Incorrect selection of the C library"; \
+			exit 1; \
+		fi; \
+		test -f $$l && break; \
+	done; \
 	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
 	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
 	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
-- 
1.7.3.3
