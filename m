From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Oct 2017 12:49:13 -0400
Subject: [Buildroot] [PATCH 1/1] postgresql: bump to 10.0
Message-ID: <20171024164913.23133-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

changes:
- add has for license file.
- postgresql 10.0 will default to checking for /dev/urandom if a ssl
  library is not found, which will fail when cross compiling. The
  workaround is to add --disable-strong-random if a ssl library is
  not installed to the conf opts.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/postgresql/postgresql.hash | 7 +++++--
 package/postgresql/postgresql.mk   | 4 +++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 62ce9a7407..01531231a9 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.5/postgresql-9.6.5.tar.bz2.sha256
-sha256 06da12a7e3dddeb803962af8309fa06da9d6989f49e22865335f0a14bad0744c  postgresql-9.6.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.0/postgresql-10.0.tar.bz2.sha256
+sha256 712f5592e27b81c5b454df96b258c14d94b6b03836831e015c65d6deeae57fd1  postgresql-10.0.tar.bz2
+
+# Locally computed
+sha256 7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676 COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7adb957cf0..d88daf478d 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.5
+POSTGRESQL_VERSION = 10.0
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
