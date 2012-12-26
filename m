From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Dec 2012 10:55:47 -0300
Subject: [Buildroot] [PATCH 1/3] libgcrypt: disable tests
Message-ID: <1356530149-12305-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The testsuite uses fork() hence fails on !MMU targets.
We don't use/install these so just get rid of them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgcrypt/libgcrypt.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index a320e48..3aa60c6 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -10,6 +10,7 @@ LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
+LIBGCRYPT_DEPENDENCIES = libgpg-error
 
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
@@ -17,6 +18,12 @@ LIBGCRYPT_CONF_OPT = \
 	--disable-optimization \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
-LIBGCRYPT_DEPENDENCIES = libgpg-error
+# Tests use fork()
+define LIBGCRYPT_DISABLE_TESTS
+	$(SED) 's/ tests//' $(@D)/Makefile.in
+endef
+
+LIBGCRYPT_POST_PATCH_HOOKS += LIBGCRYPT_DISABLE_TESTS
+
 
 $(eval $(autotools-package))
-- 
1.7.8.6
