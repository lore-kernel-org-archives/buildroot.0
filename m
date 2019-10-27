From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 27 Oct 2019 10:02:52 +0100
Subject: [Buildroot] [PATCH] package/glog: bump to version 0.4.0
Message-ID: <20191027090252.28853-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fixed a build issue reported by test-pkg.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 ...ts-some-tests-require-HAVE_STACKTRAC.patch | 39 +++++++++++++++++++
 package/glog/glog.hash                        |  2 +-
 package/glog/glog.mk                          |  5 ++-
 3 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch

diff --git a/package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch b/package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch
new file mode 100644
index 0000000000..10a84fbbe0
--- /dev/null
+++ b/package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch
@@ -0,0 +1,39 @@
+From 87b41094299cdc626876085549725ed0205ca830 Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Sat, 26 Oct 2019 19:10:43 +0200
+Subject: [PATCH] symbolize_unitests: some tests require HAVE_STACKTRACE
+ defined to be run
+
+The following test cases functions:
+-  TestWithPCInsideInlineFunction
+-  TestWithPCInsideNonInlineFunction
+-  TestWithReturnAddress
+are defined if HAVE_STACKTRACE is defined
+
+Make sure they are invoked under the same condition
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ src/symbolize_unittest.cc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/symbolize_unittest.cc b/src/symbolize_unittest.cc
+index 9a17e7b..e11470e 100644
+--- a/src/symbolize_unittest.cc
++++ b/src/symbolize_unittest.cc
+@@ -407,9 +407,12 @@ int main(int argc, char **argv) {
+   // used to install some callback function at InitGoogle() time.
+   InstallSymbolizeCallback(NULL);
+
++# if defined(HAVE_STACKTRACE)
+   TestWithPCInsideInlineFunction();
+   TestWithPCInsideNonInlineFunction();
+   TestWithReturnAddress();
++# endif
++
+   return RUN_ALL_TESTS();
+ # elif defined(OS_WINDOWS) || defined(OS_CYGWIN)
+   TestWithReturnAddress();
+-- 
+2.17.1
+
diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index 6d75c32284..b9ba665400 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0  glog-0.3.5.tar.gz
+sha256 f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c  glog-0.4.0.tar.gz
 
 # Hash for License file:
 sha256 0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 39bcf82ef8..6974f7bac7 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-GLOG_VERSION = 0.3.5
+GLOG_VERSION = 0.4.0
 GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
 GLOG_LICENSE_FILES = COPYING
 
+# No configure script provided, so we need autoreconf
+GLOG_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
 GLOG_DEPENDENCIES = gflags
 endif
-- 
2.17.1
