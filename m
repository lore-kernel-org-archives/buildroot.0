From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Dec 2012 23:41:19 +0100
Subject: [Buildroot] [git commit] gettext: bump to version 0.18.2
Message-ID: <20121226224225.DCE879A496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ee2f459628901723e08ab01c4595cf6ed5595b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gettext/gettext-uclibc-compat.patch        |   27 --------------------
 .../gettext/gettext-uclibc-sched_param-def.patch   |   20 --------------
 package/gettext/gettext.mk                         |    2 +-
 3 files changed, 1 insertions(+), 48 deletions(-)

diff --git a/package/gettext/gettext-uclibc-compat.patch b/package/gettext/gettext-uclibc-compat.patch
deleted file mode 100644
index 5e52665..0000000
--- a/package/gettext/gettext-uclibc-compat.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-The glibc fix/hack isn't valid for uClibc.
-Patch taken from OpenWRT.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/gettext-runtime/intl/localename.c
-+++ b/gettext-runtime/intl/localename.c
-@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int catego
-     locale_t thread_locale = uselocale (NULL);
-     if (thread_locale != LC_GLOBAL_LOCALE)
-       {
--#  if __GLIBC__ >= 2
-+#  if __GLIBC__ >= 2 && !defined __UCLIBC__
-         /* Work around an incorrect definition of the _NL_LOCALE_NAME macro in
-            glibc < 2.12.
-            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
---- a/gettext-tools/gnulib-lib/localename.c
-+++ b/gettext-tools/gnulib-lib/localename.c
-@@ -2607,7 +2607,7 @@ gl_locale_name_thread_unsafe (int catego
-     locale_t thread_locale = uselocale (NULL);
-     if (thread_locale != LC_GLOBAL_LOCALE)
-       {
--#  if __GLIBC__ >= 2
-+#  if __GLIBC__ >= 2 && !defined __UCLIBC__
-         /* Work around an incorrect definition of the _NL_LOCALE_NAME macro in
-            glibc < 2.12.
-            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
diff --git a/package/gettext/gettext-uclibc-sched_param-def.patch b/package/gettext/gettext-uclibc-sched_param-def.patch
deleted file mode 100644
index 4e39278..0000000
--- a/package/gettext/gettext-uclibc-sched_param-def.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
-and is not needed too per standard. gnulib attempts to use it but we have to account
-for it because in this case uclibc does not behave like glibc.
-
--Khem
-
-http://bugs.gentoo.org/336484
-http://bugs.gentoo.org/323377
-
---- gettext/gettext-tools/gnulib-lib/spawn.in.h
-+++ gettext/gettext-tools/gnulib-lib/spawn.in.h
-@@ -31,7 +31,7 @@
- 
- /* Get definitions of 'struct sched_param' and 'sigset_t'.
-    But avoid namespace pollution on glibc systems.  */
--#ifndef __GLIBC__
-+#if !defined __GLIBC__ || defined __UCLIBC__
- # include <sched.h>
- # include <signal.h>
- #endif
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index a91cb7f..953077d 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GETTEXT_VERSION = 0.18.1.1
+GETTEXT_VERSION = 0.18.2
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
