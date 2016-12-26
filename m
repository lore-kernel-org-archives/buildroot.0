From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 26 Dec 2016 12:07:07 -0300
Subject: [Buildroot] [PATCH] rtl8188eu: Move the post install target hook
	before the infras
Message-ID: <20161226150707.2663-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hook is only used to install firmware blobs, and so it
doesn't need to be declared after the kernel-module infra.
Move it where it belong, to avoid confusion.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--
This is just a nitpick, but since contributors are likely to
use this package as an example, let's avoid copy-pasted cluttering.
---
 package/rtl8188eu/rtl8188eu.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5da6bf35dc53..8560be297d9a 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -10,12 +10,11 @@ RTL8188EU_LICENSE = GPLv2, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
 
-$(eval $(kernel-module))
-
 define RTL8188EU_INSTALL_FIRMWARE
 	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
 		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
 endef
 RTL8188EU_POST_INSTALL_TARGET_HOOKS += RTL8188EU_INSTALL_FIRMWARE
 
+$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.11.0
