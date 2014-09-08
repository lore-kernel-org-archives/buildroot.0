From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Sep 2014 07:53:21 -0300
Subject: [Buildroot] [PATCH] toolchain/glibc: add version 2.20
Message-ID: <1410173601-32721-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And remove version 2.18 to just keep two versions around.
So bump the default to 2.19.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/2.18/glibc-0001-accept-make4.patch | 33 ------------------------
 package/glibc/Config.in                          | 11 ++++----
 2 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 package/glibc/2.18/glibc-0001-accept-make4.patch

diff --git a/package/glibc/2.18/glibc-0001-accept-make4.patch b/package/glibc/2.18/glibc-0001-accept-make4.patch
deleted file mode 100644
index 49db374..0000000
--- a/package/glibc/2.18/glibc-0001-accept-make4.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Backport upstream patch (28d708c44bc47b56f6551ff285f78edcf61c208a) to accept
-make-4.0 or newer.
-We patch both configure and configure.in files so if we ever have to run
-autoreconf in the glibc source, then the fix will be propagated properly.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-Index: glibc-2.18/configure
-===================================================================
---- glibc-2.18.orig/configure
-+++ glibc-2.18/configure
-@@ -4772,7 +4772,7 @@ $as_echo_n "checking version of $MAKE...
-   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
-   case $ac_prog_version in
-     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
--    3.79* | 3.[89]*)
-+    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
-        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
-     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
- 
-Index: glibc-2.18/configure.in
-===================================================================
---- glibc-2.18.orig/configure.in
-+++ glibc-2.18/configure.in
-@@ -989,7 +989,7 @@ AC_CHECK_PROG_VER(CC, ${ac_tool_prefix}g
-   critic_missing="$critic_missing gcc")
- AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
-   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
--  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
-+  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
- 
- AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
-   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index df1e273..8c033f2 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -30,15 +30,14 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_18
-
-config BR2_GLIBC_VERSION_2_18
-	bool "2.18"
-	depends on !BR2_powerpc64le
+	default BR2_GLIBC_VERSION_2_19
 
 config BR2_GLIBC_VERSION_2_19
 	bool "2.19"
 
+config BR2_GLIBC_VERSION_2_20
+	bool "2.20"
+
 endchoice
 
 endif
@@ -47,5 +46,5 @@ config BR2_GLIBC_VERSION_STRING
 	string
 	default "2.18-svnr23787" if BR2_EGLIBC_VERSION_2_18
 	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
-	default "2.18" if BR2_GLIBC_VERSION_2_18
 	default "2.19" if BR2_GLIBC_VERSION_2_19
+	default "2.20" if BR2_GLIBC_VERSION_2_20
-- 
1.8.5.5
