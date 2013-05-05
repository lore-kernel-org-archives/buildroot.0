From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:57:54 +0200
Subject: [Buildroot] [git commit] bind: fix build failure for static+openssl
Message-ID: <20130505205838.BD18F99B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80ebf12906afc3a1e5f4e5682d4c5dc0779a556a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bind just links to openssl libraries without checking it's dependencies.
This works when doing shared builds since the linker picks the deps up,
but fails badly on static builds.
So just define LIBS="-lz" when openssl is enabled. Fixes:
http://autobuild.buildroot.net/results/a9a166f932e0b6727ae8e470ce748418797875b9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8a66534..f689594 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,7 +30,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	BIND_DEPENDENCIES += openssl
-	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
+	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr LIBS="-lz"
 else
 	BIND_CONF_OPT += --with-openssl=no
 endif
