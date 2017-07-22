From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Jul 2017 12:07:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/heimdal: security bump to version
	7.4.0
Message-ID: <20170722100736.25753-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes security bugs CVE-2017-11103 & CVE-2017-6594

Changed upstream tarball location as noted in the release notes:
http://www.h5l.org/releases.html?show=7.4.0

--with-db-type-preference= is needed to fix a build error:

  CCLD     otp
../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_get_internal':
otp_db.c:(.text+0x32): undefined reference to `__roken_dbm_fetch'
otp_db.c:(.text+0xd9): undefined reference to `__roken_dbm_store'
../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_db_open':
otp_db.c:(.text+0x1c9): undefined reference to `__roken_dbm_open'
../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_db_close':
otp_db.c:(.text+0x205): undefined reference to `__roken_dbm_close'
../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_delete':
otp_db.c:(.text+0x23e): undefined reference to `__roken_dbm_delete'
../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_put':
otp_db.c:(.text+0x388): undefined reference to `__roken_dbm_store'
collect2: error: ld returned 1 exit status

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/heimdal/heimdal.hash | 4 ++--
 package/heimdal/heimdal.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index 12770e17f..a0e0f3f1b 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	cee58ab3a4ce79f243a3e73f465dac19fe2b93ef1c5ff244d6f1d689fedbde2d	heimdal-7.1.0.tar.gz
+# Locally calculated
+sha256 3de14ecd36ad21c1694a13da347512b047f4010d176fe412820664cb5d1429ad  heimdal-7.4.0.tar.gz
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 5af792685..57325564c 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 7.1.0
-HEIMDAL_SITE = http://www.h5l.org/dist/src
+HEIMDAL_VERSION = 7.4.0
+HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
 HEIMDAL_MAKE = $(MAKE1)
@@ -15,6 +15,7 @@ HOST_HEIMDAL_CONF_OPTS = \
 	--enable-static \
 	--without-openldap \
 	--without-capng \
+	--with-db-type-preference= \
 	--without-sqlite3 \
 	--without-libintl \
 	--without-openssl \
-- 
2.11.0
