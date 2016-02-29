From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:43:19 +0100
Subject: [Buildroot] [git commit] package/systemd: remove
	BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
Message-ID: <20160302202759.3A6377FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5a073ac021656dda1e734314d4bbea83a1c6e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option was a bit misleading since it only selected additional
libraries without --enable/disabling any features. Including all of them
here would add a lot of bloat so instead, it is replaced with notes
detailing which features each library enables.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Thomas:
 - slightly tweak Config.in help text, as suggested by Arnout.
 - add Config.in.legacy handling for BR2_PACKAGE_SYSTEMD_ALL_EXTRAS,
   as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy           | 10 ++++++++++
 package/systemd/Config.in  | 11 +++--------
 package/systemd/systemd.mk | 16 ++++++++++------
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1cd2697..69b3c84 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
+	bool "systemd all extras option has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  The systemd option to enable "all extras" has been
+	  removed. To get the same features, the libgcrypt and xz
+	  package should now be enabled.
+
 config BR2_GCC_VERSION_4_5_X
 	bool "gcc 4.5.x has been removed"
 	select BR2_LEGACY
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f7fc3bb..b7eca3a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -56,6 +56,9 @@ config BR2_PACKAGE_SYSTEMD
 	  The selection of other packages will enable some features:
 
 	  - acl package will add support for multi-seat.
+	  - xz package will add compression support in journal and coredump.
+	  - libgcrypt package will add support for journal sealing and
+	    DNSSEC verification in resolved.
 
 	  http://freedesktop.org/wiki/Software/systemd
 
@@ -64,14 +67,6 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
-config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
-	bool "enable all extras"
-	select BR2_PACKAGE_XZ
-	select BR2_PACKAGE_LIBGCRYPT
-	help
-	  Enable extra features for Systemd: journal compression and
-	  signing.
-
 config BR2_PACKAGE_SYSTEMD_KDBUS
 	bool "enable kdbus support"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b2cce11..9f2dc51 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -80,16 +80,20 @@ else
 SYSTEMD_CONF_OPTS += --disable-kdbus
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
-SYSTEMD_DEPENDENCIES += xz libgcrypt
+ifeq ($(BR2_PACKAGE_XZ),y)
+SYSTEMD_DEPENDENCIES += xz
+SYSTEMD_CONF_OPTS += --enable-xz
+else
+SYSTEMD_CONF_OPTS += --disable-xz
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+SYSTEMD_DEPENDENCIES += libgcrypt
 SYSTEMD_CONF_OPTS += \
-	--enable-xz \
 	--enable-gcrypt	\
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-SYSTEMD_CONF_OPTS += \
-	--disable-xz \
-	--disable-gcrypt
+SYSTEMD_CONF_OPTS += --disable-gcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
