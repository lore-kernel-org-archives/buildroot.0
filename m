From: James Knight <james.knight@rockwellcollins.com>
Date: Mon,  5 Oct 2015 16:26:58 -0400
Subject: [Buildroot] [PATCH v4 3/4] package/beecrypt: add host variant
In-Reply-To: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
References: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1444076819-10228-3-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by an upcoming host variant of the `rpm` package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v3 -> v4:
  - Restore order to common configuration options to reduce noise
     (suggested by Yann E. MORIN).
  - Altered name of common configuration variable from
     BEECRYPT_CONF_OPTS to BEECRYPT_COMMON_CONF_OPTS for clarity 
     (suggested by Yann E. MORIN).

Changes v2 -> v3:
  - None.

Changes v1 -> v2:
  - Do not configured host variant based off of target variant
     configuration (based off comments from Thomas Petazzoni).
---
 package/beecrypt/beecrypt.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index e66cec1..3b985ad 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -11,12 +11,19 @@ BEECRYPT_INSTALL_STAGING = YES
 BEECRYPT_LICENSE = LGPLv2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
 
-BEECRYPT_CONF_OPTS = \
+BEECRYPT_COMMON_CONF_OPTS = \
 	--disable-expert-mode \
 	--without-java \
 	--without-python \
 	--disable-openmp
 
+BEECRYPT_CONF_OPTS = \
+	$(BEECRYPT_COMMON_CONF_OPTS)
+
+HOST_BEECRYPT_CONF_OPTS = \
+	$(BEECRYPT_COMMON_CONF_OPTS) \
+	--without-cplusplus
+
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
 BEECRYPT_CONF_OPTS += --with-cplusplus
@@ -33,3 +40,4 @@ BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
