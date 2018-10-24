From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:12:34 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] libssh: fix build with
 musl libc
Message-ID: <20181024112042.7968780091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc27fae5c2a8941fd7a44de2a79474eeaaf77e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

libssh uses GNU extensions to the glob() API. Update the cmake test to
take that into account so that glob() is not used with musl libc.

Fixes:
http://autobuild.buildroot.net/results/0c2/0c2d17316fd6bd2bf1359e23a2a1273fa349cf2a/
http://autobuild.buildroot.net/results/936/936abac5362b33980fd1efe8b830409ee2f86f6b/
http://autobuild.buildroot.net/results/51b/51b1b136ab4209ee443c1b450a932341b2ff81b7/

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81e33bc77ce659cb0f42e801a449bfdfa6af491a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ake-check-for-GNU-compatible-glob-support.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libssh/0001-cmake-check-for-GNU-compatible-glob-support.patch b/package/libssh/0001-cmake-check-for-GNU-compatible-glob-support.patch
new file mode 100644
index 0000000000..139879b86c
--- /dev/null
+++ b/package/libssh/0001-cmake-check-for-GNU-compatible-glob-support.patch
@@ -0,0 +1,44 @@
+From 3bb8b5e4517a720d178dbe5c53b4a444d718bcf1 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 14 Sep 2018 15:19:48 +0300
+Subject: [PATCH] cmake: check for GNU compatible glob support
+
+The GLOB_TILDE flag is a GNU extension. musl libc does not implement
+this extension, which leads to build failure:
+
+.../libssh-0.8.1/src/config.c: In function 'local_parse_glob':
+/home/buildroot/autobuild/run/instance-1/output/build/libssh-0.8.1/src/config.c:329:10: error: 'glob_t {aka struct <anonymous>}' has no member named 'gl_flags'; did you mean 'gl_offs'?
+         .gl_flags = 0,
+          ^~~~~~~~
+          gl_offs
+.../libssh-0.8.1/src/config.c:334:25: error: 'GLOB_TILDE' undeclared (first use in this function); did you mean '_IO_FILE'?
+     rt = glob(fileglob, GLOB_TILDE, NULL, &globbuf);
+                         ^~~~~~~~~~
+                         _IO_FILE
+
+Check for GLOB_TILDE directly to make sure the libc provides the
+required extension.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://www.libssh.org/archive/libssh/2018-09/0000020.html
+
+ ConfigureChecks.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
+index f91bd038f5a3..dac61bcf678e 100644
+--- a/ConfigureChecks.cmake
++++ b/ConfigureChecks.cmake
+@@ -156,7 +156,7 @@ check_function_exists(explicit_bzero HAVE_EXPLICIT_BZERO)
+ check_function_exists(memset_s HAVE_MEMSET_S)
+ 
+ if (HAVE_GLOB_H)
+-  check_function_exists(glob HAVE_GLOB)
++  check_symbol_exists(GLOB_TILDE "glob.h" HAVE_GLOB)
+ endif (HAVE_GLOB_H)
+ 
+ if (NOT WIN32)
+-- 
+2.18.0
+
