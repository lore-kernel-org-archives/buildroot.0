From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 09:43:52 -0500
Subject: [Buildroot] [NEXT 1/1] postgresql: bump to 10.1
Message-ID: <20171120144352.11599-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

changes:

- Add a hash for the license file.

- PostgreSQL 10.0 and above will default to checking for /dev/urandom if an
  SSL library is not found, which will fail when cross compiling.
  The workaround is to add --disable-strong-random to the configure options
  if a SSL library not selected.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/postgresql/postgresql.hash | 7 ++++---
 package/postgresql/postgresql.mk   | 4 +++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index e628389..e234770 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.6/postgresql-9.6.6.tar.bz2.sha256
-sha256 399cdffcb872f785ba67e25d275463d74521566318cfef8fe219050d063c8154  postgresql-9.6.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.1/postgresql-10.1.tar.bz2.sha256
+sha256	3ccb4e25fe7a7ea6308dea103cac202963e6b746697366d72ec2900449a5e713	postgresql-10.1.tar.bz2
+
 # License file, Locally calculated
-sha256 7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676  COPYRIGHT
+sha256	7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 50ce212..d1f231b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.6
+POSTGRESQL_VERSION = 10.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -56,6 +56,8 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 POSTGRESQL_DEPENDENCIES += openssl
 POSTGRESQL_CONF_OPTS += --with-openssl
+else
+POSTGRESQL_CONF_OPTS += --disable-strong-random
 endif
 
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
-- 
2.13.6
