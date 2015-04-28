From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:40:00 +0200
Subject: [Buildroot] [PATCH 3/7] boot/uboot: do not check hash for custom
	versions
In-Reply-To: <cover.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <12d715d71a908668d9156cfb3c0a0de1966bea66.1430260630.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For custom tarballs, it's quite obvious we can not check hashes.

For custom versions, that's not so obvious. One might think we could
have hashes for all the official releases, but that's not possible: if
the user uses a released version of Buildroot (say 2015.05) much later
in the future, and wants to use the then-released 2038.02 U-Boot. It now
seems pretty obvious that Buildroot 2015.02 can't know the hash for
U-Boot 2038.02.

So, disable checking the hash for custom tarballs and custom versions.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vincent Stehle <vincent.stehle@laposte.net>
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 01aaf2c..410d8d8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -17,6 +17,7 @@ ifeq ($(UBOOT_VERSION),custom)
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
 UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
 UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
@@ -27,6 +28,9 @@ else
 # Handle stable official U-Boot versions
 UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
+endif
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-- 
1.9.1
