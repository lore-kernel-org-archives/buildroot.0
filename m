From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Oct 2013 17:49:58 +0200
Subject: [Buildroot] [PATCH] boost: fix build on 64-bit target after bump to
	1.54.0
Message-ID: <1381938598-19420-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes compilation error with aarch64 target:

./boost/atomic/atomic.hpp: At global scope:
./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in this scope
 typedef atomic<uintptr_t> atomic_uintptr_t;
                ^
./boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
 typedef atomic<uintptr_t> atomic_uintptr_t;
                         ^
./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration before ';' token
 typedef atomic<uintptr_t> atomic_uintptr_t;
                                           ^

Fixes http://autobuild.buildroot.net/results/0b69d7b33dc16ea27e395a949cefbd0a35c92f61/

Reported here: https://svn.boost.org/trac/boost/ticket/8973
Fix reported here: https://svn.boost.org/trac/boost/ticket/8731

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Backported-from: https://svn.boost.org/trac/boost/changeset/84950
---
 ...oost-0003-fix-64bit-build-with-recent-gcc.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/boost/boost-0003-fix-64bit-build-with-recent-gcc.patch

diff --git a/package/boost/boost-0003-fix-64bit-build-with-recent-gcc.patch b/package/boost/boost-0003-fix-64bit-build-with-recent-gcc.patch
new file mode 100644
index 0000000..5fdfb01
--- /dev/null
+++ b/package/boost/boost-0003-fix-64bit-build-with-recent-gcc.patch
@@ -0,0 +1,33 @@
+Patch for recent versions of glibc which always assume int64_t support.
+
+Fixes compilation error with aarch64 target:
+
+./boost/atomic/atomic.hpp: At global scope:
+./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in this scope
+ typedef atomic<uintptr_t> atomic_uintptr_t;
+                ^
+./boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
+ typedef atomic<uintptr_t> atomic_uintptr_t;
+                         ^
+./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration before ';' token
+ typedef atomic<uintptr_t> atomic_uintptr_t;
+                                           ^
+
+Reported here: https://svn.boost.org/trac/boost/ticket/8973
+Fix reported here: https://svn.boost.org/trac/boost/ticket/8731
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+Backported-from: https://svn.boost.org/trac/boost/changeset/84950
+
+--- a/boost/cstdint.hpp	(revision 84805)
++++ b/boost/cstdint.hpp	(revision 84950)
+@@ -42,5 +42,8 @@
+ // See https://svn.boost.org/trac/boost/ticket/3548 and http://sources.redhat.com/bugzilla/show_bug.cgi?id=10990
+ //
+-#if defined(BOOST_HAS_STDINT_H) && (!defined(__GLIBC__) || defined(__GLIBC_HAVE_LONG_LONG))
++#if defined(BOOST_HAS_STDINT_H)					\
++  && (!defined(__GLIBC__)					\
++      || defined(__GLIBC_HAVE_LONG_LONG)			\
++      || (defined(__GLIBC__) && ((__GLIBC__ > 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ >= 17)))))
+ 
+ // The following #include is an implementation artifact; not part of interface.
-- 
1.8.1.2
