From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 13 Aug 2015 13:14:49 -0400
Subject: [Buildroot] [PATCH 1/3] package/beecrypt: add host variant
Message-ID: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by an upcoming host variant of the `rpm` package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/beecrypt/beecrypt.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index cd0b4ac..0d7b360 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -11,16 +11,21 @@ BEECRYPT_INSTALL_STAGING = YES
 BEECRYPT_LICENSE = LGPLv2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
 
-BEECRYPT_CONF_OPTS = \
+BEECRYPT_CONFIGURE_ARGS = \
 	--disable-expert-mode \
 	--without-java \
 	--without-python \
 	--disable-openmp
 
+BEECRYPT_CONF_OPTS = $(BEECRYPT_CONFIGURE_ARGS)
+HOST_BEECRYPT_CONF_OPTS = $(BEECRYPT_CONFIGURE_ARGS)
+
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
+HOST_BEECRYPT_DEPENDENCIES += host-icu
 else
 BEECRYPT_CONF_OPTS += --without-cplusplus
+HOST_BEECRYPT_CONF_OPTS += --without-cplusplus
 
 # automake/libtool uses the C++ compiler to link libbeecrypt because of
 # (the optional) cppglue.cxx. Force it to use the C compiler instead.
@@ -29,6 +34,8 @@ define BEECRYPT_LINK_WITH_CC
 endef
 
 BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
+HOST_BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
