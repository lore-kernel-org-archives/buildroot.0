From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 11 Sep 2013 16:59:28 -0500
Subject: [Buildroot] [PATCH v2 08/17] libcgroup: new package
In-Reply-To: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378936777-28308-9-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Corrected the license version and license file to be correct.
  - Cleaned up the configure options to enable options for static
    libraries and linux-pam if they are selected in the configuration.

 package/Config.in              |    1 +
 package/libcgroup/Config.in    |    4 ++++
 package/libcgroup/libcgroup.mk |   38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 package/libcgroup/Config.in
 create mode 100644 package/libcgroup/libcgroup.mk

diff --git a/package/Config.in b/package/Config.in
index 0e7184a..a0ba26d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -654,6 +654,7 @@ source "package/libatomic_ops/Config.in"
 source "package/libbsd/Config.in"
 source "package/libcap/Config.in"
 source "package/libcap-ng/Config.in"
+source "package/libcgroup/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
new file mode 100644
index 0000000..17d2db2
--- /dev/null
+++ b/package/libcgroup/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBCGROUP
+	bool "libcgroup"
+	help
+	  libcgroup is a library that abstracts the control group file system in Linux. 
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
new file mode 100644
index 0000000..06f1e60
--- /dev/null
+++ b/package/libcgroup/libcgroup.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# libcgroup
+#
+################################################################################
+
+LIBCGROUP_VERSION = 0.38
+LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
+LIBCGROUP_SITE = http://sourceforge.net/projects/libcg/files/latest/download
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
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	LIBCGROUP_CONF_OPT += --enable-static --disable-shared
+endif
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
