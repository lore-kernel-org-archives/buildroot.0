From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Dec 2012 16:15:17 -0300
Subject: [Buildroot] [PATCH] gettext: fix build failure with locale and
	uclibc
Message-ID: <1355512517-24342-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Johan Sagaert in the mailing list, if it's building with
a uClibc toolchain with locale enabled the build fails since the new
gettext does a locale hack for glibc which isn't needed nor supported.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext-uclibc-compat.patch |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/gettext/gettext-uclibc-compat.patch

diff --git a/package/gettext/gettext-uclibc-compat.patch b/package/gettext/gettext-uclibc-compat.patch
new file mode 100644
index 0000000..5e52665
--- /dev/null
+++ b/package/gettext/gettext-uclibc-compat.patch
@@ -0,0 +1,27 @@
+The glibc fix/hack isn't valid for uClibc.
+Patch taken from OpenWRT.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/gettext-runtime/intl/localename.c
++++ b/gettext-runtime/intl/localename.c
+@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int catego
+     locale_t thread_locale = uselocale (NULL);
+     if (thread_locale != LC_GLOBAL_LOCALE)
+       {
+-#  if __GLIBC__ >= 2
++#  if __GLIBC__ >= 2 && !defined __UCLIBC__
+         /* Work around an incorrect definition of the _NL_LOCALE_NAME macro in
+            glibc < 2.12.
+            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
+--- a/gettext-tools/gnulib-lib/localename.c
++++ b/gettext-tools/gnulib-lib/localename.c
+@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int catego
+     locale_t thread_locale = uselocale (NULL);
+     if (thread_locale != LC_GLOBAL_LOCALE)
+       {
+-#  if __GLIBC__ >= 2
++#  if __GLIBC__ >= 2 && !defined __UCLIBC__
+         /* Work around an incorrect definition of the _NL_LOCALE_NAME macro in
+            glibc < 2.12.
+            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
-- 
1.7.8.6
