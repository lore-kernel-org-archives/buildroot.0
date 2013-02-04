From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 22:40:39 +0100
Subject: [Buildroot] [git commit] neard: fix missing nfc.h header
Message-ID: <20130204222117.BD4B59A930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90de2b9d96695f949b1c88e9b0999875d761fe06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have a patch that allows neard to build even on toolchain using old
kernel headers that lack the nfc.h header. However, after the bump to
neard 0.9, this patch was not updated to take into account the two new
plugins that neard has added.

Fixes http://autobuild.buildroot.org/results/5eeb6f62cc0e654a536b6614dc51e8af4e301bb6/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../neard/neard-fix-missing-linux-nfc-header.patch |  104 +++++++++++++-------
 1 files changed, 68 insertions(+), 36 deletions(-)

diff --git a/package/neard/neard-fix-missing-linux-nfc-header.patch b/package/neard/neard-fix-missing-linux-nfc-header.patch
index 9b9ce32..b04c5da 100644
--- a/package/neard/neard-fix-missing-linux-nfc-header.patch
+++ b/package/neard/neard-fix-missing-linux-nfc-header.patch
@@ -10,10 +10,10 @@ is available or not, and if not, use our own private copy of it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: neard-0.8/configure.ac
+Index: b/configure.ac
 ===================================================================
---- neard-0.8.orig/configure.ac	2012-11-03 19:56:07.000000000 +0100
-+++ neard-0.8/configure.ac	2012-12-09 17:08:00.000000000 +0100
+--- a/configure.ac
++++ b/configure.ac
 @@ -88,6 +88,8 @@
  AC_SUBST(NETLINK_CFLAGS)
  AC_SUBST(NETLINK_LIBS)
@@ -23,10 +23,10 @@ Index: neard-0.8/configure.ac
  AC_ARG_ENABLE(test, AC_HELP_STRING([--enable-test],
  					[enable test/example scripts]),
  					[enable_test=${enableval}])
-Index: neard-0.8/src/near.h
+Index: b/src/near.h
 ===================================================================
---- neard-0.8.orig/src/near.h	2012-11-03 19:56:07.000000000 +0100
-+++ neard-0.8/src/near.h	2012-12-09 16:56:40.000000000 +0100
+--- a/src/near.h
++++ b/src/near.h
 @@ -23,7 +23,11 @@
  #include <sys/socket.h>
  
@@ -39,10 +39,10 @@ Index: neard-0.8/src/near.h
  
  #include <glib.h>
  
-Index: neard-0.8/src/linux-nfc.h
+Index: b/src/linux-nfc.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ neard-0.8/src/linux-nfc.h	2012-12-09 17:11:10.000000000 +0100
+--- /dev/null
++++ b/src/linux-nfc.h
 @@ -0,0 +1,197 @@
 +/*
 + * Copyright (C) 2011 Instituto Nokia de Tecnologia
@@ -241,10 +241,10 @@ Index: neard-0.8/src/linux-nfc.h
 +#define NFC_LLCP_DIRECTION_TX		0x01
 +
 +#endif /*__LINUX_NFC_H */
-Index: neard-0.8/plugins/mifare.c
+Index: b/plugins/mifare.c
 ===================================================================
---- neard-0.8.orig/plugins/mifare.c	2012-10-10 05:29:07.000000000 +0200
-+++ neard-0.8/plugins/mifare.c	2012-12-09 16:58:22.000000000 +0100
+--- a/plugins/mifare.c
++++ b/plugins/mifare.c
 @@ -29,7 +29,11 @@
  #include <sys/socket.h>
  
@@ -257,10 +257,10 @@ Index: neard-0.8/plugins/mifare.c
  
  #include <near/plugin.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/p2p.c
+Index: b/plugins/p2p.c
 ===================================================================
---- neard-0.8.orig/plugins/p2p.c	2012-11-03 19:56:07.000000000 +0100
-+++ neard-0.8/plugins/p2p.c	2012-12-09 16:59:06.000000000 +0100
+--- a/plugins/p2p.c
++++ b/plugins/p2p.c
 @@ -30,7 +30,11 @@
  #include <sys/socket.h>
  
@@ -273,10 +273,10 @@ Index: neard-0.8/plugins/p2p.c
  
  #include <near/plugin.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/handover.c
+Index: b/plugins/handover.c
 ===================================================================
---- neard-0.8.orig/plugins/handover.c	2012-11-03 19:56:07.000000000 +0100
-+++ neard-0.8/plugins/handover.c	2012-12-09 17:13:30.000000000 +0100
+--- a/plugins/handover.c
++++ b/plugins/handover.c
 @@ -29,7 +29,11 @@
  #include <sys/socket.h>
  
@@ -289,10 +289,10 @@ Index: neard-0.8/plugins/handover.c
  
  #include <near/types.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/nfctype1.c
+Index: b/plugins/nfctype1.c
 ===================================================================
---- neard-0.8.orig/plugins/nfctype1.c	2012-10-10 05:29:07.000000000 +0200
-+++ neard-0.8/plugins/nfctype1.c	2012-12-09 17:09:13.000000000 +0100
+--- a/plugins/nfctype1.c
++++ b/plugins/nfctype1.c
 @@ -29,7 +29,11 @@
  #include <sys/socket.h>
  
@@ -305,10 +305,10 @@ Index: neard-0.8/plugins/nfctype1.c
  
  #include <near/plugin.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/nfctype2.c
+Index: b/plugins/nfctype2.c
 ===================================================================
---- neard-0.8.orig/plugins/nfctype2.c	2012-10-10 05:29:07.000000000 +0200
-+++ neard-0.8/plugins/nfctype2.c	2012-12-09 17:09:52.000000000 +0100
+--- a/plugins/nfctype2.c
++++ b/plugins/nfctype2.c
 @@ -29,7 +29,11 @@
  #include <sys/socket.h>
  
@@ -321,10 +321,10 @@ Index: neard-0.8/plugins/nfctype2.c
  
  #include <near/plugin.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/nfctype3.c
+Index: b/plugins/nfctype3.c
 ===================================================================
---- neard-0.8.orig/plugins/nfctype3.c	2012-11-03 19:56:07.000000000 +0100
-+++ neard-0.8/plugins/nfctype3.c	2012-12-09 17:11:51.000000000 +0100
+--- a/plugins/nfctype3.c
++++ b/plugins/nfctype3.c
 @@ -29,7 +29,11 @@
  #include <sys/socket.h>
  
@@ -337,10 +337,10 @@ Index: neard-0.8/plugins/nfctype3.c
  
  #include <near/plugin.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/nfctype4.c
+Index: b/plugins/nfctype4.c
 ===================================================================
---- neard-0.8.orig/plugins/nfctype4.c	2012-11-03 19:56:07.000000000 +0100
-+++ neard-0.8/plugins/nfctype4.c	2012-12-09 17:12:14.000000000 +0100
+--- a/plugins/nfctype4.c
++++ b/plugins/nfctype4.c
 @@ -30,7 +30,11 @@
  #include <sys/socket.h>
  
@@ -353,10 +353,10 @@ Index: neard-0.8/plugins/nfctype4.c
  
  #include <near/plugin.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/npp.c
+Index: b/plugins/npp.c
 ===================================================================
---- neard-0.8.orig/plugins/npp.c	2012-10-10 05:29:07.000000000 +0200
-+++ neard-0.8/plugins/npp.c	2012-12-09 17:12:36.000000000 +0100
+--- a/plugins/npp.c
++++ b/plugins/npp.c
 @@ -29,7 +29,11 @@
  #include <sys/socket.h>
  
@@ -369,10 +369,42 @@ Index: neard-0.8/plugins/npp.c
  
  #include <near/plugin.h>
  #include <near/log.h>
-Index: neard-0.8/plugins/snep.c
+Index: b/plugins/snep.c
 ===================================================================
---- neard-0.8.orig/plugins/snep.c	2012-11-03 19:56:07.000000000 +0100
-+++ neard-0.8/plugins/snep.c	2012-12-09 17:13:07.000000000 +0100
+--- a/plugins/snep.c
++++ b/plugins/snep.c
+@@ -29,7 +29,11 @@
+ #include <sys/socket.h>
+ 
+ #include <linux/socket.h>
++#ifdef HAVE_LINUX_NFC_H
+ #include <linux/nfc.h>
++#else
++#include "../src/linux-nfc.h"
++#endif
+ 
+ #include <near/plugin.h>
+ #include <near/log.h>
+Index: b/plugins/snep-core.c
+===================================================================
+--- a/plugins/snep-core.c
++++ b/plugins/snep-core.c
+@@ -29,7 +29,11 @@
+ #include <sys/socket.h>
+ 
+ #include <linux/socket.h>
++#ifdef HAVE_LINUX_NFC_H
+ #include <linux/nfc.h>
++#else
++#include "../src/linux-nfc.h"
++#endif
+ 
+ #include <near/plugin.h>
+ #include <near/log.h>
+Index: b/plugins/snep-validation.c
+===================================================================
+--- a/plugins/snep-validation.c
++++ b/plugins/snep-validation.c
 @@ -29,7 +29,11 @@
  #include <sys/socket.h>
  
