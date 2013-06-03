From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 16:49:47 +0200
Subject: [Buildroot] [git commit] p11-kit: new package
Message-ID: <20130603152934.136BF9A893@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f0f72c8792ff416621cdd354aca084f1c0c4e02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/p11-kit/Config.in  |   15 +++++++++++++++
 package/p11-kit/p11-kit.mk |   15 +++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8a29c99..0d4ed90 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -610,6 +610,7 @@ source "package/mpc/Config.in"
 source "package/mpfr/Config.in"
 source "package/mtdev2tuio/Config.in"
 source "package/orc/Config.in"
+source "package/p11-kit/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
 source "package/protobuf-c/Config.in"
diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
new file mode 100644
index 0000000..40a07d3
--- /dev/null
+++ b/package/p11-kit/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_P11_KIT
+	bool "p11-kit"
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBTASN1
+	help
+	  Provides a way to load and enumerate PKCS#11 modules.
+	  Provides a standard configuration setup for installing PKCS#11
+	  modules in such a way that they're discoverable.
+
+	  http://p11-glue.freedesktop.org/p11-kit.html
+
+comment "p11-kit requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
new file mode 100644
index 0000000..2ddb27c
--- /dev/null
+++ b/package/p11-kit/p11-kit.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# p11-kit
+#
+#############################################################
+
+P11_KIT_VERSION = 0.18.1
+P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
+P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
+P11_KIT_INSTALL_STAGING = YES
+P11_KIT_CONF_OPT = --disable-static
+P11_KIT_LICENSE = BSD-3c
+P11_KIT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
