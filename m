From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 23:00:37 +0100
Subject: [Buildroot] [git commit] rpcbind: fix build on toolchains without
	IPv6 support
Message-ID: <20121114220324.0B61F99FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a4d6111c05f59d48231bd3cca4592cce4235e46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../rpcbind-0003-Make-IPv6-configurable.patch      |   42 ++++++++++++++++++++
 package/rpcbind/rpcbind.mk                         |    1 +
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch b/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch
new file mode 100644
index 0000000..576434b
--- /dev/null
+++ b/package/rpcbind/rpcbind-0003-Make-IPv6-configurable.patch
@@ -0,0 +1,42 @@
+From ab7769e4b57741c654f1a815b006d6548104ba95 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 10 Nov 2012 22:24:56 +0100
+Subject: [PATCH] Make IPv6 configurable
+
+Add an autoconf check that verifies whether IPv6 is available or not,
+and define the INET6 macro if available, instead of hardcoding it in
+src/Makefile.am.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in    |    3 +++
+ src/Makefile.am |    2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index de1c730..57f0bf0 100644
+--- a/configure.in
++++ b/configure.in
+@@ -61,6 +61,9 @@ AC_ARG_ENABLE(libwrap,[ --enable-libwrap  Enables host name checking],
+ 	esac],[libwarp=false])
+ AM_CONDITIONAL(LIBWRAP, test x$libwarp = xtrue)
+ 
++AC_CHECK_HEADER(netinet/ip6.h,
++        AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available]))
++
+ AC_CONFIG_FILES([Makefile src/Makefile man/Makefile])
+ AC_OUTPUT()
+                                                                    
+diff --git a/src/Makefile.am b/src/Makefile.am
+index cc0a85b..3826eca 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,4 +1,4 @@
+-INCLUDES = -I$(srcdir)/tirpc -DPORTMAP -DINET6 -DVERSION="\"$(VERSION)\"" \
++INCLUDES = -I$(srcdir)/tirpc -DPORTMAP -DVERSION="\"$(VERSION)\"" \
+                                                 -D_GNU_SOURCE -Wall -pipe
+ if DEBUG
+ INCLUDES +=	-DRPCBIND_DEBUG -DSVC_RUN_DEBUG -DDEBUG_RMTCALL
+-- 
+1.7.9.5
+
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index de9a421..382e53b 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -9,6 +9,7 @@ RPCBIND_SITE    = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPC
 RPCBIND_SOURCE  = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3c
 RPCBIND_LICENSE_FILES = COPYING
+RPCBIND_AUTORECONF = YES
 
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
