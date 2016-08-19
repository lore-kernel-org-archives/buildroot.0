From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Fri, 19 Aug 2016 22:45:03 +0530
Subject: [Buildroot] [PATCH v2 master 1/2] logrotate: fix up build error
	with gcc 6
Message-ID: <1471626904-29215-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With gcc version 6, we see following warnings.

  logrotate.c: In function 'postrotateSingleLog':
  logrotate.c:1784:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
       if (!state->doRotate)
       ^~
  logrotate.c:1787:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
    if (!hasErrors && log->flags & LOG_FLAG_TMPFILENAME) {
    ^~
Add a upstream patch to fix above warning.

  config.c: In function 'strndup':
  config.c:87:10: error: nonnull argument 's' compared to NULL [-Werror=nonnull-compare]
          if(!s)
            ^
  cc1: all warnings being treated as errors
  make[2]: *** [config.o] Error 1
  make[2]: *** Waiting for unfinished jobs....
  cc1: all warnings being treated as errors
  make[2]: *** [logrotate.o] Error 1

Add a patch to drop check for nonnull to fix above warning.

Fixes:

  http://autobuild.buildroot.net/results/6dc/6dc2eb22104076920d77425b1e608ef9b9e01c94/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
Changes v1 -> v2:
  - Add upstream patch to fix second build issues instead of
    version bump on master branch. (Suggested by Thomas Petazzoni)
---
 .../logrotate/0002-fix-up-warning-with-gcc6.patch  | 31 ++++++++++++++++++++++
 package/logrotate/logrotate.hash                   |  1 +
 package/logrotate/logrotate.mk                     |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 package/logrotate/0002-fix-up-warning-with-gcc6.patch

diff --git a/package/logrotate/0002-fix-up-warning-with-gcc6.patch b/package/logrotate/0002-fix-up-warning-with-gcc6.patch
new file mode 100644
index 0000000..49abca3
--- /dev/null
+++ b/package/logrotate/0002-fix-up-warning-with-gcc6.patch
@@ -0,0 +1,31 @@
+fix up warning with gcc6
+
+With gcc version 6, we see following warning.
+
+  config.c: In function 'strndup':
+  config.c:87:10: error: nonnull argument 's' compared to NULL [-Werror=nonnull-compare]
+          if(!s)
+            ^
+  cc1: all warnings being treated as errors
+
+strndup is declared with nonnull attribute for first parameter. In such
+cases, gcc 6 warns when we check for nonnull explicitly. So drop the
+check for nonnull.
+
+This build is found by Buildroot autobuilder.
+http://autobuild.buildroot.net/results/6dc/6dc2eb22104076920d77425b1e608ef9b9e01c94/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+
+--- logrotate-3.9.2/config.c.old	2016-08-18 22:11:53.881100685 +0530
++++ logrotate-3.9.2/config.c	2016-08-18 22:12:58.913100548 +0530
+@@ -84,9 +84,6 @@ char *strndup(const char *s, size_t n)
+        size_t nAvail;
+        char *p;
+ 
+-       if(!s)
+-               return NULL;
+-
+        /* min() */
+        nAvail = strlen(s) + 1;
+        if ( (n + 1) < nAvail)
diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 77d4dc8..8dee715 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 2de00c65e23fa9d7909cae6594e550b9abe9a7eb1553669ddeaca92d30f97009 logrotate-3.9.2.tar.gz
+sha256 e0d360908ac506e02f08fa1ad70e17d6985045d8640f383fef8f322886d6e1e1 6a36c105587b07ad14fc937f3ee6e2eb402621a2.patch
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index de4d837..38f183c 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -13,6 +13,7 @@ LOGROTATE_DEPENDENCIES = popt host-pkgconf
 LOGROTATE_AUTORECONF = YES
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 LOGROTATE_CONF_OPTS = --without-selinux
+LOGROTATE_PATCH = https://github.com/logrotate/logrotate/commit/6a36c105587b07ad14fc937f3ee6e2eb402621a2.patch
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 LOGROTATE_DEPENDENCIES += acl
-- 
2.6.2
