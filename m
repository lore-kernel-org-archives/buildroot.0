From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jan 2011 15:57:51 -0300
Subject: [Buildroot] [PATCH 1/3] uclibc: add BSD endian conversions
In-Reply-To: <1294858673-25760-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294858673-25760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294858673-25760-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add BSD endian conversion routines.

Required to use a modern udev.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../uClibc-0.9.31-add-bsd-endian-conversions.patch |   64 ++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-add-bsd-endian-conversions.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31-add-bsd-endian-conversions.patch b/toolchain/uClibc/uClibc-0.9.31-add-bsd-endian-conversions.patch
new file mode 100644
index 0000000..652d7c9
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-add-bsd-endian-conversions.patch
@@ -0,0 +1,64 @@
+From c6d6237819037168a6923ac080e348e54615422c Mon Sep 17 00:00:00 2001
+From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Date: Tue, 1 Jun 2010 23:22:57 +0400
+Subject: [PATCH] endian.h: add BSD convertions between big/little-endian byte order
+
+This patch adds support for convertion of values between host and
+big-/little-endian byte order.
+
+Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ include/endian.h |   38 ++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 38 insertions(+), 0 deletions(-)
+
+diff --git a/include/endian.h b/include/endian.h
+index 2f7bce1..0ba7384 100644
+--- a/include/endian.h
++++ b/include/endian.h
+@@ -55,4 +55,42 @@
+ # define __LONG_LONG_PAIR(HI, LO) HI, LO
+ #endif
+ 
++
++#ifdef __USE_BSD
++/* Conversion interfaces.  */
++# include <byteswap.h>
++
++# if __BYTE_ORDER == __LITTLE_ENDIAN
++#  define htobe16(x) __bswap_16 (x)
++#  define htole16(x) (x)
++#  define be16toh(x) __bswap_16 (x)
++#  define le16toh(x) (x)
++
++#  define htobe32(x) __bswap_32 (x)
++#  define htole32(x) (x)
++#  define be32toh(x) __bswap_32 (x)
++#  define le32toh(x) (x)
++
++#  define htobe64(x) __bswap_64 (x)
++#  define htole64(x) (x)
++#  define be64toh(x) __bswap_64 (x)
++#  define le64toh(x) (x)
++# else
++#  define htobe16(x) (x)
++#  define htole16(x) __bswap_16 (x)
++#  define be16toh(x) (x)
++#  define le16toh(x) __bswap_16 (x)
++
++#  define htobe32(x) (x)
++#  define htole32(x) __bswap_32 (x)
++#  define be32toh(x) (x)
++#  define le32toh(x) __bswap_32 (x)
++
++#  define htobe64(x) (x)
++#  define htole64(x) __bswap_64 (x)
++#  define be64toh(x) (x)
++#  define le64toh(x) __bswap_64 (x)
++# endif
++#endif
++
+ #endif	/* endian.h */
+-- 
+1.7.3.4
+
-- 
1.7.3.4
