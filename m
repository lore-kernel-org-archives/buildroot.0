From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 14:16:29 +0100
Subject: [Buildroot] [git commit] package/libpam-nfc: new package
Message-ID: <20191222130754.07410804F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3077766252e0f54ae63fef3b22a57588e6053cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libpam-nfc/Config.in       |  7 +++++++
 package/libpam-nfc/libpam-nfc.hash |  3 +++
 package/libpam-nfc/libpam-nfc.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d2089e2672..a67dca3e6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1429,6 +1429,7 @@ N:	Louis Aussedat <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
 F:	package/mfoc
+F:	package/libpam-nfc
 F:	package/python-dnspython/
 F:	package/python-future/
 F:	package/python-huepy/
diff --git a/package/Config.in b/package/Config.in
index 2bfec09702..9f12470b22 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1805,6 +1805,7 @@ menu "Other"
 	source "package/linux-pam/Config.in"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
+	source "package/libpam-nfc/Config.in"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
diff --git a/package/libpam-nfc/Config.in b/package/libpam-nfc/Config.in
new file mode 100644
index 0000000000..ce3a3eeb19
--- /dev/null
+++ b/package/libpam-nfc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBPAM_NFC
+	bool "libpam-nfc"
+	select BR2_PACKAGE_LIBNFC
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
index 0000000000..fc283c8777
--- /dev/null
+++ b/package/libpam-nfc/libpam-nfc.mk
@@ -0,0 +1,28 @@
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
+LIBPAM_NFC_MAKE = $(MAKE1)
+
+# Autoreconf requires an existing m4 directory
+define LIBPAM_NFC_MKDIR_M4
+	mkdir -p $(@D)/m4
+endef
+LIBPAM_NFC_PRE_CONFIGURE_HOOKS += LIBPAM_NFC_MKDIR_M4
+
+$(eval $(autotools-package))
