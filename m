From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Feb 2015 23:47:35 +0100
Subject: [Buildroot] [git commit] libsigrokdecode: new package
Message-ID: <20150201225323.89FBE7FB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9404f1a0a758d1443962ee9ac4c960f0fe23bab4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs libglib2+host-pkgconf, simplify pre-configure, propagate
	!python dependency]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |    1 +
 package/libsigrokdecode/Config.in          |   26 ++++++++++++++++++++++++++
 package/libsigrokdecode/libsigrokdecode.mk |   23 +++++++++++++++++++++++
 package/sigrok-cli/sigrok-cli.mk           |    8 +++++++-
 4 files changed, 57 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e7aa6d0..dd011be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -738,6 +738,7 @@ menu "Hardware handling"
 	source "package/libserial/Config.in"
 	source "package/libserialport/Config.in"
 	source "package/libsigrok/Config.in"
+	source "package/libsigrokdecode/Config.in"
 	source "package/libsoc/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
new file mode 100644
index 0000000..2529923
--- /dev/null
+++ b/package/libsigrokdecode/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBSIGROKDECODE
+	bool "libsigrokdecode"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON # python3
+	depends on BR2_USE_WCHAR # libglib2/python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2/python3
+	depends on BR2_USE_MMU # libglib2/python3
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
+comment "libsigrokecode needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_PYTHON
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libsigrokdecode is not compatible with python"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_PYTHON
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
new file mode 100644
index 0000000..c0a4017
--- /dev/null
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -0,0 +1,23 @@
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
+LIBSIGROKDECODE_DEPENDENCIES = host-pkgconf libglib2 python3
+
+define LIBSIGROKDECODE_ADD_MISSING
+	mkdir -p $(@D)/autostuff
+endef
+
+LIBSIGROKDECODE_PRE_CONFIGURE_HOOKS += LIBSIGROKDECODE_ADD_MISSING
+
+$(eval $(autotools-package))
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 6051d6d..9f8b1c2 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -12,7 +12,13 @@ SIGROK_CLI_LICENSE_FILES = COPYING
 # Git checkout has no configure script
 SIGROK_CLI_AUTORECONF = YES
 SIGROK_CLI_DEPENDENCIES = host-pkgconf libsigrok
-SIGROK_CLI_CONF_OPTS = --with-libsigrokdecode=NO
+
+ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
+SIGROK_CLI_CONF_OPTS += --with-libsigrokdecode
+SIGROK_CLI_DEPENDENCIES += libsigrokdecode
+else
+SIGROK_CLI_CONF_OPTS += --with-libsigrokdecode=NO
+endif
 
 define SIGROK_CLI_ADD_MISSING
 	mkdir -p $(@D)/autostuff
