From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 00:02:11 +0100
Subject: [Buildroot] [git commit] tpm2-tools: allow building without stack
 smashing protection (SSP)
Message-ID: <20180322230317.01F9E838A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=428dfe71f337a5de4540d57a244442d64b2d8e75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable SSP if the toolchain does not support it. This must be done
explicitly because configure enables hardening by default but doesn't
contain a link test, so it doesn't detect when libssp is missing.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/tpm2-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 0697900d2d..13fdb163bb 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -10,4 +10,8 @@ TPM2_TOOLS_LICENSE = BSD-2-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
 TPM2_TOOLS_DEPENDENCIES = dbus libcurl libglib2 openssl tpm2-tss host-pkgconf
 
+# configure.ac doesn't contain a link test, so it doesn't detect when
+# libssp is missing.
+TPM2_TOOLS_CONF_OPTS = $(if $(BR2_TOOLCHAIN_HAS_SSP),--enable-hardening,--disable-hardening)
+
 $(eval $(autotools-package))
