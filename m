From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Jun 2019 23:20:49 +0200
Subject: [Buildroot] [git commit] package/libevent: fix build with openssl
Message-ID: <20190609212131.BEC6F8F2D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8bd71bf96cfcf29a96726076f91c3561a96ef39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 2.1.10 in commit
3c8e79db8375f83a8e6a1d58ade697447903b6b0, openssl detection is broken.
Add a patch to fix it otherwise libwebsock fails to build

Fixes:
 - http://autobuild.buildroot.org/results/be32afa364a6b387195cdb5166fb23e9610451a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...event_openssl.m4-fix-detection-of-openssl.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libevent/0002-m4-libevent_openssl.m4-fix-detection-of-openssl.patch b/package/libevent/0002-m4-libevent_openssl.m4-fix-detection-of-openssl.patch
new file mode 100644
index 0000000000..0724135df8
--- /dev/null
+++ b/package/libevent/0002-m4-libevent_openssl.m4-fix-detection-of-openssl.patch
@@ -0,0 +1,36 @@
+From 0374b55942e533a3c3997439481a8d05d6c8f729 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 8 Jun 2019 23:44:37 +0200
+Subject: [PATCH] m4/libevent_openssl.m4: fix detection of openssl
+
+Since commit 506df426dbeb0187bbd3654bd286b4100628fb16, OPENSSL_INCS is
+added to CPPFLAGS without any white space, as a result openssl detection
+fails on:
+configure:10395: checking openssl/ssl.h usability
+configure:10395: /home/fabrice/buildroot-test/buildroot/output/host/bin/riscv32-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wall -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64-I/home/fabrice/buildroot-test/buildroot/output/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/include  conftest.c >&5
+<command-line>:0:0: warning: "_FILE_OFFSET_BITS" redefined
+<command-line>:0:0: note: this is the location of the previous definition
+<command-line>:0:23: error: division by zero in #if
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libevent/libevent/pull/830]
+---
+ m4/libevent_openssl.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/libevent_openssl.m4 b/m4/libevent_openssl.m4
+index 7b458134..19811981 100644
+--- a/m4/libevent_openssl.m4
++++ b/m4/libevent_openssl.m4
+@@ -40,7 +40,7 @@ case "$enable_openssl" in
+ 	;;
+     esac
+     CPPFLAGS_SAVE=$CPPFLAGS
+-    CPPFLAGS+=$OPENSSL_INCS
++    CPPFLAGS="$CPPFLAGS $OPENSSL_INCS"
+     AC_CHECK_HEADERS([openssl/ssl.h], [], [have_openssl=no])
+     CPPFLAGS=$CPPFLAGS_SAVE
+     AC_SUBST(OPENSSL_INCS)
+-- 
+2.20.1
+
