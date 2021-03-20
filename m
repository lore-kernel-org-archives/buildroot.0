From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:31:55 +0100
Subject: [Buildroot] [git commit] package/qpid-proton: fix build on musl
Message-ID: <20210320200754.064468862F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fef4d8ea1855bb296ee15172ddf0d82fcb602457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build on musl with qpid-proton in version 0.33.0 which was added
with commit d4c0fde91da0d79204a21ed8de1bd410efa1c4d6

Fixes:
 - http://autobuild.buildroot.org/results/6a901b9ff68b7f52cabf8273d1017025fbd93b0d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oactor-epoll-internal.h-fix-build-on-musl.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch b/package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch
new file mode 100644
index 0000000000..1806a7a780
--- /dev/null
+++ b/package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch
@@ -0,0 +1,43 @@
+From e4211aa978606b9201dc0eb2399d1af6c010a46a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 17 Mar 2021 17:21:52 +0100
+Subject: [PATCH] c/src/proactor/epoll-internal.h: fix build on musl
+
+Build with epoll proactor on musl is broken since at least version 0.23.0 and
+https://github.com/apache/qpid-proton/commit/37136940e3077f25ce58c94775f48c66f666f4a8
+because musl does not define PTHREAD_MUTEX_ADAPTIVE_NP resulting in the
+following build failure:
+
+In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll.c:60:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h: In function 'pmutex_init':
+/home/giuliobenetti/autobuild/run/instance-0/output-1/build/qpid-proton-0.33.0/c/src/proactor/epoll-internal.h:319:36: error: 'PTHREAD_MUTEX_ADAPTIVE_NP' undeclared (first use in this function); did you mean 'PTHREAD_MUTEX_STALLED'?
+  319 |   pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
+      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
+      |                                    PTHREAD_MUTEX_STALLED
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6a901b9ff68b7f52cabf8273d1017025fbd93b0d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://issues.apache.org/jira/browse/PROTON-2346]
+---
+ c/src/proactor/epoll-internal.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/c/src/proactor/epoll-internal.h b/c/src/proactor/epoll-internal.h
+index e8c9f0a9..fa6a6f2a 100644
+--- a/c/src/proactor/epoll-internal.h
++++ b/c/src/proactor/epoll-internal.h
+@@ -315,7 +315,9 @@ static inline void pmutex_init(pthread_mutex_t *pm){
+   pthread_mutexattr_t attr;
+ 
+   pthread_mutexattr_init(&attr);
++#ifdef PTHREAD_MUTEX_ADAPTIVE_NP
+   pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ADAPTIVE_NP);
++#endif
+   if (pthread_mutex_init(pm, &attr)) {
+     perror("pthread failure");
+     abort();
+-- 
+2.30.1
+
