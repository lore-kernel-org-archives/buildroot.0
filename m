From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  5 Sep 2015 09:24:51 +0200
Subject: [Buildroot] [PATCH] package/mono: fix linking options for
	locale_charset
Message-ID: <1441437891-6420-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Adding a patch for proper locale_charset linking handling.
* With this patch there is no need anymore for forcing
  libiconv as dependency, mono will now check if locale
  is enabled or not and acts accordingly.

Fixes http://autobuild.buildroot.net/results/8d2cd5619ba4d9cec5c8ac7fef467f47abc18aea/ 
      http://autobuild.buildroot.net/results/a3678744ded94906961430f3a4523cf1f1b0099b/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

The patch was submitted upstream, I will care of remove it when it will included.

 ...glib-checking-for-locale_charset-function.patch | 28 ++++++++++++++++++++++
 package/mono/Config.in                             |  1 -
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 package/mono/0005-eglib-checking-for-locale_charset-function.patch

diff --git a/package/mono/0005-eglib-checking-for-locale_charset-function.patch b/package/mono/0005-eglib-checking-for-locale_charset-function.patch
new file mode 100644
index 0000000..52d5638
--- /dev/null
+++ b/package/mono/0005-eglib-checking-for-locale_charset-function.patch
@@ -0,0 +1,28 @@
+From 026a8c44d332b3595814ce0aceba255467cd7b6d Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Sat, 5 Sep 2015 08:57:21 +0200
+Subject: [PATCH] eglib: checking for locale_charset function
+
+This patch checks if locale_charset function is availabe in
+libiconv or libcharset and changes the linking options accordingly.
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ eglib/configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/eglib/configure.ac b/eglib/configure.ac
+index 9d094ea..5ea220e 100644
+--- a/eglib/configure.ac
++++ b/eglib/configure.ac
+@@ -182,6 +182,7 @@ fi
+ AC_SUBST(G_HAVE_ISO_VARARGS)
+ 
+ AC_CHECK_HEADERS(getopt.h sys/select.h sys/time.h sys/wait.h pwd.h langinfo.h iconv.h localcharset.h sys/types.h sys/resource.h)
++AC_CHECK_LIB([iconv], [locale_charset],[],[AC_CHECK_LIB([charset], [locale_charset],[LIBS+="-liconv -lcharset"])])
+ AC_CHECK_HEADER(alloca.h, [HAVE_ALLOCA_H=1], [HAVE_ALLOCA_H=0])
+ AC_SUBST(HAVE_ALLOCA_H)
+ 
+-- 
+1.9.1
+
diff --git a/package/mono/Config.in b/package/mono/Config.in
index 0f57703..cf18a03 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_MONO
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  An open source, cross-platform, implementation of C#
 	  and the CLR that is binary compatible with Microsoft.NET.
-- 
1.9.1
