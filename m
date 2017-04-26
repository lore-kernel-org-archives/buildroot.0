From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Apr 2017 23:39:47 +0200
Subject: [Buildroot] [PATCH v2 2/8] grub2-tools: new package
In-Reply-To: <20170426213953.14904-1-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
Message-ID: <20170426213953.14904-3-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support tools to interact with GNU GRUB Multiboot boot loader.

In the context of Buildroot, some useful target tools provided by
grub2-tools are grub2-editenv, grub2-reboot, which provide means to
manage the Grub 2 environment, boot order, and others.

This package is also meant as a preparation step to be turned into a
host-package later and help decouple the target and host portions of the
actual Grub 2 boot loader package.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v1 -> v2:
  - bump to 2.02 instead of git, as discussed in the mailing list, and
  also 2.02 final release has finally been done this week.
  - grub 2.02 is not in the Buildroot default gnu mirror yet it seems.
  - needs wchar
  - add myself to the DEVELOPERS file
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/grub2-tools/Config.in        | 10 ++++++++++
 package/grub2-tools/grub2-tools.hash |  2 ++
 package/grub2-tools/grub2-tools.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/grub2-tools/Config.in
 create mode 100644 package/grub2-tools/grub2-tools.hash
 create mode 100644 package/grub2-tools/grub2-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 123a8f9..d6e7b85 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -472,6 +472,7 @@ F:	package/acpitool/
 F:	package/efibootmgr/
 F:	package/efivar/
 F:	package/fwts/
+F:	package/grub2-tools/
 F:	package/spi-tools/
 F:	package/xdotool/
 
diff --git a/package/Config.in b/package/Config.in
index 4eaa95b..6eee7d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ endmenu
 	source "package/gpm/Config.in"
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
+	source "package/grub2-tools/Config.in"
 	source "package/gvfs/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
diff --git a/package/grub2-tools/Config.in b/package/grub2-tools/Config.in
new file mode 100644
index 0000000..24a5664
--- /dev/null
+++ b/package/grub2-tools/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GRUB2_TOOLS
+	bool "grub2-tools"
+	depends on BR2_USE_WCHAR
+	help
+	  Support tools to interact with GNU GRUB Multiboot boot loader.
+
+	  http://www.gnu.org/software/grub/
+
+comment "grub2-tools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/grub2-tools/grub2-tools.hash b/package/grub2-tools/grub2-tools.hash
new file mode 100644
index 0000000..7f0679f
--- /dev/null
+++ b/package/grub2-tools/grub2-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 810b3798d316394f94096ec2797909dbf23c858e48f7b3830826b8daa06b7b0f grub-2.02.tar.xz
diff --git a/package/grub2-tools/grub2-tools.mk b/package/grub2-tools/grub2-tools.mk
new file mode 100644
index 0000000..8bf1a31
--- /dev/null
+++ b/package/grub2-tools/grub2-tools.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# grub2-tools
+#
+################################################################################
+
+GRUB2_TOOLS_VERSION = 2.02
+GRUB2_TOOLS_SITE = http://ftp.gnu.org/gnu/grub
+GRUB2_TOOLS_SOURCE = grub-$(GRUB2_VERSION).tar.xz
+GRUB2_TOOLS_LICENSE = GPLv3+
+GRUB2_TOOLS_LICENSE_FILES = COPYING
+GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex
+
+GRUB2_TOOLS_CONF_ENV = \
+	CPP="$(TARGET_CC) -E" \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	TARGET_NM="$(TARGET_NM)" \
+	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
+	TARGET_STRIP="$(TARGET_CROSS)strip"
+
+GRUB2_TOOLS_CONF_OPTS = \
+	--disable-grub-mkfont \
+	--enable-efiemu=no \
+	ac_cv_lib_lzma_lzma_code=no \
+	--enable-device-mapper=no \
+	--enable-libzfs=no \
+	--disable-werror
+
+$(eval $(autotools-package))
-- 
2.9.3
