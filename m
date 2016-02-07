From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 14:10:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseview: update musl patch
Message-ID: <1454850622-9888-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream requested to update the source of the musl patch:
http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1954

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pulseview/0001-musl.patch | 54 +++++++++++++++++++++++++++++++++++++++
 package/pulseview/pulseview.mk    |  4 ---
 2 files changed, 54 insertions(+), 4 deletions(-)
 create mode 100644 package/pulseview/0001-musl.patch

diff --git a/package/pulseview/0001-musl.patch b/package/pulseview/0001-musl.patch
new file mode 100644
index 0000000..1acee73
--- /dev/null
+++ b/package/pulseview/0001-musl.patch
@@ -0,0 +1,54 @@
+From dcfe0a01f72021aab961245d0ebcc9f8d4504b40 Mon Sep 17 00:00:00 2001
+From: Soeren Apel <soeren@apelpie.net>
+Date: Sun, 31 Jan 2016 14:12:44 +0100
+Subject: [PATCH] View: Honor ENABLE_DECODE compiler switch
+
+Signed-off-by: Soeren Apel <soeren@apelpie.net>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Patch downloaded from upstream git:
+http://sigrok.org/gitweb/?p=pulseview.git;a=commitdiff;h=dcfe0a01f72021aab961245d0ebcc9f8d4504b40
+as suggested by upstream:
+http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1954
+
+ pv/view/view.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pv/view/view.cpp b/pv/view/view.cpp
+index c9b08bf..6ad7dea 100644
+--- a/pv/view/view.cpp
++++ b/pv/view/view.cpp
+@@ -43,7 +43,6 @@
+ #include <libsigrokcxx/libsigrokcxx.hpp>
+ 
+ #include "analogsignal.hpp"
+-#include "decodetrace.hpp"
+ #include "header.hpp"
+ #include "logicsignal.hpp"
+ #include "ruler.hpp"
+@@ -59,6 +58,10 @@
+ #include "pv/data/logicsegment.hpp"
+ #include "pv/util.hpp"
+ 
++#ifdef ENABLE_DECODE
++#include "decodetrace.hpp"
++#endif
++
+ using boost::shared_lock;
+ using boost::shared_mutex;
+ 
+@@ -455,9 +458,11 @@ void View::enable_coloured_bg(bool state)
+ 		if (l)
+ 			l->set_coloured_bg(state);
+ 
++#ifdef ENABLE_DECODE
+ 		shared_ptr<DecodeTrace> d = dynamic_pointer_cast<DecodeTrace>(i);
+ 		if (d)
+ 			d->set_coloured_bg(state);
++#endif
+ 	}
+ 
+ 	viewport_->update();
+-- 
+2.6.2
+
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index 35d852c..cc97187 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -8,10 +8,6 @@
 
 PULSEVIEW_VERSION = 0.3.0
 PULSEVIEW_SITE = http://sigrok.org/download/source/pulseview
-# bug fixed upstream
-# http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1950
-PULSEVIEW_PATCH = \
-	https://github.com/abraxa/pulseview/commit/dcfe0a01f72021aab961245d0ebcc9f8d4504b40.patch
 PULSEVIEW_LICENSE = GPLv3+
 PULSEVIEW_LICENSE_FILES = COPYING
 PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
-- 
2.7.0
