From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 1 Oct 2013 15:19:45 -0500
Subject: [Buildroot] [Patch v4] libcgroup: new package
Message-ID: <1380658785-16964-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in              |    1 +
 package/libcgroup/Config.in    |    7 +++++++
 package/libcgroup/libcgroup.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/libcgroup/Config.in
 create mode 100644 package/libcgroup/libcgroup.mk

diff --git a/package/Config.in b/package/Config.in
index bb8c6b7..8427abc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -661,6 +661,7 @@ source "package/libatomic_ops/Config.in"
 source "package/libbsd/Config.in"
 source "package/libcap/Config.in"
 source "package/libcap-ng/Config.in"
+source "package/libcgroup/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
new file mode 100644
index 0000000..9f8754d
--- /dev/null
+++ b/package/libcgroup/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBCGROUP
+	bool "libcgroup"
+	help
+	  libcgroup is a library that abstracts the control
+	  group file system in Linux.
+	  
+	  http://libcg.sourceforge.net/
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
new file mode 100644
index 0000000..fd7c4fc
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
