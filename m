From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 10:35:30 +0200
Subject: [Buildroot] [PATCH 3/8] external toolchain: use LANG=C when calling
	gcc -v
In-Reply-To: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247819731.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fd5570970e1a488815b8ca94b516f92901cefacb.1247819731.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lionel Landwerlin <lionel.landwerlin@openwide.fr> reported that using
the external toolchain support when LANG=fr_FR.UTF-8 doesn't work,
since the messages printed by gcc -v are translated in another
language, defeating the grep ^Configured test.

Therefore, as per Lionel suggestion, we force LANG=C when calling
$(TARGET_CC) -v.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/external-toolchain/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 7a0132a..4cd4f2d 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -135,7 +135,7 @@ check_uclibc = \
 # configuration of the external toolchain.
 #
 check_arm_abi = \
-	EXT_TOOLCHAIN_TARGET=$(shell $(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' ') ; \
+	EXT_TOOLCHAIN_TARGET=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Target | cut -f2 -d ' ') ; \
 	if echo $${EXT_TOOLCHAIN_TARGET} | grep -q 'eabi$$' ; then \
 		EXT_TOOLCHAIN_ABI="eabi" ; \
 	else \
@@ -159,7 +159,7 @@ else
 EXTERNAL_LIBS+=ld-linux.so libnss_files.so
 endif
 
-SYSROOT_DIR=$(shell $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
+SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
 
 $(STAMP_DIR)/ext-toolchain-installed:
 	@echo "Checking external toolchain settings"
-- 
1.6.0.4
