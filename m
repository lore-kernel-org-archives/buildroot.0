From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Oct 2018 17:05:58 +0200
Subject: [Buildroot] [PATCH] package/nodejs: use per-build cache directories
Message-ID: <20181013150558.31065-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When two Buildroot builds run in parallel, and they both happen to call
npm at roughly the same time, the two npm instances may conflict when
accessing the npm cache, which is by default ~/.npm

Although npm is supposed to lock access to the cache, it seems it does
sometimes fail to do so properly, bailling out in error, when it would
never ever crash at all when not running in parallel. We suspect that
the sequence leading to such failures are something like:

    npm-1                           npm-2
      lock(retry=few, sleep=short)    .
      does-stuff()                    .
      .                               lock(retry=few, sleep=short)
      .                               # can't lock local cache
      .                               download-module()
      .                                 # can't download
      .                                 exit(1)
      unlock()

As per the docs [0], few = 10, short = 10. So if the first npm (npm-1)
takes more than 100s (which can happen behind slow links and/or big
modules that contain native code that is compiled), then the second npm
(npm-2) will bail out (the download would fail if there is no network
access, for example, and only local modules are used).

Point npm to use a per-build cache directory, so they no longer compete
across builds.

That would still need some care when we do top-level parallel builds,
though.

Note also that the conflicts are not totally eliminated: two or more npm
instances may still compete for some other resource that has not yet
been identified.

But, at least, the conflict window has been drastically shortened now,
to the point where it now seldom occurs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 29462cb979..429642b795 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -153,6 +153,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 	npm_config_build_from_source=true \
 	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
 	npm_config_prefix=$(TARGET_DIR)/usr \
+	npm_config_cache=$(BUILD_DIR)/.npm-cache \
 	$(HOST_DIR)/bin/npm
 
 #
-- 
2.14.1
