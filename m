From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 15 Jul 2016 12:49:23 -0400
Subject: [Buildroot] [v2 1/1] package/audit: Bump to version 2.6.5
Message-ID: <1468601363-12822-1-git-send-email-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Removed 0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch
  as this was applied upstream.

- Removed 0002-Fix-usage-of-audit_status.feature_bitmap.patch as this was
  applied upstream.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
Changes v1 - v2:
  - Removed 0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch.
  - Removed AUDIT_AUTORECONF = YES from Makefile along with preceding comment


 ...les.c-define-EHWPOISON-when-not-available.patch | 44 ----------------
 ...-Fix-usage-of-audit_status.feature_bitmap.patch | 59 ----------------------
 package/audit/audit.hash                           |  2 +-
 package/audit/audit.mk                             |  2 +-
 4 files changed, 2 insertions(+), 105 deletions(-)
 delete mode 100644 package/audit/0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch
 delete mode 100644 package/audit/0002-Fix-usage-of-audit_status.feature_bitmap.patch

diff --git a/package/audit/0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch b/package/audit/0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch
deleted file mode 100644
index 8880d6c..0000000
--- a/package/audit/0001-lib-gen_tables.c-define-EHWPOISON-when-not-available.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ac10cdedd136689028223088ffca80b98c7bbaff Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 2 Jul 2016 10:33:34 +0200
-Subject: [PATCH] lib/gen_tables.c: define EHWPOISON when not available
-
-When building on some old system with old kernel headers, the
-gen_tables.c program (built natively) doesn't build due to missing
-EHWPOISON. This commit defines EHWPOISON to the value found in
-asm-generic kernel headers, which is correct for most (but not all
-architectures).
-
-Anyway, the whole concept of building a program on the host to generate
-a table with errno values, then built into a target program is
-inherently broken, so our fix is not more broken than the rest of the
-mechanism used by audit.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- lib/gen_tables.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/lib/gen_tables.c b/lib/gen_tables.c
-index 98f576c..d0bb7f5 100644
---- a/lib/gen_tables.c
-+++ b/lib/gen_tables.c
-@@ -55,6 +55,15 @@
- #define SHMGET          23
- #define SHMCTL          24
- 
-+/*
-+ * Values from asm-generic, might be different on other architectures,
-+ * but anyway the concept of building a program on the host to
-+ * generate errno related tables used on another architecture is
-+ * broken.
-+ */
-+#ifndef EHWPOISON
-+#define EHWPOISON	133
-+#endif
- 
- /* The ratio of table size to number of non-empty elements allowed for a
-    "direct" s2i table; if the ratio would be bigger, bsearch tables are used
--- 
-2.7.4
-
diff --git a/package/audit/0002-Fix-usage-of-audit_status.feature_bitmap.patch b/package/audit/0002-Fix-usage-of-audit_status.feature_bitmap.patch
deleted file mode 100644
index a6af43b..0000000
--- a/package/audit/0002-Fix-usage-of-audit_status.feature_bitmap.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From f9e4d6aa957c0728827d7efee44a57f887766ae6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 6 Jul 2016 20:22:11 +0200
-Subject: [PATCH] Fix usage of audit_status.feature_bitmap
-
-The feature_bitmap field of "struct audit_status" only appeared in
-kernel headers >= 3.19. However, the code using it in libaudit.c is only
-conditional on the existence of AUDIT_FEATURE_VERSION, which has been
-added in Linux 3.13.
-
-This means that building audit with kernel headers >= 3.13 but < 3.19
-currently fails:
-
-libaudit.c: In function 'load_feature_bitmap':
-libaudit.c:609:33: error: 'struct audit_status' has no member named 'feature_bitmap'
-     features_bitmap = rep.status->feature_bitmap;
-                                 ^
-libaudit.c: In function 'audit_rule_fieldpair_data':
-libaudit.c:1424:9: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
-         4294967295;
-
-This commit fixes that by testing the availability of the feature_bitmap
-field.
-
-Submitted upstream: https://www.redhat.com/archives/linux-audit/2016-July/msg00022.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac   | 1 +
- lib/libaudit.c | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 219720b..00788c4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,6 +64,7 @@ AC_CHECK_SIZEOF([unsigned int])
- AC_CHECK_SIZEOF([unsigned long])
- AM_PROG_CC_C_O
- AC_CHECK_DECLS([AUDIT_FEATURE_VERSION], [], [], [[#include <linux/audit.h>]])
-+AC_CHECK_MEMBERS([struct audit_status.feature_bitmap], [], [], [[#include <linux/audit.h>]])
- AC_CHECK_DECLS([AUDIT_VERSION_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
- AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
- dnl; posix_fallocate is used in audisp-remote
-diff --git a/lib/libaudit.c b/lib/libaudit.c
-index 2c96f29..510d841 100644
---- a/lib/libaudit.c
-+++ b/lib/libaudit.c
-@@ -579,7 +579,7 @@ static void load_feature_bitmap(void)
- 		return;
- 	}
- 
--#if HAVE_DECL_AUDIT_FEATURE_VERSION
-+#if defined(HAVE_DECL_AUDIT_FEATURE_VERSION) && defined(HAVE_STRUCT_AUDIT_STATUS_FEATURE_BITMAP)
- 	if ((rc = audit_request_status(fd)) > 0) {
- 		struct audit_reply rep;
- 		int i;
--- 
-2.7.4
-
diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 8d6649b..75b0197 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	016a101d6f8f5608ff90355b49adeb2848990ab2fdbb0933c3e09ac8c95db1d9	audit-2.6.3.tar.gz
+sha256	a9c4bc0b95ffabc364f7de67ea694bab7045b120f396a2b149399a17138592bf	audit-2.6.5.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 4cc87d1..89fdf14 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.6.3
+AUDIT_VERSION = 2.6.5
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
-- 
2.7.4
