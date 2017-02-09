From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  9 Feb 2017 11:29:52 +0100
Subject: [Buildroot] [PATCH 2/2] libevent: drop openssl static linking
	workaround
In-Reply-To: <20170209102952.6351-1-peter@korsgaard.com>
References: <20170209102952.6351-1-peter@korsgaard.com>
Message-ID: <20170209102952.6351-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index 128bb2ac7..5458ce316 100644
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
-- 
2.11.0
