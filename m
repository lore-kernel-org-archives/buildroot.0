From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 08 Aug 2012 23:26:11 +0300
Subject: [Buildroot] [PATCH] yasm: New package
Message-ID: <5022CB63.9020908@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My first git format patch. 
This is needed by Firefox WebM support. Firefox is almost ready too but
need few changes to cairo and libpng.

Hopefully it went right (can somebody suggest some good, git online
tutorial or book?).

Stefan

Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
---
 package/Config.in      |    1 +
 package/yasm/Config.in |    9 +++++++++
 package/yasm/yasm.mk   |   23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
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
index 0000000..f8fbc9b
--- /dev/null
+++ b/package/yasm/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_YASM
+    bool "yasm"
+    help
+      Yasm is a complete rewrite of the NASM-2.10.01 assembler.
+      It supports the x86 and AMD64 instruction sets, accepts NASM
+      and GAS assembler syntaxes and outputs binary, ELF32 and ELF64
+      object formats.
+
+
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
new file mode 100644
index 0000000..280efd2
--- /dev/null
+++ b/package/yasm/yasm.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# yasm
+#
+#############################################################
+YASM_VERSION = 1.2.0
+YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
+YASM_SITE = http://www.tortall.net/projects/yasm/releases/
+YASM_CONF_OPT = --enable-shared
+
+define YASM_PRE_CONFIGURE_FIXUP
+# This sed prevents it compiling 2 programs (vsyasm and ytasm)
+# that are only of use on Microsoft Windows.
+#    cd $(@D)
+    sed -i 's#) ytasm.*#)#' $(@D)/Makefile.in
+endef
+
+YASM_PRE_CONFIGURE_HOOKS += YASM_PRE_CONFIGURE_FIXUP
+
+
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.7.6
