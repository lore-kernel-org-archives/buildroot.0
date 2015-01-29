From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 29 Jan 2015 12:35:40 +0100
Subject: [Buildroot] [PATCH v2 5/5] libsigrokdecode: new package
In-Reply-To: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
References: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1422531340-24883-6-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in                          |  1 +
 package/libsigrokdecode/Config.in          | 20 ++++++++++++++++++++
 package/libsigrokdecode/libsigrokdecode.mk | 26 ++++++++++++++++++++++++++
 package/sigrok-cli/sigrok-cli.mk           |  8 +++++++-
 4 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 package/libsigrokdecode/Config.in
 create mode 100644 package/libsigrokdecode/libsigrokdecode.mk

diff --git a/package/Config.in b/package/Config.in
index 8742408..ae6a326 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -735,6 +735,7 @@ menu "Hardware handling"
 	source "package/libserial/Config.in"
 	source "package/libserialport/Config.in"
 	source "package/libsigrok/Config.in"
+	source "package/libsigrokdecode/Config.in"
 	source "package/libsoc/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
new file mode 100644
index 0000000..d13d9be
--- /dev/null
+++ b/package/libsigrokdecode/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBSIGROKDECODE
+	bool "libsigrokdecode"
+	select BR2_PACKAGE_PYTHON3
+	# python3
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	help
+	  Libsigrokdecode is a shared library written in C, which
+	  provides (streaming) protocol decoding functionality. Say
+	  yes here if you want to add this functionality to your
+	  buildroot-generated sigrok suite.
+
+	  This library is a part of the sigrok software suite.
+
+	  http://sigrok.org/wiki/Libsigrokdecode
+
+comment "libsigrok needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
new file mode 100644
index 0000000..9d9fc11
--- /dev/null
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libsigrokdecode
+#
+################################################################################
+
+LIBSIGROKDECODE_VERSION = 9177963de41c2d003d417049470eea3c98eeb2ef
+# No https access on upstream git
+LIBSIGROKDECODE_SITE = git://sigrok.org/libsigrokdecode
+LIBSIGROKDECODE_LICENSE = GPLv3+
+LIBSIGROKDECODE_LICENSE_FILES = COPYING
+# Git checkout has no configure script
+LIBSIGROKDECODE_AUTORECONF = YES
+LIBSIGROKDECODE_INSTALL_STAGING = YES
+LIBSIGROKDECODE_DEPENDENCIES = python3
+
+define LIBSIGROKDECODE_ADD_MISSING
+	cd $(@D); \
+	mkdir -p autostuff; \
+	automake --add-missing; \
+	cd -;
+endef
+
+LIBSIGROKDECODE_PRE_CONFIGURE_HOOKS += LIBSIGROKDECODE_ADD_MISSING
+
+$(eval $(autotools-package))
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 71b33a4..97d95b5 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -12,7 +12,13 @@ SIGROK_CLI_LICENSE_FILES = COPYING
 # Git checkout has no configure script
 SIGROK_CLI_AUTORECONF = YES
 SIGROK_CLI_DEPENDENCIES = libsigrok
-SIGROK_CLI_CONF_OPTS = --with-libsigrokdecode=NO
+
+ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
+SIGROK_CLI_CONF_OPTS += --with-libsigrokdecode
+SIGROK_CLI_DEPENDENCIES += libsigrokdecode
+else
+SIGROK_CLI_CONF_OPTS += --with-libsigrokdecode=NO
+endif
 
 define SIGROK_CLI_ADD_MISSING
 	cd $(@D); \
-- 
2.1.4
