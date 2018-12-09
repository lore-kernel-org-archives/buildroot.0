From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:23:08 +0100
Subject: [Buildroot] [git commit] package/asterisk: enable for uclibc
 toolchains
Message-ID: <20181209211922.214288B759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81e5615052122d26842b25b7f0a2039ef8045fe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch extends the configure checks for re-entrant resolver
functions to fix uclibc builds.

Quoting Yann:
http://lists.busybox.net/pipermail/buildroot/2017-September/203004.html

"As a final stroke of genius, asterisk checks for the re-entrant variant
of res_ninit(), and concludes that all such functions are available,
including res_nsearch(). Uclibc-ng has the former but not the latter, so
the build fails. Since there is no cache variable for that check, we
can't pre-feed that result to configure, and fixing it is a bigger
endeavour. So we make asterisk depend on glibc for now, until someone
is brave enough to fix it."

Musl builds are still broken:

output/build/asterisk-16.0.0/include/asterisk/astmm.h:165:35:
 error: expected ???=???, ???,???, ???;???, ???asm??? or ???__attribute__??? before ???->??? token
  Do_not_use_calloc__use_ast_calloc->fail(a, b)

output/build/asterisk-16.0.0/include/asterisk/astmm.h:169:77:
 error: expected ???=???, ???,???, ???;???, ???asm??? or ???__attribute__??? before ???->??? token
  Do_not_use_free__use_ast_free_or_ast_std_free_for_remotely_allocated_memory->fail(a)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-detection-of-re-entrant-resolver-funct.patch | 38 ++++++++++++++++++++++
 package/asterisk/Config.in                         |  7 ++--
 package/asterisk/asterisk.mk                       |  2 +-
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch b/package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
new file mode 100644
index 0000000000..bee8fdbb1b
--- /dev/null
+++ b/package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
@@ -0,0 +1,38 @@
+From 9b4070944578336506cd0a76de6f733c72d0ca74 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 13 Oct 2018 11:11:15 +0200
+Subject: [PATCH] configure: fix detection of re-entrant resolver functions
+
+Fixes https://issues.asterisk.org/jira/browse/ASTERISK-21795
+
+uClibc does not provide res_nsearch:
+asterisk-16.0.0/main/dns.c:506: undefined reference to `res_nsearch'
+
+Patch coded by Yann E. MORIN:
+http://lists.busybox.net/pipermail/buildroot/2018-October/232630.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index dd0c8edd13..ee1ca9ceb6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1388,7 +1388,11 @@ AC_LINK_IFELSE(
+ 			#include <arpa/nameser.h>
+ 			#endif
+ 			#include <resolv.h>],
+-			[int foo = res_ninit(NULL);])],
++			[
++				int foo;
++				foo = res_ninit(NULL);
++				foo = res_nsearch(NULL, NULL, 0, 0, NULL, 0);
++			])],
+ 	AC_MSG_RESULT(yes)
+ 	AC_DEFINE([HAVE_RES_NINIT], 1, [Define to 1 if your system has the re-entrant resolver functions.])
+ 	AC_SEARCH_LIBS(res_9_ndestroy, resolv)
+-- 
+2.19.1
+
diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index cfea181026..b55bc0174d 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_ASTERISK
 	bool "asterisk"
-	# Uses glibc resolver function res_nsearch()
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # libedit
 	depends on BR2_USE_WCHAR # libedit
 	select BR2_PACKAGE_JANSSON
@@ -25,7 +24,7 @@ config BR2_PACKAGE_ASTERISK
 
 	  http://www.asterisk.org/
 
-comment "asterisk needs a glibc toolchain w/ C++, dynamic library, wchar"
+comment "asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+	depends on BR2_TOOLCHAIN_USES_MUSL || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index eb663a75bf..8a46438f92 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -21,7 +21,7 @@ ASTERISK_LICENSE_FILES = \
 	codecs/speex/speex_resampler.h \
 	utils/db1-ast/include/db.h
 
-# For patches 0002 and 0003
+# For patches 0002, 0003 and 0005
 ASTERISK_AUTORECONF = YES
 ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject
 
