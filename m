From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  3 Jun 2013 22:03:35 -0400
Subject: [Buildroot] [PATCH 7/7] kmod: adjust license info based on kmod
	tools selection
In-Reply-To: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1370311415-1966-7-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libkmod is licensed as LGPL, while the kmod tools are GPL.
We always install libkmod, but conditionally install the tools.
This patch adjusts the license variables accordingly.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/kmod/kmod.mk |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 5c733b9..2fe9942 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -7,11 +7,13 @@
 KMOD_VERSION = 13
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
-KMOD_LICENSE = GPLv2+ LGPLv2.1+
-KMOD_LICENSE_FILES = COPYING libkmod/COPYING
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 
+# license info for libkmod only, conditionally add more below
+KMOD_LICENSE = LGPLv2.1+
+KMOD_LICENSE_FILES = libkmod/COPYING
+
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 KMOD_CONF_OPT += --disable-manpages
 endif
@@ -27,6 +29,11 @@ KMOD_CONF_OPT += --with-xz
 endif
 
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
+
+# add license info for kmod tools
+KMOD_LICENSE += GPLv2+
+KMOD_LICENSE_FILES += COPYING
+
 # take precedence over busybox / module-init-tools implementations
 KMOD_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
-- 
1.7.9.5
