From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Fri, 19 Jun 2015 12:54:34 +0200
Subject: [Buildroot] [PATCH 2/2] openssl: always build apps
In-Reply-To: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
Message-ID: <1434711274-49716-2-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that building the openssl binary without MMU is supported, the only
reason left for not building apps if the openssl binary is disabled is
to save build time. Moreover, the commit
720893b62510438237b9923d744dd079ddb4f67d "openssl: disable apps for
NOMMU", which added this behavior, had a side effect: the scripts from
apps (CA.pl, CA.sh and tsget) and the default configuration file
(openssl.cnf) were no longer installed, which is not advertized by the
BR2_PACKAGE_OPENSSL_BIN option. CA.pl and CA.sh use the openssl binary,
so not installing them without the latter would make sense. But tsget
does not use the openssl binary, and openssl.cnf can be used by
libcrypto, so it is preferable to handle BR2_PACKAGE_OPENSSL_BIN like
before the commit mentioned above, i.e. to always build and install apps
and to just remove the openssl binary afterwards if needed, which the
current commit does.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/openssl/openssl.mk | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 34a9830..d450f1e 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -14,14 +14,6 @@ HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
-define OPENSSL_DISABLE_APPS
-	$(SED) '/^build_apps/! s/build_apps//' $(@D)/Makefile.org
-	$(SED) '/^DIRS=/ s/apps//' $(@D)/Makefile.org
-endef
-OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
-endif
-
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
 endif
@@ -140,6 +132,13 @@ endef
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS_SHARED
 endif
 
+ifneq ($(BR2_PACKAGE_OPENSSL_BIN),y)
+define OPENSSL_REMOVE_OPENSSL_BIN
+	rm -f $(TARGET_DIR)/usr/bin/openssl
+endef
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_BIN
+endif
+
 ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 define OPENSSL_REMOVE_OPENSSL_ENGINES
 	rm -rf $(TARGET_DIR)/usr/lib/engines
-- 
2.1.4
