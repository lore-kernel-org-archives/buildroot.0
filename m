From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:33:57 +0100
Subject: [Buildroot] [git commit] php: switch to pcre2
Message-ID: <20190119214058.117268152C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75bfe6158297bc623081ab6cc7cdb93f9efd25b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

php moved from pcre to pcre2 since bump to version 7.3 and
http://github.com/php/php-src/commit/a5bc5aed71f7a15f14f33bb31b8e17bf5f327e2d

This fixes a build failure: without this change, if BR2_PACKAGE_PCRE is
set, external pcre support in php is (wrongly) enabled with
--with-pcre-regex but because pcre2 was not found, php fallbacks on
built-in pcre2 without the "SLJIT_SINGLE_THREADED hack"

Fixes:
 - http://autobuild.buildroot.org/results/40ef339019203d2cc49d388e222cf17c3ca37944

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index fd428e192a..b6b17a1562 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -243,9 +243,9 @@ endef
 PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 
 ### Use external PCRE if it's available
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += pcre
+PHP_DEPENDENCIES += pcre2
 else
 # The bundled pcre library is not configurable through ./configure options,
 # and by default is configured to be thread-safe, so it wants pthreads. So
