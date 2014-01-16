From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jan 2014 01:15:48 +0100
Subject: [Buildroot] [PATCH v2 05/12] libplist: new package
In-Reply-To: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389831355-19983-6-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libplist is a client for manipulating Apple Property List (.plist) files
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
---
Changes v1 -> v2:
  - Fix header (Yann E. Morin)
  - Fix comments on toolchain option (Peter Korsgaard)
---
 package/Config.in            |  1 +
 package/libplist/Config.in   | 12 ++++++++++++
 package/libplist/libplist.mk | 15 +++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/libplist/Config.in
 create mode 100644 package/libplist/libplist.mk

diff --git a/package/Config.in b/package/Config.in
index bd5bec1..8aa4a2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -734,6 +734,7 @@ source "package/libical/Config.in"
 source "package/liblog4c-localtime/Config.in"
 source "package/libnspr/Config.in"
 source "package/libpfm4/Config.in"
+source "package/libplist/Config.in"
 source "package/libpthsem/Config.in"
 source "package/libseccomp/Config.in"
 source "package/libsigc/Config.in"
diff --git a/package/libplist/Config.in b/package/libplist/Config.in
new file mode 100644
index 0000000..c9d511b
--- /dev/null
+++ b/package/libplist/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBPLIST
+	bool "libplist"
+	select BR2_PACKAGE_LIBXML2
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libplist is a client for manipulating Apple Property List
+	  (.plist) files
+
+	  http://cgit.sukimashita.com/libplist.git
+
+comment "libplist needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
new file mode 100644
index 0000000..87f09c6
--- /dev/null
+++ b/package/libplist/libplist.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libplist
+#
+################################################################################
+
+LIBPLIST_VERSION = 1.6
+LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
+LIBPLIST_DEPENDENCIES = libxml2
+LIBPLIST_INSTALL_STAGING = YES
+LIBPLIST_MAKE = $(MAKE1)
+LIBPLIST_LICENSE = LGPLv2.1+
+LIBPLIST_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
-- 
1.8.5.2
