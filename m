From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 22 Sep 2016 20:12:54 +0200
Subject: [Buildroot] [PATCH v2] mksh: add new package MirOS Korn Shell
Message-ID: <20160922181253.GA13373@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The MirOS Korn Shell is a quite complete posix shell implementation,
is rather small and supports vi mode properly.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - added hash file
  - updated to latest release
  - tested with shared and static builds
---
I am resending the patch from Kurt, not sure why he got no feedback
yet. I can take over maintainership (DEVELOPERS entry), if Kurt won't do it.
It is a great shell and if you ever try to debug functions in ash
with set -x, you know why you want to switch to mksh.
It should properly cross-compile for every supported buildroot
architecture with MMU. It is used for a long time in OpenADK as
base system shell and it is pretty stable.
---
 package/Config.in      |  1 +
 package/mksh/Config.in | 22 ++++++++++++++++++++++
 package/mksh/mksh.hash |  4 ++++
 package/mksh/mksh.mk   | 31 +++++++++++++++++++++++++++++++
 system/Config.in       |  9 ++++++++-
 5 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 package/mksh/Config.in
 create mode 100644 package/mksh/mksh.hash
 create mode 100644 package/mksh/mksh.mk

diff --git a/package/Config.in b/package/Config.in
index 9ca6c15..287603b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1654,6 +1654,7 @@ menu "Shell and utilities"
 comment "Shells"
 	source "package/bash/Config.in"
 	source "package/dash/Config.in"
+	source "package/mksh/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/at/Config.in"
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
diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
new file mode 100644
index 0000000..d95001c
--- /dev/null
+++ b/package/mksh/mksh.hash
@@ -0,0 +1,4 @@
+# From http://www.mirbsd.org/mksh.htm#build
+md5	43fc3e32963cc1795a299bcec531d770	mksh-R53a.tgz
+# Calculated based on the hash above
+sha256	3bb2453c8cb65abbda24f9bdd8b8371e30a6e1c2f7a0d5474a3efae438639635	mksh-R53a.tgz
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
new file mode 100644
index 0000000..7ca58cd
--- /dev/null
+++ b/package/mksh/mksh.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# mksh
+#
+################################################################################
+
+MKSH_VERSION = R53a
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
index 77c665b..d3b2889 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -276,13 +276,19 @@ config BR2_SYSTEM_BIN_SH_DASH
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DASH
 
+config BR2_SYSTEM_BIN_SH_MKSH
+	bool "mksh"
+	depends on BR2_USE_MMU # mksh
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_MKSH
+
 config BR2_SYSTEM_BIN_SH_ZSH
 	bool "zsh"
 	depends on BR2_USE_MMU # zsh
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_ZSH
 
-comment "bash, dash, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
+comment "bash, dash, mksh, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS && BR2_PACKAGE_BUSYBOX
 
 config BR2_SYSTEM_BIN_SH_NONE
@@ -295,6 +301,7 @@ config BR2_SYSTEM_BIN_SH
 	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
 	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
 	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
+	default "mksh"    if BR2_SYSTEM_BIN_SH_MKSH
 	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
 
 menuconfig BR2_TARGET_GENERIC_GETTY
-- 
2.1.4
