From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 09:44:36 -0200
Subject: [Buildroot] [PATCH 1/3] autoconf: bump to 2.68
Message-ID: <1330256678-26318-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .../autoconf-2.65-dont-add-dirty-to-version.patch  |   30 ----------------
 ...toconf-2.65-fix-m4-detection-test-on-dash.patch |   36 --------------------
 package/autoconf/autoconf.mk                       |    2 +-
 3 files changed, 1 insertions(+), 67 deletions(-)
 delete mode 100644 package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch
 delete mode 100644 package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch

diff --git a/package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch b/package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch
deleted file mode 100644
index 38ac163..0000000
--- a/package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-autoconf: don't append -dirty to version
-
-Don't append -dirty to autoconf version number if the buildroot git tree
-has uncommited changes.
-
-This script is meant for the autoconf developers, but it also activates
-if you build autoconf in a subdirectory of a git tree (E.G. like how it's
-commonly done in buildroot).
-
-The affect is that autoconf gets built as being version 2.65-dirty, which
-breaks programs (like Python) which explicitly checks for autoconf-2.65.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- build-aux/git-version-gen |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: autoconf-2.65/build-aux/git-version-gen
-===================================================================
---- autoconf-2.65.orig/build-aux/git-version-gen
-+++ autoconf-2.65/build-aux/git-version-gen
-@@ -135,7 +135,7 @@ case "$dirty" in
-     *) # Append the suffix only if there isn't one already.
- 	case $v in
- 	  *-dirty) ;;
--	  *) v="$v-dirty" ;;
-+	  #*) v="$v-dirty" ;;
- 	esac ;;
- esac
- 
diff --git a/package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch b/package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch
deleted file mode 100644
index 35f99b2..0000000
--- a/package/autoconf/autoconf-2.65-fix-m4-detection-test-on-dash.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Patch taken upstream at
-http://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=7f75858f577f11a844781764f30cd42cfe8a5669,
-with the following modifications:
-
- * Changes to NEWS file removed to avoid conflicts
-
- * Changes also made manually to the generated configure
-   script. Otherwise, host-autoconf is needed to compile
-   host-autoconf !
-
-Index: autoconf-2.65.old/configure
-===================================================================
---- autoconf-2.65.old.orig/configure	2009-12-15 16:11:05.175566911 +0100
-+++ autoconf-2.65.old/configure	2009-12-15 16:11:37.739562146 +0100
-@@ -2380,7 +2380,7 @@
-       ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
-       ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
-       test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
--      && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
-+      && test -z "`$as_echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
-       && test -f conftest.m4f \
-       && ac_cv_path_M4=$ac_path_M4 ac_path_M4_found=:
-       rm -f conftest.m4f
-Index: autoconf-2.65.old/m4/m4.m4
-===================================================================
---- autoconf-2.65.old.orig/m4/m4.m4	2009-12-15 16:11:05.207566124 +0100
-+++ autoconf-2.65.old/m4/m4.m4	2009-12-15 16:11:18.595562030 +0100
-@@ -29,7 +29,7 @@
-       ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
-       ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
-       test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
--      && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
-+      && test -z "`AS_ECHO([$ac_snippet]) | $ac_path_M4 --trace=mac 2>&1`" \
-       && test -f conftest.m4f \
-       && ac_cv_path_M4=$ac_path_M4 ac_path_M4_found=:
-       rm -f conftest.m4f],
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 7c42bf9..3220c25 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION = 2.65
+AUTOCONF_VERSION = 2.68
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
1.7.9.1
