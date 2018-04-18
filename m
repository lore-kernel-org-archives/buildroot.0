From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 18 Apr 2018 04:55:59 -0400
Subject: [Buildroot] [PATCH 1/1] prosody: add dependency on shared libraries
Message-ID: <1524041759-11496-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The prosody package uses several Lua packages that require shared libraries.
Therefore, prosody must require shared libraries too.

Fixes: http://autobuild.buildroot.net/results/b126bce0bbd111f021ed5be7c8773fef2a8f8579

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Note: this bug was reported as a luaexpat build error, but the fault is really due to
prosody.  When the autobuilder's defconfig is applied, the following is emitted:

warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASEC which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAEXPAT which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAFILESYSTEM which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASOCKET which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASEC which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAEXPAT which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUAFILESYSTEM which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
warning: (BR2_PACKAGE_PROSODY) selects BR2_PACKAGE_LUASOCKET which has unmet direct dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_LUAINTERPRETER)
---
 package/prosody/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index ef26e27..32fa648 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PROSODY
 	bool "prosody"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_STATIC_LIBS # luasec, luaexpat, luafilesystem
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
@@ -15,6 +16,6 @@ config BR2_PACKAGE_PROSODY
 
 	  https://prosody.im
 
-comment "prosody needs the lua interpreter"
-	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
+comment "prosody needs the lua interpreter, dynamic library"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
-- 
2.7.4
