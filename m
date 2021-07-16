From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Jul 2021 19:20:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: fix build with
 libmaxminddb
Message-ID: <20210716172016.207663-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Build with libmaxminddb is broken since bump to version 3.0.5 in commit
464d0be380c84ac7c3f1684e49153c3868280d7e because of
https://github.com/SpiderLabs/ModSecurity/commit/785958f9b5089b918c7d054cbcc2fe4a3c7b3788

So revert this commit until upstream answer to comment to
https://github.com/SpiderLabs/ModSecurity/issues/2131

Fixes:
 - http://autobuild.buildroot.org/results/4c639fd967faa06f8ae362bacd38f3409c47267c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Revert-Fix-maxminddb-link-on-FreeBSD.patch | 28 +++++++++++++++++++
 package/libmodsecurity/libmodsecurity.mk      |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch

diff --git a/package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch b/package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
new file mode 100644
index 0000000000..9608e3d935
--- /dev/null
+++ b/package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
@@ -0,0 +1,28 @@
+From 6737dc133cb4811a000c02b4e0a92b72f0b220ee Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Jul 2021 19:12:51 +0200
+Subject: [PATCH] Revert "Fix maxminddb link on FreeBSD"
+
+This reverts commit 785958f9b5089b918c7d054cbcc2fe4a3c7b3788.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/libmaxmind.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/libmaxmind.m4 b/build/libmaxmind.m4
+index 656fc250..02820b5a 100644
+--- a/build/libmaxmind.m4
++++ b/build/libmaxmind.m4
+@@ -10,7 +10,7 @@ dnl  MAXMIND_VERSION
+ AC_DEFUN([PROG_MAXMIND], [
+ 
+ # Possible names for the maxmind library/package (pkg-config)
+-MAXMIND_POSSIBLE_LIB_NAMES="maxminddb maxmind"
++MAXMIND_POSSIBLE_LIB_NAMES="libmaxminddb maxminddb maxmind"
+ 
+ # Possible extensions for the library
+ MAXMIND_POSSIBLE_EXTENSIONS="so la sl dll dylib"
+-- 
+2.30.2
+
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index b2637257b6..66e7e522a1 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -12,6 +12,8 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
+# We're patching build/libmaxmind.m4
+LIBMODSECURITY_AUTORECONF = YES
 
 LIBMODSECURITY_DEPENDENCIES = pcre
 LIBMODSECURITY_CONF_OPTS = \
-- 
2.30.2
