From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  9 Feb 2017 14:45:56 +0100
Subject: [Buildroot] [PATCH 2/4] cracklib: New package
In-Reply-To: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
References: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
Message-ID: <20170209134558.3723-2-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Config.in              |  1 +
 package/cracklib/Config.in     | 28 ++++++++++++++++++++++++++++
 package/cracklib/cracklib.hash |  3 +++
 package/cracklib/cracklib.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 package/cracklib/Config.in
 create mode 100644 package/cracklib/cracklib.hash
 create mode 100644 package/cracklib/cracklib.mk

diff --git a/package/Config.in b/package/Config.in
index 4a95749..a149936 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1317,6 +1317,7 @@ menu "Other"
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
index 0000000..c8e7fd5
--- /dev/null
+++ b/package/cracklib/cracklib.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# cracklib
+#
+################################################################################
+
+CRACKLIB_VERSION = 2.9.6
+CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/cracklib-$(CRACKLIB_VERSION)
+CRACKLIB_LICENSE = LGPLv2+
+CRACKLIB_LICENSE_FILES = COPYING.LIB README-LICENSE
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
+	cracklib-format $(CRACKLIB_DICT_SOURCE) | cracklib-packer $(TARGET_DIR)/usr/share/cracklib/pw_dict
+	rm $(TARGET_DIR)/usr/share/cracklib/cracklib-small
+endef
+
+CRACKLIB_POST_INSTALL_TARGET_HOOKS += CRACKLIB_BUILD_DICT
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.3
