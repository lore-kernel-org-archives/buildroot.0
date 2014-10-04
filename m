From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 18:47:37 +0200
Subject: [Buildroot] [git commit] packages: rename FOO_INSTALL_OPT into
	FOO_INSTALL_OPTS
Message-ID: <20141004170453.64DC59D584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1993430346a8fed4607cfb565104cc33b598ea1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_INSTALL_OPT.

Sed command used:
   find * -type f | xargs sed -i 's#_INSTALL_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-perl.txt   |    2 +-
 docs/manual/adding-packages-python.txt |    6 +++---
 package/gcc/gcc-initial/gcc-initial.mk |    2 +-
 package/pkg-autotools.mk               |    4 ++--
 package/pkg-python.mk                  |   12 ++++++------
 package/scons/scons.mk                 |    2 +-
 package/util-linux/util-linux.mk       |    2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index b6cec21..00f21ad 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -113,6 +113,6 @@ cases, typical packages will therefore only use a few of them.
   pass to +make pure_install+ or +perl Build install+ in the install step.
   By default, empty.
 
-* +HOST_PERL_FOO_INSTALL_OPT+, to specify additional options to
+* +HOST_PERL_FOO_INSTALL_OPTS+, to specify additional options to
   pass to +make pure_install+ or +perl Build install+ in the install step.
   By default, empty.
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 46d140d..8c62ff5 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -128,16 +128,16 @@ therefore only use a few of them, or none.
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
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 45a0f4f..63cf88b 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -54,6 +54,6 @@ HOST_GCC_INITIAL_CONF_ENV = \
 # support, as it can't guess it since the C library hasn't been built
 # yet (we're gcc-initial).
 HOST_GCC_INITIAL_MAKE_OPTS = $(if $(BR2_TOOLCHAIN_HAS_SSP),gcc_cv_libc_provides_ssp=yes) all-gcc all-target-libgcc
-HOST_GCC_INITIAL_INSTALL_OPT = install-gcc install-target-libgcc
+HOST_GCC_INITIAL_INSTALL_OPTS = install-gcc install-target-libgcc
 
 $(eval $(host-autotools-package))
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 1884d4d..1ee14f9 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -107,7 +107,7 @@ $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
-$(2)_INSTALL_OPT                ?= install
+$(2)_INSTALL_OPTS                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 
@@ -285,7 +285,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index d49e5c2..09bc783 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -45,7 +45,7 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPT = \
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH)
 
-HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
+HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
 
 # Target setuptools-based packages
@@ -72,7 +72,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPT = \
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH)
 
-HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
+HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
 
 ################################################################################
@@ -96,7 +96,7 @@ $(2)_BUILDDIR	= $$($(2)_SRCDIR)
 
 $(2)_ENV         ?=
 $(2)_BUILD_OPT   ?=
-$(2)_INSTALL_OPT ?=
+$(2)_INSTALL_OPTS ?=
 
 ifndef $(2)_SETUP_TYPE
  ifdef $(3)_SETUP_TYPE
@@ -118,7 +118,7 @@ else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
-$(2)_BASE_INSTALL_OPT = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT)
+$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
 endif
 # Setuptools
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
@@ -132,7 +132,7 @@ else
 $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   =
-$(2)_BASE_INSTALL_OPT = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT)
+$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")
@@ -241,7 +241,7 @@ define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$($(2)_PYTHON_INTERPRETER) setup.py install \
-		$$($$(PKG)_BASE_INSTALL_OPT) $$($$(PKG)_INSTALL_OPT))
+		$$($$(PKG)_BASE_INSTALL_OPTS) $$($$(PKG)_INSTALL_OPTS))
 endef
 endif
 
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 42a703c..e418530 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -12,7 +12,7 @@ SCONS_SETUP_TYPE = distutils
 
 HOST_SCONS_NEEDS_HOST_PYTHON = python2
 
-HOST_SCONS_INSTALL_OPT = \
+HOST_SCONS_INSTALL_OPTS = \
 	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
 
 $(eval $(host-python-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6202739..9d57e43 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -141,4 +141,4 @@ $(eval $(host-autotools-package))
 # one, so it disappears
 UTIL_LINUX_INSTALL_STAGING_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
 UTIL_LINUX_INSTALL_TARGET_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-HOST_UTIL_LINUX_INSTALL_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+HOST_UTIL_LINUX_INSTALL_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
