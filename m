From: Markos Chandras <markos.chandras@imgtec.com>
Date: Fri, 30 Aug 2013 11:17:23 +0100
Subject: [Buildroot] [PATCH] ltrace: Add missing mips->mipsel symlink
Message-ID: <1377857843-7453-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Restore missing mips->mipsel symlink. It appears ltrace was
packaged incorrectly and the symlink got lost. See
http://lists.alioth.debian.org/pipermail/ltrace-devel/2013-August/000938.html

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/ltrace/ltrace.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 55930b8..08d6276 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -13,6 +13,12 @@ LTRACE_CONF_OPT = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
 
+define LTRACE_MIPS_SYMLINK
+	cd $(@D)/sysdeps/linux-gnu; ln -sf mipsel mips
+endef
+
+LTRACE_POST_EXTRACT_HOOKS += LTRACE_MIPS_SYMLINK
+
 # ltrace can use libunwind only if libc has backtrace() support
 # We don't normally do so for uClibc and we can't know if it's external
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
1.8.3.2
