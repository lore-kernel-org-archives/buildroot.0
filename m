From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 16 Sep 2017 10:37:09 -0300
Subject: [Buildroot] [PATCH] stella: fix error when building with uClibc-ng
Message-ID: <1505569029-28935-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClibc-ng C library defines a type called R0 that conflits with a
global variable called R0 from PaddleReader.cxx.

src/emucore/tia/PaddleReader.cxx:25:3: error: ?constexpr const double R0? redeclared as different kind of symbol
   R0 = 1.5e3,
   ^

/home/sprado/workspace/build/buildroot/build/stella_uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:42:3:note: previous declaration ?<anonymous enum> R0?
   R0 = 0,
   ^~

So let's redefine R0 as a private member of the PaddleReader class.

This patch has already been accepted upstream [1] and should be removed in
the next version bump.

[1] https://github.com/stella-emu/stella/commit/391601d2386e41372d6fa198fbe40287d2e87542

Fixes:

http://autobuild.buildroot.net/results/9ab5772f01236eaa7def66a2f443f13efca8c34c
http://autobuild.buildroot.net/results/5a4a194fe85e04ab31b146367c5a45e4f7688fca
http://autobuild.buildroot.net/results/31f6bb3f5879d056fe152ca19b6b0367cc636212
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...03-Fix-error-when-building-with-uClibc-ng.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch

diff --git a/package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch b/package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch
new file mode 100644
index 000000000000..ffbc83187bc1
--- /dev/null
+++ b/package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch
@@ -0,0 +1,54 @@
+From 36d5c8bc3592b4dffbec222a179c3956787a0694 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sat, 9 Sep 2017 15:04:58 -0300
+Subject: [PATCH] Fix error when building with uClibc-ng
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The uClibc-ng C library defines a type called R0 that conflits with a
+global variable called R0 from PaddleReader.cxx.
+
+src/emucore/tia/PaddleReader.cxx:25:3: error: ?constexpr const double R0? redeclared as different kind of symbol
+   R0 = 1.5e3,
+   ^
+/home/sprado/workspace/build/buildroot/build/stella_uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:42:3: note: previous declaration ?<anonymous enum> R0?
+   R0 = 0,
+   ^~
+
+So let's redefine R0 as a private member of the PaddleReader class.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ src/emucore/tia/PaddleReader.cxx | 1 -
+ src/emucore/tia/PaddleReader.hxx | 2 ++
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/emucore/tia/PaddleReader.cxx b/src/emucore/tia/PaddleReader.cxx
+index 69c828ea6c5c..27ff828200ee 100644
+--- a/src/emucore/tia/PaddleReader.cxx
++++ b/src/emucore/tia/PaddleReader.cxx
+@@ -22,7 +22,6 @@
+ static constexpr double
+   C = 68e-9,
+   RPOT = 1e6,
+-  R0 = 1.5e3,
+   USUPP = 5;
+ 
+ static constexpr double TRIPPOINT_LINES = 379;
+diff --git a/src/emucore/tia/PaddleReader.hxx b/src/emucore/tia/PaddleReader.hxx
+index 00238a4fe5b5..0032e6efd015 100644
+--- a/src/emucore/tia/PaddleReader.hxx
++++ b/src/emucore/tia/PaddleReader.hxx
+@@ -65,6 +65,8 @@ class PaddleReader : public Serializable
+ 
+     bool myIsDumped;
+ 
++    static constexpr double R0 = 1.5e3;
++
+   private:
+     PaddleReader(const PaddleReader&) = delete;
+     PaddleReader(PaddleReader&&) = delete;
+-- 
+1.9.1
+
-- 
1.9.1
