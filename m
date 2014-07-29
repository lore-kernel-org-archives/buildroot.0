From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:31 +0200
Subject: [Buildroot] [PATCH 04 of 20] packages: rename FOO_INSTALL_OPT into
 FOO_INSTALL_OPTS
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <350c3078ccd9350ebbcd.1406668351@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_INSTALL_OPT.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-perl.txt             |   2 +-
 docs/manual/adding-packages-python.txt           |   6 +++---
 package/gcc/gcc-initial/gcc-initial.mk           |   2 +-
 package/gcc/gcc-intermediate/gcc-intermediate.mk |   4 ++--
 package/pkg-autotools.mk                         |   4 ++--
 package/pkg-python.mk                            |  12 ++++++------
 package/scons/scons.mk                           |   2 +-
 package/util-linux/util-linux.mk                 |   2 +-
 8 files changed, 17 insertions(+), 17 deletions(-)

diff -r 9b89581eb95a -r 350c3078ccd9 docs/manual/adding-packages-perl.txt
--- a/docs/manual/adding-packages-perl.txt	Mon Jul 28 21:28:40 2014 +0200
+++ b/docs/manual/adding-packages-perl.txt	Mon Jul 28 21:34:36 2014 +0200
@@ -113,6 +113,6 @@
   pass to +make pure_install+ or +perl Build install+ in the install step.
   By default, empty.
 
-* +HOST_PERL_FOO_INSTALL_OPT+, to specify additional options to
+* +HOST_PERL_FOO_INSTALL_OPTS+, to specify additional options to
   pass to +make pure_install+ or +perl Build install+ in the install step.
   By default, empty.
diff -r 9b89581eb95a -r 350c3078ccd9 docs/manual/adding-packages-python.txt
--- a/docs/manual/adding-packages-python.txt	Mon Jul 28 21:28:40 2014 +0200
+++ b/docs/manual/adding-packages-python.txt	Mon Jul 28 21:34:36 2014 +0200
@@ -128,16 +128,16 @@
   passed automatically by the infrastructure.
 
 * +PYTHON_FOO_INSTALL_TARGET_OPT+, +PYTHON_FOO_INSTALL_STAGING_OPT+,
-  +HOST_PYTHON_FOO_INSTALL_OPT+ to specify additional options to pass
+  +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
   to the Python +setup.py+ script during the target installation step,
   the staging installation step or the host installation,
   respectively. Note that the infrastructure is automatically passing
   some options, defined in +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPT+
   or +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT+ (for target distutils
-  packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT+ (for host
+  packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS+ (for host
   distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPT+ or
   +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT+ (for target setuptools
-  packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT+ (for host
+  packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
   setuptools packages).
 
 * +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
diff -r 9b89581eb95a -r 350c3078ccd9 package/gcc/gcc-initial/gcc-initial.mk
--- a/package/gcc/gcc-initial/gcc-initial.mk	Mon Jul 28 21:28:40 2014 +0200
+++ b/package/gcc/gcc-initial/gcc-initial.mk	Mon Jul 28 21:34:36 2014 +0200
@@ -38,6 +38,6 @@
 	$(HOST_GCC_COMMON_CONF_ENV)
 
 HOST_GCC_INITIAL_MAKE_OPTS = all-gcc
-HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
+HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc
 
 $(eval $(host-autotools-package))
diff -r 9b89581eb95a -r 350c3078ccd9 package/gcc/gcc-intermediate/gcc-intermediate.mk
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk	Mon Jul 28 21:28:40 2014 +0200
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk	Mon Jul 28 21:34:36 2014 +0200
@@ -41,9 +41,9 @@
 HOST_GCC_INTERMEDIATE_MAKE_OPTS += all-target-libgcc
 endif
 
-HOST_GCC_INTERMEDIATE_INSTALL_OPT = install-gcc
+HOST_GCC_INTERMEDIATE_INSTALL_OPTS = install-gcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-HOST_GCC_INTERMEDIATE_INSTALL_OPT += install-target-libgcc
+HOST_GCC_INTERMEDIATE_INSTALL_OPTS += install-target-libgcc
 endif
 
 $(eval $(host-autotools-package))
diff -r 9b89581eb95a -r 350c3078ccd9 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Mon Jul 28 21:28:40 2014 +0200
+++ b/package/pkg-autotools.mk	Mon Jul 28 21:34:36 2014 +0200
@@ -107,7 +107,7 @@
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
-$(2)_INSTALL_OPT                ?= install
+$(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 
@@ -281,7 +281,7 @@
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
diff -r 9b89581eb95a -r 350c3078ccd9 package/pkg-python.mk
--- a/package/pkg-python.mk	Mon Jul 28 21:28:40 2014 +0200
+++ b/package/pkg-python.mk	Mon Jul 28 21:34:36 2014 +0200
@@ -45,7 +45,7 @@
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH)
 
-HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
+HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
 
 # Target setuptools-based packages
@@ -72,7 +72,7 @@
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH)
 
-HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
+HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
 
 ################################################################################
@@ -96,7 +96,7 @@
 
 $(2)_ENV         ?=
 $(2)_BUILD_OPT   ?=
-$(2)_INSTALL_OPT ?=
+$(2)_INSTALL_OPTS ?=
 
 ifndef $(2)_SETUP_TYPE
  ifdef $(3)_SETUP_TYPE
@@ -118,7 +118,7 @@
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
-$(2)_BASE_INSTALL_OPT = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT)
+$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
@@ -132,7 +132,7 @@
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
-$(2)_BASE_INSTALL_OPT = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT)
+$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")
@@ -241,7 +241,7 @@
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$($(2)_PYTHON_INTERPRETER) setup.py install \
-		$$($$(PKG)_BASE_INSTALL_OPT) $$($$(PKG)_INSTALL_OPT))
+		$$($$(PKG)_BASE_INSTALL_OPTS) $$($$(PKG)_INSTALL_OPTS))
 endef
 endif
 
diff -r 9b89581eb95a -r 350c3078ccd9 package/scons/scons.mk
--- a/package/scons/scons.mk	Mon Jul 28 21:28:40 2014 +0200
+++ b/package/scons/scons.mk	Mon Jul 28 21:34:36 2014 +0200
@@ -12,7 +12,7 @@
 
 HOST_SCONS_NEEDS_HOST_PYTHON = python2
 
-HOST_SCONS_INSTALL_OPT = \
+HOST_SCONS_INSTALL_OPTS = \
 	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
 
 $(eval $(host-python-package))
diff -r 9b89581eb95a -r 350c3078ccd9 package/util-linux/util-linux.mk
--- a/package/util-linux/util-linux.mk	Mon Jul 28 21:28:40 2014 +0200
+++ b/package/util-linux/util-linux.mk	Mon Jul 28 21:34:36 2014 +0200
@@ -141,4 +141,4 @@
 # one, so it disappears
 UTIL_LINUX_INSTALL_STAGING_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
 UTIL_LINUX_INSTALL_TARGET_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-HOST_UTIL_LINUX_INSTALL_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+HOST_UTIL_LINUX_INSTALL_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
