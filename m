From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 16:19:25 +0200
Subject: [Buildroot] [git commit] boost: fix build on 64-bit target after
	bump to 1.54.0
Message-ID: <20131022142610.D15AB9BAB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f4b08697b84f7d7eb1682a576bbcbe57af70945
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...oost-0003-fix-64bit-build-with-recent-gcc.patch |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

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
