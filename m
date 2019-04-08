From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:45:34 +0200
Subject: [Buildroot] [git commit] package/tpm2-totp: new package
Message-ID: <20190408204813.DA4008D334@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec2b5236c56bcb6b5519e0c8f8b8e69680cca316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Library and utility for TOTP based attestation using the tpm2-tss software
stack.

Add an upstream patch to fix format string mismatch errors when building for
32bit architectures.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...mat-string-warnings-when-building-for-32b.patch | 60 ++++++++++++++++++++++
 package/tpm2-totp/Config.in                        | 21 ++++++++
 package/tpm2-totp/tpm2-totp.hash                   |  3 ++
 package/tpm2-totp/tpm2-totp.mk                     | 21 ++++++++
 6 files changed, 107 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65ce802df8..98d3a1db94 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1751,6 +1751,7 @@ F:	package/python-validators/
 F:	package/python-webob/
 F:	package/python-websocket-client/
 F:	package/sedutil/
+F:	package/tpm2-totp/
 F:	package/triggerhappy/
 
 N:	Peter Seiderer <ps.report@gmx.net>
diff --git a/package/Config.in b/package/Config.in
index 32f80cb2d0..5f14a66b3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2217,6 +2217,7 @@ menu "System tools"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
+	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/xen/Config.in"
diff --git a/package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch b/package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch
new file mode 100644
index 0000000000..5dce95cc14
--- /dev/null
+++ b/package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch
@@ -0,0 +1,60 @@
+From 1d39994398a886584c5fb14b3a646c4ae6b0d35c Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 8 Apr 2019 11:03:09 +0200
+Subject: [PATCH] src: fix format string warnings when building for 32bit
+ architectures
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building currently gives the following warnings (which fails the build
+because of Werror) about format string mismatches:
+
+src/tpm2-totp.c:343:23: error: format ???%ld??? expects argument of type ???long int???, but argument 3 has type ???uint64_t??? {aka ???long long unsigned int???} [-Werror=format=]
+         printf("%s%06ld", timestr, totp);
+                   ~~~~^            ~~~~
+                   %06lld
+
+src/libtpm2-totp.c: In function ???tpm2totp_generateKey???:
+src/libtpm2-totp.c:172:13: error: format ???%li??? expects argument of type ???long int???, but argument 3 has type ???size_t??? {aka ???unsigned int???} [-Werror=format=]
+         dbg("Calling Esys_GetRandom for %li bytes", SECRETLEN - *secret_size);
+                                         ~~^
+                                         %i
+
+Fix it by using PRIu64 from inttypes.h for uint64_t and %zu for size_t.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/libtpm2-totp.c | 2 +-
+ src/tpm2-totp.c    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libtpm2-totp.c b/src/libtpm2-totp.c
+index e740ab1..6942771 100644
+--- a/src/libtpm2-totp.c
++++ b/src/libtpm2-totp.c
+@@ -169,7 +169,7 @@ tpm2totp_generateKey(uint32_t pcrs, uint32_t banks, const char *password,
+     if (rc != TPM2_RC_INITIALIZE) chkrc(rc, goto error);
+ 
+     while (*secret_size < SECRETLEN) {
+-        dbg("Calling Esys_GetRandom for %li bytes", SECRETLEN - *secret_size);
++        dbg("Calling Esys_GetRandom for %zu bytes", SECRETLEN - *secret_size);
+         rc = Esys_GetRandom(ctx,
+                             ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
+                             SECRETLEN - *secret_size, &t);
+diff --git a/src/tpm2-totp.c b/src/tpm2-totp.c
+index 47b661a..d5dcdce 100644
+--- a/src/tpm2-totp.c
++++ b/src/tpm2-totp.c
+@@ -340,7 +340,7 @@ main(int argc, char **argv)
+                             localtime (&now));
+             chkrc(rc, exit(1));
+         }
+-        printf("%s%06ld", timestr, totp);
++        printf("%s%06" PRIu64, timestr, totp);
+         break;
+     case CMD_RESEAL:
+         rc = tpm2totp_loadKey_nv(opt.nvindex, &keyBlob, &keyBlob_size);
+-- 
+2.11.0
+
diff --git a/package/tpm2-totp/Config.in b/package/tpm2-totp/Config.in
new file mode 100644
index 0000000000..ca630e4584
--- /dev/null
+++ b/package/tpm2-totp/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_TPM2_TOTP
+	bool "tpm2-tools"
+	depends on !BR2_STATIC_LIBS # tpm2-tss
+	select BR2_PACKAGE_LIBQRENCODE
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  This is a reimplementation of Matthew Garrett's tpmtotp
+	  software for TPM 2.0 using the tpm2-tss software stack. Its
+	  purpose is to attest the trustworthiness of a device against
+	  a human using time-based one-time passwords (TOTP),
+	  facilitating the Trusted Platform Module (TPM) to bind the
+	  TOTP secret to the known trustworthy system state. In
+	  addition to the original tpmtotp, given the new capabilities
+	  of in-TPM hmac calculation, the tpm2-totp's secret HMAC keys
+	  do not have to be exported from the TPM to the CPU's RAM on
+	  boot anymore.
+
+	  https://github.com/tpm2-software/tpm2-totp
+
+comment "tpm2-totp needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/tpm2-totp/tpm2-totp.hash b/package/tpm2-totp/tpm2-totp.hash
new file mode 100644
index 0000000000..c8bc28ea6c
--- /dev/null
+++ b/package/tpm2-totp/tpm2-totp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 a6aa41df2d0773e67f5cf853621d46b89ae2181bc3ef5ff91ad597992259c192  tpm2-totp-0.1.1.tar.gz
+sha256 67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
new file mode 100644
index 0000000000..1ce40e20d5
--- /dev/null
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tpm2-totp
+#
+################################################################################
+
+TPM2_TOTP_VERSION = 0.1.1
+TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
+TPM2_TOTP_LICENSE = BSD-3-Clause
+TPM2_TOTP_LICENSE_FILES = LICENSE
+TPM2_TOTP_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
+
+# -fstack-protector-all is used by default. Disable that so the BR2_SSP_* options
+# in the toolchain wrapper and CFLAGS are used instead
+TPM2_TOTP_CONF_ENV += \
+	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no
+
+# do not build man pages
+TPM2_TOTP_CONF_ENV += ac_cv_path_PANDOC=''
+
+$(eval $(autotools-package))
