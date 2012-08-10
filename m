From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Fri, 10 Aug 2012 22:30:11 +0300
Subject: [Buildroot] [PATCH] yasm: New package
Message-ID: <1344627011-1862-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
---
 package/Config.in      |    1 +
 package/yasm/Config.in |    9 +++++++++
 package/yasm/yasm.mk   |   20 ++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/yasm/Config.in
 create mode 100644 package/yasm/yasm.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..bde4318 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -91,6 +91,7 @@ source "package/sstrip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
+source "package/yasm/Config.in"
 endmenu
 
 menu "Games"
diff --git a/package/yasm/Config.in b/package/yasm/Config.in
new file mode 100644
index 0000000..bb1d417
--- /dev/null
+++ b/package/yasm/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_YASM
+	bool "yasm"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Yasm is a complete rewrite of the NASM-2.10.01 assembler.
+	  It supports the x86 and AMD64 instruction sets, accepts NASM
+	  and GAS assembler syntaxes and outputs binary, ELF32 and ELF64
+	  object formats.
+
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
new file mode 100644
index 0000000..ac75d2b
--- /dev/null
+++ b/package/yasm/yasm.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# yasm
+#
+#############################################################
+YASM_VERSION = 1.2.0
+YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
+YASM_SITE = http://www.tortall.net/projects/yasm/releases/
+YASM_CONF_OPT = --disable-static
+
+define YASM_PRE_CONFIGURE_FIXUP
+# This sed prevents it compiling 2 programs (vsyasm and ytasm) 
+# that are only of use on Microsoft Windows. 
+	sed -i 's#) ytasm.*#)#' $(@D)/Makefile.in
+endef
+
+YASM_PRE_CONFIGURE_HOOKS += YASM_PRE_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.7.6
