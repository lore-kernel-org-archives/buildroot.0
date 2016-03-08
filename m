From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  9 Mar 2016 00:06:41 +0100
Subject: [Buildroot] [PATCH v2] libpjsip: depend on libsrtp
Message-ID: <1457478401-24164-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpjsip needs libsrtp to build, but it bundles a libsrtp version in
case one is not found during the configure step. The Buildroot policy
in such cases is to force using the external package, so forcibly
depend on libsrtp.

Adding --with-external-srtp also fixes libpjsip not correctly the
libsrtp installed in staging, which shows up with the symptom:

  .../libpjmedia.so: undefined reference to `srtp_deinit'
  collect2: error: ld returned 1 exit status

Fixes:
  http://autobuild.buildroot.org/results/305/305fdc8442cd2e8f51b90485be0dca83ffa36603/
  http://autobuild.buildroot.org/results/a2f/a2f407c1361ac5c24af122445e84645e9aee309d/
  ...and many other similar autobuild failures.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpjsip/Config.in   | 1 +
 package/libpjsip/libpjsip.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 980fada3d5fb..727d2ec3d06c 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBPJSIP
 	bool "libpjsip"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBSRTP
 	help
 	  PJSIP is a free and open source multimedia communication
 	  library written in C language implementing standard based
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index ee250f5b11ef..49abd744e59d 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -7,6 +7,7 @@
 LIBPJSIP_VERSION = 2.4.5
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
+LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPLv2+
 LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_INSTALL_STAGING = YES
@@ -22,7 +23,8 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-speex-aec \
 	--disable-resample \
 	--disable-video \
-	--disable-opencore-amr
+	--disable-opencore-amr \
+	--with-external-srtp=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBPJSIP_DEPENDENCIES += openssl
-- 
1.9.1
