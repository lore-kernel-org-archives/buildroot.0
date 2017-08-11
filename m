From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Aug 2017 18:00:47 +0200
Subject: [Buildroot] [PATCH 1/3] package/libb64: new package
In-Reply-To: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1502467249-2861-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds libb64, a library of ANSI C routines for fast
encoding/decoding data into and from a base64-encoded format.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in          |  1 +
 package/libb64/Config.in   | 12 ++++++++++++
 package/libb64/libb64.hash |  3 +++
 package/libb64/libb64.mk   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/libb64/Config.in
 create mode 100644 package/libb64/libb64.hash
 create mode 100644 package/libb64/libb64.mk

diff --git a/package/Config.in b/package/Config.in
index b5170b0..02022b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -984,6 +984,7 @@ menu "Crypto"
 	source "package/gcr/Config.in"
 	source "package/gnutls/Config.in"
 	source "package/libassuan/Config.in"
+	source "package/libb64/Config.in"
 	source "package/libgcrypt/Config.in"
 	source "package/libgpg-error/Config.in"
 	source "package/libgpgme/Config.in"
diff --git a/package/libb64/Config.in b/package/libb64/Config.in
new file mode 100644
index 0000000..a994731
--- /dev/null
+++ b/package/libb64/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBB64
+	bool "libb64"
+	help
+	  libb64 is a library of ANSI C routines for fast encoding/decoding
+	  data into and from a base64-encoded format. C++ wrappers are
+	  included, as well as the source code for standalone encoding
+	  and decoding executables.
+	  Base64 uses a subset of displayable ASCII characters, and is
+	  therefore a useful encoding for storing binary data in a text
+	  file, such as XML, or sending binary data over text-only email.
+
+	  http://libb64.sourceforge.net
diff --git a/package/libb64/libb64.hash b/package/libb64/libb64.hash
new file mode 100644
index 0000000..012a7b0
--- /dev/null
+++ b/package/libb64/libb64.hash
@@ -0,0 +1,3 @@
+# sha1 from sourceforge, sha256 locally computed
+sha1  04b3e21b8c951d27f02fe91249ca3474554af0b9  libb64-1.2.1.zip
+sha256  20106f0ba95cfd9c35a13c71206643e3fb3e46512df3e2efb2fdbf87116314b2  libb64-1.2.1.zip
diff --git a/package/libb64/libb64.mk b/package/libb64/libb64.mk
new file mode 100644
index 0000000..8130aef
--- /dev/null
+++ b/package/libb64/libb64.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libb64
+#
+################################################################################
+
+LIBB64_VERSION = 1.2.1
+LIBB64_SOURCE = libb64-$(LIBB64_VERSION).zip
+LIBB64_SITE = https://downloads.sourceforge.net/project/libb64/libb64/libb64
+LIBB64_LICENSE = Public Domain
+LIBB64_LICENSE_FILES = LICENSE
+LIBB64_INSTALL_STAGING = YES
+
+define LIBB64_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(LIBB64_SOURCE) -d $(BUILD_DIR)
+endef
+
+define LIBB64_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS)" -C $(@D) all_src
+endef
+
+define LIBB64_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/b64
+	$(INSTALL) -D -m 0755 $(@D)/include/b64/* $(STAGING_DIR)/usr/include/b64
+	$(INSTALL) -D -m 0755 $(@D)/src/libb64.a $(STAGING_DIR)/usr/lib
+endef
+
+define LIBB64_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/libb64.a $(STAGING_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
