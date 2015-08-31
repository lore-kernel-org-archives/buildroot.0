From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 31 Aug 2015 13:26:17 -0400
Subject: [Buildroot] [PATCH v2 4/4] package/rpm: add host variant
In-Reply-To: <1441041977-9160-1-git-send-email-james.knight@rockwellcollins.com>
References: <1441041977-9160-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1441041977-9160-4-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following adds support for a host variant of the rpm package. This
support will allow a host system to setup/manipulate a target system's
initial RPM database during the post-build phase.

A target's default RPM database (/var/lib/rpm) is initially empty. If a
developer wishes to create this database during the build phase, they
will have to do so using the same database format between their host
system and target system. By provided an rpm host variant, a developer
can ensure an rpm database build, for example, during the post-build
phase will be compatible with the rpm system installed on the target.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v1 -> v2:
  - A series of changes (different configuration options) based off of a
     switch from rpm 4.12.0.1 (from rpm5).
  - Cleaned up configuration options to ensure host variant is not
     configured based off of target variant configuration (from comments
     provided by from Thomas Petazzoni).
  - Original patch set referenced a host variant neon package. This is
     no longer required in rpm 4.12.0.1 version.
---
 package/Config.in.host     |  1 +
 package/rpm/Config.in.host |  8 ++++++++
 package/rpm/rpm.mk         | 18 +++++++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 package/rpm/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 1e047aa..1820b20 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -22,6 +22,7 @@ menu "Host utilities"
 	source "package/patchelf/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/rpm/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/rpm/Config.in.host b/package/rpm/Config.in.host
new file mode 100644
index 0000000..3c15bd4
--- /dev/null
+++ b/package/rpm/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_RPM
+	bool "host rpm"
+	select BR2_PACKAGE_HOST_BEECRYPT
+	select BR2_PACKAGE_HOST_BERKELEYDB
+	help
+	  The RPM Package Manager (RPM).
+
+	  http://www.rpm.org/
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index adf408e..6de3e63 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -9,10 +9,11 @@ RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
+HOST_RPM_DEPENDENCIES = host-pkgconf host-beecrypt host-berkeleydb host-popt
 RPM_LICENSE = GPLv2
 RPM_LICENSE_FILES = COPYING
 
-RPM_CONF_OPTS += \
+RPM_CONFIGURE_ARGS = \
 	--disable-largefile \
 	--disable-rpath \
 	--enable-python=no \
@@ -20,6 +21,18 @@ RPM_CONF_OPTS += \
 	--with-gnu-ld \
 	--without-hackingdocs
 
+RPM_CONF_OPTS += \
+	$(RPM_CONFIGURE_ARGS)
+
+HOST_RPM_CONF_OPTS += \
+	$(RPM_CONFIGURE_ARGS) \
+	--with-beecrypt \
+	--without-archive \
+	--without-cap \
+	--without-libintl-prefix \
+	--without-lua \
+	--without-selinux
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
 RPM_CONF_OPTS += --with-acl
@@ -75,5 +88,8 @@ endif
 
 RPM_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) $(RPM_CONFIGURATION)"
+HOST_RPM_CONF_ENV += \
+	CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include/beecrypt"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
