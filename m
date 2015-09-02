From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 11:36:56 +0100
Subject: [Buildroot] [PATCHv3 1/2] udisks: bump to version 1.0.5
Message-ID: <1441190217-26852-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version depends on libgudev when using systemd, otherwise it fails
with an error like this one:

checking for GUDEV... no
configure: error: Package requirements (gudev-1.0 >= 147) were not met:

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3: add a comment to explain the libgudev dependency 
Changes v1 -> v2: depend on libgudev when using systemd

 package/udisks/Config.in   |    1 +
 package/udisks/udisks.hash |    2 +-
 package/udisks/udisks.mk   |    6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index a5da2bf..fba1793 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_UDISKS
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LIBATASMART
+	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_SYSTEMD
 	help
 	  The udisks project provides
 
diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 5debfd5..7ad4326 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5	udisks-1.0.4.tar.gz
+sha256 f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71  udisks-1.0.5.tar.gz
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 7a24106..957823c 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 1.0.4
+UDISKS_VERSION = 1.0.5
 UDISKS_SITE = http://hal.freedesktop.org/releases
 UDISKS_LICENSE = GPLv2+
 UDISKS_LICENSE_FILES = COPYING
@@ -22,6 +22,10 @@ UDISKS_DEPENDENCIES = 	\
 
 UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UDISKS_CONF_OPTS += libgudev
+endif
+
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
 UDISKS_CONF_OPTS += --enable-lvm2
 endif
-- 
1.7.1
