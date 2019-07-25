From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 Jul 2019 19:18:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump to version
 4.92.1
Message-ID: <20190725171816.31519-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2019-13917:
http://www.exim.org/static/doc/security/CVE-2019-13917.txt

https://github.com/Exim/exim/commit/d185889f47b9b27088e777f7d382295c51271586
added new code to "Prebuild the data structure for builtin macros".

This function needs a host-built binary called macro_predef, it depends
on host-berkeleydb, host-pcre and optionally on host-openssl.

With an openssl-enabled exim the host build of macro_predef will fail
if host-openssl is missing:

/usr/bin/gcc -DMACRO_PREDEF macro_predef.c
In file included from hash.h:14,
                 from exim.h:485,
                 from macro_predef.c:11:
sha_ver.h:37:12: fatal error: openssl/ssl.h: No such file or directory

because macro_predef also has the an optional dependency on openssl:
https://github.com/Exim/exim/blob/exim-4.92%2Bfixes/src/src/macro_predef.c#L130

Removed patches applied upstream:
0004: https://github.com/Exim/exim/commit/98913c8ea2be5188dd22ec652da1182017e8edb7
0005: https://github.com/Exim/exim/commit/cf3cd306062a08969c41a1cdd32c6855f1abecf1
0007: https://github.com/Exim/exim/commit/7ea1237c783e380d7bdb86c90b13d8203c7ecf26#diff-58af16fe62ea674adf1730edc078d175R6243

Added patch to fix uClibc build.

Added license hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/0004-glibc.patch                 | 27 ----------
 ...-libnsl.patch => 0004-remove-libnsl.patch} |  0
 ...ix-base64d-buffer-size-CVE-2018-6789.patch | 37 --------------
 package/exim/0005-Fix-uClibc-build.patch      | 35 +++++++++++++
 package/exim/0007-Fix-CVE-2019-10149.patch    | 51 -------------------
 package/exim/exim.hash                        |  3 +-
 package/exim/exim.mk                          | 16 ++++--
 7 files changed, 49 insertions(+), 120 deletions(-)
 delete mode 100644 package/exim/0004-glibc.patch
 rename package/exim/{0006-remove-libnsl.patch => 0004-remove-libnsl.patch} (100%)
 delete mode 100644 package/exim/0005-Fix-base64d-buffer-size-CVE-2018-6789.patch
 create mode 100644 package/exim/0005-Fix-uClibc-build.patch
 delete mode 100644 package/exim/0007-Fix-CVE-2019-10149.patch

diff --git a/package/exim/0004-glibc.patch b/package/exim/0004-glibc.patch
deleted file mode 100644
index 7ae2ef8c70..0000000000
--- a/package/exim/0004-glibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-uClibc does not contain gnu/libc-version.h
-
-Patch sent upstream: https://bugs.exim.org/show_bug.cgi?id=2070
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr exim-4.88.org/src/exim.c exim-4.88/src/exim.c
---- exim-4.88.org/src/exim.c	2016-12-18 15:02:28.000000000 +0100
-+++ exim-4.88/src/exim.c	2016-12-26 12:12:57.000000000 +0100
-@@ -12,7 +12,7 @@
- 
- #include "exim.h"
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
- # include <gnu/libc-version.h>
- #endif
- 
-@@ -1044,7 +1044,7 @@
-   fprintf(f, "Compiler: <unknown>\n");
- #endif
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
-   fprintf(f, "Library version: Glibc: Compile: %d.%d\n",
- 	       	__GLIBC__, __GLIBC_MINOR__);
-   if (__GLIBC_PREREQ(2, 1))
diff --git a/package/exim/0006-remove-libnsl.patch b/package/exim/0004-remove-libnsl.patch
similarity index 100%
rename from package/exim/0006-remove-libnsl.patch
rename to package/exim/0004-remove-libnsl.patch
diff --git a/package/exim/0005-Fix-base64d-buffer-size-CVE-2018-6789.patch b/package/exim/0005-Fix-base64d-buffer-size-CVE-2018-6789.patch
deleted file mode 100644
index 1811a7ff98..0000000000
--- a/package/exim/0005-Fix-base64d-buffer-size-CVE-2018-6789.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 062990cc1b2f9e5d82a413b53c8f0569075de700 Mon Sep 17 00:00:00 2001
-From: "Heiko Schlittermann (HS12-RIPE)" <hs@schlittermann.de>
-Date: Mon, 5 Feb 2018 22:23:32 +0100
-Subject: [PATCH] Fix base64d() buffer size (CVE-2018-6789)
-
-Credits for discovering this bug: Meh Chang <meh@devco.re>
-
-[Peter: Drop ChangeLog change, fix path]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/base64.c      | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/base64.c b/src/base64.c
-index f6f187f0..e58ca6c7 100644
---- a/src/base64.c
-+++ b/src/base64.c
-@@ -152,10 +152,14 @@ static uschar dec64table[] = {
- int
- b64decode(const uschar *code, uschar **ptr)
- {
-+
- int x, y;
--uschar *result = store_get(3*(Ustrlen(code)/4) + 1);
-+uschar *result;
- 
--*ptr = result;
-+{
-+  int l = Ustrlen(code);
-+  *ptr = result = store_get(1 + l/4 * 3 + l%4);
-+}
- 
- /* Each cycle of the loop handles a quantum of 4 input bytes. For the last
- quantum this may decode to 1, 2, or 3 output bytes. */
--- 
-2.11.0
-
diff --git a/package/exim/0005-Fix-uClibc-build.patch b/package/exim/0005-Fix-uClibc-build.patch
new file mode 100644
index 0000000000..9d5452bb56
--- /dev/null
+++ b/package/exim/0005-Fix-uClibc-build.patch
@@ -0,0 +1,35 @@
+From 68ea4fc7ca53bf010e5ec738ad078452f0eaa639 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 23 Jul 2019 18:48:06 +0200
+Subject: [PATCH] Fix uClibc build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+structs.h:757:18: error: ?NS_MAXMSG? undeclared here (not in a function); did you mean ?N_MASC??
+   uschar  answer[NS_MAXMSG];      /* the answer itself */
+
+Patch sent upstream: https://github.com/Exim/exim/pull/70
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ OS/os.h-Linux | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/OS/os.h-Linux b/OS/os.h-Linux
+index 63cf9babd..1d82e9bad 100644
+--- a/OS/os.h-Linux
++++ b/OS/os.h-Linux
+@@ -87,5 +87,9 @@ then change the 0 to 1 in the next block. */
+ # define TCPI_OPT_SYN_DATA 32
+ #endif
+ 
++/* Needed for uClibc */
++#ifndef NS_MAXMSG
++# define NS_MAXMSG 65535
++#endif
+ 
+ /* End */
+-- 
+2.20.1
+
diff --git a/package/exim/0007-Fix-CVE-2019-10149.patch b/package/exim/0007-Fix-CVE-2019-10149.patch
deleted file mode 100644
index f8b5338b57..0000000000
--- a/package/exim/0007-Fix-CVE-2019-10149.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From d740d2111f189760593a303124ff6b9b1f83453d Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Mon, 27 May 2019 21:57:31 +0100
-Subject: [PATCH] Fix CVE-2019-10149
-
-[Peter: drop documentation update, fix path]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/deliver.c          | 22 ++++++++++++++--------
- 1 files changed, 52 insertions(+), 8 deletions(-)
- create mode 100644 doc/doc-txt/cve-2019-10149
-
-diff --git a/src/deliver.c b/src/deliver.c
-index 59256ac2..45cc0723 100644
---- a/src/deliver.c
-+++ b/src/deliver.c
-@@ -6227,17 +6227,23 @@ if (process_recipients != RECIP_IGNORE)
- 	{
- 	uschar * save_local =  deliver_localpart;
- 	const uschar * save_domain = deliver_domain;
-+	uschar * addr = new->address, * errmsg = NULL;
-+	int start, end, dom;
- 
--	deliver_localpart = expand_string(
--		      string_sprintf("${local_part:%s}", new->address));
--	deliver_domain =    expand_string(
--		      string_sprintf("${domain:%s}", new->address));
-+	if (!parse_extract_address(addr, &errmsg, &start, &end, &dom, TRUE))
-+	  log_write(0, LOG_MAIN|LOG_PANIC,
-+                "failed to parse address '%.100s': %s\n", addr, errmsg);
-+	else
-+	  {
-+	  deliver_localpart =
-+	    string_copyn(addr+start, dom ? (dom-1) - start : end - start);
-+	  deliver_domain = dom ? CUS string_copyn(addr+dom, end - dom) : CUS"";
- 
--	(void) event_raise(event_action,
--		      US"msg:fail:internal", new->message);
-+	  event_raise(event_action, US"msg:fail:internal", new->message);
- 
--	deliver_localpart = save_local;
--	deliver_domain =    save_domain;
-+	  deliver_localpart = save_local;
-+	  deliver_domain = save_domain;
-+	  }
- 	}
- #endif
-       }
--- 
-2.11.0
-
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 41f51b15eb..a75156a312 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 1a21322a10e2da9c0bd6a2a483b6e7ef8fa7f16efcab4c450fd73e7188f5fa94  exim-4.89.1.tar.xz
+sha256 2c64a871dd7ac464c14df8eb0dcf5cf766b46fff5af0316aaa4bf0268dde24b4  exim-4.92.1.tar.xz
+sha256 49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index bde2df1153..577f22b366 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.89.1
+EXIM_VERSION = 4.92.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
-EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
+EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
-EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
+EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
@@ -65,7 +65,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-EXIM_DEPENDENCIES += openssl
+EXIM_DEPENDENCIES += host-openssl openssl
 define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 	$(call exim-config-change,SUPPORT_TLS,yes)
 	$(call exim-config-change,USE_OPENSSL_PC,openssl)
@@ -111,9 +111,17 @@ ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
+# We need the host version of macro_predef during the build, before
+# building it we need to prepare the makefile.
 # "The -j (parallel) flag must not be used with make"
 # (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
 define EXIM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) makefile
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)/build-br macro_predef \
+		CC=$(HOSTCC) \
+		LNCC=$(HOSTCC) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
 endef
 
-- 
2.20.1
