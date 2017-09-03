From: Cam Hutchison <camh@xdna.net>
Date: Sun,  3 Sep 2017 22:08:35 +1000
Subject: [Buildroot] [PATCH 1/1] toolchain: detect external glibc in
	symlinked /lib
Message-ID: <20170903120835.16190-1-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

check_glibc checks for a valid glibc in an external toolchain, but
assumes that the files indicating the presence of glibc (ld-linux*.so.*,
ld.so.* or ld64.so.*) are in a top-level directory of the sysroot.

When building a toolchain with buildroot and a merged /usr, /lib is
a symlink to usr/lib. This is copied from the target to the staging
directory, and then to the sysroot, and the ultimate location of the
required files is in /usr/lib in the sysroot.

check_glibc fails to find the necessary files in this layout due to it
using find(1) with -maxdepth 2 and not following symlinks. This causes
the error 'Incorrect selection of the C library' when trying to use a
buildroot toolchain as an external toolchain that was built with a
merged /usr.

Tell find(1) to follow symlinks so that it can find the required files
to determine glibc availability in the external toolchain.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index e9e36d2069..63ef6fb4b0 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -227,7 +227,7 @@ check_glibc_rpc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if test `find $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' -o -name 'ld64.so.*' | wc -l` -eq 0 ; then \
+	if test `find -L $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' -o -name 'ld64.so.*' | wc -l` -eq 0 ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
-- 
2.11.0
