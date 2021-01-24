From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Sun, 24 Jan 2021 10:43:22 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: introduce
 BR2_TARGET_UBOOT_NEEDS_XXD
Message-ID: <20210124094322.153407-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling uboot with a default environment built from a
text file [1], the build pipeline uses the xxd command [2].

xxd is distributed with vim [3], which might no be installed
on the host, so we provide this "uboot needs xxd" option to
install host-vim for such a case.

[1] https://gitlab.denx.de/u-boot/u-boot/-/blob/v2021.01/env/Kconfig#L612-628
[2] https://gitlab.denx.de/u-boot/u-boot/-/blob/v2021.01/Makefile#L1887-1893
[3] https://github.com/vim/vim/tree/v8.2.0000/src/xxd

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d43c85cce7..5b91d23a81 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -239,6 +239,14 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	  and that the OpenSBI variable pointing to OpenSBI binary,
 	  is passed during the Buildroot build.
 
+config BR2_TARGET_UBOOT_NEEDS_XXD
+	bool "U-Boot needs xxd"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires xxd to be available on the host. This is typically
+	  the case when the board configuration has USE_DEFAULT_ENV_FILE
+	  enabled.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2478a2a1e9..3afed94dbe 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -198,6 +198,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_LZOP),y)
 UBOOT_DEPENDENCIES += host-lzop
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
+UBOOT_DEPENDENCIES += host-vim
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.25.3
