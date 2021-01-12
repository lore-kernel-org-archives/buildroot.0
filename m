From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 12 Jan 2021 10:18:06 +0100
Subject: [Buildroot] [PATCH] uboot: fix binman with a new dependency
Message-ID: <20210112091806.906954-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since 2021.01, tools/binman is broken.
tools/binman/control.py imports pkg_resources
the module pkg_resources is supplied by setuptools,
so this new dependency is required.

binman is used only for building SPL

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 boot/uboot/uboot.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d2b4e8dc6..a3d949a55 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -167,8 +167,14 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
 UBOOT_DEPENDENCIES += host-python
+ifeq ($(BR2_TARGET_UBOOT_SPL),y)
+UBOOT_DEPENDENCIES += host-python-setuptools
+endif
 else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
 UBOOT_DEPENDENCIES += host-python3
+ifeq ($(BR2_TARGET_UBOOT_SPL),y)
+UBOOT_DEPENDENCIES += host-python3-setuptools
+endif
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-- 
2.27.0
