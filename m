From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] external-toolchain: only copy
	existing directories of the sysroot
Message-ID: <20100706060217.ADCEC825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d510536371b8147af389f914a94509937dc18f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of copying all directories in "etc lib sbin usr", check that
each of them exists before doing the copy. This is only to avoid an
harmless error message.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/external-toolchain/ext-tool.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index b1eee23..9c1ec8f 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -120,7 +120,9 @@ copy_toolchain_sysroot = \
 	ARCH_SYSROOT_DIR="$(strip $2)"; \
 	ARCH_SUBDIR="$(strip $3)"; \
 	for i in etc lib sbin usr ; do \
-		cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
+			cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
+		fi ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-- 
1.7.1
