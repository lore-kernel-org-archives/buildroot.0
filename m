From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:53:59 +1300
Subject: [Buildroot] [git commit] rtl8188eu: Move the post install target
	hook before the infras
Message-ID: <20170127085420.61D1B82101@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e8a5ff22ee91df07b945d838d98d5c38e1c9d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hook is only used to install firmware blobs, and so it
doesn't need to be declared after the kernel-module infra.
Move it where it belong, to avoid confusion.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8188eu/rtl8188eu.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5da6bf3..8560be2 100644
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
