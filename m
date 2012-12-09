From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:34:53 +0100
Subject: [Buildroot] [PATCH 20/51] package/libbsd: new package
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-21-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in        |    1 +
 package/libbsd/Config.in |   17 +++++++++++++++++
 package/libbsd/libbsd.mk |   25 +++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 package/libbsd/Config.in
 create mode 100644 package/libbsd/libbsd.mk

diff --git a/package/Config.in b/package/Config.in
index 559a093..37910c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,6 +503,7 @@ source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
 source "package/libatomic_ops/Config.in"
+source "package/libbsd/Config.in"
 source "package/libcap/Config.in"
 source "package/libcap-ng/Config.in"
 source "package/libdaemon/Config.in"
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
new file mode 100644
index 0000000..d1f9e46
--- /dev/null
+++ b/package/libbsd/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBBSD_AVAILABLE
+	def_bool y
+
+comment "libbsd requires (other packages)"
+	depends on !BR2_PACKAGE_LIBBSD_AVAILABLE
+
+config BR2_PACKAGE_LIBBSD
+	bool "libbsd"
+	depends on BR2_PACKAGE_LIBBSD_AVAILABLE
+	help
+	  This library provides useful functions commonly found on BSD
+	  systems, and lacking on others like GNU systems, thus making
+	  it easier to port projects with strong BSD origins, without
+	  needing to embed the same code over and over again on each
+	  project.
+	  
+	  http://libbsd.freedesktop.org/
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
new file mode 100644
index 0000000..d7438e8
--- /dev/null
+++ b/package/libbsd/libbsd.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# libbsd
+#
+#############################################################
+
+LIBBSD_VERSION         = 0.4.2
+LIBBSD_SOURCE          = libbsd-$(LIBBSD_VERSION).tar.gz
+LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
+LIBBSD_LICENSE         = BSD-3c MIT
+LIBBSD_LICENSE_FILES   = LICENSE
+
+# man-pages are BSD-4c, so that license only matters
+# if doc is kept in the target rootfs
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
+LIBBSD_LICENSE        += BSD-4c
+endif
+
+LIBBSD_AUTORECONF      = YES
+LIBBSD_AUTORECONF_OPT  = -f -i
+LIBBSD_DEPENDENCIES    = host-automake
+
+LIBBSD_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.2.5
