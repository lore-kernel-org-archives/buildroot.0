From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:48 -0700
Subject: [Buildroot] [PATCH 19/23] arch/xtensa: accept the overlay to be an
	URL
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-20-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It can be interesting to get the overlay from a remote server, rather
than expect it to be present locally.

Since that file can be any URL, we can't know its hash, so we just
exclude it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/arch.mk.xtensa | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index a346e31..9edbcfb 100644
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
@@ -41,6 +49,10 @@ define arch-xtensa-overlay-inner
 
 ifneq ($$(ARCH_XTENSA_OVERLAY_FILE),)
 
+# No need for a conditional here, the variable will be enpty when
+# there is no URL to download.
+$(1)_EXTRA_DOWNLOADS += $$(ARCH_XTENSA_OVERLAY_URL)
+
 define $(1)_XTENSA_OVERLAY_EXTRACT
 	$$(call arch-xtensa-overlay-extract,$$(@D),$$($(1)_ARCH_XTENSA_OVERLAY_COMPONENT))
 endef
-- 
2.1.4
