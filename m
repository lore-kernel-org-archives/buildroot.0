From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Sat, 21 Dec 2019 10:58:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-nfc: new package
Message-ID: <20191221095858.8680-1-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libpam-nfc/Config.in       |  7 +++++++
 package/libpam-nfc/libpam-nfc.hash |  3 +++
 package/libpam-nfc/libpam-nfc.mk   | 31 ++++++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/libpam-nfc/Config.in
 create mode 100644 package/libpam-nfc/libpam-nfc.hash
 create mode 100644 package/libpam-nfc/libpam-nfc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 770888fb23..b367114e1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1428,6 +1428,7 @@ F:	package/ti-sgx-um/
 N:	Louis Aussedat <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
+F:	package/libpam-nfc
 F:	package/python-dnspython/
 F:	package/python-future/
 F:	package/python-huepy/
diff --git a/package/Config.in b/package/Config.in
index 4480259af5..b1bbb240e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1801,6 +1801,7 @@ menu "Other"
 	source "package/linux-pam/Config.in"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
+	source "package/libpam-nfc/Config.in"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
diff --git a/package/libpam-nfc/Config.in b/package/libpam-nfc/Config.in
new file mode 100644
index 0000000000..5baa5d76f5
--- /dev/null
+++ b/package/libpam-nfc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBPAM_NFC
+	bool "libpam-nfc"
+    select BR2_PACKAGE_LIBNFC
+	help
+	  NFC-based PAM authentification module.
+
+	  https://github.com/nfc-tools/pam_nfc
diff --git a/package/libpam-nfc/libpam-nfc.hash b/package/libpam-nfc/libpam-nfc.hash
new file mode 100644
index 0000000000..27896ef4b1
--- /dev/null
+++ b/package/libpam-nfc/libpam-nfc.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  f44273944f1ecc78b10b65147328860836b60fe4bb8c39819e32199f2870d48b  libpam-nfc-bb762e0e649195110e015ffb605c4375e927c437.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libpam-nfc/libpam-nfc.mk b/package/libpam-nfc/libpam-nfc.mk
new file mode 100644
index 0000000000..fc1eb72b47
--- /dev/null
+++ b/package/libpam-nfc/libpam-nfc.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libpam-nfc
+#
+################################################################################
+
+LIBPAM_NFC_VERSION = bb762e0e649195110e015ffb605c4375e927c437
+LIBPAM_NFC_SITE = $(call github,nfc-tools,pam_nfc,$(LIBPAM_NFC_VERSION))
+LIBPAM_NFC_LICENSE = GPL-2.0
+LIBPAM_NFC_LICENSE_FILES = COPYING
+LIBPAM_NFC_DEPENDENCIES = linux-pam libnfc
+# Fetching from github, we need to generate the configure script
+LIBPAM_NFC_AUTORECONF = YES
+LIBPAM_NFC_INSTALL_STAGING = YES
+
+LIBPAM_NFC_CONF_OPTS = \
+	--with-pam-dir=/lib/security
+
+# libpam breaks with parallel build, but is very fast to build.
+# build single threaded.
+define LIBPAM_NFC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+# Autoreconf requires an existing m4 directory
+define LIBPAM_NFC_MKDIR_M4
+	mkdir -p $(@D)/m4
+endef
+LIBPAM_NFC_PRE_CONFIGURE_HOOKS += LIBPAM_NFC_MKDIR_M4
+
+$(eval $(autotools-package))
-- 
2.24.0
