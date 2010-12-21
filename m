From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Dec 2010 13:49:37 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: fix multilib symlink for
	external toolchains
In-Reply-To: <cover.1292935765.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292935765.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d266d70afb300c8cda477b046863c88f6f16942e.1292935765.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARCH_SUBDIR is a shell variable, so it should be referenced with
$${ARCH_SUBDIR}. Without this, no symbolic link is created, and the
external toolchain fails to work if the non-default multilib variant
is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 9b37f3f..eb9d742 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -96,7 +96,7 @@ copy_toolchain_sysroot = \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
-		ln -s . $(STAGING_DIR)/$(ARCH_SUBDIR) ; \
+		ln -s . $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
 	fi ; \
 	find $(STAGING_DIR) -type d | xargs chmod 755
 
-- 
1.7.0.4
