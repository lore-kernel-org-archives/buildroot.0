From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 13:46:52 +0200
Subject: [Buildroot] [git commit] swupdate: allow luajit to enable HAVE_LUA
Message-ID: <20161025114833.B323B819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=515ced20087407189bc5523a2bf7c19b239cb78d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, HAVE_LUA=y was only passed when BR2_PACKAGE_LUA=y. However,
swupdate can also use LuaJIT instead of the classic Lua. Therefore,
this commit updates the package to use BR2_PACKAGE_HAS_LUAINTERPRETER
and the luainterpreter virtual package.

Note that the swupdate configuration needs to be updated separately
(via swupdate-menuconfig) to enable Lua support, and to specify the
Lua version (which should be jit-5.1 to link against LuaJIT).

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
[Thomas: use the luainterpreter virtual package, expand commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/swupdate.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 313a54f..d442810 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -39,8 +39,8 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-ifeq ($(BR2_PACKAGE_LUA),y)
-SWUPDATE_DEPENDENCIES += lua host-pkgconf
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
+SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
