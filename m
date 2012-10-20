From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Oct 2012 21:05:39 +0200
Subject: [Buildroot] [git commit] toolchain: have check_glibc to search
	deeper for ld-linux
Message-ID: <20121020190731.D8D1F997D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8fd94218ee6284061552ca5de2256417a21bcb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ld-linux*.so may not be present in lib/ directory, it could be
in lib32 and/or lib64 only. But check_glibc reports
"Incorrect selection of the C library" in this case, which is
not true.
Fixed by extending the search to  SYSROOT/*/*.

Signed-off-by: Jean-Mickael Guerin <jean-mickael.guerin@6wind.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
