From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  7 Nov 2017 16:29:06 -0500
Subject: [Buildroot] [PATCH 1/1] ntp: no longer require openssl
Message-ID: <20171107212906.31336-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

4.2.8p10 no longer requires openssl to compile.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/ntp/Config.in |  1 -
 package/ntp/ntp.mk    | 10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1af02dbc0b..8ce9a5b0bb 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NTP
 	bool "ntp"
 	select BR2_PACKAGE_LIBEVENT
-	select BR2_PACKAGE_OPENSSL
 	help
 	  Network Time Protocol suite/programs.
 	  Provides things like ntpd, ntpdate, ntpq, etc...
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index c70d6e6351..8c30b749d4 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -7,7 +7,7 @@
 NTP_VERSION_MAJOR = 4.2
 NTP_VERSION = $(NTP_VERSION_MAJOR).8p10
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
-NTP_DEPENDENCIES = host-pkgconf libevent openssl $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = NTP
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
@@ -18,12 +18,18 @@ NTP_CONF_OPTS = \
 	--disable-debugging \
 	--with-yielding-select=yes \
 	--disable-local-libevent \
-	--with-crypto
 
 # 0002-ntp-syscalls-fallback.patch
 # 0003-ntpq-fpic.patch
 NTP_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NTP_CONF_OPTS += --with-crypto
+NTP_DEPENDENCIES += openssl
+else
+NTP_CONF_OPTS += --without-crypto --disable-openssl-random
+endif
+ 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
 NTP_CONF_OPTS += --with-locfile=linux
 else
-- 
2.13.6
