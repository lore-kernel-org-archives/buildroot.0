From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Oct 2016 23:11:11 +0200
Subject: [Buildroot] [git commit] mksh: new package
Message-ID: <20161001213926.552EB81D68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04b4c5c26ec1438cac6e4526369c13f8f42753f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MirOS Korn Shell is a quite complete posix shell implementation,
is rather small and supports vi mode properly.

[Peter: use mksh.1 as license file, use TARGET_CONFIGURE_OPTS, install -D]
Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in      |  1 +
 package/mksh/Config.in | 25 +++++++++++++++++++++++++
 package/mksh/mksh.hash |  4 ++++
 package/mksh/mksh.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fe3ac2c..ef82b2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1655,6 +1655,7 @@ menu "Shell and utilities"
 comment "Shells"
 	source "package/bash/Config.in"
 	source "package/dash/Config.in"
+	source "package/mksh/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/at/Config.in"
diff --git a/package/mksh/Config.in b/package/mksh/Config.in
new file mode 100644
index 0000000..55d1cc1
--- /dev/null
+++ b/package/mksh/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_MKSH
+	bool "mksh"
+	depends on BR2_USE_MMU # fork()
+	help
+	  The MirBSD Korn Shell,
+
+	  mksh is a successor of pdksh but not affiliated with the
+	  pdksh developers or contributors. mksh is not affiliated
+	  with the AT&T Korn Shell, its past or present owners,
+	  other than that both attempt to implement the Korn Shell
+	  programming language.
+
+	  mksh targets users who desire a compact, fast, reliable,
+	  secure shell not cut off modern extensions; a shell with
+	  Unicode support; an actively developed, current, and
+	  portable product; one with developers that listen to
+	  their users??? requests and implement them if they
+	  actually make sense.
+
+	  mksh aims to replace pdksh in all but very rare use cases
+	  (such as support for checking the Unix mbox) and in all
+	  operating environments
+	  (thus including patches from pdksh on e.g. Debian).
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
index 0000000..248b43f
--- /dev/null
+++ b/package/mksh/mksh.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# mksh
+#
+################################################################################
+
+MKSH_VERSION = R53a
+MKSH_SOURCE = mksh-$(MKSH_VERSION).tgz
+MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
+# For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
+MKSH_LICENSE = MirOS, ISC
+MKSH_LICENSE_FILES = mksh.1
+
+define MKSH_BUILD_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) \
+		TARGET_OS=Linux $(TARGET_CONFIGURE_OPTS) \
+		sh ./Build.sh
+endef
+
+define MKSH_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/mksh $(TARGET_DIR)/bin/mksh
+endef
+
+$(eval $(generic-package))
