From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:06:56 +0200
Subject: [Buildroot] [git commit branch/next] package/libbsd: new package
Message-ID: <20130512201213.915BB9A163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ae47d82649d38de6896270a6b6945d2467b7047
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/libbsd/Config.in |   10 ++++++++++
 package/libbsd/libbsd.mk |   21 +++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bbacd5c..55a38b9 100644
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
index 0000000..0ed9dac
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
