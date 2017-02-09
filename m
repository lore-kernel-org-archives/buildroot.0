From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Feb 2017 15:02:12 +0100
Subject: [Buildroot] [git commit] libevent: drop openssl static linking
	workaround
Message-ID: <20170209140257.679AF7FDD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=125dd2d1198a5ba25b1865d58ef649cfa5c4e84f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f29bb169cf (libevent: fix openssl detection when statically linking)
forced libevent to link against zlib when statically linking against openssl
as the configure script failed to do this.

Since then libevent has been bumped, and it now uses pkg-config to figure
out how to link with openssl, so ensure pkg-config is available and drop the
now-unneeded workaround.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 128bb2a..5458ce3 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -24,13 +24,8 @@ LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBEVENT_DEPENDENCIES += openssl
+LIBEVENT_DEPENDENCIES += host-pkgconf openssl
 LIBEVENT_CONF_OPTS += --enable-openssl
-# openssl needs zlib but configure forgets to link against it causing
-# openssl detection to fail
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBEVENT_CONF_ENV += OPENSSL_LIBADD='-lz'
-endif
 else
 LIBEVENT_CONF_OPTS += --disable-openssl
 endif
