From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:47 -0500
Subject: [Buildroot] [PATCH 08/17] libcgroup: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-9-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in              |    1 +
 package/libcgroup/Config.in    |    4 ++++
 package/libcgroup/libcgroup.mk |   22 ++++++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/libcgroup/Config.in
 create mode 100644 package/libcgroup/libcgroup.mk

diff --git a/package/Config.in b/package/Config.in
index 9e59b90..72e1fde 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -629,6 +629,7 @@ source "package/libatomic_ops/Config.in"
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
index 0000000..965f8c1
--- /dev/null
+++ b/package/libcgroup/libcgroup.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# libcgroup
+#
+#############################################################
+LIBCGROUP_VERSION = 0.38
+LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
+LIBCGROUP_SITE = http://sourceforge.net/projects/libcg/files/latest/download
+LIBCGROUP_LICENSE = LGPLv2.0
+LIBCGROUP_LICENSE_FILES = 
+LIBCGROUP_DEPENDENCIES = linux-pam
+
+LIBCGROUP_INSTALL_STAGING = YES
+LIBCGROUP_INSTALL_TARGET = YES
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h large file support.
+# see https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+# This same issue is in policycoreutils
+LIBCGROUP_CONF_ENV = CXXFLAGS+="-U_FILE_OFFSET_BITS" \
+	CFLAGS+="-U_FILE_OFFSET_BITS"
+
+$(eval $(autotools-package))
-- 
1.7.1
