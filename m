From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:36:35 +0200
Subject: [Buildroot] [git commit] lzop: fix build of host variant with gcc6
Message-ID: <20160701144044.9BCB67FD4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=040c9e14edeab0c6173f72c0a1e765fc5a3a58ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jaap Crezee <jaap@jcz.nl>
[Thomas: minor tweaks in commit log and patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzop/0001-build-with-gcc6.patch | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/lzop/0001-build-with-gcc6.patch b/package/lzop/0001-build-with-gcc6.patch
new file mode 100644
index 0000000..774ee54
--- /dev/null
+++ b/package/lzop/0001-build-with-gcc6.patch
@@ -0,0 +1,37 @@
+From: Jaap Crezee <jaap@jcz.nl>
+Date: Sat, 25 june 2016 13:13:00 +0200
+Subject: [PATCH 1/1] fix compilation host-lzop with gcc-6
+
+This patch allows host-lzop to be compiled with host systems containing gcc-6
+
+Upstream patch found here:
+https://build.opensuse.org/package/view_file/Archiving/lzop/lzop-1.03-gcc6.patch?expand=1
+
+Signed-off-by: Jaap Crezee <jaap@jcz.nl>
+
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
