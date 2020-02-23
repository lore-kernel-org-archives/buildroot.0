From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 09:38:06 +0100
Subject: [Buildroot] [git commit] package/tpm2-tss: bump to version 2.3.3
Message-ID: <20200223082626.ECC3A8E78C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=950e81fd173c67c25399aa1d88112f3c19809edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a number of issues:

- Fixed mixing salted and unsalted sessions in the same ESAPI context
- Removed use of VLAs from TPML marshal code
- Added check for object node before calling compute_session_value function
- Fixed auth calculation in Esys_StartAuthSession called with optional parameters
- Fixed compute_encrypted_salt error handling in Esys_StartAuthSession
- Fixed exported symbols map for libtss2-mu

The 2.3.3 tarball accidently contains a Makefile-fuzz-generated.am with
content from a fuzz testing run (rather than an empty file as in earlier
releases), confusing autoreconf together with our
0001-configure-Only-use-CXX-when-fuzzing.patch.

Work around that by adding a post-patch hook to truncate the file.  The
issue has been reported upstream and the release logic has been changed to
ensure this does not happen again for future releases:

https://github.com/tstruk/tpm2-tss/commit/d163041e3bafa23c0be89c82a99b8501634ebdb4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tpm2-tss/tpm2-tss.hash |  2 +-
 package/tpm2-tss/tpm2-tss.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index 0f78eb36b1..3b778d4f1e 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 82929a0611f39246e09202702a61b54c980ab694626c1f5823520ddf75024fa6  tpm2-tss-2.3.2.tar.gz
+sha256 9d8c8866829e3ff5e1649ecd82498cb1329e0691139458e53b69e6061febe3d3  tpm2-tss-2.3.3.tar.gz
 sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 08090204ff..470020857a 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 2.3.2
+TPM2_TSS_VERSION = 2.3.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
@@ -17,4 +17,13 @@ TPM2_TSS_AUTORECONF = YES
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
+# The 2.3.3 tarball accidently contains a Makefile-fuzz-generated.am
+# with content from a fuzz testing run rather than an empty file,
+# confusing autoreconf with
+# 0001-configure-Only-use-CXX-when-fuzzing.patch
+define TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
+	truncate -s 0 $(@D)/Makefile-fuzz-generated.am
+endef
+TPM2_TSS_POST_PATCH_HOOKS += TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
+
 $(eval $(autotools-package))
