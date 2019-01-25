From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 08:01:42 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] tpm2-abrmd: fix build
 with BR2_FORTIFY_SOURCE_1
Message-ID: <20190125072924.32B758B44E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e04ae696d4f37bf57d09d668fcad0c6b608025cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

The configure script passes -U FORTIFY_SOURCE -D FORTIFY_SOURCE=2 by
default, which conflicts with BR2_FORTIFY_SOURCE_1 as -Werror is used:

<cross>-gcc ..  -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 .. -D_FORTIFY_SOURCE=1
<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]

Disable this so the FORTIFY_SOURCE flags in TARGET_CFLAGS (if any) is used
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8286be28913ef3b93c6edacec15a01d7b23b1566)
[Peter: adjust variable names for abrmd-1.3.0]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index bc5daa054d..f3a6980c23 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -11,10 +11,13 @@ TPM2_ABRMD_LICENSE_FILES = LICENSE
 TPM2_ABRMD_INSTALL_STAGING = YES
 TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
 
-# -fstack-protector-all is used by default. Disable that so the
-# BR2_SSP_* options in the toolchain wrapper are used instead
+# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
+# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
+# in the toolchain wrapper and CFLAGS are used instead
 TPM2_ABRMD_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=no
+	ax_cv_check_ccppflags___U_FORTIFY_SOURCE=no \
+	ax_cv_check_ccppflags___D_FORTIFY_SOURCE_2=no
 
 TPM2_ABRMD_CONF_OPTS += \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
