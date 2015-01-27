From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 27 Jan 2015 17:02:13 +0100
Subject: [Buildroot] [PATCH 2/2] sigrok: new package
In-Reply-To: <1422374533-11694-1-git-send-email-bgolaszewski@baylibre.com>
References: <1422374533-11694-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1422374533-11694-3-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add sigrok libraries and sigrok-cli executable in a single package.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in                                 |  1 +
 package/sigrok/Config.in                          | 37 +++++++++++++++++++++++
 package/sigrok/libserialport/libserialport.mk     | 15 +++++++++
 package/sigrok/libsigrok/libsigrok.mk             | 16 ++++++++++
 package/sigrok/libsigrokdecode/libsigrokdecode.mk | 16 ++++++++++
 package/sigrok/sigrok.mk                          | 10 ++++++
 package/sigrok/sigrokcli/sigrokcli.mk             | 14 +++++++++
 7 files changed, 109 insertions(+)
 create mode 100644 package/sigrok/Config.in
 create mode 100644 package/sigrok/libserialport/libserialport.mk
 create mode 100644 package/sigrok/libsigrok/libsigrok.mk
 create mode 100644 package/sigrok/libsigrokdecode/libsigrokdecode.mk
 create mode 100644 package/sigrok/sigrok.mk
 create mode 100644 package/sigrok/sigrokcli/sigrokcli.mk

diff --git a/package/Config.in b/package/Config.in
index 2d0adac..fe2f417 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ endif
 	source "package/sdparm/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
+	source "package/sigrok/Config.in"
 	source "package/sispmctl/Config.in"
 	source "package/smartmontools/Config.in"
 	source "package/smstools3/Config.in"
diff --git a/package/sigrok/Config.in b/package/sigrok/Config.in
new file mode 100644
index 0000000..f5f52ce
--- /dev/null
+++ b/package/sigrok/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_SIGROK
+	bool "sigrok"
+	select BR2_PACKAGE_LIBSERIALPORT
+	select BR2_PACKAGE_LIBSIGROK
+	select BR2_PACKAGE_LIBSIGROKDECODE
+	select BR2_PACKAGE_SIGROKCLI
+	# libglib2 & python3:
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	help
+	  Signal analysis software suite.
+
+	  This package contains the sigrok software suite: libserialport,
+	  libsigrok, libsigrokdecode libraries and sigrok-cli command-line
+	  utility.
+
+	  http://sigrok.org/
+
+comment "sigrok needs a toolchain w/ wchar, threads
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_LIBSERIALPORT
+	bool
+
+config BR2_PACKAGE_LIBSIGROK
+	bool
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBZIP
+
+config BR2_PACKAGE_LIBSIGROKDECODE
+	bool
+	select BR2_PACKAGE_PYTHON3
+
+config BR2_PACKAGE_SIGROKCLI
+	bool
diff --git a/package/sigrok/libserialport/libserialport.mk b/package/sigrok/libserialport/libserialport.mk
new file mode 100644
index 0000000..970e1c1
--- /dev/null
+++ b/package/sigrok/libserialport/libserialport.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libserialport
+#
+################################################################################
+
+LIBSERIALPORT_VERSION = HEAD
+LIBSERIALPORT_SITE = git://sigrok.org/libserialport
+LIBSERIALPORT_LICENSE = LGPLv3+
+LIBSERIALPORT_LICENSE_FILES = COPYING
+LIBSERIALPORT_AUTORECONF = YES
+LIBSERIALPORT_INSTALL_STAGING = YES
+LIBSERIALPORT_PRE_CONFIGURE_HOOKS += SIGROK_ADD_MISSING
+
+$(eval $(autotools-package))
diff --git a/package/sigrok/libsigrok/libsigrok.mk b/package/sigrok/libsigrok/libsigrok.mk
new file mode 100644
index 0000000..4a61f6c
--- /dev/null
+++ b/package/sigrok/libsigrok/libsigrok.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libsigrok
+#
+################################################################################
+
+LIBSIGROK_VERSION = HEAD
+LIBSIGROK_SITE = git://sigrok.org/libsigrok
+LIBSIGROK_LICENSE = GPLv3+
+LIBSIGROK_LICENSE = COPYING
+LIBSIGROK_AUTORECONF = YES
+LIBSIGROK_INSTALL_STAGING = YES
+LIBSIGROK_DEPENDENCIES = libglib2 libzip
+LIBSIGROK_PRE_CONFIGURE_HOOKS += SIGROK_ADD_MISSING
+
+$(eval $(autotools-package))
diff --git a/package/sigrok/libsigrokdecode/libsigrokdecode.mk b/package/sigrok/libsigrokdecode/libsigrokdecode.mk
new file mode 100644
index 0000000..696f097
--- /dev/null
+++ b/package/sigrok/libsigrokdecode/libsigrokdecode.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libsigrokdecode
+#
+################################################################################
+
+LIBSIGROKDECODE_VERSION = HEAD
+LIBSIGROKDECODE_SITE = git://sigrok.org/libsigrokdecode
+LIBSIGROKDECODE_LICENSE = GPLv3+
+LIBSIGROKDECODE_LICENSE_FILES = COPYING
+LIBSIGROKDECODE_AUTORECONF = YES
+LIBSIGROKDECODE_INSTALL_STAGING = YES
+LIBSIGROKDECODE_DEPENDENCIES = python3
+LIBSIGROKDECODE_PRE_CONFIGURE_HOOKS += SIGROK_ADD_MISSING
+
+$(eval $(autotools-package))
diff --git a/package/sigrok/sigrok.mk b/package/sigrok/sigrok.mk
new file mode 100644
index 0000000..b287880
--- /dev/null
+++ b/package/sigrok/sigrok.mk
@@ -0,0 +1,10 @@
+define SIGROK_ADD_MISSING
+	cd $(@D); \
+	mkdir -p autostuff; \
+	automake --add-missing; \
+	cd -;
+endef
+
+ifeq ($(BR2_PACKAGE_SIGROK),y)
+include $(sort $(wildcard package/sigrok/*/*.mk))
+endif
diff --git a/package/sigrok/sigrokcli/sigrokcli.mk b/package/sigrok/sigrokcli/sigrokcli.mk
new file mode 100644
index 0000000..3d984ef
--- /dev/null
+++ b/package/sigrok/sigrokcli/sigrokcli.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sigrok-cli
+#
+################################################################################
+
+SIGROKCLI_VERSION = HEAD
+SIGROKCLI_SITE = git://sigrok.org/sigrok-cli
+SIGROKCLI_LICENSE = GPLv3+
+SIGROKCLI_LICENSE_FILES = COPYING
+SIGROKCLI_AUTORECONF = YES
+SIGROKCLI_PRE_CONFIGURE_HOOKS += SIGROK_ADD_MISSING
+
+$(eval $(autotools-package))
-- 
2.1.4
