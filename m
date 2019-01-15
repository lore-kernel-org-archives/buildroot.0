From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 11:15:19 +0100
Subject: [Buildroot] [PATCH v2 4/7] tpm2-abrmd: do not enforce
 -fstack-protector-all
In-Reply-To: <20190115101522.21042-1-peter@korsgaard.com>
References: <20190115101522.21042-1-peter@korsgaard.com>
Message-ID: <20190115101522.21042-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stack protection is now controlled Buildroot wide with the BR2_SSP_*
options, so disable the explicit -fstack-protector-all so the SSP logic in
the toolchain wrapper is used instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 74cc66ba20..2834615ac3 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -11,9 +11,10 @@ TPM2_ABRMD_LICENSE_FILES = LICENSE
 TPM2_ABRMD_INSTALL_STAGING = YES
 TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
 
-# configure.ac doesn't contain a link test, so it doesn't detect when
-# libssp is missing.
-TPM2_ABRMD_CONF_ENV = ax_cv_check_cflags___________Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+# -fstack-protector-all is used by default. Disable that so the
+# BR2_SSP_* options in the toolchain wrapper are used instead
+TPM2_ABRMD_CONF_ENV = \
+	ax_cv_check_cflags___________Werror_______fstack_protector_all=no
 
 TPM2_ABRMD_CONF_OPTS += \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
-- 
2.11.0
