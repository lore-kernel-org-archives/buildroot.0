From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:27:03 +0200
Subject: [Buildroot] [git commit branch/next] yasm: New package
Message-ID: <20120811202815.B67B49715F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a81db89eb036216c87b3036251adbeea2013b0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[thomas.petazzoni at free-electrons.com:

 drop the --disable-static from configuration options, the default
 behavior should work without problem.

 make sure the pre configure hook is also executed for the host
 variant of the package.

 add the project upstream URL in the package help text
]

Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/yasm/Config.in |    9 +++++++++
 package/yasm/yasm.mk   |   20 ++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 89cb40f..45f0799 100644
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
