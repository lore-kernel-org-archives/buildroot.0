From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 11:15:18 +0100
Subject: [Buildroot] [PATCH v2 3/7] tpm2-tools: always disable hardening
 options
In-Reply-To: <20190115101522.21042-1-peter@korsgaard.com>
References: <20190115101522.21042-1-peter@korsgaard.com>
Message-ID: <20190115101522.21042-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building with --enable-hardening (the default), forces -fstack-protector-all
/ FORTIFY_SOURCE=2.  These options are now controlled Buildroot wide with
the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options.  Disable hardening so the
ssp/fortify settings in the toolchain wrapper / CFLAGS is used instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/tpm2-tools.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 9c224018ce..f7e2f85228 100644
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
-- 
2.11.0
