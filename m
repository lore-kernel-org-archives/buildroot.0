From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 19:22:51 +0100
Subject: [Buildroot] [git commit] bind: disable libjson support
Message-ID: <20151230182311.4840782756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e8f91f346c3fefd5e9115881813f96ae422b5a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It conflicts with jsoncpp, bind probes for json/json.h first, but that
header is installed by jsoncpp, which is completely different from
json-c.
Since it's not clear who's correct here (there might be some other
json-c predecessor/version that installs there as well) and the same
functionality (stats channel) is provided by libxml2 as well, just
disable libjson support completely.

Fixes:
http://autobuild.buildroot.net/results/226/2262c9b46663ea7a45e128a5fd7ff30417c2c2a7/build-end.log
(indirectly, it was probing aboslute directories while searching for it)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5a77d82..2a06599 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -22,6 +22,7 @@ BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
+	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--with-libtool \
@@ -36,13 +37,6 @@ else
 BIND_CONF_OPTS += --disable-linux-caps
 endif
 
-ifeq ($(BR2_PACKAGE_JSON_C),y)
-BIND_CONF_OPTS += --with-libjson=yes
-BIND_DEPENDENCIES += json-c
-else
-BIND_CONF_OPTS += --with-libjson=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
 BIND_DEPENDENCIES += libxml2
