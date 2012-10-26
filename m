From: Evgeni Dobrev <evgeni@plan42bg.com>
Date: Fri, 26 Oct 2012 17:41:20 +0200
Subject: [Buildroot] [PATCH] efl is now at 1.7.1
Message-ID: <1351266080-12424-1-git-send-email-evgeni@plan42bg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- bumped up revision to 1.7.1
- choose between external and Buildroot built edje_cc and eet when building elemntary
- finer control over building options
---
 package/efl/expedite/expedite.mk           |    2 +-
 package/efl/libecore/libecore.mk           |    2 +-
 package/efl/libedbus/libedbus.mk           |    2 +-
 package/efl/libedje/Config.in              |   60 +++++++++++++++++++++++
 package/efl/libedje/libedje.mk             |   70 ++++++++++++++++++++++++++-
 package/efl/libeet/libeet.mk               |    8 +++-
 package/efl/libefreet/libefreet.mk         |    2 +-
 package/efl/libeina/libeina.mk             |    6 ++-
 package/efl/libelementary/Config.in        |   71 ++++++++++++++++++++++++++++
 package/efl/libelementary/libelementary.mk |   39 +++++++++++++--
 package/efl/libembryo/Config.in            |    7 +++
 package/efl/libembryo/libembryo.mk         |   12 ++++-
 package/efl/libethumb/libethumb.mk         |    4 +-
 package/efl/libevas/libevas.mk             |    4 +-
 14 files changed, 271 insertions(+), 18 deletions(-)

diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index a841ac9..b58b6ac 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-EXPEDITE_VERSION = 1.1.0
+EXPEDITE_VERSION = 1.7.1
 EXPEDITE_SITE = http://download.enlightenment.org/releases/
 EXPEDITE_DEPENDENCIES = libevas libeina libeet
 
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index df8db0d..87dcfa3 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBECORE_VERSION = 1.1.0
+LIBECORE_VERSION = 1.7.1
 LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
 LIBECORE_SITE = http://download.enlightenment.org/releases/
 LIBECORE_INSTALL_STAGING = YES
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 04c48a4..43e3536 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEDBUS_VERSION = 1.1.0
+LIBEDBUS_VERSION = 1.7.1
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
 LIBEDBUS_SITE = http://download.enlightenment.org/releases/
 LIBEDBUS_INSTALL_STAGING = YES
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
index f0985dd..0c6d2a9 100644
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -19,3 +19,63 @@ config BR2_PACKAGE_LIBEDJE_CC
 	help
 	  Build and install the Edje compiler for the target. Normally this
 	  is not required.
+
+config BR2_PACKAGE_LIBEDJE_DECC
+	bool "build edje_decc"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Build and install the Edje decompiler for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBEDJE_RECC
+	bool "build edje_recc"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Build and install the Edje recompiler for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBEDJE_PLAYER
+	bool "build edje_player"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Build and install the Edje player for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBEDJE_INSPECTOR
+	bool "build edje_inspector"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Build and install the Edje inspector for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBEDJE_EXTERNAL_INSPECTOR
+	bool "build edje_external_inspector"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Build and install the Edje external inspector for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBEDJE_WATCH
+	bool "build edje_watch"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Build and install edje_watch  for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBEDJE_PROGRAM_CACHE
+	bool "edje program cache"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Enable EDJE_PROGRAM_CACHE support.
+
+config BR2_PACKAGE_LIBEDJE_CALC_CACHE
+	bool "edje calc cache"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Enable EDJE_CALC_CACHE support.
+
+config BR2_PACKAGE_LIBEDJE_FIXED_POINT
+	bool "edje code fixed point"
+	depends on BR2_PACKAGE_LIBEDJE
+	help
+	  Reduce use of FPU by using Fixed Point provided by Eina and Eet.
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index e6d9ab3..0bf80ee 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEDJE_VERSION = 1.1.0
+LIBEDJE_VERSION = 1.7.1
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 LIBEDJE_SITE =  http://download.enlightenment.org/releases/
 LIBEDJE_INSTALL_STAGING = YES
@@ -12,13 +12,79 @@ LIBEDJE_INSTALL_STAGING = YES
 LIBEDJE_DEPENDENCIES = host-pkg-config lua libeina libeet libecore libevas \
 			libembryo
 
+LIBEDJE_CONF_OPT += \
+		    --disable-install-examples \
+		    --disable-multisense \
+		    --disable-sndfile \
+		    --disable-remix \
+		    --disable-vorbis \
+		    --disable-alsa \
+		    --disable-flac \
+		    --disable-tests
+
 ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
 LIBEDJE_CONF_OPT += --enable-edje-cc
 else
 LIBEDJE_CONF_OPT += --disable-edje-cc
 endif
 
-HOST_LIBEDJE_CONF_OPT = --enable-edje-cc
+ifeq ($(BR2_PACKAGE_LIBEDJE_DECC),y)
+LIBEDJE_CONF_OPT += --enable-edje-decc
+else
+LIBEDJE_CONF_OPT += --disable-edje-decc
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_RECC),y)
+LIBEDJE_CONF_OPT += --enable-edje-recc
+else
+LIBEDJE_CONF_OPT += --disable-edje-recc
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_PLAYER),y)
+LIBEDJE_CONF_OPT += --enable-edje-player
+else
+LIBEDJE_CONF_OPT += --disable-edje-player
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_INSPECTOR),y)
+LIBEDJE_CONF_OPT += --enable-edje-inspector
+else
+LIBEDJE_CONF_OPT += --disable-edje-inspector
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_EXTERNAL_INSPECTOR),y)
+LIBEDJE_CONF_OPT += --enable-edje-external-inspector
+else
+LIBEDJE_CONF_OPT += --disable-edje-external-inspector
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_WATCH),y)
+LIBEDJE_CONF_OPT += --enable-edje-watch
+else
+LIBEDJE_CONF_OPT += --disable-edje-watch
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_PROGRAM_CACHE),y)
+LIBEDJE_CONF_OPT += --enable-edje-program-cache
+else
+LIBEDJE_CONF_OPT += --disable-edje-program-cache
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_CALC_CACHE),y)
+LIBEDJE_CONF_OPT += --enable-edje-calc-cache
+else
+LIBEDJE_CONF_OPT += --disable-edje-calc-cache
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDJE_FIXED_POINT),y)
+LIBEDJE_CONF_OPT += --enable-fixed-point
+else
+LIBEDJE_CONF_OPT += --disable-fixed-point
+endif
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+LIBEDJE_CONF_OPT += --disable-doc
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index 3ca12d3..72cf7f8 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -4,12 +4,18 @@
 #
 #############################################################
 
-LIBEET_VERSION = 1.5.0
+LIBEET_VERSION = 1.7.1
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases/
 LIBEET_INSTALL_STAGING = YES
 
 LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
 
+LIBEEET_CONF_OPT += --disable-install-examples 
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+LIBEET_CONF_OPT += --disable-doc
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index 2f00bcf..c6762fd 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEFREET_VERSION = 1.1.0
+LIBEFREET_VERSION = 1.7.1
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
 LIBEFREET_SITE = http://download.enlightenment.org/releases/
 LIBEFREET_INSTALL_STAGING = YES
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index 2391379..8aaada9 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -4,12 +4,16 @@
 #
 #############################################################
 
-LIBEINA_VERSION = 1.1.0
+LIBEINA_VERSION = 1.7.1
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 LIBEINA_SITE = http://download.enlightenment.org/releases/
 LIBEINA_INSTALL_STAGING = YES
 
 LIBEINA_DEPENDENCIES = host-pkg-config
 
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+LIBEINA_CONF_OPT += --disable-doc
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index 59af80e..13d03dc 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -10,3 +10,74 @@ config BR2_PACKAGE_LIBELEMENTARY
 	  with less code.
 
 	  http://trac.enlightenment.org/e/wiki/Elementary
+
+choice
+	prompt "edje_cc type"
+	default BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_BUILDROOT
+	depends on BR2_PACKAGE_LIBELEMENTARY
+
+config BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_BUILDROOT
+	bool "Buildroot built"
+	select BR2_PACKAGE_LIBEDJE_CC
+	help
+	  Select this option if you want Buildroot to build edje_cc on your host.
+
+config BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PREINSTALLED
+	bool "Pre-installed"
+	help
+	  Select this option if you want to use a pre-installed edje_cc
+	  Specify the path to edje_cc in BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PATH
+
+endchoice 
+
+config BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PATH
+	string "edje_cc path"
+	default "/path/to/edje_cc"
+	depends on BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PREINSTALLED
+	help
+	  Path to an externally provided edje_cc
+
+choice
+	prompt "eet type"
+	default BR2_PACKAGE_LIBELEMENTARY_EET_BUILDROOT
+	depends on BR2_PACKAGE_LIBELEMENTARY
+
+config BR2_PACKAGE_LIBELEMENTARY_EET_BUILDROOT
+	bool "Buildroot built"
+	help
+	  Select this option if you want Buildroot to build eet on your host.
+
+config BR2_PACKAGE_LIBELEMENTARY_EET_PREINSTALLED
+	bool "Pre-installed"
+	help
+	  Select this option if you want to use a pre-installed eer.
+	  Specify the path to eet in BR2_PACKAGE_LIBELEMENTARY_EET_PATH
+
+endchoice 
+
+config BR2_PACKAGE_LIBELEMENTARY_EET_PATH
+	string "eet path"
+	default "/path/to/eet"
+	depends on BR2_PACKAGE_LIBELEMENTARY_EET_PREINSTALLED
+	help
+	  Path to an externally provided eet
+
+config BR2_PACKAGE_LIBELEMENTARY_TEST
+	bool "build elementary_test"
+	depends on BR2_PACKAGE_LIBELEMENTARY
+	help
+	  Build and install elementary_test for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBELEMENTARY_CONFIG
+	bool "build elementary_config"
+	depends on BR2_PACKAGE_LIBELEMENTARY
+	help
+	  Build and install elementary_config for the target. Normally this
+	  is not required.
+
+config BR2_PACKAGE_LIBELEMENTARY_QUICK_LAUNCH
+	bool "enable quick-launch support"
+	depends on BR2_PACKAGE_LIBELEMENTARY
+	help
+	  Enable quick-launch support.
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 83c9005..18319d1 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -4,15 +4,42 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 0.8.0.65643
+LIBELEMENTARY_VERSION = 1.7.1
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
-LIBELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBELEMENTARY_SITE = http://download.enlightenment.org/releases/
 LIBELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
-				host-libeet
+LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje 
 
-LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
+ifneq ($(BR2_PACKAGE_LIBELEMENTARY_TEST),y)
+LIBELEMENTARY_CONF_OPT += --disable-elementary-test
+endif
+
+ifneq ($(BR2_PACKAGE_LIBELEMENTARY_CONFIG),y)
+LIBELEMENTARY_CONF_OPT += --disable-elementary-config
+endif
+
+ifneq ($(BR2_PACKAGE_LIBELEMENTARY_QUICK_LAUNCH),y)
+LIBELEMENTARY_CONF_OPT += --disable-quick-launch
+endif
+
+ifeq ($(BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PREINSTALLED),y)
+LIBELEMENTARY_CONF_OPT += --with-edje-cc=$(BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PATH)
+else
+LIBELEMENTARY_DEPENDENCIES += host-libedje
+LIBELEMENTARY_CONF_OPT += --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+endif
+
+ifeq ($(BR2_PACKAGE_LIBELEMENTARY_EET_PREINSTALLED),y)
+LIBELEMENTARY_CONF_OPT += --with-eet-eet=$(BR2_PACKAGE_LIBELEMENTARY_EET_PATH)
+else
+LIBELEMENTARY_DEPENDENCIES += host-libeet
+LIBELEMENTARY_CONF_OPT += --with-eet-eet=$(HOST_DIR)/usr/bin/eet
+endif
+
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+LIBELEMENTARY_CONF_OPT += --disable-doc
+endif
 
 $(eval $(autotools-package))
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
index 63c7064..ee6313d 100644
--- a/package/efl/libembryo/Config.in
+++ b/package/efl/libembryo/Config.in
@@ -7,3 +7,10 @@ config BR2_PACKAGE_LIBEMBRYO
 	  abstract machine bytecode that it understands.
 
 	  http://trac.enlightenment.org/e/wiki/Embryo
+
+config BR2_PACKAGE_LIBEMBRYO_CC
+	bool "build embryo_cc"
+	depends on BR2_PACKAGE_LIBEMBRYO
+	help
+	  Build and install the embryo compiler for the target. Normally this
+	  is not required.
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index db1696d..6b92b24 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -4,12 +4,22 @@
 #
 #############################################################
 
-LIBEMBRYO_VERSION = 1.1.0
+LIBEMBRYO_VERSION = 1.7.1
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
 LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
 LIBEMBRYO_INSTALL_STAGING = YES
 
 LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
 
+ifeq ($(BR2_PACKAGE_LIBEMBRYO_CC),y)
+LIBEMBRYO_CONF_OPT += --enable-embryo-cc
+else
+LIBEMBRYO_CONF_OPT += --disable-embryo-cc
+endif
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+LIBEMBRYO_CONF_OPT += --disable-doc
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 92e4c83..9b7ee1d 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBETHUMB_VERSION = 0.1.1.65643
+LIBETHUMB_VERSION = 1.7.1
 LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
-LIBETHUMB_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBETHUMB_SITE = http://download.enlightenment.org/releases/
 LIBETHUMB_INSTALL_STAGING = YES
 
 LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 3baf23b..3b2263e 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEVAS_VERSION = 1.1.0
+LIBEVAS_VERSION = 1.7.1
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
 LIBEVAS_SITE = http://download.enlightenment.org/releases/
 LIBEVAS_INSTALL_STAGING = YES
@@ -28,6 +28,8 @@ HOST_LIBEVAS_CONF_OPT += \
 	--enable-software-xcb \
 	--disable-gl-xcb
 
+LIBEVAS_CONF_OPT += --disable-build-examples 
+
 # rendering options
 ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
 LIBEVAS_CONF_OPT += --enable-scale-sample
-- 
1.7.2.5
