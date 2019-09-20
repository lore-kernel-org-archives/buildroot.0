From: =?iso-8859-1?Q?Julien_B=E9raud?= <julien.beraud@orolia.com>
Date: Fri, 20 Sep 2019 08:34:58 +0000
Subject: [Buildroot] [PATCH 2019.02.x] qt5base: Add patch to fix compile
 issue with gcc9
Message-ID: <20190920083428.28841-1-julien.beraud@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes an issue when building Qt5 on a machine that has gcc9 as the
system compiler.

Original commit in qt5base:
https://github.com/qt/qtbase/commit/a52d7861edfb5956de38ba80015c4dd0b596259b#diff-0b4819f9df9c43297ba840d1ac401599

Signed-off-by: Julien Beraud <julien.beraud@orolia.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0006-Fix-compile-issue-with-gcc-9.patch   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch

diff --git a/package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch b/package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch
new file mode 100644
index 0000000000..a10ab06e35
--- /dev/null
+++ b/package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch
@@ -0,0 +1,32 @@
+From e094806951ff7337b5b0c534db479e3808f153a7 Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Date: Tue, 13 Nov 2018 16:00:23 +0100
+Subject: [PATCH 1/1] Fix compile issue with gcc 9
+
+It appears messenne_twisters in the latest libstdc++ has one more
+requirement before it is willing to construct with our
+SystemGenerator struct as an sseq provider.
+
+Change-Id: If38151d1fa6f40a80274acc26d9ed6b4ac6049fe
+Reviewed-by: Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+Signed-off-by: Julien Beraud <julien.beraud@orolia.com>
+---
+ src/corelib/global/qrandom.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/corelib/global/qrandom.cpp b/src/corelib/global/qrandom.cpp
+index ebf9864b15..577736a867 100644
+--- a/src/corelib/global/qrandom.cpp
++++ b/src/corelib/global/qrandom.cpp
+@@ -218,6 +218,7 @@ struct QRandomGenerator::SystemGenerator
+ #endif // Q_OS_WINRT
+ 
+     static SystemGenerator &self();
++    typedef quint32 result_type;
+     void generate(quint32 *begin, quint32 *end) Q_DECL_NOEXCEPT_EXPR(FillBufferNoexcept);
+ 
+     // For std::mersenne_twister_engine implementations that use something
+-- 
+2.23.0
+
-- 
2.23.0
