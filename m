From: Jaap Crezee <jaap@jcz.nl>
Date: Thu, 16 Jun 2016 07:47:44 +0200
Subject: [Buildroot] [PATCH 1/1] lzop: fix for compiling host-lzop using
	gcc-6
Message-ID: <20160616054744.4092-1-jaap@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

src/miniacc.h: some changes (found upstream, but tweaked) to get gcc-6 to
compile lzop in the form of host-lzop with a gcc-6 based host system.

Signed-off-by: Jaap Crezee <jaap@jcz.nl>
---
 package/lzop/001-host-gcc-6.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/lzop/001-host-gcc-6.patch

diff --git a/package/lzop/001-host-gcc-6.patch b/package/lzop/001-host-gcc-6.patch
new file mode 100644
index 0000000..852debe
--- /dev/null
+++ b/package/lzop/001-host-gcc-6.patch
@@ -0,0 +1,26 @@
+--- a/src/miniacc.h.orig   2016-02-10 16:09:23.247315866 +0100
++++ b/src/miniacc.h   2016-02-10 16:12:14.973297054 +0100
+@@ -4469,12 +4469,12 @@
+ #if defined(__MSDOS__) && defined(__TURBOC__) && (__TURBOC__ < 0x0150)
+ #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #else
+-    ACCCHK_ASSERT((1   << (8*SIZEOF_INT-1)) < 0)
++    ACCCHK_ASSERT((int)(1u   << (8*SIZEOF_INT-1)) < 0)
+ #endif
+     ACCCHK_ASSERT((1u  << (8*SIZEOF_INT-1)) > 0)
+ #if 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #else
+-    ACCCHK_ASSERT((1l  << (8*SIZEOF_LONG-1)) < 0)
++    ACCCHK_ASSERT((long)(1ul  << (8*SIZEOF_LONG-1)) < 0)
+ #endif
+     ACCCHK_ASSERT((1ul << (8*SIZEOF_LONG-1)) > 0)
+ #if defined(acc_int16e_t)
+@@ -4703,7 +4703,7 @@
+ #elif 1 && (ACC_CC_LCC || ACC_CC_LCCWIN32) && !defined(ACCCHK_CFG_PEDANTIC)
+ #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #elif !(ACC_BROKEN_INTEGRAL_PROMOTION) && (SIZEOF_INT > 1)
+-    ACCCHK_ASSERT( (((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
++    ACCCHK_ASSERT( (int)((unsigned int)((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
+ #endif
+ #if (ACC_CC_BORLANDC && (__BORLANDC__ >= 0x0530) && (__BORLANDC__ < 0x0560))
+ #  pragma option pop
-- 
2.8.3
