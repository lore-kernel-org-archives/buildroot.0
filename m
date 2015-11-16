From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:07 +0100
Subject: [Buildroot] [PATCH 12/21 RFC] package/gcc: include the extensa
	overlay in the legal-info output
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <a4e7d17f5fe855e78064b306c5bd99d2d8dc6f4e.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the Xtensa overlay is combined with the gcc sources, so it must be
redistributed for proper compliance.

Add a post-legal-info hook that also installs the Xtensa overlay in the
legal-info output.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index be58d96..53aaf5c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -43,10 +43,18 @@ HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 #
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_XTENSA_OVERLAY_TAR = $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,$(BR2_XTENSA_CORE_NAME)).tar
+
 define HOST_GCC_XTENSA_OVERLAY_EXTRACT
 	tar xf $(HOST_GCC_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
 endef
 HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+
+define HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
+	$(Q)$(call hardlink-copy,$(HOST_GCC_XTENSA_OVERLAY_TAR),\
+				 $(HOST_GCC_REDIST_SOURCES_DIR))
+endef
+HOST_GCC_POST_LEGAL_INFO_HOOKS += HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
+
 endif # Xtensa
 
 ifeq ($(ARCH),powerpc)
-- 
1.9.1
