From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  9 Aug 2019 00:02:11 -0300
Subject: [Buildroot] [PATCH] package/package/tpm2-totp: bump to version 0.1.2
Message-ID: <20190809030211.5319-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Drop patches; issues fixed upstream.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...tring-warnings-when-building-for-32b.patch | 60 -------------------
 ...ion-failure-due-to-variable-may-be-u.patch | 42 -------------
 package/tpm2-totp/tpm2-totp.hash              |  2 +-
 package/tpm2-totp/tpm2-totp.mk                |  2 +-
 4 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch
 delete mode 100644 package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch

diff --git a/package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch b/package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch
deleted file mode 100644
index 5dce95cc14..0000000000
--- a/package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 1d39994398a886584c5fb14b3a646c4ae6b0d35c Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 8 Apr 2019 11:03:09 +0200
-Subject: [PATCH] src: fix format string warnings when building for 32bit
- architectures
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Building currently gives the following warnings (which fails the build
-because of Werror) about format string mismatches:
-
-src/tpm2-totp.c:343:23: error: format ?%ld? expects argument of type ?long int?, but argument 3 has type ?uint64_t? {aka ?long long unsigned int?} [-Werror=format=]
-         printf("%s%06ld", timestr, totp);
-                   ~~~~^            ~~~~
-                   %06lld
-
-src/libtpm2-totp.c: In function ?tpm2totp_generateKey?:
-src/libtpm2-totp.c:172:13: error: format ?%li? expects argument of type ?long int?, but argument 3 has type ?size_t? {aka ?unsigned int?} [-Werror=format=]
-         dbg("Calling Esys_GetRandom for %li bytes", SECRETLEN - *secret_size);
-                                         ~~^
-                                         %i
-
-Fix it by using PRIu64 from inttypes.h for uint64_t and %zu for size_t.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/libtpm2-totp.c | 2 +-
- src/tpm2-totp.c    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libtpm2-totp.c b/src/libtpm2-totp.c
-index e740ab1..6942771 100644
---- a/src/libtpm2-totp.c
-+++ b/src/libtpm2-totp.c
-@@ -169,7 +169,7 @@ tpm2totp_generateKey(uint32_t pcrs, uint32_t banks, const char *password,
-     if (rc != TPM2_RC_INITIALIZE) chkrc(rc, goto error);
- 
-     while (*secret_size < SECRETLEN) {
--        dbg("Calling Esys_GetRandom for %li bytes", SECRETLEN - *secret_size);
-+        dbg("Calling Esys_GetRandom for %zu bytes", SECRETLEN - *secret_size);
-         rc = Esys_GetRandom(ctx,
-                             ESYS_TR_NONE, ESYS_TR_NONE, ESYS_TR_NONE,
-                             SECRETLEN - *secret_size, &t);
-diff --git a/src/tpm2-totp.c b/src/tpm2-totp.c
-index 47b661a..d5dcdce 100644
---- a/src/tpm2-totp.c
-+++ b/src/tpm2-totp.c
-@@ -340,7 +340,7 @@ main(int argc, char **argv)
-                             localtime (&now));
-             chkrc(rc, exit(1));
-         }
--        printf("%s%06ld", timestr, totp);
-+        printf("%s%06" PRIu64, timestr, totp);
-         break;
-     case CMD_RESEAL:
-         rc = tpm2totp_loadKey_nv(opt.nvindex, &keyBlob, &keyBlob_size);
--- 
-2.11.0
-
diff --git a/package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch b/package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch
deleted file mode 100644
index a650ab49f4..0000000000
--- a/package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 194f41635367452a7a3c9a75ebbada531bf4c58d Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Sun, 26 May 2019 13:39:44 -0300
-Subject: [PATCH] src: fix compilation failure due to "variable may be used
- uninitialized"
-
-Some inline declarations of strtok_r (specifically in Sourcery CodeBench
-Lite 2016.11-19) contain code where an '__s' local variable can be used
-uninitialized.
-
-When GCC expands that declaration in 'parse_pcrs', __s becomes an alias
-to the local variable 'saveptr', which in fact is not initialized, but
-this is not relevant, since the 'str' argument is knowingly not NULL
-when passed to strtok_r because it comes from 'optarg' in parse_opts.
-
-Anyway, initialize saveptr to NULL to prevent the compilation error.
-
-Fixes:
-  http://autobuild.buildroot.net/results/5693a35e4d6bc76a1f46fe0e217abc49f7188aad/
-
-Change-Id: I03ad3731774c56744f18154ec161c92ba002903d
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- src/tpm2-totp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tpm2-totp.c b/src/tpm2-totp.c
-index 3f60b4a..f28a4d6 100644
---- a/src/tpm2-totp.c
-+++ b/src/tpm2-totp.c
-@@ -93,7 +93,7 @@ int
- parse_pcrs(char *str, int *pcrs)
- {
-     char *token;
--    char *saveptr;
-+    char *saveptr = NULL;
-     char *endptr;
-     long pcr;
- 
--- 
-2.20.1
-
diff --git a/package/tpm2-totp/tpm2-totp.hash b/package/tpm2-totp/tpm2-totp.hash
index c8bc28ea6c..0449f9513a 100644
--- a/package/tpm2-totp/tpm2-totp.hash
+++ b/package/tpm2-totp/tpm2-totp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 a6aa41df2d0773e67f5cf853621d46b89ae2181bc3ef5ff91ad597992259c192  tpm2-totp-0.1.1.tar.gz
+sha256 2ce2a518c96540942b0e78bc73efaefb76a2784b7e2dd1b3f14e7d31d97b33b7  tpm2-totp-0.1.2.tar.gz
 sha256 67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index 1ce40e20d5..ca557388e6 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOTP_VERSION = 0.1.1
+TPM2_TOTP_VERSION = 0.1.2
 TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
-- 
2.18.1
