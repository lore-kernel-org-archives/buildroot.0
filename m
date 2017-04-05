From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed,  5 Apr 2017 14:42:33 +0200
Subject: [Buildroot] [PATCH v2 1/2] cracklib: New package
Message-ID: <20170405124234.7035-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---

Changes since v1:

 * Update DEVELOPERS file
 * Use SPDX license codes
 * Use the tools from host-cracklib for generating dictionary files

 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/cracklib/Config.in     | 28 ++++++++++++++++++++++++++++
 package/cracklib/cracklib.hash |  3 +++
 package/cracklib/cracklib.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/cracklib/Config.in
 create mode 100644 package/cracklib/cracklib.hash
 create mode 100644 package/cracklib/cracklib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c610e..c31b410 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1467,6 +1467,7 @@ F:	package/proxychains-ng/
 F:	package/yasm/
 
 N:	Stefan S?rensen <stefan.sorensen@spectralink.com>
+F:	package/cracklib/
 F:	package/libscrypt/
 
 N:	Stephan Hoffmann <sho@relinux.de>
diff --git a/package/Config.in b/package/Config.in
index 71bd44a..66e9201 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
diff --git a/package/cracklib/Config.in b/package/cracklib/Config.in
new file mode 100644
index 0000000..cf428fd
--- /dev/null
+++ b/package/cracklib/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_CRACKLIB
+	bool "cracklib"
+	help
+	  CrackLib tests passwords to determine whether they match
+	  certain security-oriented characteristics, with the purpose
+	  of stopping users from choosing passwords that are easy to
+	  guess. CrackLib performs several tests on passwords: it
+	  tries to generate words from a username and gecos entry and
+	  checks those words against the password; it checks for
+	  simplistic patterns in passwords; and it checks for the
+	  password in a dictionary.
+
+	  https://github.com/cracklib/cracklib
+
+if BR2_PACKAGE_CRACKLIB
+
+config BR2_PACKAGE_CRACKLIB_TOOLS
+	bool "install tools"
+	help
+	  Install cracklib command line tools for creating dicts.
+
+config BR2_PACKAGE_CRACKLIB_FULL_DICT
+	bool "full dict"
+	help
+	  Install the full cracklib dict (requires about 8Mb extra target
+	  space).
+
+endif
diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
new file mode 100644
index 0000000..3038a47
--- /dev/null
+++ b/package/cracklib/cracklib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	17cf76943de272fd579ed831a1fd85339b393f8d00bf9e0d17c91e972f583343	cracklib-2.9.6.tar.gz
+sha256	27973245225eeb9d0090e97f3dea4197dec99b64d9d3a791a60298f3b021824c	cracklib-words-2.9.6.gz
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
new file mode 100644
index 0000000..4e816a8
--- /dev/null
+++ b/package/cracklib/cracklib.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# cracklib
+#
+################################################################################
+
+CRACKLIB_VERSION = 2.9.6
+CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/cracklib-$(CRACKLIB_VERSION)
+CRACKLIB_LICENSE = LGPL-2.1
+CRACKLIB_LICENSE_FILES = COPYING.LIB
+CRACKLIB_INSTALL_STAGING = YES
+CRACKLIB_DEPENDENCIES = host-cracklib
+ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
+CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).gz
+endif
+
+ifeq ($(BR2_PACKAGE_CRACKLIB_TOOLS),)
+define CRACKLIB_REMOVE_TOOLS
+	rm -f $(TARGET_DIR)/usr/sbin/*cracklib*
+endef
+
+CRACKLIB_POST_INSTALL_TARGET_HOOKS += CRACKLIB_REMOVE_TOOLS
+endif
+
+ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
+CRACKLIB_DICT_SOURCE = $(DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).gz
+else
+CRACKLIB_DICT_SOURCE = $(@D)/dicts/cracklib-small
+endif
+
+define CRACKLIB_BUILD_DICT
+	$(HOST_DIR)/usr/sbin/cracklib-format $(CRACKLIB_DICT_SOURCE) | \
+		$(HOST_DIR)/usr/sbin/cracklib-packer \
+		$(TARGET_DIR)/usr/share/cracklib/pw_dict
+	rm $(TARGET_DIR)/usr/share/cracklib/cracklib-small
+endef
+
+CRACKLIB_POST_INSTALL_TARGET_HOOKS += CRACKLIB_BUILD_DICT
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.3
