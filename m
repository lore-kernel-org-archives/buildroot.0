From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 17 Dec 2019 15:37:03 +0100
Subject: [Buildroot] [PATCH 2/3] package/libnss: remove ld segfault
 workaround
In-Reply-To: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
References: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191217143704.51115-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ld bug has been fixed with binutils version 2.27 and Buildroot at
the moment provides binutils > 2.27, so let's remove the workaround.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
This patch must be applied after patch:
https://patchwork.ozlabs.org/patch/1210535/
---
 package/libnss/libnss.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9349276a90..7c49ac1b25 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -27,16 +27,6 @@ endef
 
 LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_FIXUP_LINUX_MK
 
-# --gc-sections triggers binutils ld segfault
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
-ifeq ($(BR2_microblaze),y)
-define LIBNSS_DROP_GC_SECTIONS
-	sed -i 's:-Wl,--gc-sections::g' $(@D)/nss/coreconf/Linux.mk
-endef
-
-LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_DROP_GC_SECTIONS
-endif
-
 ifeq ($(BR2_aarch64_be),y)
 LIBNSS_ARCH = aarch64
 else
-- 
2.20.1
