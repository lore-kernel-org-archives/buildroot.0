From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Mar 2016 10:16:33 +0000
Subject: [Buildroot] [PATCH v2] gdb: specify where to find lzma libraries
Message-ID: <1457691393-48436-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported in...

  https://bugs.busybox.net/show_bug.cgi?id=8786

..., gdb fails to build with xz and expat support at the same time when
using an external toolchain.

This is how the problem is shown:

checking for liblzma... no
configure: error: missing liblzma for --with-lzma

And having a deeper look in gdb/config.log we can se a message like this
one:

/lib64/liblzma.so.5: undefined reference to `clock_gettime at GLIBC_2.17'

As Thomas said in the bug report quoted above, that error is related to
the fact that it find the host's lzma.

Adding --with-lzma-prefix=$(STAGING_DIR)/usr to GDB_CONF_OPTS fixes the
problem.

Credit-to: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Adding --with-lzma-prefix=$(HOST_DIR)/usr to GDB_CONF_OPTS is wrong.
   Instead, we should add --with-lzma-prefix=$(STAGING_DIR)/usr. Thanks
   to Peter Korsgaard for highlighting the mistake.

 package/gdb/gdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 32d52eb..f7d6339 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -120,6 +120,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 GDB_CONF_OPTS += --with-lzma
+GDB_CONF_OPTS += --with-liblzma-prefix=$(STAGING_DIR)/usr
 GDB_DEPENDENCIES += xz
 else
 GDB_CONF_OPTS += --without-lzma
-- 
2.4.10
