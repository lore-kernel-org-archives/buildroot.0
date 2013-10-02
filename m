From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 2 Oct 2013 07:46:04 -0500
Subject: [Buildroot] [Patch v5] libcgroup: new package
Message-ID: <1380717964-15081-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - Cleaned up extra spaces (suggested by Peter)
  - Corrected the dl path (suggested by Peter)
  - Added dependencies on BR2_TOOLCHAIN_USES_GLIBC and
    BR2_INSTALL_LIBSTDCPP rather than reworking the 
    package (suggested by Peter)
Changes v3 -> v4:
  - Changed the length of the config comment (suggested by Thomas)
  - Removed unneeded configure options (suggested by Thomas)
Changes v2 -> v3:
  - No changes.
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Corrected the license version and license file to be correct.
  - Cleaned up the configure options to enable options for static
    libraries and linux-pam if they are selected in the configuration.

 package/Config.in              |    1 +
 package/libcgroup/Config.in    |   13 +++++++++++++
 package/libcgroup/libcgroup.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/libcgroup/Config.in
 create mode 100644 package/libcgroup/libcgroup.mk

diff --git a/package/Config.in b/package/Config.in
index d410c34..9874c43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -662,6 +662,7 @@ source "package/libatomic_ops/Config.in"
 source "package/libbsd/Config.in"
 source "package/libcap/Config.in"
 source "package/libcap-ng/Config.in"
+source "package/libcgroup/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
new file mode 100644
index 0000000..0f5c097
--- /dev/null
+++ b/package/libcgroup/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBCGROUP
+	bool "libcgroup"
+	depends on BR2_INSTALL_LIBSTDCPP
+	# libcgroup uses <fts.h> which is not included by default in uClibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  libcgroup is a library that abstracts the control
+	  group file system in Linux.
+
+	  http://libcg.sourceforge.net/
+
+comment "libcgroup requires a glibc toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
new file mode 100644
index 0000000..c2392e0
--- /dev/null
+++ b/package/libcgroup/libcgroup.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libcgroup
+#
+################################################################################
+
+LIBCGROUP_VERSION = 0.38
+LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
+LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v.038
+LIBCGROUP_LICENSE = LGPLv2.1
+LIBCGROUP_LICENSE_FILES = COPYING
+
+LIBCGROUP_INSTALL_STAGING = YES
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
+# large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992
+# for more information.
+LIBCGROUP_CONF_ENV = \
+	CXXFLAGS+="-U_FILE_OFFSET_BITS" \
+	CFLAGS+="-U_FILE_OFFSET_BITS"
+
+LIBCGROUP_CONF_OPT = \
+	--disable-tools \
+	--disable-daemon \
+	--disable-initscript-install
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+	LIBCGROUP_DEPENDENCIES += linux-pam
+	LIBCGROUP_CONF_OPT += --enable-pam
+else
+	LIBCGROUP_CONF_OPT += --disable-pam
+endif
+
+$(eval $(autotools-package))
-- 
1.7.1
