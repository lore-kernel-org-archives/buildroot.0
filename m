From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:51:47 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/subversion: drop
 first patch
Message-ID: <20210214163455.87BBE80057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6df7b9c7b8d946ddc1282386803c35a8db4817a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

First patch is not needed since version 1.8.0 and
https://github.com/apache/subversion/commit/f071ec0c26cdf47e89fa90b31d2233ee1a2b00c2

Indeed, as spotted by upstream when sending them this patch, the
original expressions will not mangle '-mfloat-gprs=double' because the
patterns contain a trailing space.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9670aa285250e1ee4fc44fa0134137961494cdeb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/0001-dont-mangle-cflags.patch   | 24 ----------------------
 ...e.patch => 0001-workaround-ac-run-ifelse.patch} |  0
 2 files changed, 24 deletions(-)

diff --git a/package/subversion/0001-dont-mangle-cflags.patch b/package/subversion/0001-dont-mangle-cflags.patch
deleted file mode 100644
index adb8b8e933..0000000000
--- a/package/subversion/0001-dont-mangle-cflags.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-[PATCH] configure.ac: don't mangle CFLAGS
-
-Ensure that the sed expression to strip debugging options from CFLAGS
-doesn't mangle flags like -mfloat-gprs=double, breaking the build.
-
-[Vincent: adapt to 1.9.2 and patch configure.ac instead of configure]
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -Nrup a/configure.ac b/configure.ac
---- a/configure.ac	2015-07-27 00:03:10.000000000 +0100
-+++ b/configure.ac	2015-09-28 10:33:39.175048493 +0100
-@@ -1110,8 +1110,8 @@ if test "$enable_debugging" = "yes" ; th
-   CXXFLAGS="$CXXFLAGS -DSVN_DEBUG -DAP_DEBUG"
- elif test "$enable_debugging" = "no" ; then
-   AC_MSG_NOTICE([Disabling debugging])
--  CFLAGS=["`echo $CFLAGS' ' | $SED -e 's/-g[0-9] //g' -e 's/-g //g'`"]
--  CXXFLAGS=["`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9] //g' -e 's/-g //g'`"]
-+  CFLAGS=["`echo $CFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"]
-+  CXXFLAGS=["`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"]
-   dnl Compile with NDEBUG to get rid of assertions
-   CFLAGS="$CFLAGS -DNDEBUG"
-   CXXFLAGS="$CXXFLAGS -DNDEBUG"
diff --git a/package/subversion/0002-workaround-ac-run-ifelse.patch b/package/subversion/0001-workaround-ac-run-ifelse.patch
similarity index 100%
rename from package/subversion/0002-workaround-ac-run-ifelse.patch
rename to package/subversion/0001-workaround-ac-run-ifelse.patch
