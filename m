From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Feb 2021 18:25:13 +0100
Subject: [Buildroot] [git commit] package/tpm2-pkcs11: new package
Message-ID: <20210206170620.3BC5F81898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42db2c7236c2249ec02608ed714fa6f95e36161b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A PKCS#11 interface for TPM2 hardware

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
[Peter: add openssl dependency, drop tpm2-tools, unconditionally pass -std=gnu99]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/tpm2-pkcs11/Config.in        | 14 +++++++++++++
 package/tpm2-pkcs11/tpm2-pkcs11.hash |  3 +++
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 40 ++++++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 64d770e9fc..d2d94102b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2725,6 +2725,7 @@ F:	package/fwup/
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
 F:	package/gloox/
+F:	package/tpm2-pkcs11/
 
 N:	Yann CARDAILLAC <ycardaillac@sepro-group.com>
 F:	package/open62541/
diff --git a/package/Config.in b/package/Config.in
index 06dfc32cc6..c3f10122fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1378,6 +1378,7 @@ menu "Crypto"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
+	source "package/tpm2-pkcs11/Config.in"
 	source "package/tpm2-tss/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
new file mode 100644
index 0000000000..46d5cab07e
--- /dev/null
+++ b/package/tpm2-pkcs11/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_TPM2_PKCS11
+	bool "tpm2-pkcs11"
+	depends on !BR2_STATIC_LIBS # tpm2-tss
+	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  A PKCS#11 interface for TPM2 hardware
+
+	  https://github.com/tpm2-software/tpm2-pkcs11
+
+comment "tpm2-pkcs11 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
new file mode 100644
index 0000000000..16dd9166ba
--- /dev/null
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  13425c34358ec798d333743099b9aec5e42f6a4653c4c0e40eb075681f369687  tpm2-pkcs11-1.5.0.tar.gz
+sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
new file mode 100644
index 0000000000..fb3846f056
--- /dev/null
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# tpm2-pkcs11
+#
+################################################################################
+
+TPM2_PKCS11_VERSION = 1.5.0
+TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
+TPM2_PKCS11_LICENSE = BSD-2-Clause
+TPM2_PKCS11_LICENSE_FILES = LICENSE
+TPM2_PKCS11_DEPENDENCIES = host-pkgconf libyaml openssl sqlite tpm2-tss
+
+TPM2_PKCS11_CONF_OPTS += \
+		--disable-hardening
+
+# Fix tpm.c:746:5: error: 'for' loop initial declarations are only allowed in C99 mode
+# Fix implicit declaration of function 'strnlen'
+TPM2_PKCS11_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
+# do not build man pages
+TPM2_PKCS11_CONF_ENV += ac_cv_prog_PANDOC=''
+
+# tpm2-pkcs11 checks for tpm2-tools programs and errors out if not
+# found, even though they are only used by the (unused in Buildroot)
+# python-based tools
+TPM2_PKCS11_CONF_ENV += \
+	ac_cv_prog_tpm2_createprimary=yes \
+	ac_cv_prog_tpm2_create=yes \
+	ac_cv_prog_tpm2_evictcontrol=yes \
+	ac_cv_prog_tpm2_readpublic=yes \
+	ac_cv_prog_tpm2_load=yes \
+	ac_cv_prog_tpm2_loadexternal=yes \
+	ac_cv_prog_tpm2_unseal=yes \
+	ac_cv_prog_tpm2_encryptdecrypt=yes \
+	ac_cv_prog_tpm2_sign=yes \
+	ac_cv_prog_tpm2_getcap=yes \
+	ac_cv_prog_tpm2_import=yes \
+	ac_cv_prog_tpm2_changeauth=yes
+
+$(eval $(autotools-package))
