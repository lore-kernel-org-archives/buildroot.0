From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Jan 2017 21:58:48 +0100
Subject: [Buildroot] [git commit] uclibc: add locale/iconv related bugfixes
Message-ID: <20170108205936.3B3B880429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcef07e6528c9af73edc2e1e710eec7ae1506e2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- do not remove iconv.h when UCLIBC_HAS_LOCALE enabled
- select UCLIBC_HAS_LIBICONV when UCLIBC_HAS_LOCALE enabled

Fixes:
   http://autobuild.buildroot.net/?reason=libglib2-2.50.2&step=250

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ve-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch | 26 ++++++++++++++++++++++
 package/uclibc/0003-locale-needs-libiconv.patch    | 25 +++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/package/uclibc/0002-do-not-remove-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch b/package/uclibc/0002-do-not-remove-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch
new file mode 100644
index 0000000..4567720
--- /dev/null
+++ b/package/uclibc/0002-do-not-remove-iconv.h-when-UCLIBC_HAS_LOCALE-is-not-.patch
@@ -0,0 +1,26 @@
+From 0d80d5a235af1a12b606dea6380dc91f755546fe Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 28 Dec 2016 19:08:15 +0100
+Subject: [PATCH] do not remove iconv.h when UCLIBC_HAS_LOCALE is not set
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 9acf76c..c8afe1c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -282,7 +282,7 @@ HEADERS_RM-$(UCLIBC_HAS_IPV6)                += netinet/ip6.h netinet/icmp6.h
+ HEADERS_RM-$(UCLIBC_HAS_BACKTRACE)           += execinfo.h
+ HEADERS_RM-$(UCLIBC_HAS_LIBICONV)            += iconv.h
+ HEADERS_RM-$(UCLIBC_HAS_LIBINTL)             += intl.h
+-HEADERS_RM-$(UCLIBC_HAS_LOCALE)              += iconv.h bits/uClibc_ctype.h
++HEADERS_RM-$(UCLIBC_HAS_LOCALE)              += bits/uClibc_ctype.h
+ HEADERS_RM-$(UCLIBC_HAS_PTY)                 += pty.h
+ HEADERS_RM-$(UCLIBC_HAS_REALTIME)            += mqueue.h bits/mqueue.h sched.h \
+ 	bits/sched.h \
+-- 
+2.1.4
+
diff --git a/package/uclibc/0003-locale-needs-libiconv.patch b/package/uclibc/0003-locale-needs-libiconv.patch
new file mode 100644
index 0000000..e244955
--- /dev/null
+++ b/package/uclibc/0003-locale-needs-libiconv.patch
@@ -0,0 +1,25 @@
+From a2c56ee4fbff7af9128d630299d81fb46582673d Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 29 Dec 2016 13:38:09 +0100
+Subject: [PATCH] locale: needs libiconv
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ extra/Configs/Config.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
+index 6b0985e..b02054c 100644
+--- a/extra/Configs/Config.in
++++ b/extra/Configs/Config.in
+@@ -1442,6 +1442,7 @@ config UCLIBC_HAS_LOCALE
+ 	bool "Locale Support"
+ 	select UCLIBC_HAS_WCHAR
+ 	select UCLIBC_HAS_CTYPE_TABLES
++	select UCLIBC_HAS_LIBICONV
+ 	help
+ 	  uClibc now has full ANSI/ISO C99 locale support (except for
+ 	  wcsftime() and collating items in regex).  Be aware that enabling
+-- 
+2.1.4
+
