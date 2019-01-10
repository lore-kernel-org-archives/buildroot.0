From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Jan 2019 23:03:38 +0100
Subject: [Buildroot] [git commit] package/php: fix building pcre extension
Message-ID: <20190110220522.958FF884B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=745f884e41b5f350296e8448f5fc31d20f67a077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure option "--with-pcre-regex=$(STAGING_DIR)/usr" is broken.
PHP will  prepend $(STAGING_DIR)/usr to the paths, which will cause a
failure because it won't be able to find pcre, and will then fallback to
searching for pcre2, which won't be installed.

Removing "=$(STAGING_DIR)/usr" from --with-pcre-regex fixes the issue.

Fixes:
  http://autobuild.buildroot.net/results/586/586f56e8fcf2d2bbbd3bdf69b1c3befff7ce8bbf
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Tested-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index fd428e192a..7d7d78353b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -244,7 +244,7 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
-PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
+PHP_CONF_OPTS += --with-pcre-regex
 PHP_DEPENDENCIES += pcre
 else
 # The bundled pcre library is not configurable through ./configure options,
