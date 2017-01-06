From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Jan 2017 12:19:16 +0100
Subject: [Buildroot] [git commit] heimdal: bump to version 7.1.0
Message-ID: <20170106112237.0D6BC8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a65f1d5f7861062a9bcb3bf1444967d0ee28918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches and related autoreconf.
Re-enable parallel builds to check against the autobuilders.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heimdal/0001-vendor.patch                  | 19 ------------
 ...dm5-fix-race-in-Makefile-with-kadm5_err.h.patch | 35 ----------------------
 package/heimdal/heimdal.hash                       |  2 +-
 package/heimdal/heimdal.mk                         |  5 +---
 4 files changed, 2 insertions(+), 59 deletions(-)

diff --git a/package/heimdal/0001-vendor.patch b/package/heimdal/0001-vendor.patch
deleted file mode 100644
index 1ccd629..0000000
--- a/package/heimdal/0001-vendor.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add --vendor option to krb5-config, required by samba 4.
-Status: Backport from upstream git.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura heimdal-1.5.3.orig/tools/krb5-config.in heimdal-1.5.3.vendor/tools/krb5-config.in
---- heimdal-1.5.3.orig/tools/krb5-config.in	2012-12-09 19:06:44.000000000 -0300
-+++ heimdal-1.5.3.vendor/tools/krb5-config.in	2013-12-18 15:49:45.283986300 -0300
-@@ -50,6 +50,10 @@
-     do_usage=yes
-     usage_exit=0
-     ;;
-+  --vendor)
-+    echo "Heimdal";
-+    exit 0
-+    ;;
-   --version)
-     echo "@PACKAGE@ @VERSION@"
-     exit 0
diff --git a/package/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch b/package/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
deleted file mode 100644
index 7361bf2..0000000
--- a/package/heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 18fe7d300f133c2b9eb93bb4bd81e4644979a74b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jakub=20=C4=8Cajka?= <jcajka@redhat.com>
-Date: Tue, 1 Jul 2014 13:13:43 -0600
-Subject: [PATCH] kadm5: fix race in Makefile with kadm5_err.h
-
-When running make with -j4, occasionally kadm5 fails due to a missing
-header file kadm5_err.h. Fix the race condition.
-
-Reported at https://bugzilla.redhat.com/1115164
-
-Reviewed-by: Ken Dreyer <ktdreyer@ktdreyer.com>
-
-Backported from upstream commit
-6affa4cceceaa1369dd895f8acdd7a883ee65674.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- lib/kadm5/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/kadm5/Makefile.am b/lib/kadm5/Makefile.am
-index f8be3b1..1b399b1 100644
---- a/lib/kadm5/Makefile.am
-+++ b/lib/kadm5/Makefile.am
-@@ -155,6 +155,7 @@ iprop-commands.c iprop-commands.h: iprop-commands.in
- 	$(SLC) $(srcdir)/iprop-commands.in
- 
- $(libkadm5srv_la_OBJECTS): kadm5_err.h
-+$(libkadm5clnt_la_OBJECTS): kadm5_err.h
- $(iprop_log_OBJECTS): iprop-commands.h
- 
- client_glue.lo server_glue.lo: $(srcdir)/common_glue.c
--- 
-2.4.5
-
diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index f32d279..12770e1 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	8fe19e0f12ff0d0c2f20a6cf56727deaabd89db9c197288022fb489e103b730d	heimdal-1.6rc2.tar.gz
+sha256	cee58ab3a4ce79f243a3e73f465dac19fe2b93ef1c5ff244d6f1d689fedbde2d	heimdal-7.1.0.tar.gz
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 8199229..a20ec8f 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 1.6rc2
+HEIMDAL_VERSION = 7.1.0
 HEIMDAL_SITE = http://www.h5l.org/dist/src
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
@@ -24,11 +24,8 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--without-x \
 	--disable-heimdal-documentation
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
-HEIMDAL_MAKE = $(MAKE1)
 HEIMDAL_LICENSE = BSD-3c
 HEIMDAL_LICENSE_FILES = LICENSE
-# 0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
-HEIMDAL_AUTORECONF = YES
 
 # We need asn1_compile in the PATH for samba4
 define HOST_HEIMDAL_MAKE_SYMLINK
