From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Feb 2015 23:47:34 +0100
Subject: [Buildroot] [git commit] sigrok-cli: new package
Message-ID: <20150201225323.7D76B7FB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=793486e687c5c56b0dfda99ad6ecd603058dba38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs host-pkgconf, simplify pre configure hook]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/sigrok-cli/Config.in     |   17 +++++++++++++++++
 package/sigrok-cli/sigrok-cli.mk |   23 +++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1f37c7e..e7aa6d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ endif
 	source "package/sdparm/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
+	source "package/sigrok-cli/Config.in"
 	source "package/sispmctl/Config.in"
 	source "package/smartmontools/Config.in"
 	source "package/smstools3/Config.in"
diff --git a/package/sigrok-cli/Config.in b/package/sigrok-cli/Config.in
new file mode 100644
index 0000000..e3e5420
--- /dev/null
+++ b/package/sigrok-cli/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SIGROK_CLI
+	bool "sigrok-cli"
+	select BR2_PACKAGE_LIBSERIALPORT
+	select BR2_PACKAGE_LIBSIGROK
+	# libsigrok->libglib2:
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	help
+	  Sigrok-cli is a command-line frontend for the sigrok
+	  software suite.
+
+	  http://sigrok.org/wiki/Sigrok-cli
+
+comment "sigrok-cli needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
new file mode 100644
index 0000000..6051d6d
--- /dev/null
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# sigrok-cli
+#
+################################################################################
+
+SIGROK_CLI_VERSION = 198487f611d8a7be4fa15017c22fa01a56551ca6
+# No https access on upstream git
+SIGROK_CLI_SITE = git://sigrok.org/sigrok-cli
+SIGROK_CLI_LICENSE = GPLv3+
+SIGROK_CLI_LICENSE_FILES = COPYING
+# Git checkout has no configure script
+SIGROK_CLI_AUTORECONF = YES
+SIGROK_CLI_DEPENDENCIES = host-pkgconf libsigrok
+SIGROK_CLI_CONF_OPTS = --with-libsigrokdecode=NO
+
+define SIGROK_CLI_ADD_MISSING
+	mkdir -p $(@D)/autostuff
+endef
+
+SIGROK_CLI_PRE_CONFIGURE_HOOKS += SIGROK_CLI_ADD_MISSING
+
+$(eval $(autotools-package))
