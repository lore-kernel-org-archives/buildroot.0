From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Oct 2016 20:03:10 +0300
Subject: [Buildroot] [PATCH 2/2] libpcap: bump to version 1.8.1
In-Reply-To: <806b12235b685b37dced54464cbd380abf091c33.1477501390.git.baruch@tkos.co.il>
References: <806b12235b685b37dced54464cbd380abf091c33.1477501390.git.baruch@tkos.co.il>
Message-ID: <0a7a49e96ee2626cb9d1909826751a50646630b2.1477501390.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Also remove ac_cv_linux_vers caching since this check was remove in upstream
commit f3e011b18c55ae.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ....in-fix-detect-of-if_bonding.h-on-uclinux.patch | 30 ----------------------
 package/libpcap/libpcap.hash                       |  2 +-
 package/libpcap/libpcap.mk                         |  5 +---
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch

diff --git a/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch b/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch
deleted file mode 100644
index 7838c6f25676..000000000000
--- a/package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5b8dc4eaeab60d5effc33055e5bce9ac0d98d339 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 2 Jun 2015 21:39:15 +0300
-Subject: [PATCH] configure.in: fix detect of if_bonding.h on uclinux
-
-noMMU Linux (uClinux) is also Linux
-
-Upstream status: https://github.com/the-tcpdump-group/libpcap/pull/440
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index be4b29e2f8ba..31287d0dbe61 100644
---- a/configure.in
-+++ b/configure.in
-@@ -149,7 +149,7 @@ struct rtentry;
- fi
- 
- case "$host_os" in
--linux*)
-+linux*|uclinux*)
- 	AC_CHECK_HEADERS(linux/sockios.h linux/if_bonding.h,,,
- 	[
- #include <sys/socket.h>
--- 
-2.1.4
-
diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 5ce53673b803..6894046aff45 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7f448b0	libpcap-1.7.4.tar.gz
+sha256	673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e	libpcap-1.8.1.tar.gz
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 0a74de7b8ea7..258308795379 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.7.4
+LIBPCAP_VERSION = 1.8.1
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = zlib host-flex host-bison
 
-# We're patching configure.in
-LIBPCAP_AUTORECONF = YES
 LIBPCAP_CONF_ENV = \
-	ac_cv_linux_vers=2 \
 	ac_cv_header_linux_wireless_h=yes \
 	CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
-- 
2.9.3
