From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:40:03 +0200
Subject: [Buildroot] [PATCH 6/7] linux: do not check hashes for custom
	versions and tarballs
In-Reply-To: <cover.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <f033e301266baba536c3d63902cc2439e45eb3a4.1430260630.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0c348da..959c564 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -13,8 +13,10 @@ ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
+# For 'local', there is no hash check, so no need to set BR_NO_CHECK_HASH_FOR
 LINUX_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
@@ -24,6 +26,9 @@ LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = hg
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
+endif
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
-- 
1.9.1
