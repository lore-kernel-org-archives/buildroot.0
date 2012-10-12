From: Jean-Mickael Guerin <jean-mickael.guerin@6wind.com>
Date: Fri, 12 Oct 2012 22:25:50 +0200
Subject: [Buildroot] [PATCH] toolchain: have check_glibc to search deeper
	for ld-linux
Message-ID: <1350073550-779-1-git-send-email-jean-mickael.guerin@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ld-linux*.so may not be present in lib/ directory, it could be
in lib32 and/or lib64 only. But check_glibc reports
"Incorrect selection of the C library" in this case, which is
not true.
Fixed by extending the search to  SYSROOT/*/*.

Signed-off-by: Jean-Mickael Guerin <jean-mickael.guerin@6wind.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index d5ab91b..497cfff 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -196,7 +196,7 @@ check_glibc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if test `find $${SYSROOT_DIR}/lib/ -maxdepth 1 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
+	if test `find $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
-- 
1.7.12
