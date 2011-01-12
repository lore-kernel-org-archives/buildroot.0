From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jan 2011 15:57:52 -0300
Subject: [Buildroot] [PATCH 2/3] uclibc: add SOCK_CLOEXEC and SOCK_NONBLOCK
	support
In-Reply-To: <1294858673-25760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294858673-25760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294858673-25760-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add SOCK_CLOEXEC and SOCK_NONBLOCK support to uclibc.

Required to use a modern udev.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../uClibc/uClibc-0.9.31-add-sock-cloexec.patch    |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-add-sock-cloexec.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31-add-sock-cloexec.patch b/toolchain/uClibc/uClibc-0.9.31-add-sock-cloexec.patch
new file mode 100644
index 0000000..a7089a9
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-add-sock-cloexec.patch
@@ -0,0 +1,43 @@
+From 83333e9c873e4eca6b2c945f7770b1f5373b0427 Mon Sep 17 00:00:00 2001
+From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Date: Tue, 1 Jun 2010 20:02:39 +0400
+Subject: [PATCH] bits/socket.h: add SOCK_CLOEXEC and SOCK_NONBLOCK support
+
+This patch adds support for SOCK_CLOEXEC and SOCK_NONBLOCK socket
+descriptor flags, which are introduced since Linux 2.6.27
+
+Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/sysdeps/linux/common/bits/socket.h |   12 +++++++++++-
+ 1 files changed, 11 insertions(+), 1 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/bits/socket.h b/libc/sysdeps/linux/common/bits/socket.h
+index ac5a433..11f6e97 100644
+--- a/libc/sysdeps/linux/common/bits/socket.h
++++ b/libc/sysdeps/linux/common/bits/socket.h
+@@ -53,10 +53,20 @@ enum __socket_type
+   SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
+ 				   datagrams of fixed maximum length.  */
+ #define SOCK_SEQPACKET SOCK_SEQPACKET
+-  SOCK_PACKET = 10		/* Linux specific way of getting packets
++  SOCK_PACKET = 10,		/* Linux specific way of getting packets
+ 				   at the dev level.  For writing rarp and
+ 				   other similar things on the user level. */
+ #define SOCK_PACKET SOCK_PACKET
++
++  /* Flags to be ORed into the type parameter of socket and socketpair and
++     used for the flags parameter of paccept.  */
++
++  SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
++				   new descriptor(s).  */
++#define SOCK_CLOEXEC SOCK_CLOEXEC
++  SOCK_NONBLOCK = 04000		/* Atomically mark descriptor(s) as
++				   non-blocking.  */
++#define SOCK_NONBLOCK SOCK_NONBLOCK
+ };
+ 
+ /* Protocol families.  */
+-- 
+1.7.3.4
+
-- 
1.7.3.4
