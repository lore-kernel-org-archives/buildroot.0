From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 09:21:45 +0100
Subject: [Buildroot] [git commit] package/tpm2-tss: bump to version 2.3.2
Message-ID: <20191215100004.747238B4F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48dd190c3361d89b7d14fefd103a02c7b6eece23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of license file (SPDX ID has been removed with
  https://github.com/tpm2-software/tpm2-tss/commit/0dbc84ee45d0e4cd7eae528f53968f8877455aab)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: use --disable-defaultflags and explicitly pass -std=c99]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...m2b-types.c-fix-maybe-uninitialized-error.patch | 37 ----------------------
 package/tpm2-tss/tpm2-tss.hash                     |  4 +--
 package/tpm2-tss/tpm2-tss.mk                       | 13 +++-----
 3 files changed, 6 insertions(+), 48 deletions(-)

diff --git a/package/tpm2-tss/0001-tpm2b-types.c-fix-maybe-uninitialized-error.patch b/package/tpm2-tss/0001-tpm2b-types.c-fix-maybe-uninitialized-error.patch
deleted file mode 100644
index 7125835711..0000000000
--- a/package/tpm2-tss/0001-tpm2b-types.c-fix-maybe-uninitialized-error.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 815f2bcbdfe5d9aff2cd3acbbb105daf1f5e9d7f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 7 Feb 2019 09:58:07 +0100
-Subject: [PATCH] tpm2b-types.c: fix maybe-uninitialized error
-
-src/tss2-mu/tpm2b-types.c: In function 'Tss2_MU_TPM2B_ECC_POINT_Marshal':
-src/tss2-mu/tpm2b-types.c:201:24: error: 'ptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-         *(UINT16 *)ptr = HOST_TO_BE_16(buffer + local_offset - ptr - 2); \
-                        ^
-src/tss2-mu/tpm2b-types.c:152:12: note: 'ptr' was declared here
-     UINT8 *ptr; \
-
-Fixes:
- - http://autobuild.buildroot.org/results/8d7b6dad6602fe67338abc696bc4752dda8e9717
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/tpm2-software/tpm2-tss/pull/1265]
----
- src/tss2-mu/tpm2b-types.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tss2-mu/tpm2b-types.c b/src/tss2-mu/tpm2b-types.c
-index 9c1003ab..7632febb 100644
---- a/src/tss2-mu/tpm2b-types.c
-+++ b/src/tss2-mu/tpm2b-types.c
-@@ -150,7 +150,7 @@ TSS2_RC Tss2_MU_##type##_Marshal(type const *src, uint8_t buffer[], \
-                                  size_t buffer_size, size_t *offset) \
- { \
-     size_t local_offset = 0; \
--    UINT8 *ptr; \
-+    UINT8 *ptr = NULL; \
-     TSS2_RC rc; \
- \
-     if (src == NULL) { \
--- 
-2.14.1
-
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index 9368357c77..0f78eb36b1 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 bddfa4ab2ceb6394bcacf7db5d6419cbfabdb22702b6df75c59e60dd5f3fafb5  tpm2-tss-2.1.3.tar.gz
-sha256 f7da3c2da12cec3348bb7ee9e2a9e651a241450b2efb67da29d5a75ef2da058a  LICENSE
+sha256 82929a0611f39246e09202702a61b54c980ab694626c1f5823520ddf75024fa6  tpm2-tss-2.3.2.tar.gz
+sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index e02abb446c..425a6703af 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,20 +4,15 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 2.1.3
+TPM2_TSS_VERSION = 2.3.2
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
-TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc
+TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
 
-# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
-# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
-# in the toolchain wrapper and CFLAGS are used instead
-TPM2_TSS_CONF_ENV = \
-	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no \
-	ax_cv_check_ccppflags___________Wall__Werror_______U_FORTIFY_SOURCE=no \
-	ax_cv_check_ccppflags___________Wall__Werror_______D_FORTIFY_SOURCE_2=no
+# uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
+TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 $(eval $(autotools-package))
