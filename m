From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Aug 2015 18:47:22 +0100
Subject: [Buildroot] [PATCH] webkitgtk24: fix MIPS64 n64 ABI detection
Message-ID: <1439920042-58593-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

webkitgtk24 is failing to compile for MIPS64 n64 because the ABI is not
detected correctly. It causes failures like these ones:

./Source/JavaScriptCore/runtime/JSCJSValueInlines.h:201:53: error: cast
from 'JSC::JSCell*' to 'int32_t {aka int}' loses precision
[-fpermissive]

[snip]

./Source/WTF/wtf/StdLibExtras.h:137:5: error: static assertion failed:
bitwise_cast size of FromType and ToType must be equal!

Bug report:

  https://bugs.webkit.org/show_bug.cgi?id=145113

Upstream patch:

  http://trac.webkit.org/changeset/185863

Fixes:

  http://autobuild.buildroot.net/results/0d5/0d56a5bf6e92e7344dcee7acb85e176198f703e7/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...m.h-use-_ABI64-instead-of-_MIPS_SIM_ABI64.patch |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/webkitgtk24/0002-WTF-Platform.h-use-_ABI64-instead-of-_MIPS_SIM_ABI64.patch

diff --git a/package/webkitgtk24/0002-WTF-Platform.h-use-_ABI64-instead-of-_MIPS_SIM_ABI64.patch b/package/webkitgtk24/0002-WTF-Platform.h-use-_ABI64-instead-of-_MIPS_SIM_ABI64.patch
new file mode 100644
index 0000000..d56dc58
--- /dev/null
+++ b/package/webkitgtk24/0002-WTF-Platform.h-use-_ABI64-instead-of-_MIPS_SIM_ABI64.patch
@@ -0,0 +1,46 @@
+[WTF] Platform.h: use _ABI64 instead of _MIPS_SIM_ABI64 to determine MIPS N64
+
+Patch backported from upstream:
+
+http://trac.webkit.org/changeset/185863
+
+I tweaked this patch to remove the Changelog part in order to make it
+apply in Buildroot.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 2c84c8d1c294037141473c10e0374df63a3cdea9 Mon Sep 17 00:00:00 2001
+From: ossy at webkit.org <ossy@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Tue, 23 Jun 2015 06:33:16 +0000
+Subject: [PATCH] [WTF] Platform.h: use _ABI64 instead of _MIPS_SIM_ABI64 to determine MIPS N64
+ https://bugs.webkit.org/show_bug.cgi?id=145113
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Patch by YunQiang Su <wzssyqa@gmail.com> on 2015-06-22
+Reviewed by Csaba Osztrogon??c.
+
+* wtf/Platform.h:
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 185863 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ Source/WTF/wtf/Platform.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index c234f50..b5e9859 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -82,7 +82,7 @@
+
+ /* CPU(MIPS) - MIPS 32-bit and 64-bit */
+ #if (defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_) || defined(__mips64))
+-#if defined(_MIPS_SIM_ABI64) && (_MIPS_SIM == _MIPS_SIM_ABI64)
++#if defined(_ABI64) && (_MIPS_SIM == _ABI64)
+ #define WTF_CPU_MIPS64 1
+ #define WTF_MIPS_ARCH __mips64
+ #else
+--
+1.7.1
+
-- 
1.7.1
