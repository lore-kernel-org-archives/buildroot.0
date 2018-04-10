From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Apr 2018 14:42:25 +0300
Subject: [Buildroot] [PATCH] nmap: bump to version 7.70
Message-ID: <dd8327325d3bb6fb24bfb2acaa0d3ec65c031b84.1523360545.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop libssh2 configure test fix; the issue is fixed upstream.

Add license file hash.

Cc: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...c-fix-AC_CHECK_HEADER-call-to-test-for-li.patch | 30 ----------------------
 package/nmap/nmap.hash                             |  6 +++--
 package/nmap/nmap.mk                               | 12 ++-------
 3 files changed, 6 insertions(+), 42 deletions(-)
 delete mode 100644 package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch

diff --git a/package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch b/package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch
deleted file mode 100644
index ed5cae259e4b..000000000000
--- a/package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ff629766dbd3b5e179330ba4f07fd7e3d8384ec0 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Wed, 1 Nov 2017 15:30:40 +0100
-Subject: [PATCH] configure.ac: fix AC_CHECK_HEADER call to test for libssh2
-
-The -lm argument is passed as an argument to AC_CHECK_HEADER(), which
-doesn't make sense. The intention was to pass it as the fifth
-argument of AC_CHECK_LIB().
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3d00e164e..67db42e08 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -674,7 +674,7 @@ AC_HELP_STRING([--without-libssh2], [Compile without libssh2]),
-       AC_CHECK_LIB(ssh2, libssh2_version,
-         [have_libssh2=yes
-         LIBSSH2_INC=$with_libssh2/include
--        LIBSSH2_LIB=$with_libssh2/lib])],,[-lm])
-+        LIBSSH2_LIB=$with_libssh2/lib],,[-lm])])
- 
-     LDFLAGS=$_ldflags
-     CPPFLAGS=$_cppflags
--- 
-2.13.6
-
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 740ec7a001eb..349f98d48b9f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,4 @@
-# From https://nmap.org/dist/sigs/nmap-7.60.tar.bz2.digest.txt
-sha256 a8796ecc4fa6c38aad6139d9515dc8113023a82e9d787e5a5fb5fa1b05516f21  nmap-7.60.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.70.tar.bz2.digest.txt
+sha256 847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18  nmap-7.70.tar.bz2
+# Locally calculated
+sha256 e013006fbdb7a7923e456e72272b115a5d722a3c6a372f27b5e8fcd282104651  COPYING
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 92a2be1b5406..391215dbf4fb 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,23 +4,15 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.60
+NMAP_VERSION = 7.70
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
-NMAP_DEPENDENCIES = libpcap host-autoconf
+NMAP_DEPENDENCIES = libpcap
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included
 NMAP_LICENSE = GPL-2.0
 NMAP_LICENSE_FILES = COPYING
 
-# nmap doesn't autoreconf properly, so we just re-generate the
-# top-level configure script, since we are patching configure.ac.
-define NMAP_DO_AUTOCONF
-	(cd $(@D); $(HOST_DIR)/bin/autoconf)
-endef
-
-NMAP_PRE_CONFIGURE_HOOKS += NMAP_DO_AUTOCONF
-
 # needed by libpcap
 NMAP_LIBS_FOR_STATIC_LINK += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 
-- 
2.16.3
