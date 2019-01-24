From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 22:54:37 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] tpm2-tools: always
 disable hardening options
Message-ID: <20190125072924.250858B44E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d6bb84aa5334227f94b891fb5f973dcf73a6a76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Building with --enable-hardening (the default), forces -fstack-protector-all
/ FORTIFY_SOURCE=2.  These options are now controlled Buildroot wide with
the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options.  Disable hardening so the
ssp/fortify settings in the toolchain wrapper / CFLAGS is used instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2bf187c2b135ff9af748257c591b3f9851f4c9cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/tpm2-tools.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 13fdb163bb..c6d5804889 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -10,8 +10,9 @@ TPM2_TOOLS_LICENSE = BSD-2-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
 TPM2_TOOLS_DEPENDENCIES = dbus libcurl libglib2 openssl tpm2-tss host-pkgconf
 
-# configure.ac doesn't contain a link test, so it doesn't detect when
-# libssp is missing.
-TPM2_TOOLS_CONF_OPTS = $(if $(BR2_TOOLCHAIN_HAS_SSP),--enable-hardening,--disable-hardening)
+# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
+# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
+# in the toolchain wrapper and CFLAGS are used instead
+TPM2_TOOLS_CONF_OPTS = --disable-hardening
 
 $(eval $(autotools-package))
