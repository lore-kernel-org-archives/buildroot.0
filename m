From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 09:41:40 +0100
Subject: [Buildroot] [git commit] qt5webkit: add upstream patch to fix build
	on ARM softfp
Message-ID: <20131227084417.7DB609C20A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1aa31b65118aefbde0a4ac7ab9679353751146c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...kit-0002-Fix-QtWebKit-build-on-ARM-softfp.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit-0002-Fix-QtWebKit-build-on-ARM-softfp.patch b/package/qt5/qt5webkit/qt5webkit-0002-Fix-QtWebKit-build-on-ARM-softfp.patch
new file mode 100644
index 0000000..edbfb90
--- /dev/null
+++ b/package/qt5/qt5webkit/qt5webkit-0002-Fix-QtWebKit-build-on-ARM-softfp.patch
@@ -0,0 +1,35 @@
+From 8a716a29721d900069d82878c45cf87a356adba3 Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@digia.com>
+Date: Tue, 17 Dec 2013 12:26:58 +0100
+Subject: [PATCH] Fix QtWebKit build on ARM softfp
+
+The low level interpreter depends on hardfp, so we need to disable it
+when builing on ARM targets with softfp.
+
+Task-number: QTBUG-35681
+Change-Id: I8aaef546b92182a87cc7116ac452d8725de6a7db
+Reviewed-by: Jocelyn Turcotte <jocelyn.turcotte@digia.com>
+Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
+---
+ Source/WTF/wtf/Platform.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 3a9b509..cddc210 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -771,6 +771,11 @@
+ #define ENABLE_LLINT 0
+ #endif
+ 
++/* LLINT on ARM depends on an FPU */
++#if !defined(ENABLE_LLINT) && CPU(ARM) && !CPU(ARM_HARDFP)
++#define ENABLE_LLINT 0
++#endif
++
+ /* On some of the platforms where we have a JIT, we want to also have the 
+    low-level interpreter. */
+ #if !defined(ENABLE_LLINT) \
+-- 
+1.8.5.1
+
