From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 11:50:20 +0200
Subject: [Buildroot] [git commit] libuci: fix Lua finding
Message-ID: <20140406095058.2FC7F9C58D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00f4e0331ea63568450874756375586bcd122cf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes Lua path comparison, if Lua is not provided.

Fixes

  http://autobuild.buildroot.org/results/a14/a140e9ea33202e8b870ec047a573f269e9a74b08/

[Thomas: add reference to the autobuilder failure.]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci-01-uci-fix-Lua-finding.patch |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/libuci/libuci-01-uci-fix-Lua-finding.patch b/package/libuci/libuci-01-uci-fix-Lua-finding.patch
new file mode 100644
index 0000000..f37e136
--- /dev/null
+++ b/package/libuci/libuci-01-uci-fix-Lua-finding.patch
@@ -0,0 +1,31 @@
+From 980432ce260020ed8a907b3bbc1334845ba4c4a9 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 5 Apr 2014 19:18:10 +0200
+Subject: [PATCH] uci: fix Lua finding
+
+If ${LUAPATH} is not quoted and Lua is not provided, then following
+error occurs:
+
+"NOT" "No such file or directory" "EQUAL" "0" "OR" "EQUAL" ""
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lua/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lua/CMakeLists.txt b/lua/CMakeLists.txt
+index e4295d7..4ba8e37 100644
+--- a/lua/CMakeLists.txt
++++ b/lua/CMakeLists.txt
+@@ -36,7 +36,7 @@ IF(NOT LUAPATH)
+ 	)
+ 
+ 	IF(BUILD_LUA)
+-		IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR ${LUAPATH} EQUAL "")
++		IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR "${LUAPATH}" EQUAL "")
+ 			MESSAGE(SEND_ERROR "Lua was not found on your system")
+ 		ENDIF()
+ 	ENDIF()
+-- 
+1.8.3.2
+
