From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 00:22:55 +0200
Subject: [Buildroot] [PATCH 2/6] package/libbsd: new package
In-Reply-To: <cover.1368137904.git.yann.morin.1998@free.fr>
References: <cover.1368137904.git.yann.morin.1998@free.fr>
Message-ID: <5c0f98dff6b5fd1b8a2dc27c623d91d4e5dd16b2.1368137905.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Nathan Lynch <ntl@pobox.com>
---
 package/Config.in        |  1 +
 package/libbsd/Config.in | 10 ++++++++++
 package/libbsd/libbsd.mk | 21 +++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/libbsd/Config.in
 create mode 100644 package/libbsd/libbsd.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..fc97f58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -578,6 +578,7 @@ source "package/gmp/Config.in"
 source "package/gsl/Config.in"
 source "package/gtest/Config.in"
 source "package/libatomic_ops/Config.in"
+source "package/libbsd/Config.in"
 source "package/libcap/Config.in"
 source "package/libcap-ng/Config.in"
 source "package/libdaemon/Config.in"
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
new file mode 100644
index 0000000..7f2b55a
--- /dev/null
+++ b/package/libbsd/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBBSD
+	bool "libbsd"
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
index 0000000..3af1002
--- /dev/null
+++ b/package/libbsd/libbsd.mk
@@ -0,0 +1,21 @@
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
+LIBBSD_LICENSE        += (libraries), BSD-4c (documentation)
+endif
+
+LIBBSD_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.8.1.2
