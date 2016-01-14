From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 14 Jan 2016 22:44:21 +0100
Subject: [Buildroot] [PATCH v1 2/2] assimp: fix compile for big endian target
In-Reply-To: <1452807861-1020-1-git-send-email-ps.report@gmx.net>
References: <1452807861-1020-1-git-send-email-ps.report@gmx.net>
Message-ID: <1452807861-1020-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch taken from upstream [1].

Fixes ([2]):
  code/Bitmap.cpp: In function 'std::size_t Assimp::Copy(uint8_t*, T&) [with T = short unsigned int, std::size_t = unsigned int, uint8_t = unsigned char]':
  code/Bitmap.cpp:95:50:   instantiated from here
  code/Bitmap.cpp:87:9: error: lvalue required as unary '&' operand

[1] https://github.com/assimp/assimp/commit/756cfd4f74b866e3183caede69daa8c105b73bab.patch
[2] http://autobuild.buildroot.net/results/7aa/7aafdc2633bad96a2a17f4e8664e09aae78a3bbd

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../assimp/0002-fix-compilation-on-BigEndian.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/assimp/0002-fix-compilation-on-BigEndian.patch

diff --git a/package/assimp/0002-fix-compilation-on-BigEndian.patch b/package/assimp/0002-fix-compilation-on-BigEndian.patch
new file mode 100644
index 0000000..93cba5d
--- /dev/null
+++ b/package/assimp/0002-fix-compilation-on-BigEndian.patch
@@ -0,0 +1,40 @@
+From 8457f3eff89dae35d43f679a66842ceedfd08808 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?IOhannes=20m=20zm=C3=B6lnig?=
+ <zmoelnig@umlautQ.umlaeute.mur.at>
+Date: Fri, 13 Nov 2015 22:33:20 +0100
+Subject: [PATCH] fix compilation on BigEndian
+
+cannot pass a function by reference where an lvalue is expected
+(only applies to bigendian, where a macro expands to a byteswap function)
+
+Closes https://github.com/assimp/assimp/issues/613
+
+Taken from [1] for buildroot assimp package compile fix.
+
+[1] https://github.com/assimp/assimp/commit/756cfd4f74b866e3183caede69daa8c105b73bab.patch
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ code/Bitmap.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/code/Bitmap.cpp b/code/Bitmap.cpp
+index 13ec372..829fd02 100644
+--- a/code/Bitmap.cpp
++++ b/code/Bitmap.cpp
+@@ -84,7 +84,12 @@ namespace Assimp {
+ 
+     template<typename T>
+     inline std::size_t Copy(uint8_t* data, T& field) {
++#ifdef AI_BUILD_BIG_ENDIAN
++        T field_swapped=AI_BE(field);
++        std::memcpy(data, &field_swapped, sizeof(field)); return sizeof(field);
++#else
+         std::memcpy(data, &AI_BE(field), sizeof(field)); return sizeof(field);
++#endif
+     }
+ 
+     void Bitmap::WriteHeader(Header& header, IOStream* file) {
+-- 
+2.1.4
+
-- 
2.1.4
