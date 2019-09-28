From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 09:31:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: disable on ARM 32 bits
Message-ID: <20190928073133.27537-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

32 bits architectures are not supported since version 3.4, see
https://docs.mongodb.com/manual/installation/#supported-platforms

So update Config.in and drop patch which is not needed anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fix-build-with-gcc-7-and-fpermissive.patch | 55 -------------------
 package/mongodb/Config.in                     |  2 -
 2 files changed, 57 deletions(-)
 delete mode 100644 package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch

diff --git a/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch b/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
deleted file mode 100644
index b4b1746682..0000000000
--- a/package/mongodb/0001-ssl_manager.cpp-fix-build-with-gcc-7-and-fpermissive.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 362be06fc16a5ad0f9e9aa90cc763c5242e8e35c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Feb 2019 12:41:45 +0100
-Subject: [PATCH] ssl_manager.cpp: fix build with gcc 7 and -fpermissive
-
-Change prototype of DERToken::parse function from
-parse(ConstDataRange cdr, size_t* outLength);
-to parse(ConstDataRange cdr, uint64_t* outLength);
-
-Otherwise, we got the following error:
-
-src/mongo/util/net/ssl_manager.cpp: In static member function 'static mongo::StatusWith<mongo::{anonymous}::DERToken> mongo::{anonymous}::DERToken::parse(mongo::ConstDataRange, size_t*)':
-src/mongo/util/net/ssl_manager.cpp:575:79: error: invalid conversion from 'size_t* {aka unsigned int*}' to 'long unsigned int*' [-fpermissive]
-  if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, outLength) ||
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mongodb/mongo/pull/1296]
----
- src/mongo/util/net/ssl_manager.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/ssl_manager.cpp
-index b93ebe84a4..3511eb5d99 100644
---- a/src/mongo/util/net/ssl_manager.cpp
-+++ b/src/mongo/util/net/ssl_manager.cpp
-@@ -782,7 +782,7 @@ public:
-      *
-      * Returns a DERToken which consists of the (tag, length, value) tuple.
-      */
--    static StatusWith<DERToken> parse(ConstDataRange cdr, size_t* outLength);
-+    static StatusWith<DERToken> parse(ConstDataRange cdr, uint64_t* outLength);
- 
- private:
-     DERType _type{DERType::EndOfContent};
-@@ -799,7 +799,7 @@ struct DataType::Handler<DERToken> {
-                        size_t length,
-                        size_t* advanced,
-                        std::ptrdiff_t debug_offset) {
--        size_t outLength;
-+        uint64_t outLength;
- 
-         auto swPair = DERToken::parse(ConstDataRange(ptr, length), &outLength);
- 
-@@ -844,7 +844,7 @@ StatusWith<std::string> readDERString(ConstDataRangeCursor& cdc) {
- }
- 
- 
--StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, size_t* outLength) {
-+StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, uint64_t* outLength) {
-     const size_t kTagLength = 1;
-     const size_t kTagLengthAndInitialLengthByteLength = kTagLength + 1;
- 
--- 
-2.14.1
-
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 9c5dba8347..6a8a35992d 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -1,8 +1,6 @@
 # from https://docs.mongodb.com/manual/installation/#supported-platforms
 config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 	bool
-	# ARM needs LDREX/STREX, so ARMv6+
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	default y if BR2_aarch64 || BR2_x86_64
 
 config BR2_PACKAGE_MONGODB
-- 
2.23.0
