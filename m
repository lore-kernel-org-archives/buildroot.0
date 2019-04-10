From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Apr 2019 10:26:00 +0200
Subject: [Buildroot] [PATCH] package/syslog-ng: fix segfault on startup due
 to pthread_atfork
Message-ID: <20190410082600.29086-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

syslog-ng may segfault at startup (during library initialization, before
reaching main) in newer toolchains. I have witnessed it on aarch64 (but with
32-bit arm userland) with glibc 2.28.

Problem is described in syslog-ng issue #2263 [1], which in turn leads to a
problem in 'ivykis' which is shipped with syslog-ng, see ivykis issue #15
[2].

Root cause is that 'pthread_atfork' is used by ivykis but searched by its
configure script in libpthread_nonshared only. In newer toolchains, it seems
this symbol is in libc_nonshared.

Apply a patch someone proposed via pullrequest [3] to the ivykis project,
but which is at this moment not yet merged upstream.

[1] https://github.com/balabit/syslog-ng/issues/2263
[2] https://github.com/buytenh/ivykis/issues/15
[3] https://github.com/buytenh/ivykis/pull/16

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...thread-atfork-also-in-libc-nonshared.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch

diff --git a/package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch b/package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch
new file mode 100644
index 0000000000..0f8454af97
--- /dev/null
+++ b/package/syslog-ng/0003-look-for-pthread-atfork-also-in-libc-nonshared.patch
@@ -0,0 +1,49 @@
+From a844abca43349739c36a4cdb7ea6f3bce560bd7f Mon Sep 17 00:00:00 2001
+From: Rolf Eike Beer <eb@emlix.com>
+Date: Thu, 8 Nov 2018 08:14:46 +0100
+Subject: [PATCH] look for pthread_atfork() also in lib c_nonshared
+
+Newer versions of glibc do not have pthread_nonshared anymore, instead the
+symbol is in c_nonshared. This fixes a crash on start on those platforms
+(namely with syslog-ng).
+
+Signed-off-by: Rolf Eike Beer <eb@emlix.com>
+[ThomasDS: backport from https://github.com/buytenh/ivykis/pull/16, at this
+moment not yet merged upstream.
+See also:
+- https://github.com/buytenh/ivykis/issues/15
+- https://github.com/balabit/syslog-ng/issues/2263
+]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+---
+ configure.ac | 2 ++
+ src/pthr.h   | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ivykis/configure.ac b/lib/ivykis/configure.ac
+index e9b10c0..56440d1 100644
+--- a/lib/ivykis/configure.ac
++++ b/lib/ivykis/configure.ac
+@@ -88,6 +88,8 @@ esac
+ # link in libpthread_nonshared.a if it is available.
+ #
+ AC_CHECK_LIB([pthread_nonshared], [pthread_atfork])
++# the lib is gone in glibc 2.28, things are now in c_nonshared
++AC_CHECK_LIB([c_nonshared], [pthread_atfork])
+ 
+ # Checks for header files.
+ AC_CHECK_HEADERS([process.h])
+diff --git a/lib/ivykis/src/pthr.h b/lib/ivykis/src/pthr.h
+index a41eaf3..32c1af2 100644
+--- a/lib/ivykis/src/pthr.h
++++ b/lib/ivykis/src/pthr.h
+@@ -42,7 +42,7 @@ static inline int pthreads_available(void)
+  * symbol because that causes it to be undefined even if you link
+  * libpthread_nonshared.a in explicitly.
+  */
+-#ifndef HAVE_LIBPTHREAD_NONSHARED
++#if !defined(HAVE_LIBPTHREAD_NONSHARED) && !defined(HAVE_LIBC_NONSHARED)
+ #pragma weak pthread_atfork
+ #endif
+ 
-- 
2.21.0
