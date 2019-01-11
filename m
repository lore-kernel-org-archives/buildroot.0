From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 11 Jan 2019 15:33:12 +0100
Subject: [Buildroot] [PATCH 1/1] swupdate: disable lua in static build
Message-ID: <20190111143312.1498-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2018.11 and
https://github.com/sbabic/swupdate/commit/624904cc18003fae413011563dac83a333f10509,
bindings for LUA is a shared library so disable lua if BR2_STATIC_LIBS
is set

Fixes:
 - http://autobuild.buildroot.org/results/55767e58c211656558af7916a4e0975089a2785b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 08d6ba9372..b7ef09c924 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -44,7 +44,7 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER):$(BR2_STATIC_LIBS),y:)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
 define SWUPDATE_SET_LUA_VERSION
-- 
2.14.1
