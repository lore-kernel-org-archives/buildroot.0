From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:11 +0100
Subject: [Buildroot] [PATCH 41/51] package/binutils: extract Xtensa overlay
	as post-extract hook
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <0644f9dfb8ba6e12eb8d950fb91711750a452de4.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... like it is done for gcc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4740305..09c1d1c 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -91,16 +91,16 @@ endef
 endif
 
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define BINUTILS_XTENSA_PRE_PATCH
+define BINUTILS_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),binutils)
 endef
-BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
-HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
-define BINUTILS_XTENSA_LEGAL_INFO
+BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
+HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
+define BINUTILS_XTENSA_OVERLAY_LEGAL_INFO
 	$(call arch-xtensa-overlay-legal-info,$($(PKG)_REDIST_SOURCES_DIR))
 endef
-BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_LEGAL_INFO
-HOST_BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_LEGAL_INFO
+BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_OVERLAY_LEGAL_INFO
+HOST_BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_OVERLAY_LEGAL_INFO
 endif
 
 ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
-- 
1.9.1
