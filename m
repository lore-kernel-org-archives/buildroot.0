From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Tue, 27 May 2014 12:45:38 +0400
Subject: [Buildroot] [PATCH] gdb: Reenable makeinfo for GDB from git
Message-ID: <1401180338-18317-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This effectively reverts commit 21aaa85 for GDB versions that use Git
instead of upstream tarballs. When building GDB from Git it is required to
compile .info files from .texi files, otherwise build fails.

This fixes:
http://autobuild.buildroot.net/results/df6/df64fe6e834f016267f522f089e00a08b1fd893e/
http://autobuild.buildroot.net/results/95f/95fa2904f81a114abfa337dcce141b7c87d5a52c/

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/gdb/gdb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index c3fca40..50bbf20 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -50,8 +50,10 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
+ifneq ($(GDB_FROM_GIT),y)
 HOST_GDB_CONF_ENV = \
 	ac_cv_prog_MAKEINFO=missing
+endif
 
 GDB_CONF_ENV = \
 	ac_cv_prog_MAKEINFO=missing \
-- 
1.8.4.1
