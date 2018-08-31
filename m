From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 31 Aug 2018 16:17:35 +0200
Subject: [Buildroot] [PATCH next] squid: fix build failure on nios2
Message-ID: <20180831141735.32773-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libstdc++ can have ATOMIC_INT_LOCK_FREE < 2, this way exception_ptr.h
containing current_exception() function won't be included causing build
failure.

Add a patch to replace current_exception() with uncaught_exception()
function. current_exception() is only used to check if there is a pending
exception, uncaught_exception() does the same and does not rely on
ATOMIC_INT_LOCK_FREE >= 2.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...place-current_exception-with-uncaugh.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch

diff --git a/package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch b/package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch
new file mode 100644
index 0000000000..acd18a6f4f
--- /dev/null
+++ b/package/squid/0003-TextException-replace-current_exception-with-uncaugh.patch
@@ -0,0 +1,32 @@
+From 14666035700bbabe699bdae4164d292cb04ca556 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Fri, 31 Aug 2018 15:54:21 +0200
+Subject: [PATCH] TextException: replace current_exception() with
+ uncaught_exception()
+
+If libstdc++ has ATOMIC_INT_LOCK_FREE < 2 current_exception() is not supported.
+
+Since current_exception() is needed only to check if there are pending
+exceptions, let's use uncaught_exception() instead.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/base/TextException.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/TextException.cc b/src/base/TextException.cc
+index f197e237a..773778b71 100644
+--- a/src/base/TextException.cc
++++ b/src/base/TextException.cc
+@@ -61,7 +61,7 @@ TextException::what() const throw()
+ std::ostream &
+ CurrentException(std::ostream &os)
+ {
+-    if (std::current_exception()) {
++    if (std::uncaught_exception()) {
+         try {
+             throw; // re-throw to recognize the exception type
+         }
+-- 
+2.17.1
+
-- 
2.17.1
