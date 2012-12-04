From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 10:21:05 -0800
Subject: [Buildroot] [git commit] package: add classpath
Message-ID: <20121204190928.0DF9899716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5062f530081913bd0487f0f879be180f30836ab8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Requires java, javac and jar on the build machine, similar to how we
require gcc/g++.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

classpath: fixup
---
 package/Config.in              |    1 +
 package/classpath/Config.in    |   14 ++++++++++
 package/classpath/classpath.mk |   55 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5ba1f05..66e8352 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ endmenu
 menu "Other"
 source "package/apr/Config.in"
 source "package/apr-util/Config.in"
+source "package/classpath/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
new file mode 100644
index 0000000..45d5984
--- /dev/null
+++ b/package/classpath/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CLASSPATH
+	bool "classpath"
+	depends on BR2_PACKAGE_JAMVM
+	depends on BR2_INET_IPV6
+	help
+	  GNU Classpath, Essential Libraries for Java, is a GNU
+	  project to create free core class libraries for use with
+	  virtual machines and compilers for the java programming
+	  language.
+
+	  http://classpath.org
+
+comment "classpath requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
new file mode 100644
index 0000000..9142f69
--- /dev/null
+++ b/package/classpath/classpath.mk
@@ -0,0 +1,55 @@
+CLASSPATH_VERSION = 0.98
+CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
+CLASSPATH_CONF_OPT = \
+	--disable-examples \
+	--disable-plugin \
+	--disable-rpath \
+	--disable-Werror \
+	--disable-gconf-peer \
+	--disable-tools
+
+CLASSPATH_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+CLASSPATH_CONF_OPT += --enable-alsa
+CLASSPATH_DEPENDENCIES += alsa-lib
+else
+CLASSPATH_CONF_OPT += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_GMP),y)
+CLASSPATH_CONF_OPT += --enable-gmp
+CLASSPATH_DEPENDENCIES += gmp
+else
+CLASSPATH_CONF_OPT += --disable-gmp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+CLASSPATH_CONF_OPT += --enable-gstreamer-peer
+CLASSPATH_DEPENDENCIES += gst-plugins-base
+else
+CLASSPATH_CONF_OPT += --disable-gstreamer-peer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
+CLASSPATH_CONF_OPT += --enable-gtk-peer
+CLASSPATH_DEPENDENCIES += libgtk2
+else
+CLASSPATH_CONF_OPT += --disable-gtk-peer
+endif
+
+ifeq ($(BR2_PACKAGE_QT),y)
+CLASSPATH_CONF_OPT += --enable-qt-peer
+CLASSPATH_DEPENDENCIES += qt
+else
+CLASSPATH_CONF_OPT += --disable-qt-peer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
+CLASSPATH_CONF_OPT += --enable-xmlj
+CLASSPATH_DEPENDENCIES += libxml2 libxslt
+else
+CLASSPATH_CONF_OPT += --disable-xmlj
+endif
+
+$(eval $(autotools-package))
