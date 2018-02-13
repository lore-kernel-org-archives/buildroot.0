From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:38:18 +0100
Subject: [Buildroot] [git commit] php: disable valgrind
Message-ID: <20180213213837.6FB0C87F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8684bc8959a6a2d35959b4e2e9ecca23f5914992
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduced in PHP7.2, if a host has valgrind headers installed, PHP will detect
them and set HAVE_VALGRIND to 1.
Disable this entry after configuring.

fixes:
http://autobuild.buildroot.net/results/d59/d59b5961890aeddcd6d59ed52243be6554d1fe21

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/php.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index a4481c45c7..e6bc1e47e1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -232,6 +232,11 @@ define PHP_DISABLE_PCRE_JIT
 	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
 endef
 
+define PHP_DISABLE_VALGRIND
+	$(SED) '/^#define HAVE_VALGRIND/d' $(@D)/main/php_config.h
+endef
+PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
+
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
