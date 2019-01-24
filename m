From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 22:54:06 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] tpm2-tss: do not enforce
 -fstack-protector-all
Message-ID: <20190125072924.17B1A8E633@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a42c2f02e53890bcb4e7982237376d691883b7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Stack protection is now controlled buildroot wide with the BR2_SSP_*
options, so disable the explicit -fstack-protector-all so the SSP logic in
the toolchain wrapper is used instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d38bcb9de572ec285bfb67f5a806a55e98a44e13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index dcc1e5d74d..334d5b06af 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,8 +11,9 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser host-pkgconf
 
-# configure.ac doesn't contain a link test, so it doesn't detect when
-# libssp is missing.
-TPM2_TSS_CONF_ENV = ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+# -fstack-protector-all is used by default. Disable that so the
+# BR2_SSP_* options in the toolchain wrapper are used instead
+TPM2_TSS_CONF_ENV = \
+	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no
 
 $(eval $(autotools-package))
