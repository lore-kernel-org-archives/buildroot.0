From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 24 Nov 2018 15:54:49 +0100
Subject: [Buildroot] [PATCH/next 1/2] squid: remove gnu atomics handling
Message-ID: <20181124145450.5623-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnu atomics has been removed since version 3.5.27:
https://github.com/squid-cache/squid/commit/ddd4edb743d82be97fc651d529e04bf55329a50d
So remove squid_cv_gnu_atomics handling

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b661d5d133..2b6c830a62 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -38,15 +38,6 @@ SQUID_CONF_OPTS = \
 	--with-swapdir=/var/cache/squid/ \
 	--with-default-user=squid
 
-# Atomics in Squid use __sync built-ins on 4 and 8 bytes. However, the
-# configure script tests them using AC_TRY_RUN, so we have to give
-# some hints.
-ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4)$(BR2_TOOLCHAIN_HAS_SYNC_8),yy)
-SQUID_CONF_ENV += squid_cv_gnu_atomics=yes
-else
-SQUID_CONF_ENV += squid_cv_gnu_atomics=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 SQUID_CONF_OPTS += --with-mit-krb5
 SQUID_DEPENDENCIES += libkrb5
-- 
2.17.1
