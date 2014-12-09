From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:21 +0000
Subject: [Buildroot] [PATCH 1/8] Adding janus-gateway and dependencies
Message-ID: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/ding-libs/Config.in    | 14 ++++++++++++++
 package/ding-libs/ding-libs.mk | 16 ++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/ding-libs/Config.in
 create mode 100644 package/ding-libs/ding-libs.mk

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
new file mode 100644
index 0000000..4840c51
--- /dev/null
+++ b/package/ding-libs/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DING_LIBS
+	bool "ding-libs"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  DING-LIBS (DING Is Not Glib) are a set of small, useful libraries that SSSD uses and makes available to other projects. They provide:
+	    dhash - A dynamic hash table
+	    ini_config - A library for parsing and managing INI files
+	    path_utils - Manage UNIX paths and subsets of paths
+	    collection - A generic, hierarchical grouping mechanism for complex data sets
+	    ref_array - A dynamically-growing, reference-counted array
+	    libbasicobjects - A set of fundamental object types for C
+
+	  https://git.fedorahosted.org/git/ding-libs.git
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
new file mode 100644
index 0000000..c49a9b7
--- /dev/null
+++ b/package/ding-libs/ding-libs.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# ding-libs
+#
+#############################################################
+DING_LIBS_VERSION = 0_4_0
+DING_LIBS_SOURCE = ding_libs-$(DING_LIBS_VERSION).tar.xz
+DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot 
+DING_LIBS_DEPENDENCIES = $(if !$(BR2_ENABLE_LOCALE),libiconv) $(if $(BR2_NEEDS_GETTEXT),gettext) 
+DING_LIBS_AUTORECONF = YES
+DING_LIBS_INSTALL_STAGING = YES
+DING_LIBS_LICENSE = GPLv3
+DING_LIBS_LICENSE_FILES = COPYING
+DING_LIBS_MAKE=$(MAKE1)
+
+$(eval $(autotools-package))
-- 
1.9.1
