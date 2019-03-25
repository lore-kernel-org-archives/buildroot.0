From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:46:10 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] linux{,
 -headers}: support downloads of v5+
Message-ID: <20190325204337.B992980FA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc31a761c571fed11b508b01eb44c4a4dd0e4c14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With the arrival of linux v5.0, we need yet another condition to set
_SITE correctly. Instead of continuing this madness, solve the problem
generically: use v2.6 for 2.6.*, and use the number before the first dot
in the other cases.

While we're at it, remove the comment which has been incorrect since
80d7b68167a5c8893e906ace6b5f0b0166336406 (7 years ago).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Tested-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4ed7246a597325cea2c5b4624b7c94c67ca8662d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk                         | 9 ++-------
 package/linux-headers/linux-headers.mk | 9 ++-------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2b5d096e14..c7081db88f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -37,15 +37,10 @@ else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
 LINUX_SITE = https://git.kernel.org/torvalds/t
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
-# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
-# to use the $(word) function. We support versions such as 4.0, 3.1,
-# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
 LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
-else ifeq ($(findstring x3.,x$(LINUX_VERSION)),x3.)
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
-else ifeq ($(findstring x4.,x$(LINUX_VERSION)),x4.)
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
+else
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_VERSION))).x
 endif
 endif
 
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 4b5ebf8d97..95432ade83 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -50,15 +50,10 @@ LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 LINUX_HEADERS_SITE = https://git.kernel.org/torvalds/t
 else
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
-# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
-# to use the $(word) function. We support versions such as 4.0, 3.1,
-# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
-else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
-else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
-LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
+else
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_HEADERS_VERSION))).x
 endif # x2.6
 endif # LINUX_HEADERS_CUSTOM_TARBALL
 
