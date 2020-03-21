From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 20:56:21 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/gcc: fix download
 url when using upstream gcc for csky
Message-ID: <20200321194817.2AB3A83AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14fb794b4568a92747452af3049bafed37be9ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a85b464b9440ae97dabb961086d9285947c7b283)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 527f30bf22..0cf31e41f5 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -16,7 +16,7 @@ GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_GCC_VERSION_OR1K),y)
 GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else ifeq ($(BR2_csky),y)
+else ifeq ($(BR2_GCC_VERSION_CSKY),y)
 GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
