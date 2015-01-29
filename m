From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 29 Jan 2015 12:35:39 +0100
Subject: [Buildroot] [PATCH v2 4/5] sigrok-cli: new package
In-Reply-To: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
References: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1422531340-24883-5-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in                |  1 +
 package/sigrok-cli/Config.in     | 17 +++++++++++++++++
 package/sigrok-cli/sigrok-cli.mk | 26 ++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/sigrok-cli/Config.in
 create mode 100644 package/sigrok-cli/sigrok-cli.mk

diff --git a/package/Config.in b/package/Config.in
index 686f343..8742408 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ endif
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
index 0000000..71b33a4
--- /dev/null
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -0,0 +1,26 @@
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
+SIGROK_CLI_DEPENDENCIES = libsigrok
+SIGROK_CLI_CONF_OPTS = --with-libsigrokdecode=NO
+
+define SIGROK_CLI_ADD_MISSING
+	cd $(@D); \
+	mkdir -p autostuff; \
+	automake --add-missing; \
+	cd -;
+endef
+
+SIGROK_CLI_PRE_CONFIGURE_HOOKS += SIGROK_CLI_ADD_MISSING
+
+$(eval $(autotools-package))
-- 
2.1.4
