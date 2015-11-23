From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:20 +0100
Subject: [Buildroot] [PATCH 50/51] arch/xtensa: accept the overlay to be an
	URL
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <fb88a640d6ca2ceb85fc96fa73a960af848c8930.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It can be interesting to get the overlay from a remote server, rather
than expect it to be present locally.

Since that file can be any URL, we can't know its hash, so we just
exclude it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Chris Zankel <chris@zankel.net>
---
 arch/arch.mk.xtensa | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 238ba24..afaec3c 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -9,7 +9,15 @@
 #       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
 #   endif
 ################################################################################
-ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
+BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
+ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
+ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
+ARCH_XTENSA_OVERLAY_FILE = $(BR2_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
+# Do not check that file, we can't know its hash
+BR_NO_CHECK_HASH_FOR += $(notdir $(ARCH_XTENSA_OVERLAY_URL))
+else
+ARCH_XTENSA_OVERLAY_FILE = $(BR_ARCH_XTENSA_OVERLAY_FILE)
+endif
 
 ################################################################################
 # arch-xtensa-overlay-extract -- extract an extensa overlay
@@ -54,6 +62,10 @@ define arch-xtensa-overlay-inner
 
 ifneq ($$(ARCH_XTENSA_OVERLAY_FILE),)
 
+# No need for a conditional here, the variable will be enpty when
+# there is no URL to download.
+$(1)_EXTRA_DOWNLOADS += $$(ARCH_XTENSA_OVERLAY_URL)
+
 define $(1)_XTENSA_OVERLAY_EXTRACT
 	$$(call arch-xtensa-overlay-extract,$$(@D),$$($(1)_ARCH_XTENSA_OVERLAY_COMPONENT))
 endef
-- 
1.9.1
