From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:16:25 +0200
Subject: [Buildroot] [git commit] uclibc: fix networking support on sparc
Message-ID: <20140729181712.2CFB29D09B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edeee941c8e20fa5aad8edd5448553e89e7e858c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While updating the default config for Sparc, I noticed that networking
is broken. The reason is a uClibc backport patch from uClibc
master. This commit adds a fix on top of it, which was submitted to
upstream uClibc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uclibc-0061-fix-sparc-networking.patch         |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch b/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch
new file mode 100644
index 0000000..1272950
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch
@@ -0,0 +1,39 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+Bug introduced by uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch
+Sent upstream: http://lists.uclibc.org/pipermail/uclibc/2014-July/048438.html
+
+diff -Nur uClibc-0.9.33.2.orig/libc/inet/socketcalls.c uClibc-0.9.33.2/libc/inet/socketcalls.c
+--- uClibc-0.9.33.2.orig/libc/inet/socketcalls.c	2012-05-15 09:20:09.000000000 +0200
++++ uClibc-0.9.33.2/libc/inet/socketcalls.c	2014-07-28 14:50:52.477479493 +0200
+@@ -34,6 +34,30 @@
+ #define SYS_ACCEPT4     18
+ #endif
+ 
++/* for sparc: __NR_socket and others are defined, but syscalls are not implemen
++/* see http://lists.busybox.net/pipermail/uclibc/2004-March/029424.html */
++#ifdef __sparc__
++#undef __NR_accept
++#undef __NR_accept4
++#undef __NR_bind
++#undef __NR_connect
++#undef __NR_getpeername
++#undef __NR_getsockname
++#undef __NR_getsockopt
++#undef __NR_listen
++#undef __NR_recv
++#undef __NR_recvfrom
++#undef __NR_recvmsg
++#undef __NR_send
++#undef __NR_sendmsg
++#undef __NR_sendto
++#undef __NR_setsockopt
++#undef __NR_shutdown
++#undef __NR_socket
++#undef __NR_socketpair
++#endif
++
++
+ #ifdef __UCLIBC_HAS_THREADS_NATIVE__
+ #include <sysdep-cancel.h>
+ #include <pthreadP.h>
