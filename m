From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jun 2014 23:34:59 +0200
Subject: [Buildroot] [git commit] rpcbind: bump to version 0.2.1
Message-ID: <20140630213728.261B09D0C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4414f7f165a32ba5934261d23a882b1152024cd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches that were updated to take into account minor upstream
 changes:

 - rpcbind-0001-Remove-yellow-pages-support.patch
 - rpcbind-0003-Make-IPv6-configurable.patch

 Patches that were removed as they were no longer needed thanks to
 upstream changes:

 - rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../rpcbind-0001-Remove-yellow-pages-support.patch |   10 ++--
 ...to-use-NSS-support-when-not-available-in-.patch |   60 --------------------
 .../rpcbind-0003-Make-IPv6-configurable.patch      |   50 ++++++++--------
 package/rpcbind/rpcbind.mk                         |    3 +-
 4 files changed, 32 insertions(+), 91 deletions(-)

diff --git a/package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch b/package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch
index eba17bf..e35828f 100644
--- a/package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch
+++ b/package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch
@@ -1,4 +1,4 @@
-From 6b5db966ae01c0bdaa7b3b90d9332394af6ea0be Mon Sep 17 00:00:00 2001
+From 249e25c5cc675c212ca4e4a3342bff8f59285b1a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 22:03:43 +0100
 Subject: [PATCH] Remove yellow pages support
@@ -9,11 +9,11 @@ such feature, get rid of it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- src/security.c |   18 ------------------
+ src/security.c | 18 ------------------
  1 file changed, 18 deletions(-)
 
 diff --git a/src/security.c b/src/security.c
-index 0edeac6..c6c977f 100644
+index d272f74..8d5863c 100644
 --- a/src/security.c
 +++ b/src/security.c
 @@ -23,9 +23,6 @@
@@ -26,7 +26,7 @@ index 0edeac6..c6c977f 100644
  
  #include "rpcbind.h"
  
-@@ -322,24 +319,9 @@ check_callit(SVCXPRT *xprt, struct r_rmtcall_args *args, int versnum /*__unused*
+@@ -308,24 +305,9 @@ check_callit(SVCXPRT *xprt, struct r_rmtcall_args *args, int versnum /*__unused*
  		    args->rmt_proc != MOUNTPROC_UMNT)
  			break;
  		goto deny;
@@ -52,5 +52,5 @@ index 0edeac6..c6c977f 100644
  		break;
  	}
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch b/package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch
deleted file mode 100644
index f7cc4a6..0000000
--- a/package/rpcbind/rpcbind-0002-Do-not-try-to-use-NSS-support-when-not-available-in-.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From cfc70fb4c54e044f724516e9352f974187adb448 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 10 Nov 2012 22:04:12 +0100
-Subject: [PATCH] Do not try to use NSS support when not available in the C
- library
-
-uClibc does not have NSS support, so it is unnecessary to tell the C
-library to use the "files" as the source for "services", since it is
-the only possible choice.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/rpcbind.c |    6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 525ffba..cde8685 100644
---- a/src/rpcbind.c
-+++ b/src/rpcbind.c
-@@ -67,7 +67,9 @@
- #include <pwd.h>
- #include <string.h>
- #include <errno.h>
-+#ifdef HAVE_NSS_H
- #include <nss.h>
-+#endif
- #include "config.h"
- #include "rpcbind.h"
- 
-@@ -156,11 +158,13 @@ main(int argc, char *argv[])
- 		exit(1);
- 	}
- 
-+#ifdef HAVE_NSS_H
- 	/*
- 	 * Make sure we use the local service file 
- 	 * for service lookkups
- 	 */
- 	__nss_configure_lookup("services", "files");
-+#endif
- 
- 	nc_handle = setnetconfig(); 	/* open netconfig file */
- 	if (nc_handle == NULL) {
-@@ -222,11 +226,13 @@ main(int argc, char *argv[])
- 		struct passwd *p;
- 		char *id = runasdaemon ? RUN_AS : rpcbinduser;
- 
-+#ifdef HAVE_NSS_H
- 		/*
- 		 * Make sure we use the local password file
- 		 * for these lookups.
- 		 */
- 		__nss_configure_lookup("passwd", "files");
-+#endif
- 
- 		if((p = getpwnam(id)) == NULL) {
- 			syslog(LOG_ERR, "cannot get uid of '%s': %m", id);
--- 
-1.7.9.5
-
diff --git a/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch b/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch
index 576434b..0bb311c 100644
--- a/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch
+++ b/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch
@@ -1,4 +1,4 @@
-From ab7769e4b57741c654f1a815b006d6548104ba95 Mon Sep 17 00:00:00 2001
+From 5a1826d116ae986cb464d3503e0ae9ceaba3a687 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 22:24:56 +0100
 Subject: [PATCH] Make IPv6 configurable
@@ -9,34 +9,34 @@ src/Makefile.am.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- configure.in    |    3 +++
- src/Makefile.am |    2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ Makefile.am  | 1 -
+ configure.in | 3 +++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
-index de1c730..57f0bf0 100644
---- a/configure.in
-+++ b/configure.in
-@@ -61,6 +61,9 @@ AC_ARG_ENABLE(libwrap,[ --enable-libwrap  Enables host name checking],
- 	esac],[libwarp=false])
- AM_CONDITIONAL(LIBWRAP, test x$libwarp = xtrue)
+diff --git a/Makefile.am b/Makefile.am
+index d10c906..c983a3e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,6 @@ AM_CPPFLAGS = \
+ 	-DPORTMAP \
+ 	-DFACILITY=LOG_MAIL \
+ 	-DSEVERITY=LOG_INFO \
+-	-DINET6 \
+ 	-DRPCBIND_STATEDIR="\"$(statedir)\"" \
+ 	-DRPCBIND_USER="\"$(rpcuser)\"" \
+ 	-D_GNU_SOURCE \
+diff --git a/configure.ac b/configure.ac
+index 2b67720..f144c8e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,4 +36,7 @@ AS_IF([test x$enable_libwrap = xyes], [
+ 
+ AC_SEARCH_LIBS([pthread_create], [pthread])
  
 +AC_CHECK_HEADER(netinet/ip6.h,
 +        AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available]))
 +
- AC_CONFIG_FILES([Makefile src/Makefile man/Makefile])
- AC_OUTPUT()
-                                                                    
-diff --git a/src/Makefile.am b/src/Makefile.am
-index cc0a85b..3826eca 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,4 +1,4 @@
--INCLUDES = -I$(srcdir)/tirpc -DPORTMAP -DINET6 -DVERSION="\"$(VERSION)\"" \
-+INCLUDES = -I$(srcdir)/tirpc -DPORTMAP -DVERSION="\"$(VERSION)\"" \
-                                                 -D_GNU_SOURCE -Wall -pipe
- if DEBUG
- INCLUDES +=	-DRPCBIND_DEBUG -DSVC_RUN_DEBUG -DDEBUG_RMTCALL
+ AC_OUTPUT([Makefile])
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 19bdace..5699b29 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 0.2.0
+RPCBIND_VERSION = 0.2.1
 RPCBIND_SITE    = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE  = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3c
@@ -14,5 +14,6 @@ RPCBIND_AUTORECONF = YES
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
 RPCBIND_DEPENDENCIES += libtirpc
+RPCBIND_CONF_OPT += --with-rpcuser=root
 
 $(eval $(autotools-package))
