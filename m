From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 21:31:46 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] zeromq: fix static build
 with libatomic
Message-ID: <20181001193108.1075F8B44F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3e4cbf5ea75456591bb9215ca7dae3c22425647
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Second patch added support to link with -latomic if needed however using
LDFLAGS doesn't work when statically linking because LDFLAGS is added
before LIBS

Detection of atomic fails with:

configure:23230: /accts/mlweber1/instance-2/output/host/bin/sparc-linux-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -static -pedantic -Werror -Wall -D_GNU_SOURCE -D_REENTRANT -D_THREAD_SAFE -Wno-long-long -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -latomic conftest.cpp -lrt -lpthread -lstdc++ >&5
/tmp/ccgrvVTg.o: In function `main':
conftest.cpp:(.text.startup+0x10): undefined reference to `__atomic_fetch_add_4'
collect2: error: ld returned 1 exit status

So use LIBS instead of LDFLAGS

As second patch was already merged upstream, a new PR was sent:
https://github.com/zeromq/libzmq/pull/3250

Fixes:
 - http://autobuild.buildroot.net/results/c471d6b1061a8516f7772735e471db68a32965aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14f5cb7daa54644da981cae0e1dbbfc6d4c18993)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-acinclude.m4-check-if-latomic-is-needed.patch  | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
index a0c188a5c3..233b364662 100644
--- a/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
+++ b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
@@ -11,9 +11,11 @@ try fails, we try to link again with -latomic and add LIBS="-latomic" in case we
 succeeded.
 
 Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Update to use LIBS: https://github.com/zeromq/libzmq/pull/3250]
 ---
- acinclude.m4 | 32 ++++++++++++++++++++++++++++----
- 1 file changed, 28 insertions(+), 4 deletions(-)
+ acinclude.m4 | 31 +++++++++++++++++++++++++++----
+ 1 file changed, 27 insertions(+), 4 deletions(-)
 
 diff --git a/acinclude.m4 b/acinclude.m4
 index f648ed0f..aa35195f 100644
@@ -28,7 +30,7 @@ index f648ed0f..aa35195f 100644
  /* atomic intrinsics test */
  int v = 0;
  int main (int, char **)
-@@ -677,9 +677,33 @@ int main (int, char **)
+@@ -677,9 +677,32 @@ int main (int, char **)
      return t;
  }
      ])],
@@ -39,8 +41,8 @@ index f648ed0f..aa35195f 100644
 +    [libzmq_cv_has_atomic_instrisics="no"])
 +
 +    if test "x$libzmq_cv_has_atomic_instrisics" = "xno"; then
-+        save_LDFLAGS=$LDFLAGS
-+        LDFLAGS="$LDFLAGS -latomic"
++        save_LIBS=$LIBS
++        LIBS="$LIBS -latomic"
 +        AC_LINK_IFELSE([AC_LANG_SOURCE([
 +        /* atomic intrinsics test */
 +        int v = 0;
@@ -50,9 +52,8 @@ index f648ed0f..aa35195f 100644
 +            return t;
 +        }
 +        ])],
-+        [libzmq_cv_has_atomic_instrisics="yes" LIBS="-latomic"],
-+        [libzmq_cv_has_atomic_instrisics="no"])
-+        LDFLAGS=$save_LDFLAGS
++        [libzmq_cv_has_atomic_instrisics="yes"],
++        [libzmq_cv_has_atomic_instrisics="no" LIBS=$save_LIBS])
 +    fi
 +
 +    if test "x$libzmq_cv_has_atomic_instrisics" = "xyes"; then
