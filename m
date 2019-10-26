From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Oct 2019 10:21:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/aespipe: bump version to 2.4f
Message-ID: <20191026082120.10719-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated link to package homepage since old link is just a redirect now.

Added sha1 and md5 hashes provided by upstream.

Removed -no-pie workaround after upstream added a check in configure,
quoting ChangeLog:

- Added configure script autodetection for x86/amd64 -fno-pie compile
  and -no-pie linker flags. These are needed when compiler/linker
  produces position independent executable (PIE) by default.

Build-tested host-aespipe on Debian Buster 10.1 using
"gcc version 8.3.0 (Debian 8.3.0-6)"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/aespipe/Config.in      |  2 +-
 package/aespipe/Config.in.host |  2 +-
 package/aespipe/aespipe.hash   |  5 ++++-
 package/aespipe/aespipe.mk     | 12 +-----------
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/package/aespipe/Config.in b/package/aespipe/Config.in
index 2c2ff5cd8c..e1683a0aa2 100644
--- a/package/aespipe/Config.in
+++ b/package/aespipe/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_AESPIPE
 	  It can be used to encrypt and decrypt loop-AES compatible
 	  encrypted disk images.
 
-	  http://koti.tnnet.fi/jari.ruusu/linux/
+	  http://loop-aes.sourceforge.net/
diff --git a/package/aespipe/Config.in.host b/package/aespipe/Config.in.host
index b64868ce74..1e98c21c9a 100644
--- a/package/aespipe/Config.in.host
+++ b/package/aespipe/Config.in.host
@@ -7,4 +7,4 @@ config BR2_PACKAGE_HOST_AESPIPE
 	  archives. It can be used to encrypt and decrypt loop-AES
 	  compatible encrypted disk images.
 
-	  http://koti.tnnet.fi/jari.ruusu/linux/
+	  http://loop-aes.sourceforge.net/
diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index 7e3a16503c..134a16df48 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4f/
+sha1 2c23e1a6be298cf4f173f06b1123e4ecd5e9a202  aespipe-v2.4f.tar.bz2
+md5 ed05c62c1954110f009bedda4bc1562f  aespipe-v2.4f.tar.bz2
 # Locally computed:
-sha256 bad5abb8678c2a6062d22b893171623e0c8e6163b5c1e6e5086e2140e606b93a  aespipe-v2.4e.tar.bz2
+sha256 b135e1659f58dc9be5e3c88923cd03d2a936096ab8cd7f2b3af4cb7a844cef96  aespipe-v2.4f.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index aa25420f11..fd4f776dda 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,20 +4,10 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4e
+AESPIPE_VERSION = 2.4f
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
 
-# Recent Debian, Gentoo and Ubuntu enable -fPIE by default, breaking the build:
-# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837393
-# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835148
-# Older gcc versions however don't support the -no-pie flag, so we have to
-# check its availability.
-HOST_AESPIPE_NO_PIE_FLAG = $(call host-cc-option,-no-pie)
-HOST_AESPIPE_CONF_ENV = \
-	CFLAGS="$(HOST_CFLAGS) $(HOST_AESPIPE_NO_PIE_FLAG)" \
-	LDFLAGS="$(HOST_LDFLAGS) $(HOST_AESPIPE_NO_PIE_FLAG)"
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.20.1
