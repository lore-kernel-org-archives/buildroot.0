From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Aug 2016 18:49:24 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: portability fixes with musl
Message-ID: <1470847764-30974-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also bump the version to get another upstream fix (single new commit).

Fixes:
    http://autobuild.buildroot.net/results/682/68266cb5b26a62387dc99aef31fc9654c8fcd505/
    [and quite a few others...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/kmsxx/0001-kms-util-portability-fix.patch  | 41 ++++++++++++++++++++++
 ...002-utils-select-et-al.-need-sys-select.h.patch | 37 +++++++++++++++++++
 package/kmsxx/kmsxx.hash                           |  2 +-
 package/kmsxx/kmsxx.mk                             |  2 +-
 4 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 package/kmsxx/0001-kms-util-portability-fix.patch
 create mode 100644 package/kmsxx/0002-utils-select-et-al.-need-sys-select.h.patch

diff --git a/package/kmsxx/0001-kms-util-portability-fix.patch b/package/kmsxx/0001-kms-util-portability-fix.patch
new file mode 100644
index 0000000..ddc2e40
--- /dev/null
+++ b/package/kmsxx/0001-kms-util-portability-fix.patch
@@ -0,0 +1,41 @@
+From 868bc96e72f3d21f30368a50e36c6a04ad810478 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 10 Aug 2016 18:16:39 +0200
+Subject: [PATCH] kms++-util: portability fix
+
+__STRING(x) is a glibcism (i.e. it is non-standard), that happens to be
+also available with uClibc, but is not with musl.
+
+Define it if not already defined, using the same trivial definition as
+is done by both glibg and uClibc.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Patch sent upstream:
+    https://github.com/tomba/kmsxx/pull/11
+
+---
+ kms++util/inc/kms++util/kms++util.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
+index 10a1f0a..5a688f6 100644
+--- a/kms++util/inc/kms++util/kms++util.h
++++ b/kms++util/inc/kms++util/kms++util.h
+@@ -35,6 +35,13 @@ Connector* resolve_connector(Card& card, const std::string& str);
+ 
+ #define unlikely(x) __builtin_expect(!!(x), 0)
+ 
++/* __STRING(x) is a glibcism (i.e. not standard), which happens to also
++ * be available in uClibc. However, musl does not define it. Do it here.
++ */
++#ifndef __STRING
++#define __STRING(x) #x
++#endif
++
+ #define ASSERT(x) \
+ 	if (unlikely(!(x))) { \
+ 		fprintf(stderr, "%s:%d: %s: ASSERT(%s) failed\n", __FILE__, __LINE__, __PRETTY_FUNCTION__, __STRING(x)); \
+-- 
+2.7.4
+
diff --git a/package/kmsxx/0002-utils-select-et-al.-need-sys-select.h.patch b/package/kmsxx/0002-utils-select-et-al.-need-sys-select.h.patch
new file mode 100644
index 0000000..f9ecaa5
--- /dev/null
+++ b/package/kmsxx/0002-utils-select-et-al.-need-sys-select.h.patch
@@ -0,0 +1,37 @@
+From 35373b7829fdc49407f4c256c603a137b957a1ad Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 10 Aug 2016 18:34:28 +0200
+Subject: [PATCH] utils: select() et al. need <sys/select.h>
+
+Although indirectly included by way of other headers with glibc and
+uClibc, using any of the select()-class familly of functions or macros
+requires including <sys/select.h>.
+
+This fixes the build under musl, which is way more conservative in the
+ehaders that are included one-from-the-others (k.e. as few as possible).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Patch sent upstream:
+    https://github.com/tomba/kmsxx/pull/11
+
+---
+ utils/testpat.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/utils/testpat.cpp b/utils/testpat.cpp
+index ef56a80..7208105 100644
+--- a/utils/testpat.cpp
++++ b/utils/testpat.cpp
+@@ -5,6 +5,8 @@
+ #include <set>
+ #include <chrono>
+ 
++#include <sys/select.h>
++
+ #include <kms++/kms++.h>
+ #include <kms++/modedb.h>
+ 
+-- 
+2.7.4
+
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index 4615a65..5874587 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 62bd9e8c9686e5624ebeba27234cae956eeec7830a742563f051ee4a2fe522c7  kmsxx-a706f157b86e90696808025db01de99646d51a77.tar.gz
+sha256  391e2de0402a33c7fbe150e60c1c81aa9345180bca1cb2561d67e7c7e840957f  kmsxx-c817d3315193b0c8067f45d7bb5375aea4279919.tar.gz
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index df0ab23..400fe42 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSXX_VERSION = a706f157b86e90696808025db01de99646d51a77
+KMSXX_VERSION = c817d3315193b0c8067f45d7bb5375aea4279919
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
 KMSXX_LICENSE = MPLv2.0
 KMSXX_LICENSE_FILES = LICENSE
-- 
2.7.4
