From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 19:41:09 +0200
Subject: [Buildroot] [git commit] libtommath: new package
Message-ID: <20160428174450.4F9FA80110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2282f8276776144802b85cdf9f65aabdc178ea5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |  1 +
 package/libtommath/Config.in       |  7 +++++++
 package/libtommath/libtommath.hash |  2 ++
 package/libtommath/libtommath.mk   | 23 +++++++++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c7d415c..e645dfe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1244,6 +1244,7 @@ menu "Other"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libtasn1/Config.in"
+	source "package/libtommath/Config.in"
 	source "package/libtpl/Config.in"
 	source "package/libubox/Config.in"
 	source "package/libuci/Config.in"
diff --git a/package/libtommath/Config.in b/package/libtommath/Config.in
new file mode 100644
index 0000000..b2ffc72
--- /dev/null
+++ b/package/libtommath/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBTOMMATH
+	bool "libtommath"
+	help
+	  LibTomMath is a free open source portable number theoretic
+	  multiple-precision integer library written entirely in C.
+
+	  http://www.libtom.net
diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
new file mode 100644
index 0000000..fcf2ddc
--- /dev/null
+++ b/package/libtommath/libtommath.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  993a7df9ee091fca430cdde3263df57d88ef62af8103903214da49fc51bbb56c  ltm-1.0.tar.xz
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
new file mode 100644
index 0000000..463ea7b
--- /dev/null
+++ b/package/libtommath/libtommath.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# libtommath
+#
+################################################################################
+
+LIBTOMMATH_VERSION = 1.0
+LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
+LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
+LIBTOMMATH_LICENSE = WTFPL
+LIBTOMMATH_LICENSE_FILES = LICENSE
+LIBTOMMATH_INSTALL_STAGING = YES
+LIBTOMMATH_INSTALL_TARGET = NO  # only static library
+
+define LIBTOMMATH_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ $(TARGET_CFLAGS)"
+endef
+
+define LIBTOMMATH_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
+endef
+
+$(eval $(generic-package))
