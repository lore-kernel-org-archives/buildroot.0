From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat,  2 Mar 2019 06:50:05 -0300
Subject: [Buildroot] [PATCH] package/stella: bump version to 6.0
Message-ID: <20190302095005.9862-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add hashes for license files
- remove patch with changes already upstream [1]

[1] https://github.com/stella-emu/stella/commit/483013baa7b357fdf0daa2e510c537d460132584

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...x-error-when-building-with-uClibc-ng.patch | 54 -------------------
 package/stella/stella.hash                    |  4 +-
 package/stella/stella.mk                      |  2 +-
 3 files changed, 4 insertions(+), 56 deletions(-)
 delete mode 100644 package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch

diff --git a/package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch b/package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch
deleted file mode 100644
index ffbc83187bc1..000000000000
--- a/package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 36d5c8bc3592b4dffbec222a179c3956787a0694 Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Sat, 9 Sep 2017 15:04:58 -0300
-Subject: [PATCH] Fix error when building with uClibc-ng
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The uClibc-ng C library defines a type called R0 that conflits with a
-global variable called R0 from PaddleReader.cxx.
-
-src/emucore/tia/PaddleReader.cxx:25:3: error: ?constexpr const double R0? redeclared as different kind of symbol
-   R0 = 1.5e3,
-   ^
-/home/sprado/workspace/build/buildroot/build/stella_uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:42:3: note: previous declaration ?<anonymous enum> R0?
-   R0 = 0,
-   ^~
-
-So let's redefine R0 as a private member of the PaddleReader class.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- src/emucore/tia/PaddleReader.cxx | 1 -
- src/emucore/tia/PaddleReader.hxx | 2 ++
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/emucore/tia/PaddleReader.cxx b/src/emucore/tia/PaddleReader.cxx
-index 69c828ea6c5c..27ff828200ee 100644
---- a/src/emucore/tia/PaddleReader.cxx
-+++ b/src/emucore/tia/PaddleReader.cxx
-@@ -22,7 +22,6 @@
- static constexpr double
-   C = 68e-9,
-   RPOT = 1e6,
--  R0 = 1.5e3,
-   USUPP = 5;
- 
- static constexpr double TRIPPOINT_LINES = 379;
-diff --git a/src/emucore/tia/PaddleReader.hxx b/src/emucore/tia/PaddleReader.hxx
-index 00238a4fe5b5..0032e6efd015 100644
---- a/src/emucore/tia/PaddleReader.hxx
-+++ b/src/emucore/tia/PaddleReader.hxx
-@@ -65,6 +65,8 @@ class PaddleReader : public Serializable
- 
-     bool myIsDumped;
- 
-+    static constexpr double R0 = 1.5e3;
-+
-   private:
-     PaddleReader(const PaddleReader&) = delete;
-     PaddleReader(PaddleReader&&) = delete;
--- 
-1.9.1
-
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index ef17ff75a09d..72a28f70a4ad 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,2 +1,4 @@
 # Locally computed:
-sha256 74ee708b68340b65519a04a22c61921cdcf69a1d308600c212414b28e9e689ac  stella-5.0.2-src.tar.xz
+sha256 17aa8c5f08e09c51dd7dd933f93b0a1929d2832bd66f3bd994fa50ebb2b9a2b1  stella-6.0-src.tar.xz
+sha256 c946a9ee632ee40111bad6e81c84b3e0bc1e49183b7a809f05d4d371f5f587bb  Copyright.txt
+sha256 58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 158a51109b78..a4df6ea65946 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 5.0.2
+STELLA_VERSION = 6.0
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.17.2
