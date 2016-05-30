From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 08:42:06 +0200
Subject: [Buildroot] [PATCH] mksh: add MirOS Korn Shell
Message-ID: <20160530064206.GE31737@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The MirOS Korn Shell is, to my opinion, a quite complete posix shell
implementation, is rather small and supports vi mode properly for me.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/Config.in      |  1 +
 package/mksh/Config.in | 22 ++++++++++++++++++++++
 package/mksh/mksh.mk   | 31 +++++++++++++++++++++++++++++++
 system/Config.in       |  9 ++++++++-
 4 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 package/mksh/Config.in
 create mode 100644 package/mksh/mksh.mk

diff --git a/package/Config.in b/package/Config.in
index 629a7d0..17032f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1530,6 +1530,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dash/Config.in"
 	source "package/zsh/Config.in"
 endif
+	source "package/mksh/Config.in"
 comment "Utilities"
 	source "package/at/Config.in"
 	source "package/ccrypt/Config.in"
diff --git a/package/mksh/Config.in b/package/mksh/Config.in
new file mode 100644
index 0000000..9e2030a
--- /dev/null
+++ b/package/mksh/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_MKSH
+	bool "mksh"
+	depends on BR2_USE_MMU # fork()
+	help
+	  The MirBSD Korn Shell,
+
+	  mksh is a successor of pdksh but not affiliated with the pdksh
+	  developers or contributors. mksh is not affiliated with the
+	  AT&T Korn Shell, its past or present owners, other than that
+	  both attempt to implement the Korn Shell programming language.
+
+	  mksh targets users who desire a compact, fast, reliable,
+	  secure shell not cut off modern extensions; a shell with
+	  Unicode support; an actively developed, current, and portable
+	  product; one with developers that listen to their users? requests
+	  and implement them if they actually make sense.
+
+	  mksh aims to replace pdksh in all but very rare use cases
+	  (such as support for checking the Unix mbox) and in all operating
+	  environments (thus including patches from pdksh on e.g. Debian).
+
+	  http://mirbsd.de/mksh
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
new file mode 100644
index 0000000..c6c3e2f
--- /dev/null
+++ b/package/mksh/mksh.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# mksh
+#
+################################################################################
+
+MKSH_VERSION = R52c
+MKSH_SOURCE = mksh-$(MKSH_VERSION).tgz
+MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
+MKSH_LICENSE = MirOS, BSD-3c, ISC
+MKSH_LICENSE_FILES = COPYING
+
+define MKSH_CONFIGURE_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) \
+		CPPFLAGS="-DMKSH_S_NOVI=0 $(TARGET_CPPFLAGS)" \
+		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)" LDLIBS="$(TARGET_LDLIBS)" \
+		TARGET_OS=Linux \
+		sh ./Build.sh -M
+endef
+
+define MKSH_BUILD_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) \
+		sh ./Rebuild.sh
+endef
+
+define MKSH_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/mksh $(TARGET_DIR)/bin/mksh
+endef
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 2e14971..205dba6 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -267,7 +267,13 @@ config BR2_SYSTEM_BIN_SH_ZSH
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_ZSH
 
-comment "bash, dash, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
+config BR2_SYSTEM_BIN_SH_MKSH
+	bool "mksh"
+	depends on BR2_USE_MMU # mksh
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_MKSH
+
+comment "bash, dash, zsh, mksh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS && BR2_PACKAGE_BUSYBOX
 
 config BR2_SYSTEM_BIN_SH_NONE
@@ -281,6 +287,7 @@ config BR2_SYSTEM_BIN_SH
 	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
 	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
 	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
+	default "mksh"    if BR2_SYSTEM_BIN_SH_MKSH
 
 menuconfig BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
-- 
1.8.5.rc3
