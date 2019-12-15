From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 17:40:42 +0100
Subject: [Buildroot] [git commit] package/tpm2-abrmd: bump to version 2.3.0
Message-ID: <20191215163249.79B358B536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57d3eca52b1fc63e9c247496754f1d19311880f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop dbus dependency as it is not needed since version 2.2.0 and
https://github.com/tpm2-software/tpm2-abrmd/commit/c1d42c9ebefbfe36255603aca065944836c14610

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: use --disable-defaultflags and explicitly pass -std=c99]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/Config.in       |  5 ++---
 package/tpm2-abrmd/tpm2-abrmd.hash |  2 +-
 package/tpm2-abrmd/tpm2-abrmd.mk   | 19 +++++++------------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index db0ea66112..4931641af4 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_TPM2_ABRMD
 	bool "tpm2-abrmd"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	depends on !BR2_STATIC_LIBS # tpm2-tss
-	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_TPM2_TSS
 	help
diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
index 61a75c0d1b..cff3266bc8 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.hash
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ff0ed283b0300cd784d6bf2b042e167020f8443602974e53b924e9fd98a4b515  tpm2-abrmd-2.0.3.tar.gz
+sha256 63cb59be1fd21e6ae233c37a0aa4a59883a4885a7bfd2c7e69979c5048518d50  tpm2-abrmd-2.3.0.tar.gz
 sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 31f19f5d01..e92fda252a 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -4,25 +4,20 @@
 #
 ################################################################################
 
-TPM2_ABRMD_VERSION = 2.0.3
+TPM2_ABRMD_VERSION = 2.3.0
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
 TPM2_ABRMD_INSTALL_STAGING = YES
-TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
-
-# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
-# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
-# in the toolchain wrapper and CFLAGS are used instead
-TPM2_ABRMD_CONF_ENV = \
-	ax_cv_check_cflags___________Werror_______fstack_protector_all=no \
-	ax_cv_check_ccppflags___________Werror_______U_FORTIFY_SOURCE=no \
-	ax_cv_check_ccppflags___________Werror_______D_FORTIFY_SOURCE_2=no
-
-TPM2_ABRMD_CONF_OPTS += \
+TPM2_ABRMD_DEPENDENCIES = libglib2 tpm2-tss host-pkgconf
+TPM2_ABRMD_CONF_OPTS = \
+	--disable-defaultflags \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
 	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no)
 
+# uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
+TPM2_ABRMD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
+
 define TPM2_ABRMD_INSTALL_INIT_SYSTEMD
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) \
 		install-systemdpresetDATA install-systemdsystemunitDATA
