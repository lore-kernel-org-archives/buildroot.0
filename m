From: James Knight <james.knight@rockwellcollins.com>
Date: Mon,  5 Oct 2015 16:26:59 -0400
Subject: [Buildroot] [PATCH v4 4/4] package/rpm: add host variant
In-Reply-To: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
References: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1444076819-10228-4-git-send-email-james.knight@rockwellcollins.com>
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
Changes v3 -> v4:
  - Removed invalid host symbols provided in Config.in.host (pointed out
     by Yann E. MORIN).
  - Altered name of common configuration variable from RPM_CONF_OPTS to
     RPM_COMMON_CONF_OPTS for clarity (suggested by Yann E. MORIN).

Changes v2 -> v3:
  - None.

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
 package/rpm/Config.in.host |  6 ++++++
 package/rpm/rpm.mk         | 17 ++++++++++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 package/rpm/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 1f69687..14766f8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -23,6 +23,7 @@ menu "Host utilities"
 	source "package/patchelf/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/rpm/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/rpm/Config.in.host b/package/rpm/Config.in.host
new file mode 100644
index 0000000..c3d188a
--- /dev/null
+++ b/package/rpm/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_RPM
+	bool "host rpm"
+	help
+	  The RPM Package Manager (RPM).
+
+	  http://www.rpm.org/
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 4b015cd..7a3d93a 100644
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
+RPM_COMMON_CONF_OPTS = \
 	--disable-largefile \
 	--disable-rpath \
 	--enable-python=no \
@@ -21,6 +22,17 @@ RPM_CONF_OPTS += \
 	--without-cap \
 	--without-hackingdocs
 
+RPM_CONF_OPTS = \
+	$(RPM_COMMON_CONF_OPTS)
+
+HOST_RPM_CONF_OPTS = \
+	$(RPM_COMMON_CONF_OPTS) \
+	--with-beecrypt \
+	--without-archive \
+	--without-libintl-prefix \
+	--without-lua \
+	--without-selinux
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
 RPM_CONF_OPTS += --with-acl
@@ -69,5 +81,8 @@ endif
 
 RPM_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) $(RPM_CONFIGURATION)"
+HOST_RPM_CONF_ENV += \
+	CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include/beecrypt"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
