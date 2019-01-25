From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 08:00:32 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] tpm2-abrmd: do not
 enforce -fstack-protector-all
Message-ID: <20190125072924.2C2678B44E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91addc74701b86f562c720ce9d9df84ed763c1a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Stack protection is now controlled Buildroot wide with the BR2_SSP_*
options, so disable the explicit -fstack-protector-all so the SSP logic in
the toolchain wrapper is used instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit db828b919214db5cc2cbce644a75db3e3d4f74d6)
[Peter: adjust variable names for abrmd-1.3.0]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index b918ceaa4b..bc5daa054d 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -11,9 +11,10 @@ TPM2_ABRMD_LICENSE_FILES = LICENSE
 TPM2_ABRMD_INSTALL_STAGING = YES
 TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
 
-# configure.ac doesn't contain a link test, so it doesn't detect when
-# libssp is missing.
-TPM2_ABRMD_CONF_ENV = ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+# -fstack-protector-all is used by default. Disable that so the
+# BR2_SSP_* options in the toolchain wrapper are used instead
+TPM2_ABRMD_CONF_ENV = \
+	ax_cv_check_cflags___fstack_protector_all=no
 
 TPM2_ABRMD_CONF_OPTS += \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
