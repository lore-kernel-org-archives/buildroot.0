From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Sep 2015 23:39:34 +0200
Subject: [Buildroot] [git commit] udisks: bump to version 1.0.5
Message-ID: <20150907221137.C689A81E80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46a615bb6439a4fe69f1bfc6a347852b993d46a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version depends on libgudev when using systemd, otherwise it fails
with an error like this one:

checking for GUDEV... no
configure: error: Package requirements (gudev-1.0 >= 147) were not met:

[Peter: add to _DEPENDENCIES, not _CONF_OPTS]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udisks/Config.in   |    6 ++++++
 package/udisks/udisks.hash |    2 +-
 package/udisks/udisks.mk   |   11 ++++++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index a5da2bf..f24df03 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -12,6 +12,12 @@ config BR2_PACKAGE_UDISKS
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LIBATASMART
+	# When eudev is used as the udev provider, libgudev is automatically
+	# provided as it is part of eudev. However, when systemd is used as
+	# the udev provider, libgudev is not provided, and needs to be built
+	# separately. This is why we select the libgudev package only if
+	# systemd is used.
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
index 7a241069..bea9452 100644
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
@@ -22,6 +22,15 @@ UDISKS_DEPENDENCIES = 	\
 
 UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
 
+# When eudev is used as the udev provider, libgudev is automatically
+# provided as it is part of eudev. However, when systemd is used as the
+# udev provider, libgudev is not provided, and needs to be built
+# separately. This is why we select the libgudev package only if systemd
+# is used.
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UDISKS_DEPENDENCIES += libgudev
+endif
+
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
 UDISKS_CONF_OPTS += --enable-lvm2
 endif
