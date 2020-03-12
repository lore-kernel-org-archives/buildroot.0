From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 13 Mar 2020 00:41:26 +0100
Subject: [Buildroot] [PATCH] package/gcc/9.x: fix download url when using
 upstream gcc for csky
Message-ID: <20200312234127.449204-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the csky cpu support was added [1], the gcc download url was selected
depending on the csky cpu architecture (BR2_csky) rather than the csky gcc
fork version (BR2_GCC_VERSION_CSKY)[2].

When adding gcc 9.x version [3], we forgot to update the condition in order
to use the url to the gcc csky fork only when BR2_GCC_VERSION_CSKY=y.

Due to this error, the toolchain build with the upstream gcc 9.x for csky
cpu is broken due a download error.

Fix this by using BR2_GCC_VERSION_CSKY instead of BR2_csky.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/470072924

[1] 7873a5bd5ebbeb1674293dae6b06b50f0a1f2184
[2] https://git.buildroot.net/buildroot/tree/package/gcc/gcc.mk?id=7873a5bd5ebbeb1674293dae6b06b50f0a1f2184#n19
[3] 089000eccf584d611ad1a8e5400436952450e883

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <guoren@kernel.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 128293570d..524ca83db0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -13,7 +13,7 @@ GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 ifeq ($(BR2_GCC_VERSION_ARC),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else ifeq ($(BR2_csky),y)
+else ifeq ($(BR2_GCC_VERSION_CSKY),y)
 GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
-- 
2.24.1
