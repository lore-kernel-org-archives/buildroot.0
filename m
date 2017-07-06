From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  6 Jul 2017 12:48:41 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir fit
	for multi-user setups
Message-ID: <20170706104841.7711-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While building I noticed:

>>> host-ccache 3.3.4 Building
conf.c: In function 'conf_create':
conf.c:314:2: warning: too many arguments for format [-Wformat-extra-args]
  conf->cache_dir = format("/home/peko/.buildroot-ccache", get_home_directory());
  ^

As host-ccache gets installed into $(HOST_DIR) and is part of the SDK,
hardcoding the build user homedir isn't really nice for the relocatable
SDK feature (or simply for a SDK used by multiple users).

As the warning shows, CCache replaces "%s" with the current user home
directory, so rewrite BR_CACHE_DIR to use this feature if it begins with
$HOME.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 97d66bb45b..afbec44fac 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -28,9 +28,13 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 #    BR2_CCACHE_DIR.
 #  - Change hard-coded last-ditch default to match path in .config, to avoid
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
+#    CCache replaces "%s" with the home directory of the current user,
+#    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
+HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))
+
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
+	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/conf.c
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
-- 
2.11.0
