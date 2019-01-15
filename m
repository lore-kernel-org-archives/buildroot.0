From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 11:15:16 +0100
Subject: [Buildroot] [PATCH v2 1/7] tpm2-tss: do not enforce
 -fstack-protector-all
Message-ID: <20190115101522.21042-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stack protection is now controlled buildroot wide with the BR2_SSP_*
options, so disable the explicit -fstack-protector-all so the SSP logic in
the toolchain wrapper is used instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index f005e5d6b8..e2e58a092d 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -12,8 +12,9 @@ TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc
 
-# configure.ac doesn't contain a link test, so it doesn't detect when
-# libssp is missing.
-TPM2_TSS_CONF_ENV = ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+# -fstack-protector-all is used by default. Disable that so the
+# BR2_SSP_* options in the toolchain wrapper are used instead
+TPM2_TSS_CONF_ENV = \
+	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no
 
 $(eval $(autotools-package))
-- 
2.11.0
