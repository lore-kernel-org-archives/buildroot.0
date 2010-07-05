From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Jul 2010 18:58:56 +0200
Subject: [Buildroot] [PATCH 03/10] external-toolchain: only copy existing
	directories of the sysroot
In-Reply-To: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <671dd67a882e2c9d0275115574b7d7cea27c9998.1278349072.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of copying all directories in "etc lib sbin usr", check that
each of them exists before doing the copy. This is only to avoid an
harmless error message.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
