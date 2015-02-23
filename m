From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 18:01:07 +0100
Subject: [Buildroot] [git commit branch/next] libsigrok: enable building C++
	bindings
Message-ID: <20150223170203.5855881787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd3c6e26c5c368ee76ab2a42c1c76994f93a4c9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
 - Use BR2_INSTALL_LIBSTDCPP instead of BR2_TOOLCHAIN_BUILDROOT_CXX,
   so that the condition also works with external toolchains.
 - Use a 'if BR2_PACKAGE_LIBSIGROK' instead of duplicating the
   dependency.]

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/Config.in    |   15 +++++++++++++++
 package/libsigrok/libsigrok.mk |    9 ++++++++-
 2 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 47f812c..93bd06f 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -16,6 +16,21 @@ config BR2_PACKAGE_LIBSIGROK
 
 	  http://sigrok.org/wiki/Libsigrok
 
+if BR2_PACKAGE_LIBSIGROK
+
+config BR2_PACKAGE_LIBSIGROKCXX
+	bool "build C++ bindings"
+	select BR2_PACKAGE_GLIBMM
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Build libsigrok C++ bindings as well.
+
+comment "C++ bindings need a toolchain w/ C++"
+	depends on BR2_PACKAGE_LIBSIGROK
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endif
+
 comment "libsigrok needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 6bc210e..1e6080d 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -13,7 +13,7 @@ LIBSIGROK_LICENSE_FILES = COPYING
 LIBSIGROK_AUTORECONF = YES
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
-LIBSIGROK_CONF_OPTS = --disable-bindings --disable-glibtest
+LIBSIGROK_CONF_OPTS = --disable-glibtest --disable-java --disable-python
 
 define LIBSIGROK_ADD_MISSING
 	mkdir -p $(@D)/autostuff
@@ -46,4 +46,11 @@ ifeq ($(BR2_PACKAGE_GLIBMM),y)
 LIBSIGROK_DEPENDENCIES += glibmm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
+LIBSIGROK_CONF_OPTS += --enable-cxx
+LIBSIGROK_DEPENDENCIES += host-autoconf-archive glibmm
+else
+LIBSIGROK_CONF_OPTS += --disable-cxx
+endif
+
 $(eval $(autotools-package))
