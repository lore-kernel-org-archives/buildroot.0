From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:43:10 +0200
Subject: [Buildroot] [git commit] toolchain: detect external glibc in merged
	/usr
Message-ID: <20170919204918.93B2380030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b55ff5a7cdaa8a45101d11a3c095d9aeab1f0ce4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using an external toolchain that was built with Buildroot and a
merged /usr, the dynamic linker is actually in /usr/lib.

But the check_glibc macro limits the depth it is looking for the dynamic
linker, and misses it when it is in /usr/lib because it is too deep.

We could fix that in two ways: increase the depth in which we look
for it, or follow symlinks. We choose the second solution.

Signed-off-by: Cam Hutchison <camh@xdna.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index e9e36d2..63ef6fb 100644
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
