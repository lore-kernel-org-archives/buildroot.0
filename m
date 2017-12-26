From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 19:46:21 +0100
Subject: [Buildroot] [git commit] package/libpqxx: fix broken sed call
Message-ID: <20171226184751.3E65783651@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de035220aa17cfa223a2de8d5d1233d95d6dd0e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport 2 upstream fix.

Fixes:
http://autobuild.buildroot.net/results/0d1/0d131f9fa5cce259d999f7d57f9092675bfc24c7

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Fix-broken-sed-call-in-configure.ac.in.patch | 31 ++++++++++++++++++++++
 package/libpqxx/libpqxx.mk                         |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/package/libpqxx/0001-Fix-broken-sed-call-in-configure.ac.in.patch b/package/libpqxx/0001-Fix-broken-sed-call-in-configure.ac.in.patch
new file mode 100644
index 0000000..672133a
--- /dev/null
+++ b/package/libpqxx/0001-Fix-broken-sed-call-in-configure.ac.in.patch
@@ -0,0 +1,31 @@
+From d5120738a9b6b90d19e742f3c591727d16d76c9c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 26 Dec 2017 14:09:46 +0100
+Subject: [PATCH] Fix broken sed call in configure.ac.in
+
+Upstream fix from commit [1][2]
+
+[1] 80a9d5386641ac67d4ea1b602c786b45b40b252f
+[2] 85e9336740475be25ed19924cca0961f7d844c4b
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 32cf5cb5..77cf7edd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -480,7 +480,7 @@ occurring in the file.
+ ])], -L${with_postgres_lib})
+ 
+ # Remove redundant occurrances of -lpq
+-LIBS="`echo "$LIBS" | sed -e 's/-lpq[[:space:]]*[[:space:]]-lpq\>/-lpq/g'`"
++LIBS=[`echo "$LIBS" | sed -e 's/-lpq * -lpq\>/-lpq/g'`]
+ 
+ AC_LANG_POP(C)
+ 
+-- 
+2.14.3
+
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index ec6a3bc..6a8c37a 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -11,6 +11,9 @@ LIBPQXX_DEPENDENCIES = postgresql
 LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
+# 0001-Fix-broken-sed-call-in-configure.ac.in.patch
+LIBPQXX_AUTORECONF = YES
+
 LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
 
 $(eval $(autotools-package))
