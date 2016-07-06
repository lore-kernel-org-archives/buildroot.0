From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:14:35 +0200
Subject: [Buildroot] [git commit] audit: fix build with older kernel versions
Message-ID: <20160706191532.167878222C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36e076a2a9508a41dc0e4d6faf3a59b93c9be077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to audit that fixes the build with kernel
headers newer than 3.13, but older than 3.19. The patch has been
submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/2d3b2f8c2b9f7f2e04b88b1dccb83e183b5876b6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Fix-usage-of-audit_status.feature_bitmap.patch | 59 ++++++++++++++++++++++
 package/audit/audit.mk                             |  2 +
 2 files changed, 61 insertions(+)

diff --git a/package/audit/0002-Fix-usage-of-audit_status.feature_bitmap.patch b/package/audit/0002-Fix-usage-of-audit_status.feature_bitmap.patch
new file mode 100644
index 0000000..a6af43b
--- /dev/null
+++ b/package/audit/0002-Fix-usage-of-audit_status.feature_bitmap.patch
@@ -0,0 +1,59 @@
+From f9e4d6aa957c0728827d7efee44a57f887766ae6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 6 Jul 2016 20:22:11 +0200
+Subject: [PATCH] Fix usage of audit_status.feature_bitmap
+
+The feature_bitmap field of "struct audit_status" only appeared in
+kernel headers >= 3.19. However, the code using it in libaudit.c is only
+conditional on the existence of AUDIT_FEATURE_VERSION, which has been
+added in Linux 3.13.
+
+This means that building audit with kernel headers >= 3.13 but < 3.19
+currently fails:
+
+libaudit.c: In function 'load_feature_bitmap':
+libaudit.c:609:33: error: 'struct audit_status' has no member named 'feature_bitmap'
+     features_bitmap = rep.status->feature_bitmap;
+                                 ^
+libaudit.c: In function 'audit_rule_fieldpair_data':
+libaudit.c:1424:9: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
+         4294967295;
+
+This commit fixes that by testing the availability of the feature_bitmap
+field.
+
+Submitted upstream: https://www.redhat.com/archives/linux-audit/2016-July/msg00022.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac   | 1 +
+ lib/libaudit.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 219720b..00788c4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,6 +64,7 @@ AC_CHECK_SIZEOF([unsigned int])
+ AC_CHECK_SIZEOF([unsigned long])
+ AM_PROG_CC_C_O
+ AC_CHECK_DECLS([AUDIT_FEATURE_VERSION], [], [], [[#include <linux/audit.h>]])
++AC_CHECK_MEMBERS([struct audit_status.feature_bitmap], [], [], [[#include <linux/audit.h>]])
+ AC_CHECK_DECLS([AUDIT_VERSION_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
+ AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
+ dnl; posix_fallocate is used in audisp-remote
+diff --git a/lib/libaudit.c b/lib/libaudit.c
+index 2c96f29..510d841 100644
+--- a/lib/libaudit.c
++++ b/lib/libaudit.c
+@@ -579,7 +579,7 @@ static void load_feature_bitmap(void)
+ 		return;
+ 	}
+ 
+-#if HAVE_DECL_AUDIT_FEATURE_VERSION
++#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
+ 	if ((rc = audit_request_status(fd)) > 0) {
+ 		struct audit_reply rep;
+ 		int i;
+-- 
+2.7.4
+
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 5486050..849b68a 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -8,6 +8,8 @@ AUDIT_VERSION = 2.6.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
+# 0002-Fix-usage-of-audit_status.feature_bitmap.patch
+AUDIT_AUTORECONF = YES
 
 AUDIT_INSTALL_STAGING = YES
 
