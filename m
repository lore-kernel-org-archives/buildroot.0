From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Nov 2017 13:33:20 +0100
Subject: [Buildroot] [git commit branch/next] ntp: no longer require openssl
Message-ID: <20171113221621.D6E93807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a2111258ace2fc4d01a6bb3d3287ec0115eef29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

4.2.8p10 no longer requires openssl to compile.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/Config.in |  1 -
 package/ntp/ntp.mk    | 10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1af02db..8ce9a5b 100644
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
index c70d6e6..6605c3b 100644
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
