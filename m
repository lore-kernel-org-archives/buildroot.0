From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 11:23:00 +0200
Subject: [Buildroot] [git commit] bind: don't lookup zlib.h in host headers
Message-ID: <20161019093219.BD27381E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ec6dae302e31af3869be5ad0af79e8d18416ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.in looks in host headers for zlib.h, unless given a headers
directory as --with-zlib parameter.

Note: a bug in the zlib.h header lookup logic causes configure.in to add
-l$(STAGING_DIR)/usr/include/include, and -L$(STAGING_DIR)/usr/include/lib.
But this does not affect us.

Fixes:
http://autobuild.buildroot.net/results/e96/e96a36c4da3c3be4b79a27af75a70bb8955c31a9/
http://autobuild.buildroot.net/results/e0b/e0bd7df5c19c7c65ce0009b7c2b4d4104a5c3109/
http://autobuild.buildroot.net/results/e99/e993940067f7ae841132765f91bfee7248ab125f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index cda9fed..9b5d8c5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -33,7 +33,7 @@ BIND_CONF_OPTS = \
 	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-BIND_CONF_OPTS += --with-zlib
+BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr/include
 BIND_DEPENDENCIES += zlib
 else
 BIND_CONF_OPTS += --without-zlib
