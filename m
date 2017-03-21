From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:07 +0100
Subject: [Buildroot] [PATCH 11/16] uboot: exclude from hash check except for
	latest version
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-12-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of excluding the hash specifically for the custom tarball and
custom version cases, exclude it always except in the one case where
we do have a hash: the latest version.

This simplifies the code a little because soon we will add hash checks
for git as well, so we also need an exclusion in that case.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/uboot.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1e22eaa8ea..705863dd6a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -17,7 +17,6 @@ ifeq ($(UBOOT_VERSION),custom)
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
 UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
 UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
-BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
@@ -31,9 +30,10 @@ else
 # Handle stable official U-Boot versions
 UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
-ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
-BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
+
+ifeq ($(BR2_TARGET_UBOOT)$(BR2_TARGET_UBOOT_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_BIN),y)
-- 
2.11.0
