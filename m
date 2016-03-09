From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 07:31:27 +0100
Subject: [Buildroot] [git commit] libpjsip: depend on libsrtp
Message-ID: <20160309063333.563CA81983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0997f4cb7e858afe2e24c5a011439adc7ca7155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/Config.in   | 1 +
 package/libpjsip/libpjsip.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 980fada..727d2ec 100644
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
index ee250f5..49abd74 100644
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
