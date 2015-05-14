From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 May 2015 22:44:06 +0200
Subject: [Buildroot] [git commit] libupnpp: fix static linking issue with
	libcurl
Message-ID: <20150514210426.753DC800DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7638ca23229bc9dfe3696f562afc63bda6bd1f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f38/f383bf4d7572a7dd59d382cd06a9baeb37e9161c/
http://autobuild.buildroot.net/results/d93/d934871d1b192706cd9163715c5ebcd96deff2b8/

Libcurl optionally links to a number of libraries that have to be taken into
consideration when linking statically.

Use pkg-config to get the correct libcurl link line, and also use it for
libupnp instead of the hardcoded list.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/libupnpp.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 853a724..defc16a 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -12,9 +12,11 @@ LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
 
 # configure script fails to link against the dependencies of libupnp
-# causing upnp detection to fail when statically linking
+# and libcurl causing detection to fail when statically linking
 ifeq ($(BR2_STATIC_LIBS),y)
-LIBUPNPP_CONF_ENV += LIBS='-lthreadutil -lixml -pthread'
+LIBUPNPP_DEPENDENCIES += host-pkgconf
+LIBUPNPP_CONF_ENV += \
+	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libupnp libcurl)'
 endif
 
 $(eval $(autotools-package))
