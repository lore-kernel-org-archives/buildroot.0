From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2015 22:03:07 +0200
Subject: [Buildroot] [git commit] package/php: fix build without threads and
	pcre
Message-ID: <20150525205004.0DD2D7FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f1542782c66ccd47e096ea00ddf9f1451f964ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pcre library bundled in php is not configurable through the usual
--enable/disable options, but wants to be thread-safe by default, so it
wants to use pthreads (uncludes pthread.h and uses pthread_* functions).

So, just override the default configuration to explicitly require the
bundled pcre library be single-threaded when we have no thread and are
not using the external pcre library.

Fixes:
    http://autobuild.buildroot.org/results/f50/f50f4e569466ad74e49a3eac9ea2e6cfc4dd30e3/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 6492747..448b7ef 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -213,6 +213,13 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += pcre
+else
+# The bundled pcre library is not configurable through ./configure options,
+# and by default is configured to be thread-safe, so it wants pthreads. So
+# we must explicitly tell it when we don't have threads.
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+PHP_CFLAGS += -DSLJIT_SINGLE_THREADED=1
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
