From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 23:56:21 +0100
Subject: [Buildroot] [git commit] libnspr: fix link error with musl
	toolchains
Message-ID: <20160201224701.36E917FA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=390d559db3ed485994602c21db0d22a546aa3181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking against libnspr with musl toolchains we get undefined
references to `getprotobyname_r' and `getprotobynumber_r', for example
when compiling libnss:

/home/test/autobuild/instance-1/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libnspr4.so:
undefined reference to `getprotobyname_r'
/home/test/autobuild/instance-1/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libnspr4.so:
undefined reference to `getprotobynumber_r'

That's because musl does not have an implementation of these functions,
so we need to enable their internal implementation from libnspr.

This patch was backported from Alpine Linux commit
a162da839db0d3f8be94a5c1ad2e2e54e691c38a.

Fixes:
http://autobuild.buildroot.net/results/6052538d10779a21ac242d61bb43a371497ec684/
http://autobuild.buildroot.net/results/d62ea7dbe68188d073b4f176e6a354e95a8bab97/
http://autobuild.buildroot.net/results/ae50521c485371cd59bc4ee7e8f323169c7d513d/
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...able-internal-getproto-functions-for-musl.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch b/package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch
new file mode 100644
index 0000000..860ca2a
--- /dev/null
+++ b/package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch
@@ -0,0 +1,35 @@
+From c950bcf9cc7bdc68ed9751a1b7d04f4b4c2a9fb0 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Tue, 5 Jan 2016 21:15:34 -0200
+Subject: [PATCH] enable internal getproto functions for musl
+
+Musl toolchains does not have getprotobyname_r and getprotobynumber_r
+functions and need its internal implementation.
+
+Patch backported from Alpine Linux commit
+a162da839db0d3f8be94a5c1ad2e2e54e691c38a.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ nspr/pr/src/misc/prnetdb.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/nspr/pr/src/misc/prnetdb.c b/nspr/pr/src/misc/prnetdb.c
+index b86248f863f0..dc83a5615f45 100644
+--- a/nspr/pr/src/misc/prnetdb.c
++++ b/nspr/pr/src/misc/prnetdb.c
+@@ -61,10 +61,7 @@ PRLock *_pr_dnsLock = NULL;
+ #define _PR_HAVE_GETPROTO_R_POINTER
+ #endif
+ 
+-#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT)) \
+-	|| (defined(LINUX) && defined(_REENTRANT) \
+-        && !(defined(__GLIBC__) && __GLIBC__ >= 2) \
+-        && !defined(ANDROID))
++#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT))
+ #define _PR_HAVE_GETPROTO_R
+ #define _PR_HAVE_GETPROTO_R_POINTER
+ #endif
+-- 
+1.9.1
+
