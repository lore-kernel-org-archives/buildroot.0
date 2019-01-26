From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Jan 2019 11:10:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/clamav: bump version to 0.101.1
Message-ID: <20190126101037.22267-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...n-libs-curl.m4-fix-curl-config-detec.patch | 75 -------------------
 package/clamav/clamav.hash                    |  2 +-
 package/clamav/clamav.mk                      |  4 +-
 3 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 package/clamav/0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch

diff --git a/package/clamav/0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch b/package/clamav/0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch
deleted file mode 100644
index 1d26b099b9..0000000000
--- a/package/clamav/0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 6b6ff53b5931c162be13504a1efc53fc5212f9d1 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 7 May 2018 22:57:34 +0200
-Subject: [PATCH] m4/reorganization/libs/curl.m4: fix curl-config detection
- logic
-
-The current logic in curl.m4 doesn't behave properly when
---without-libcurl is passed to the ./configure script.
-
-Indeed, in this case what happens is that:
-
- (1) Since --without-libcurl is passed, LIBCURL_HOME is set to nothing
-
- (2) find_curl is set to "no"
-
- (3) Due to find_curl being "no", LIBCURL_HOME is not set to
-     /usr/local and remains empty
-
- (4) We test if $LIBCURL_HOME/bin/curl_config exists, which is
-     equivalent to testing if /bin/curl-config exists. So curl.m4 is
-     looking at /bin/curl-config, which is irrelevant in a
-     cross-compilation context: it is not because the build machine
-     has libcurl installed that it is available for the target.
-
-     Due to this mistake, it sets have_curl="yes"
-
-Due to this, the ./configure script assumes it can build the
-clamsubmit program, which fails at build time because curl/curl.h
-doesn't exist.
-
-To fix this, this commit rewrites the curl-config detection logic with
-a simpler loop. If find_curl=yes, it means we have to find libcurl
-ourselves, so we iterate over /usr/local and /usr, and check if a
-bin/curl-config binary is available there. If so, we use this path as
-LIBCURL_HOME and set have_curl="yes".
-
-This preserves the existing behavior, while fixing the situation where
---without-libcurl is passed, but /bin/curl-config exists.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/Cisco-Talos/clamav-devel/pull/87
----
- m4/reorganization/libs/curl.m4 | 15 +++++----------
- 1 file changed, 5 insertions(+), 10 deletions(-)
-
-diff --git a/m4/reorganization/libs/curl.m4 b/m4/reorganization/libs/curl.m4
-index 2a5966ee7..b6a9c2137 100644
---- a/m4/reorganization/libs/curl.m4
-+++ b/m4/reorganization/libs/curl.m4
-@@ -19,17 +19,12 @@ fi
- [find_curl="yes"])
- 
- if test "X$find_curl" = "Xyes"; then
--    LIBCURL_HOME=/usr/local
--fi
--if test -f "$LIBCURL_HOME/bin/curl-config"; then
--    have_curl="yes"
--else
--    if test "X$find_curl" = "Xyes"; then
--        LIBCURL_HOME=/usr
--        if test -f "$LIBCURL_HOME/bin/curl-config"; then
--            have_curl="yes"
-+    for p in /usr/local /usr ; do
-+        if test -f "${p}/bin/curl-config"; then
-+           LIBCURL_HOME=$p
-+           have_curl="yes"
-         fi
--    fi
-+    done
- fi
- 
- if test "X$have_curl" = "Xyes"; then
--- 
-2.14.3
-
diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 390251fc24..9ac68e7607 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 4a2e4f0cd41e62adb5a713b4a1857c49145cd09a69957e6d946ecad575206dd6  clamav-0.100.2.tar.gz
+sha256 fa368fa9b2f57638696150c7d108b06dec284e8d8e3b8e702c784947c01fb806  clamav-0.101.1.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 25ae240545..7e1b162f79 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.100.2
+CLAMAV_VERSION = 0.101.1
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
@@ -16,8 +16,6 @@ CLAMAV_DEPENDENCIES = \
 	openssl \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
-# 0003-m4-reorganization-libs-curl.m4-fix-curl-config-detec.patch
-CLAMAV_AUTORECONF = YES
 
 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
-- 
2.20.1
