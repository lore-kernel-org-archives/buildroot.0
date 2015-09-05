From: =?UTF-8?q?C=C3=A9dric=20Marie?= <cedric.marie@openmailbox.org>
Date: Sat,  5 Sep 2015 23:07:17 +0200
Subject: [Buildroot] [PATCH] Handle verbosity in infrastructures
Message-ID: <1441487237-10040-1-git-send-email-cedric.marie@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The verbosity of the build step is controlled in a different way for
every type of infrastructure. It is not possible to export a variable
that could be understood by all of them.

As a consequence, in root Makefile:
* 'VERBOSE' is removed.
* 'KBUILD_VERBOSE' and 'quiet' are also removed, because they are not
  used.
* 'Q' is kept because it is used by Buildroot.

Instead, each infrastructure should add a specific variable to export
at build time, when V is set in the command line ('make V=1').

* CMake adds 'VERBOSE=1' when V=1
* Autotools forward 'V=0' and 'V=1'. The default behaviour depends on
  the package. It is kept unchanged, unless explicitly modified by
  'make V=0' or 'make V=1'.

Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
---
 Makefile                 | 18 +++---------------
 package/pkg-autotools.mk | 16 ++++++++++++++--
 package/pkg-cmake.mk     | 12 ++++++++++--
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index 23e2ee6..4a6c9ef 100644
--- a/Makefile
+++ b/Makefile
@@ -218,23 +218,11 @@ endif
 
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
+Q = @
 ifeq ("$(origin V)", "command line")
-  KBUILD_VERBOSE = $(V)
-endif
-ifndef KBUILD_VERBOSE
-  KBUILD_VERBOSE = 0
-endif
-
-ifeq ($(KBUILD_VERBOSE),1)
-  quiet =
+ifeq ($(V),1)
   Q =
-ifndef VERBOSE
-  VERBOSE = 1
 endif
-export VERBOSE
-else
-  quiet = quiet_
-  Q = @
 endif
 
 # we want bash as shell
@@ -245,7 +233,7 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 # kconfig uses CONFIG_SHELL
 CONFIG_SHELL := $(SHELL)
 
-export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE
+export SHELL CONFIG_SHELL Q
 
 ifndef HOSTAR
 HOSTAR := ar
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 4787914..18ab1ae 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -94,6 +94,18 @@ define AUTORECONF_HOOK
 	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
 endef
 
+# During build step:
+# 'make V=0' disables the verbose mode (if enabled by the package)
+# 'make V=1' enables the verbose mode (if not already enabled by the package)
+AUTOTOOLS_VERBOSE =
+ifeq ("$(origin V)", "command line")
+ifeq ($(V),0)
+  AUTOTOOLS_VERBOSE = V=0
+else ifeq ($(V),1)
+  AUTOTOOLS_VERBOSE = V=1
+endif
+endif
+
 ################################################################################
 # inner-autotools-package -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
@@ -271,11 +283,11 @@ endif
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR) $(AUTOTOOLS_VERBOSE)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR) $(AUTOTOOLS_VERBOSE)
 endef
 endif
 endif
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 574eccc..8e57a9c 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -35,6 +35,14 @@ ifneq ($(QUIET),)
 CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
 endif
 
+# 'make V=1' enables the verbose mode during build step
+CMAKE_VERBOSE =
+ifeq ("$(origin V)", "command line")
+ifeq ($(V),1)
+  CMAKE_VERBOSE = VERBOSE=1
+endif
+endif
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -159,11 +167,11 @@ $(2)_DEPENDENCIES += host-cmake
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR) $(CMAKE_VERBOSE)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR) $(CMAKE_VERBOSE)
 endef
 endif
 endif
-- 
2.5.1
