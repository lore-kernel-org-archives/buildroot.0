From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Aug 2019 14:14:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/assimp: bump to version 4.1.0
Message-ID: <20190801121403.25018-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove second patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-compilation-on-BigEndian.patch   | 40 -------------------
 package/assimp/assimp.hash                    |  3 +-
 package/assimp/assimp.mk                      |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/assimp/0002-fix-compilation-on-BigEndian.patch

diff --git a/package/assimp/0002-fix-compilation-on-BigEndian.patch b/package/assimp/0002-fix-compilation-on-BigEndian.patch
deleted file mode 100644
index 93cba5d120..0000000000
--- a/package/assimp/0002-fix-compilation-on-BigEndian.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8457f3eff89dae35d43f679a66842ceedfd08808 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?IOhannes=20m=20zm=C3=B6lnig?=
- <zmoelnig@umlautQ.umlaeute.mur.at>
-Date: Fri, 13 Nov 2015 22:33:20 +0100
-Subject: [PATCH] fix compilation on BigEndian
-
-cannot pass a function by reference where an lvalue is expected
-(only applies to bigendian, where a macro expands to a byteswap function)
-
-Closes https://github.com/assimp/assimp/issues/613
-
-Taken from [1] for buildroot assimp package compile fix.
-
-[1] https://github.com/assimp/assimp/commit/756cfd4f74b866e3183caede69daa8c105b73bab.patch
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- code/Bitmap.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/code/Bitmap.cpp b/code/Bitmap.cpp
-index 13ec372..829fd02 100644
---- a/code/Bitmap.cpp
-+++ b/code/Bitmap.cpp
-@@ -84,7 +84,12 @@ namespace Assimp {
- 
-     template<typename T>
-     inline std::size_t Copy(uint8_t* data, T& field) {
-+#ifdef AI_BUILD_BIG_ENDIAN
-+        T field_swapped=AI_BE(field);
-+        std::memcpy(data, &field_swapped, sizeof(field)); return sizeof(field);
-+#else
-         std::memcpy(data, &AI_BE(field), sizeof(field)); return sizeof(field);
-+#endif
-     }
- 
-     void Bitmap::WriteHeader(Header& header, IOStream* file) {
--- 
-2.1.4
-
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index f97fd646b5..72d367ac43 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 187f825c563e84b1b17527a4da0351aa3d575dfd696a9d204ae4bb19ee7df94a  assimp-3.2.tar.gz
+sha256 3520b1e9793b93a2ca3b797199e16f40d61762617e072f2d525fad70f9678a71  assimp-4.1.0.tar.gz
+sha256 a26ccc3dbf2f58ea99c100945a8a126fa0f9f4d7fd2b49aa8bdb8e09355864d8  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 292e337400..ce02ef300c 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 3.2
+ASSIMP_VERSION = 4.1.0
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.20.1
