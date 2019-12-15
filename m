From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 11:02:33 +0100
Subject: [Buildroot] [git commit] package/tpm2-totp: explicitly disable
 optional configure flags
Message-ID: <20191215100004.883F38B4F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a22e0ef521a5eb6219608a86559c1e935031959
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly disable doxygen, plymouth, initramfstools and mkinitcpio support
as it is not needed / available in Buildroot.

Also use the new --disable-defaultflags option to ensure our compiler flags
are used rather than trying to disable -fstackprotector-all, similar to how
it is done in tpm2-tss.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-totp/tpm2-totp.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index bf298071e1..a41f899a71 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -9,11 +9,15 @@ TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
 TPM2_TOTP_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
+TPM2_TOTP_CONF_OPTS = \
+	--disable-defaultflags \
+	--disable-doxygen-doc \
+	--disable-plymouth \
+	--without-initramfstoolsdir \
+	--without-mkinitcpiodir
 
-# -fstack-protector-all is used by default. Disable that so the BR2_SSP_* options
-# in the toolchain wrapper and CFLAGS are used instead
-TPM2_TOTP_CONF_ENV += \
-	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no
+# uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
+TPM2_TOTP_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 # do not build man pages
 TPM2_TOTP_CONF_ENV += ac_cv_path_PANDOC=''
