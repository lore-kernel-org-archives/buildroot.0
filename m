From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Apr 2021 11:11:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/s6-linux-init: bump to version
 1.0.6.1
Message-ID: <20210411091104.222559-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build is broken since bump of skalibs to version 2.10.0.2 in commit
4d5587cb56224b2b28f53b0202fb14b2ab32d5fb because skalibs removed
webipc.h in version 2.10.0.0 and
https://github.com/skarnet/skalibs/commit/e557bab0dcaf35f003fa755b74e4c80000e05e42

So bump to version 1.0.6.1 to retrieve the following commit
https://github.com/skarnet/s6-linux-init/commit/ca8d2c96ea09cb33ff6fef33c0314c24fc6a026a

Update hash of COPYING (update in year:
https://github.com/skarnet/s6-linux-init/commit/5e17662d138fc9c9f70a4422eab059c2bdc9432d
https://github.com/skarnet/s6-linux-init/commit/1de5c2d7c63916b11668078445e5f75c054bc898)

While at it, also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/fe879267675a80bfc5ba17341144feeee53dc197

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure-add-D_GNU_SOURCE.patch     | 40 +++++++++++++++++++
 package/s6-linux-init/s6-linux-init.hash      |  4 +-
 package/s6-linux-init/s6-linux-init.mk        |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch

diff --git a/package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch b/package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch
new file mode 100644
index 0000000000..e9a272679e
--- /dev/null
+++ b/package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch
@@ -0,0 +1,40 @@
+From dadb157df58e79c7f560cacae80ea51953606fca Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 11 Apr 2021 11:02:20 +0200
+Subject: [PATCH] configure: add -D_GNU_SOURCE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This will fix the following build failure with uclibc-ng which is raised
+since version 1.0.6.1 and
+https://github.com/skarnet/s6-linux-init/commit/355a75e08bbc8af8af97576bad07471dd1b431d8:
+
+src/shutdown/s6-linux-init-shutdownd.c: In function ?main?:
+src/shutdown/s6-linux-init-shutdownd.c:294:24: error: ?F_DUPFD_CLOEXEC? undeclared (first use in this function); did you mean ?FD_CLOEXEC??
+  294 |       fd[0] = fcntl(1, F_DUPFD_CLOEXEC, 0) ;
+      |                        ^~~~~~~~~~~~~~~
+      |                        FD_CLOEXEC
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/skarnet/s6-linux-init/pull/3]
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 47db5b2..90fbb3b 100755
+--- a/configure
++++ b/configure
+@@ -138,7 +138,7 @@ getmacrostring () {
+ # Actual script
+ 
+ CC_AUTO=
+-CPPFLAGS_AUTO="-D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -iquote src/include-local -Isrc/include"
++CPPFLAGS_AUTO="-D_GNU_SOURCE -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -iquote src/include-local -Isrc/include"
+ CPPFLAGS_POST="$CPPFLAGS"
+ CPPFLAGS=
+ CFLAGS_AUTO="-pipe -Wall"
+-- 
+2.30.2
+
diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index bc2f7072ca..5f3a8d41b8 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 216af5589c2bc5dbdea6b6c94d55575c12e31f57b2e0fde5c534a840aeed02fb  s6-linux-init-1.0.3.1.tar.gz
-sha256 487e89990a571700bcdf7c0cbbde2859446f79e85e8b59791adab98fff6b1889  COPYING
+sha256  16f6c84f3c4825ca8b244b89693569d8f69db98c485bd958301a079586f2086b  s6-linux-init-1.0.6.1.tar.gz
+sha256  4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 71c727de02..efd4984085 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.0.3.1
+S6_LINUX_INIT_VERSION = 1.0.6.1
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
-- 
2.30.2
