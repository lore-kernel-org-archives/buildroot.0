From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 May 2018 19:35:36 +0200
Subject: [Buildroot] [git commit] package/expect: download tarball instead
 of cvs
Message-ID: <20180531173716.E51F98366F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23ab6cb162b7456925e2c3df4917cf9b45868d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

More than 3 years after the 5.45.3 release, a tarball for that release
was uploaded to sourceforge.net. The differences between this tarball
and the CVS checkout are minimal:

- There are no CVS directories, of course, but we don't need them.
- File timestamps are different.
- expect.tests is missing, but we don't execute tests anyway.
- configure script is different, but we AUTORECONF anyway.
- 'fixcat' script is missing, but it is not called anywhere.

Since sourceforge.net has broken CVS downloads, now is a good time to
switch away from it.

While we're at it, add a hash file including license.

Fixes:
http://autobuild.buildroot.net/results/db3/db33d4fa507fb3b4132423cd0a7e25a1fe6e4105
http://autobuild.buildroot.net/results/b6d/b6d927dcc73ac8d754422577dacefff4ff918a5c
http://autobuild.buildroot.net/results/23d/23d1034b33d0354de15de2ec4a8ccd0603e8db78
http://autobuild.buildroot.net/results/127/1272a3aa3077e434c9805ec3034f35e6fcc330d4

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expect/expect.hash | 4 ++++
 package/expect/expect.mk   | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/expect/expect.hash b/package/expect/expect.hash
new file mode 100644
index 0000000000..c89f323906
--- /dev/null
+++ b/package/expect/expect.hash
@@ -0,0 +1,4 @@
+# From https://sourceforge.net/projects/expect/files/Expect/5.45.3/expect5.45.3.tar.gz.SHA256
+sha256  c520717b7195944a69ce1492ec82ca0ac3f3baf060804e6c5ee6d505ea512be9  expect5.45.3.tar.gz
+# Locally calculated
+sha256  b2415b17dc8d9a287f4509047ef5ac3436baef7ba7c50faef5222dcdf61a2bab  README
diff --git a/package/expect/expect.mk b/package/expect/expect.mk
index d78ff6c208..ccde33a71b 100644
--- a/package/expect/expect.mk
+++ b/package/expect/expect.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-# Version 5.45.3
-EXPECT_VERSION = 2014-05-02
-EXPECT_SITE = cvs://expect.cvs.sourceforge.net:/cvsroot/expect
+EXPECT_VERSION = 5.45.3
+EXPECT_SITE = https://sourceforge.net/projects/expect/files/Expect/$(EXPECT_VERSION)
+EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
 EXPECT_LICENSE = Public domain
 EXPECT_LICENSE_FILES = README
 
+# 0001-enable-cross-compilation.patch
 EXPECT_AUTORECONF = YES
 EXPECT_DEPENDENCIES = tcl
 EXPECT_CONF_OPTS = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
