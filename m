From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 13 Aug 2015 13:14:51 -0400
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following adds support for a host variant of the rpm package. This
support will allow a host system to setup/manipulate a target system's
initial RPM database during the post-build phase.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in.host     |  1 +
 package/rpm/Config.in.host |  6 ++++++
 package/rpm/rpm.mk         | 25 +++++++++++++++++++++++--
 3 files changed, 30 insertions(+), 2 deletions(-)
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
index 0000000..101f62c
--- /dev/null
+++ b/package/rpm/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_RPM
+	bool "host rpm"
+	help
+	  The RPM package management system.
+
+	  http://rpm5.org
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 7f346b2..c84ed04 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -8,6 +8,7 @@ RPM_VERSION_MAJOR = 5.2
 RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
 RPM_DEPENDENCIES = host-pkgconf zlib beecrypt neon popt openssl
+HOST_RPM_DEPENDENCIES = host-pkgconf host-zlib host-beecrypt host-neon host-popt host-openssl
 RPM_LICENSE = LGPLv2.1
 RPM_LICENSE_FILES = COPYING.LIB
 
@@ -15,7 +16,11 @@ RPM_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
 	ac_cv_va_copy=yes
 
-RPM_CONF_OPTS = \
+HOST_RPM_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -I$(HOST_DIR)/usr/include/beecrypt -I$(HOST_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
+	ac_cv_va_copy=yes
+
+RPM_CONFIGURE_ARGS = \
 	--disable-build-versionscript \
 	--disable-rpath \
 	--without-selinux \
@@ -23,42 +28,58 @@ RPM_CONF_OPTS = \
 	--without-perl \
 	--with-openssl=external \
 	--with-zlib=external \
-	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=external
 
+RPM_CONF_OPTS = $(RPM_CONFIGURE_ARGS) --with-libbeecrypt=$(STAGING_DIR)
+HOST_RPM_CONF_OPTS = $(RPM_CONFIGURE_ARGS) --with-libbeecrypt=$(HOST_DIR)
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 RPM_DEPENDENCIES += gettext
+HOST_RPM_DEPENDENCIES += host-gettext
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 RPM_DEPENDENCIES += pcre
 RPM_CONF_OPTS += --with-pcre=external
+HOST_RPM_CONF_OPTS += --with-pcre=external
 else
 RPM_CONF_OPTS += --with-pcre=none
+HOST_RPM_CONF_OPTS += --with-pcre=none
 endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 RPM_DEPENDENCIES += file
 RPM_CONF_OPTS += --with-file=external
+HOST_RPM_DEPENDENCIES += host-file
+HOST_RPM_CONF_OPTS += --with-file=external
 else
 RPM_CONF_OPTS += --with-file=none
+HOST_RPM_CONF_OPTS += --with-file=none
 endif
 
 # xz payload support needs a toolchain w/ C++
 ifeq ($(BR2_PACKAGE_XZ)$(BR2_INSTALL_LIBSTDCPP),yy)
 RPM_DEPENDENCIES += xz
 RPM_CONF_OPTS += --with-xz=external
+HOST_RPM_DEPENDENCIES += host-xz
+HOST_RPM_CONF_OPTS += --with-xz=external
 else
 RPM_CONF_OPTS += --with-xz=none
+HOST_RPM_CONF_OPTS += --with-xz=none
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 RPM_CONF_OPTS += --with-bzip2
 RPM_DEPENDENCIES += bzip2
+HOST_RPM_CONF_OPTS += --with-bzip2
+HOST_RPM_DEPENDENCIES += bzip2
 endif
 
 RPM_MAKE = $(MAKE1)
+HOST_RPM_MAKE = $(MAKE1)
 
 RPM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) program_transform_name= install
+HOST_RPM_INSTALL_TARGET_OPTS = DESTDIR=$(HOST_DIR) program_transform_name= install
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
