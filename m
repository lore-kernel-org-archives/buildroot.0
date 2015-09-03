From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  3 Sep 2015 11:23:50 -0400
Subject: [Buildroot] [PATCH v3 3/4] package/beecrypt: add host variant
In-Reply-To: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1441293831-3524-3-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by an upcoming host variant of the `rpm` package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v2 -> v3:
  - None.

Changes v1 -> v2:
  - Do not configured host variant based off of target variant
     configuration (based off comments from Thomas Petazzoni).
---
 package/beecrypt/beecrypt.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index e66cec1..e3749d5 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -11,11 +11,18 @@ BEECRYPT_INSTALL_STAGING = YES
 BEECRYPT_LICENSE = LGPLv2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
 
-BEECRYPT_CONF_OPTS = \
+BEECRYPT_CONFIGURE_ARGS = \
 	--disable-expert-mode \
+	--disable-openmp \
 	--without-java \
-	--without-python \
-	--disable-openmp
+	--without-python
+
+BEECRYPT_CONF_OPTS += \
+	$(BEECRYPT_CONFIGURE_ARGS)
+
+HOST_BEECRYPT_CONF_OPTS += \
+	$(BEECRYPT_CONFIGURE_ARGS) \
+	--without-cplusplus
 
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
@@ -33,3 +40,4 @@ BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
