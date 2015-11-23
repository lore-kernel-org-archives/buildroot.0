From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:14 +0100
Subject: [Buildroot] [PATCH 44/51] package/binutils: use the Xtensa macro
	generators
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <7fa51ef27ece2063b6bf22a67452a2606ea5d0b3.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 09c1d1c..30d71f9 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -90,18 +90,10 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define BINUTILS_XTENSA_OVERLAY_EXTRACT
-	$(call arch-xtensa-overlay-extract,$(@D),binutils)
-endef
-BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
-HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
-define BINUTILS_XTENSA_OVERLAY_LEGAL_INFO
-	$(call arch-xtensa-overlay-legal-info,$($(PKG)_REDIST_SOURCES_DIR))
-endef
-BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_OVERLAY_LEGAL_INFO
-HOST_BINUTILS_POST_LEGAL_INFO_HOOKS += BINUTILS_XTENSA_OVERLAY_LEGAL_INFO
-endif
+BINUTILS_ARCH_XTENSA_OVERLAY_COMPONENT = binutils
+HOST_BINUTILS_ARCH_XTENSA_OVERLAY_COMPONENT = binutils
+$(eval $(arch-xtensa-overlay))
+$(eval $(host-arch-xtensa-overlay))
 
 ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
 HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
-- 
1.9.1
