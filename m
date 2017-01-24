From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 14:02:35 +0100
Subject: [Buildroot] [git commit] samba4: bump to version 4.5.4
Message-ID: <20170124140955.7F63181EBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51e771dc4d8d67910e2f142b0005d8518ee0ef50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop libbsd support, it's problematic and doesn't bring in any greater
benefit.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...> 0001-libreplace-disable-libbsd-support.patch} | 31 ++++++++++++++++------
 package/samba4/samba4.hash                         |  2 +-
 package/samba4/samba4.mk                           |  3 +--
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/package/samba4/0001-disable-libbsd.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
similarity index 56%
rename from package/samba4/0001-disable-libbsd.patch
rename to package/samba4/0001-libreplace-disable-libbsd-support.patch
index 67f79d0..4d0c770 100644
--- a/package/samba4/0001-disable-libbsd.patch
+++ b/package/samba4/0001-libreplace-disable-libbsd-support.patch
@@ -1,16 +1,25 @@
+From fc0304ba92ec7ae9a2f75fbc31d97fee39d19665 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 7 Sep 2016 23:03:43 -0300
+Subject: [PATCH] libreplace: disable libbsd support
+
 Disable libbsd support, samba4 uses a global config.h for its own
 codebase and that of heimdal (when building with builtin).
-This causes redefinition conflicts for link(2) when both standard unistd.h
-and bsd/unistd.h get included.
+This causes redefinition conflicts for link(2) when both standard
+unistd.h and bsd/unistd.h get included.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ lib/replace/wscript | 12 ------------
+ 1 file changed, 12 deletions(-)
 
-diff -Nura samba-4.2.0rc1.orig/lib/replace/wscript samba-4.2.0rc1/lib/replace/wscript
---- samba-4.2.0rc1.orig/lib/replace/wscript	2014-10-01 06:17:32.000000000 -0300
-+++ samba-4.2.0rc1/lib/replace/wscript	2014-10-01 07:21:13.559498987 -0300
-@@ -282,15 +282,6 @@
-     conf.CHECK_FUNCS('strtouq strtoll __strtoll strtoq memalign posix_memalign')
-     conf.CHECK_FUNCS('prctl')
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index 1dfd902..456be9b 100644
+--- a/lib/replace/wscript
++++ b/lib/replace/wscript
+@@ -248,18 +248,6 @@ def configure(conf):
+ 
+     conf.CHECK_FUNCS('prctl dirname basename')
  
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
@@ -21,6 +30,12 @@ diff -Nura samba-4.2.0rc1.orig/lib/replace/wscript samba-4.2.0rc1/lib/replace/ws
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 -
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
+-
      conf.CHECK_CODE('''
                  struct ucred cred;
                  socklen_t cred_len;
+-- 
+2.7.3
+
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 04b36dc..1148db2 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	10f76fa113213ae512db4a4823351178c93fb6bc95d98d0ebc72e3a74d43386f	samba-4.4.9.tar.gz
+sha256	1800d10ea14cabef67c83cc56a0f37f4f30ba5df218b3a1e7c874069a08c0f40	samba-4.5.4.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 065bf1f..7eacf8a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.4.9
+SAMBA4_VERSION = 4.5.4
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
@@ -14,7 +14,6 @@ SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-heimdal host-python \
 	e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
-	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline)
 
