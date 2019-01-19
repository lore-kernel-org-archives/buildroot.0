From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:33:43 +0100
Subject: [Buildroot] [git commit] Revert "package/php: fix building pcre
 extension"
Message-ID: <20190119214058.09FE88A69B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=392a50b2e34bd31138b6603684166742fa5c37f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 745f884e41b5f350296e8448f5fc31d20f67a077.

This was the wrong fix: issue is that php moves from pcre to pcre2 since
version 7.3.0 and
http://github.com/php/php-src/commit/a5bc5aed71f7a15f14f33bb31b8e17bf5f327e2d

This patch will always disable external pcre2 support and raise a build
failure when toolchaine does not have pthread

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 7d7d78353b..fd428e192a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -244,7 +244,7 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
-PHP_CONF_OPTS += --with-pcre-regex
+PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += pcre
 else
 # The bundled pcre library is not configurable through ./configure options,
