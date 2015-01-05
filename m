From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  5 Jan 2015 12:02:09 +0100
Subject: [Buildroot] [PATCH v3] svgtiny: update source url
Message-ID: <1420455729-15649-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As source url use the git repository instead of the unavaiable svn
repository.

Also because the git repository does not include the netsurf core
buildsystem source that are needed to build this package add those
sources as a patch.

This fix the following error:

svn: E670002: Unable to connect to a repository at URL 'svn://svn.netsurf-browser.org/trunk/libsvgtiny'
svn: E670002: Unknown hostname 'svn.netsurf-browser.org'

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---

Notes:
    v3:
      - Add missing netsurf core buildsystem sources.
    v2:
     - Use http for git (suggested by Baruch) (done by Thomas P.).

 .../0004-Add-netsurf-core-buildsystem.patch        | 1567 ++++++++++++++++++++
 package/libsvgtiny/libsvgtiny.mk                   |    5 +-
 2 files changed, 1570 insertions(+), 2 deletions(-)
 create mode 100644 package/libsvgtiny/0004-Add-netsurf-core-buildsystem.patch

diff --git a/package/libsvgtiny/0004-Add-netsurf-core-buildsystem.patch b/package/libsvgtiny/0004-Add-netsurf-core-buildsystem.patch
new file mode 100644
index 0000000..1e5d983
--- /dev/null
+++ b/package/libsvgtiny/0004-Add-netsurf-core-buildsystem.patch
@@ -0,0 +1,1567 @@
+From 8e576b831ecdbb6829c22e02d88b718ecbb63622 Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Mon, 5 Jan 2015 11:32:46 +0100
+Subject: [PATCH] Add netsurf core buildsystem
+
+Add git://git.netsurf-browser.org/buildsystem.git version
+7574b41345968b5f7e9ca5875faccb1478ce0555.
+Add only the directory "makefiles" to the "build" subdirectory.
+
+The core buildsystem is needed to be able to build libsvgtiny sources.
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ build/makefiles/Makefile.clang     |  50 +++
+ build/makefiles/Makefile.gcc       |  95 ++++++
+ build/makefiles/Makefile.norcroft  |  56 ++++
+ build/makefiles/Makefile.pkgconfig |  88 ++++++
+ build/makefiles/Makefile.subdir    | 132 ++++++++
+ build/makefiles/Makefile.tools     | 469 +++++++++++++++++++++++++++++
+ build/makefiles/Makefile.top       | 603 +++++++++++++++++++++++++++++++++++++
+ 7 files changed, 1493 insertions(+)
+ create mode 100644 build/makefiles/Makefile.clang
+ create mode 100644 build/makefiles/Makefile.gcc
+ create mode 100644 build/makefiles/Makefile.norcroft
+ create mode 100644 build/makefiles/Makefile.pkgconfig
+ create mode 100644 build/makefiles/Makefile.subdir
+ create mode 100644 build/makefiles/Makefile.tools
+ create mode 100644 build/makefiles/Makefile.top
+
+diff --git a/build/makefiles/Makefile.clang b/build/makefiles/Makefile.clang
+new file mode 100644
+index 0000000..6e8660c
+--- /dev/null
++++ b/build/makefiles/Makefile.clang
+@@ -0,0 +1,50 @@
++# Clang-specific toolchain setup
++# We assume that we're using a standard GCC/binutils environment, as well
++# as clang being mostly GCC-compatible on the command line
++
++CCDEF := -D
++CCOPT := -O2
++CCNOOPT := -O0
++CCDBG := -g
++CCINC := -I
++CCLIB := -L
++CCAS := -xassembler-with-cpp
++CCSHR := -fPIC
++
++CXXDEF := -D
++CXXOPT := -O2
++CXXNOOPT := -O0
++CXXDBG := -g
++CXXINC := -I
++CXXLIB := -L
++CXXSHR := -fPIC
++
++LDDBG := -g
++# Reevaluation is required here
++LDSHR = -shared -Wl,-soname,$(SONAME)
++
++ARFLG := cru
++
++# Definitions of various attributes
++CFLAGS := $(CFLAGS) -D_ALIGNED=""
++
++###############################################################################
++# Mac OS X Universal Binaries
++###############################################################################
++
++ifeq ($(TARGET),Darwin)
++	ifneq ($(UNIVERSAL),)
++		UNIVERSAL_FLAGS := $(foreach arch,$(UNIVERSAL),-arch $(arch) )
++		
++		CFLAGS := $(CFLAGS) $(UNIVERSAL_FLAGS)
++		LDFLAGS := $(LDFLAGS) $(UNIVERSAL_FLAGS)
++		CXXFLAGS := $(CXXFLAGS) $(UNIVERSAL_FLAGS)
++		ARFLAGS := $(ARFLAGS) -s 
++	endif
++endif
++
++###############################################################################
++# Other settings
++###############################################################################
++
++CC_CAN_BUILD_AND_DEP ?= yes
+diff --git a/build/makefiles/Makefile.gcc b/build/makefiles/Makefile.gcc
+new file mode 100644
+index 0000000..abe4f28
+--- /dev/null
++++ b/build/makefiles/Makefile.gcc
+@@ -0,0 +1,95 @@
++# GCC specific toolchain setup
++# We assume that we're using a standard GCC/binutils environment
++
++CCDEF := -D
++CCOPT := -O2
++CCNOOPT := -O0
++CCDBG := -g
++CCINC := -I
++CCLIB := -L
++CCAS := -xassembler-with-cpp
++CCSHR := -fPIC
++
++CXXDEF := -D
++CXXOPT := -O2
++CXXNOOPT := -O0
++CXXDBG := -g
++CXXINC := -I
++CXXLIB := -L
++CXXSHR := -fPIC
++
++LDDBG := -g
++# Reevaluation is required here
++LDSHR = -shared -Wl,-soname,$(SONAME)
++
++ARFLG := cru
++
++# Definitions for various attributes
++CFLAGS := $(CFLAGS) -D_ALIGNED="__attribute__((aligned))"
++
++# Extensions for coverage target
++ifeq ($(MAKECMDGOALS),coverage)
++  COVCFLAGS ?= -fprofile-arcs -ftest-coverage
++  COVCXXFLAGS ?= -fprofile-arcs -ftest-coverage
++  COVLDFLAGS ?= -lgcov
++
++  CFLAGS := $(CFLAGS) $(COVCFLAGS)
++  CXXFLAGS := $(CXXFLAGS) $(COVCXXFLAGS)
++  LDFLAGS := $(LDFLAGS) $(COVLDFLAGS)
++endif
++
++# Extensions for profile target
++ifeq ($(MAKECMDGOALS),profile)
++  PROFCFLAGS ?= -pg
++  PROFCXXFLAGS ?= -pg
++  PROFLDFLAGS ?= -pg
++
++  CFLAGS := $(CFLAGS) $(PROFCFLAGS)
++  CXXFLAGS := $(CXXFLAGS) $(PROFCXXFLAGS)
++  LDFLAGS := $(LDFLAGS) $(PROFLDFLAGS)
++endif
++
++# RISC OS module extensions
++ifeq ($(COMPONENT_TYPE),riscos-module)
++  ifneq ($(TARGET),riscos)
++    $(error Attempting to build a RISC OS module for a non-RISC OS target)
++  endif
++
++  CFLAGS := $(CFLAGS) -mmodule
++  CXXFLAGS := $(CXXFLAGS) -mmodule
++  LDFLAGS := $(LDFLAGS) -mmodule
++endif
++
++###############################################################################
++# Mac OS X Universal Binaries
++###############################################################################
++
++ifeq ($(TARGET),Darwin)
++	ifneq ($(UNIVERSAL),)
++		UNIVERSAL_FLAGS := $(foreach arch,$(UNIVERSAL),-arch $(arch) )
++		CC_CAN_BUILD_AND_DEP := no
++		CC_CANNOT_DEP := yes
++		
++		CFLAGS := $(CFLAGS) $(UNIVERSAL_FLAGS)
++		LDFLAGS := $(LDFLAGS) $(UNIVERSAL_FLAGS)
++		CXXFLAGS := $(CXXFLAGS) $(UNIVERSAL_FLAGS)
++		ARFLAGS := $(ARFLAGS) -s 
++	endif
++endif
++
++###############################################################################
++# Other settings
++###############################################################################
++
++# Determine if the compiler supports simultaneous build & dep.
++ccvsn := $(shell $(CC) -dumpversion)
++# ccvsn = x.y.z
++GCCVER := $(word 1,$(subst ., ,$(ccvsn)))
++# GCCVER = x
++
++# If the major version (x, above) is not 2, then assume build & dep.
++# This will break if using a version of GCC < 2, but that's unlikely.
++ifneq ($(GCCVER),2)
++  CC_CAN_BUILD_AND_DEP ?= yes
++endif
++
+diff --git a/build/makefiles/Makefile.norcroft b/build/makefiles/Makefile.norcroft
+new file mode 100644
+index 0000000..93344f9
+--- /dev/null
++++ b/build/makefiles/Makefile.norcroft
+@@ -0,0 +1,56 @@
++# Norcroft specific toolchain setup
++
++CCDEF := -D
++CCOPT := -Otime
++CCNOOPT :=
++CCDBG := -g
++CCINC := -I
++CCLIB := -L
++# TODO: Norcroft CC cannot do assembler as C
++CCAS :=
++CCSHR :=
++
++CXXDEF := -D
++CXXOPT := -O2
++CXXNOOPT := -O0
++CXXDBG := -g
++CXXINC := -I
++CXXLIB := -L
++CXXSHR := -fPIC
++
++LDDBG := -g
++LDSHR :=
++
++ARFLG := -c
++
++# Definitions of various attributes
++CFLAGS := $(CFLAGS) -D_ALIGNED=""
++
++# Extensions for coverage target
++ifeq ($(MAKECMDGOALS),coverage)
++  $(error Coverage is not supported with Norcroft)
++endif
++
++# Extensions for profile target
++ifeq ($(MAKECMDGOALS),profile)
++  $(error Profile is not supported with Norcroft)
++endif
++
++# RISC OS module extensions
++ifeq ($(COMPONENT_TYPE),riscos-module)
++  ifneq ($(TARGET),riscos)
++    $(error Attempting to build a RISC OS module for a non-RISC OS target)
++  endif
++
++  CFLAGS := $(CFLAGS) -zM
++  CXXFLAGS := $(CXXFLAGS) -zM
++  LDFLAGS := $(LDFLAGS) -zM
++endif
++
++###############################################################################
++# Other settings
++###############################################################################
++
++# Determine if the compiler supports simultaneous build & dep.
++CC_CANNOT_DEP := yes
++
+diff --git a/build/makefiles/Makefile.pkgconfig b/build/makefiles/Makefile.pkgconfig
+new file mode 100644
+index 0000000..14739bd
+--- /dev/null
++++ b/build/makefiles/Makefile.pkgconfig
+@@ -0,0 +1,88 @@
++# General purpose pkg-config macros
++
++# Determine if a package is available
++# 1: Name of variable to assign result into
++# 2: Name of package to search for
++define pkg_config_package_available
++  ifeq ($$(PKGCONFIG),)
++    $$(error pkg-config is required to auto-detect package availability)
++  endif
++
++  ifeq ($$(shell $$(PKGCONFIG) --exists $(2) && echo yes),yes)
++    $(1) := yes
++  else
++    $(1) := no
++  endif
++
++endef
++
++# Retrieve the version of a package
++# 1: Name of variable to assign result into
++# 2: Name of package to search for
++define pkg_config_package_version
++  ifeq ($$(PKGCONFIG),)
++    $$(error pkg-config is required to auto-detect package version)
++  endif
++
++  $(1) := $$(shell $$(PKGCONFIG) --version $(2))
++
++endef
++
++# Test the presence of a minimum version of a package
++# 1: Name of variable to assign result into
++# 2: Name of package to search for
++# 3: Lowest accepted version number
++define pkg_config_package_min_version
++  ifeq ($$(PKGCONFIG),)
++    $$(error pkg-config is required to auto-detect package version)
++  endif
++
++  ifeq ($$(shell $$(PKGCONFIG) --atleast-version=$(3) $(2) && echo yes),yes)
++     $(1) := yes
++  else
++     $(1) := no
++  endif
++
++endef
++
++# Test the presence of a minimum version of a package
++# 1: Name of variable to assign result into
++# 2: Name of package to search for
++# 3: Lowest accepted version number
++# 4: Highest accepted version number
++define pkg_config_package_compare_version
++  ifeq ($$(PKGCONFIG),)
++    $$(error pkg-config is required to auto-detect package version)
++  endif
++
++  ifeq ($$(shell $$(PKGCONFIG) --atleast-version=$(3) $(2) && echo yes),yes)
++     ifeq ($$(shell $$(PKGCONFIG) --max-version=$(4) $(2) && echo yes),yes)
++       $(1) := yes
++     else
++       $(1) := no
++     endif
++  else
++     $(1) := no
++  endif
++
++endef
++
++# Add package to compiler/linker flags
++# 1: Name of package to add details of
++# 2: CFLAGS variable to extend, or none
++# 3: LDFLAGS variable to extend, or none
++define pkg_config_package_add_flags
++  ifeq ($$(PKGCONFIG),)
++    $$(error pkg-config is required to auto-detect package version)
++  endif
++
++  ifneq ($(2),)
++    $(2) := $$($(2)) $$(shell $$(PKGCONFIG) --cflags $(1))
++  endif
++
++  ifneq ($(3),)
++    $(3) := $$($(3)) $$(shell $$(PKGCONFIG) --libs $(1))
++  endif
++
++endef
++
+diff --git a/build/makefiles/Makefile.subdir b/build/makefiles/Makefile.subdir
+new file mode 100644
+index 0000000..a8eb920
+--- /dev/null
++++ b/build/makefiles/Makefile.subdir
+@@ -0,0 +1,132 @@
++# Child makefile fragment
++#
++# Inputs (reset on exit)
++#
++# DIR_SOURCES		List of source files in this directory
++# DIR_TEST_ITEMS	List of test items in this directory
++# DIR_INSTALL_ITEMS	Items to install in form <destination>:<file1>;<file2>
++#
++# Toolchain is provided by top-level makefile
++#
++# Variables provided by top-level makefile
++#
++# BUILDDIR		The location of the build tree root
++# COMPONENT		The name of the component
++# CURDIR		The location of the source tree root
++# EXPORTDIR		The location of the export directory
++# WANT_TEST		Whether to build testcases
++#
++# do_include		Canned command sequence to include a child makefile
++#
++# Variables provided by parent makefile:
++#
++# DIR			The name of the directory we're in, relative to CURDIR
++#
++# Variables we can manipulate:
++#
++# CLEAN_ITEMS		The list of items to remove for "make clean"
++# DISTCLEAN_ITEMS	The list of items to remove for "make distclean"
++# TEST_ITEMS		The list of items to build for "make test"
++# TEST_TARGETS		The list of target names to run for "make test"
++# INSTALL_ITEMS		The list of items to (un)install
++#
++# SOURCES		The list of sources to build for $(COMPONENT)
++#
++# Plus anything from the toolchain
++
++# Push parent directory onto the directory stack
++sp             := $(sp).x
++dirstack_$(sp) := $(d)
++d              := $(DIR)
++
++# Sources
++SRCS_$(d) := $(DIR_SOURCES)
++TEST_ITEMS_$(d) :=
++INSTALL_ITEMS_$(d) :=
++
++# Append to sources for component
++SOURCES := $(SOURCES) $(addprefix $(d), $(SRCS_$(d)))
++
++# Test sources
++ifeq ($(WANT_TEST),yes)
++  ifneq ($(DIR_TEST_ITEMS),)
++    # Extract the binary name from the ITEM
++    binary = $(subst /,_,$(addprefix $(d),$(firstword $(subst :, ,$(ITEM)))))
++    # Extract the list of sources from the ITEM
++    sources = $(subst ;, ,$(lastword $(subst :, ,$(ITEM))))
++
++    # We can't simply use the output of foreach here, 
++    # as it space separates its output, which kinda defeats the point.
++    define append_test_src
++      TEST_ITEMS_$(d) := $$(TEST_ITEMS_$(d))$1;
++
++    endef
++
++    define append_test
++      TEST_ITEMS_$(d) := $$(TEST_ITEMS_$(d)) $1:
++
++      $$(eval $$(foreach TSRC,$2, \
++		$$(call append_test_src,$$(addprefix $$(d),$$(TSRC)))))
++
++    endef
++
++    # Append test items, prepending $(d) to each source file 
++    $(eval $(foreach ITEM,$(DIR_TEST_ITEMS), \
++		$(call append_test,$(binary),$(sources))))
++
++    TEST_ITEMS := $(TEST_ITEMS) $(TEST_ITEMS_$(d))
++
++    TEST_TARGETS := $(TEST_TARGETS) test_$(d)
++
++    # Extract the binary name from the TEST
++    binary_name = $(firstword $(subst :, ,$(TEST)))
++
++    # Target for tests in this directory
++    test_$(d): $(d) $(addprefix $(BUILDDIR)/, \
++			$(foreach TEST,$(TEST_ITEMS_$(d)),$(binary_name)))
++	$(Q)$(SHAREDLDPATH) $(TESTRUNNER) $(BUILDDIR) \
++		$(CURDIR)/$< $(subst /,_,$<) $(EXEEXT)
++  endif
++endif
++
++# Install items
++ifneq ($(DIR_INSTALL_ITEMS),)
++  # Extract the destination directory from the variable
++  dest_dir = $(firstword $(subst :, ,$(ITEM)))
++  # Extract the list of files to install
++  files = $(subst ;, ,$(lastword $(subst :, ,$(ITEM))))
++
++  define append_install_file
++    INSTALL_ITEMS_$(d) := $$(INSTALL_ITEMS_$(d))$1;
++
++  endef
++
++  define append_install_item
++    INSTALL_ITEMS_$(d) := $$(INSTALL_ITEMS_$(d)) $1:
++
++    $$(eval $$(foreach FILE,$2, \
++		$$(call append_install_file,$$(addprefix $$(d),$$(FILE)))))
++
++  endef
++
++  # Append items to install (along with install location), prepending $(d)
++  # to each item in the file list 
++  $(eval $(foreach ITEM,$(DIR_INSTALL_ITEMS), \
++		$(call append_install_item,$(dest_dir),$(files))))
++
++  INSTALL_ITEMS := $(INSTALL_ITEMS) $(INSTALL_ITEMS_$(d))
++endif
++
++# Reset the inputs
++DIR_SOURCES :=
++DIR_TEST_ITEMS :=
++DIR_INSTALL_ITEMS :=
++
++# Now include any children we may have
++MAKE_INCLUDES := $(wildcard $(d)*/Makefile)
++$(eval $(foreach INC, $(MAKE_INCLUDES), $(call do_include,$(INC))))
++
++# Pop off the directory stack
++d  := $(dirstack_$(sp))
++sp := $(basename $(sp))
++
+diff --git a/build/makefiles/Makefile.tools b/build/makefiles/Makefile.tools
+new file mode 100644
+index 0000000..c27b55c
+--- /dev/null
++++ b/build/makefiles/Makefile.tools
+@@ -0,0 +1,469 @@
++# Tools Makefile fragment
++#
++# Expected inputs:
++#
++# COMPONENT_TYPE	Type of component:
++# 				binary		-	Executable binary
++# 				lib-static	-	Static library
++# 				lib-shared	-	Shared library
++# 				riscos-module	-	RISC OS module
++#
++# Optional inputs:
++#
++# BUILD			Type of build to perform:
++# 				release		-	Release build (default)
++# 				debug		-	Debug build
++# OPTCFLAGS		Optional C compiler flags for $(BUILD)
++# OPTCXXFLAGS		Optional C++ compiler flags for $(BUILD)
++# OPTLDFLAGS		Optional linker flags for $(BUILD)
++# TARGET		Target platform (defaults to host)
++# PREFIX		Absolute installation path prefix 
++# 				(defaults to /usr/local)
++#
++
++###############################################################################
++# Sanity checks
++###############################################################################
++
++ifeq ($(COMPONENT_TYPE),)
++  $(error COMPONENT_TYPE not set)
++endif
++
++# Default build to release
++ifeq ($(BUILD),)
++  BUILD := release
++endif
++
++###############################################################################
++# Host/target platform detection
++###############################################################################
++
++# Autodetect host if necessary
++ifeq ($(HOST),)
++  HOST := $(shell uname -s)
++endif
++
++# Simple host sanitisation
++ifeq ($(HOST),)
++  # Don't ask
++  HOST := riscos
++else
++  ifeq ($(HOST),RISC OS)
++    HOST := riscos
++  endif
++
++  ifeq ($(HOST),BeOS)
++    HOST := beos
++  endif
++  ifeq ($(HOST),Haiku)
++    HOST := haiku
++  endif
++
++  ifeq ($(HOST),AmigaOS)
++    HOST := amiga
++  endif
++
++  ifeq ($(findstring MINGW,$(HOST)),MINGW)
++    HOST := windows
++  endif
++endif
++
++ifeq ($(TARGET),)
++  # Default target to host. Please add exceptions as required.
++  TARGET := $(HOST)
++
++  ifeq ($(HOST),haiku)
++    # This isn't necessarily correct -- they have differences. However, in the 
++    # general case, this will work. If there are differences that are actually 
++    # important wrt the target platform (as opposed to the build host) then 
++    # we'll just have to introduce a haiku target, too.
++    TARGET := beos
++  endif
++endif
++
++# Sanitise HOST and TARGET
++# TODO: Ideally, we want the equivalent of s/[^A-Za-z0-9]/_/g here
++HOST := $(subst .,_,$(subst -,_,$(subst /,_,$(HOST))))
++TARGET := $(subst .,_,$(subst -,_,$(subst /,_,$(TARGET))))
++
++# Now setup our tooling
++ifeq ($(TARGET),riscos)
++  ifeq ($(HOST),riscos)
++    # Building on native RISC OS
++    GCCSDK_INSTALL_ENV ?= <NSLibs$$Dir>
++
++    CC__ := gcc
++    CXX__ := g++
++    CMHG ?= cmunge
++    GENHTML ?= echo
++    LCOV ?= echo
++    PKGCONFIG ?=
++    # On certain versions of RISC OS (<>4 || kernel < 8.75),
++    # the kernel will clean up the current redirection on
++    # OS_Exit, including closing the associated file handles.
++    # This is problematic for UnixLib, as it's invariably using
++    # those filehandles in a pipe between parent and child processes.
++    # This affects us as, anywhere where we shell out and want to
++    # capture the output of the child process may fail.
++    # Fortunately, if we know the child process is built against
++    # UnixLib, then we also know that it won't call OS_Exit when it
++    # exits, instead returning directly to our exit handler (and thus
++    # preserving the redirection). This only works, however, if the
++    # child application is specified using its absolute path, or 
++    # found in Run$Path. In the case of Perl, it does not appear in
++    # Run$Path, so we must invoke it using its absolute path so that
++    # the SharedUnixLibrary successfully detects it as a child process.
++    PERL ?= <Perl$$Dir>.bin.perl
++
++    # This is nasty, but needed because $(CURDIR) will 
++    # contain colons, and thus confuse make mightily
++    $(shell SetMacro Alias$$$(COMPONENT)pwd Set %0 <FileSwitch$$CurrentFilingSystem>:|<FileSwitch$$<FileSwitch$$CurrentFilingSystem>$$CSD>|mUnset Alias$$$(COMPONENT)pwd)
++    $(shell $(COMPONENT)pwd $(COMPONENT)$$Dir)
++    CURDIR := <$(COMPONENT)$$Dir>
++  else
++    # Cross compiling for RISC OS
++    ifeq ($(origin GCCSDK_INSTALL_ENV),undefined)
++      ifneq ($(realpath /opt/netsurf/arm-unknown-riscos/env),)
++        GCCSDK_INSTALL_ENV := /opt/netsurf/arm-unknown-riscos/env
++      else
++        GCCSDK_INSTALL_ENV := /home/riscos/env
++      endif
++    endif
++
++    ifeq ($(origin GCCSDK_INSTALL_CROSSBIN),undefined)
++      ifneq ($(realpath /opt/netsurf/arm-unknown-riscos/cross/bin),)
++        GCCSDK_INSTALL_CROSSBIN := /opt/netsurf/arm-unknown-riscos/cross/bin
++      else
++        GCCSDK_INSTALL_CROSSBIN := /home/riscos/cross/bin
++      endif
++    endif
++
++    AR__ := $(wildcard $(GCCSDK_INSTALL_CROSSBIN)/*ar)
++    CC__ := $(wildcard $(GCCSDK_INSTALL_CROSSBIN)/*gcc)
++    CXX__ := $(wildcard $(GCCSDK_INSTALL_CROSSBIN)/*g++)
++    CMHG ?= PATH="$(GCCSDK_INSTALL_CROSSBIN):$(PATH)" $(GCCSDK_INSTALL_CROSSBIN)/cmunge
++    GENHTML ?= echo
++    LCOV ?= echo
++    PKGCONFIG ?= PKG_CONFIG_LIBDIR="$(PREFIX)/lib/pkgconfig:$(GCCSDK_INSTALL_ENV)/lib/pkgconfig:$(GCCSDK_INSTALL_ENV)/share/pkgconfig" pkg-config
++
++    ifneq ($(COMPONENT_TYPE),riscos-module)
++      ifeq ($(origin CC),default)
++        ifneq ($(findstring arm-unknown-riscos-gcc,$(CC__)),)
++          EXEEXT := ,e1f
++        else
++          EXEEXT := ,ff8
++        endif
++      else
++        ifneq ($(findstring arm-unknown-riscos-gcc,$(CC)),)
++          EXEEXT := ,e1f
++        else
++          EXEEXT := ,ff8
++        endif
++      endif
++    else
++      EXEEXT := ,ffa
++    endif
++  endif
++
++  # TODO: this assumes GCC
++  CFLAGS := $(CFLAGS) -mpoke-function-name -I$(GCCSDK_INSTALL_ENV)/include
++  CXXFLAGS := $(CXXFLAGS) -mpoke-function-name -I$(GCCSDK_INSTALL_ENV)/include
++  LDFLAGS := $(LDFLAGS) -L$(GCCSDK_INSTALL_ENV)/lib
++
++  CMHGFLAGS := -p -tgcc -32bit -apcs 3/32/nonreent/fpe2/noswst/nofpr/nofp
++
++  # Default prefix
++  PREFIX ?= $(GCCSDK_INSTALL_ENV)
++endif
++
++# BeOS-like targets
++ifeq ($(TARGET),beos)
++  ifeq ($(HOST),beos)
++    # Building on BeOS
++    CC__ := gcc
++
++    # No pkg-config
++    PKGCONFIG ?=
++
++    # Default prefix
++    BEOS_INSTALL_ENV ?= /boot/home/config
++  else
++    ifeq ($(HOST),haiku)
++      # Building on Haiku
++
++      # Default prefix
++      BEOS_INSTALL_ENV ?= /boot/common
++    else
++      # TODO: more sensible default
++      BEOS_INSTALL_ENV ?= /home/jmb/haiku/env
++      BEOS_INSTALL_CROSSBIN ?= /home/jmb/haiku/haiku/generated/cross-tools/bin
++
++      CC__ := $(wildcard $(BEOS_INSTALL_CROSSBIN)/*gcc)
++      CXX__ := $(wildcard $(BEOS_INSTALL_CROSSBIN)/*g++)
++      AR__ := $(wildcard $(BEOS_INSTALL_CROSSBIN)/*ar)
++
++      PKGCONFIG := PKG_CONFIG_LIBDIR="$(PREFIX)/lib/pkgconfig:$(BEOS_INSTALL_ENV)/lib/pkgconfig:$(BEOS_INSTALL_ENV)/share/pkgconfig" pkg-config
++    endif
++  endif
++
++  # TODO: this assumes GCC
++  CFLAGS := $(CFLAGS) -I$(BEOS_INSTALL_ENV)/include
++  CXXFLAGS := $(CXXFLAGS) -I$(BEOS_INSTALL_ENV)/include
++  LDFLAGS := $(LDFLAGS) -L$(BEOS_INSTALL_ENV)/lib
++
++  PREFIX ?= $(BEOS_INSTALL_ENV)
++endif
++
++# Windows
++ifeq ($(TARGET),windows)
++  ifeq ($(HOST),windows)
++    # Building on Windows
++    CC__ := gcc
++    CXX__ := g++
++    AR__ := ar
++
++    PKGCONFIG ?=
++  else
++    # Cross compiling for Windows -- assumes mingw toolchain
++    MINGW_INSTALL_ENV ?= /usr/local/mingw
++
++    CC__ := i586-mingw32msvc-gcc
++    CXX__ := i586-mingw32msvc-g++
++    AR__ := i586-mingw32msvc-ar
++
++    PKGCONFIG ?= PKG_CONFIG_LIBDIR="$(PREFIX)/lib/pkgconfig:$(MINGW_INSTALL_ENV)/lib/pkgconfig:$(MINGW_INSTALL_ENV)/share/pkgconfig" pkg-config
++  endif
++
++  # TODO: this assumes GCC
++  CFLAGS := $(CFLAGS) -U__STRICT_ANSI__ -I$(MINGW_INSTALL_ENV)/include
++  CXXFLAGS := $(CXXFLAGS) -U__STRICT_ANSI__ -I$(MINGW_INSTALL_ENV)/include
++  LDFLAGS := $(LDFLAGS) -L$(MINGW_INSTALL_ENV)/lib
++
++  # Default prefix
++  PREFIX ?= $(MINGW_INSTALL_ENV)
++endif
++
++# AmigaOS (3/4; m68k/ppc: we can treat them identically)
++ifeq ($(findstring amiga,$(TARGET)),amiga)
++  ifeq ($(findstring amiga,$(HOST)),amiga)
++    # Building on AmigaOS
++    # Nothing to do, as we assume the default tooling works
++  else
++    # Cross compiling for AmigaOS
++
++    ifeq ($(TARGET),amigaos3)
++      GCCSDK_INSTALL_ENV ?= /opt/netsurf/m68k-unknown-amigaos/env
++      GCCSDK_INSTALL_CROSSBIN ?= /opt/netsurf/m68k-unknown-amigaos/cross/bin
++    else
++      GCCSDK_INSTALL_ENV ?= /opt/netsurf/ppc-amigaos/env
++      GCCSDK_INSTALL_CROSSBIN ?= /opt/netsurf/ppc-amigaos/cross/bin
++    endif
++
++    AR__ := $(wildcard $(GCCSDK_INSTALL_CROSSBIN)/*ar)
++    CC__ := $(wildcard $(GCCSDK_INSTALL_CROSSBIN)/*gcc)
++    CXX__ := $(wildcard $(GCCSDK_INSTALL_CROSSBIN)/*g++)
++
++    PKGCONFIG ?= PKG_CONFIG_LIBDIR="$(PREFIX)/lib/pkgconfig:$(MINGW_INSTALL_ENV)/lib/pkgconfig:$(MINGW_INSTALL_ENV)/share/pkgconfig" pkg-config
++
++    # TODO: this assumes GCC
++    CFLAGS := $(CFLAGS) -U__STRICT_ANSI__ -I$(GCCSDK_INSTALL_ENV)/include
++    CXXFLAGS := $(CXXFLAGS) -U__STRICT_ANSI__ -I$(GCCSDK_INSTALL_ENV)/include
++    LDFLAGS := $(LDFLAGS) -L$(GCCSDK_INSTALL_ENV)/lib
++
++    PREFIX ?= $(GCCSDK_INSTALL_ENV)
++  endif
++endif
++
++# Default prefix
++PREFIX ?= /usr/local
++
++###############################################################################
++# Tool defaults
++###############################################################################
++
++CP ?= cp
++
++DOXYGEN ?= doxygen
++
++ECHO ?= echo
++
++GENHTML ?= genhtml
++
++ifeq ($(HOST),$(TARGET))
++  HOST_CC ?= $(CC)
++
++  HOST_CXX ?= $(CXX)
++else
++  HOST_CC ?= cc
++
++  HOST_CXX ?= c++
++endif
++
++INSTALL ?= install
++
++LCOV ?= lcov
++
++LN ?= ln
++
++MAKE ?= make
++
++MKDIR ?= mkdir
++MKDIRFLAGS ?= -p
++
++MV ?= mv
++
++PERL ?= perl
++
++PKGCONFIG ?= PKG_CONFIG_PATH="$(PREFIX)/lib/pkgconfig:$(PKG_CONFIG_PATH)" pkg-config
++
++GREP ?= grep
++
++SED ?= sed
++
++TOUCH ?= touch
++
++XSLTPROC ?= xsltproc
++
++###############################################################################
++# Override defaulted tools
++###############################################################################
++
++# CC
++ifeq ($(findstring ccc-analyzer,$(CC)),ccc-analyzer)
++    # We're being invoked by scan-build, so export 
++    # the compiler we would have used such that
++    # scan-build works with cross-compilation.
++    # There's no need to do this if we would have
++    # used the default compiler.
++    ifdef CC__
++      export CCC_CC := $(CC__)
++    endif
++else
++  # Only set CC if it's not already set in the 
++  # environment and we have a value for it. 
++  # Otherwise, leave it to be defaulted.
++  ifeq ($(origin CC),default)
++    ifdef CC__
++      CC := $(CC__)
++    endif
++  endif
++endif
++
++# CXX
++ifeq ($(origin CXX),default)
++  ifdef CXX__
++    CXX := $(CXX__)
++  endif
++endif
++
++# AR
++ifeq ($(origin AR),default)
++  ifdef AR__
++    AR := $(AR__)
++  endif
++endif
++
++###############################################################################
++# Auto-detect the toolchain
++###############################################################################
++
++# Check for GCC first, as that's most likely
++# TODO: Using shell redirection like this probably hurts portability
++ccspecs := $(shell $(CC) -dumpspecs 2>&1)
++ifeq ($(findstring libgcc,$(ccspecs)),libgcc)
++  # Looks like GCC
++  toolchain := gcc
++else
++  # Not GCC, so enquire further
++  ccvsn := $(shell $(CC) --version 2>&1)
++  ifeq ($(ccvsn),)
++    # Version string is blank
++    ifeq ($(HOST),riscos)
++      # For some reason we never see the output of SCL apps, so might be
++      # Norcroft.  However it might also be a GCC linked against a buggy
++      # UnixLib.
++      # TODO: Something more useful than blindly assuming GCC.
++      ccvsn := GCC
++      # ccvsn := Norcroft
++    endif
++  endif
++
++  # "Norcroft ..."
++  ifeq ($(word 1,$(ccvsn)),Norcroft)
++    toolchain := norcroft
++  endif
++  # "GCC ..."
++  ifeq ($(word 1,$(ccvsn)),GCC)
++    toolchain := gcc
++  endif
++  # "clang ..."
++  ifeq ($(word 1,$(ccvsn)),clang)
++    toolchain := clang
++  endif
++  ifeq ($(word 1,$(ccvsn)),Apple)
++    ifeq ($(word 2,$(ccvsn)),clang)
++      # Apple clang
++      toolchain := clang
++    endif
++  endif
++endif
++
++ifeq ($(toolchain),)
++  $(error Unable to detect toolchain)
++endif
++
++# TODO: It would be nice to avoid this hard-coded path
++include build/makefiles/Makefile.$(toolchain)
++
++###############################################################################
++# Default assembler/compiler/linker/archiver flags
++###############################################################################
++
++ifeq ($(BUILD),release)
++  OPTCFLAGS ?= $(CCDEF)NDEBUG $(CCOPT)
++  OPTCXXFLAGS ?= $(CXXDEF)NDEBUG $(CXXOPT)
++else
++  OPTCFLAGS ?= $(CCDBG) $(CCNOOPT) $(CCDEF)DEBUG
++  OPTCXXFLAGS ?= $(CXXDBG) $(CXXNOOPT) $(CXXDEF)DEBUG
++  OPTLDFLAGS ?= $(LDDBG)
++endif
++
++ifeq ($(origin ARFLAGS),default)
++  ARFLAGS := $(ARFLG)
++endif
++
++# TODO: This assumes that the C compiler can cope with assembler
++ASFLAGS ?= $(CCAS)
++
++CFLAGS := $(CFLAGS) $(OPTCFLAGS) $(CCDEF)BUILD_TARGET_$(TARGET) $(CCDEF)BUILD_HOST_$(HOST)
++CXXFLAGS := $(CXXFLAGS) $(OPTCXXFLAGS) \
++		$(CXXDEF)BUILD_TARGET_$(TARGET) $(CXXDEF)BUILD_HOST_$(HOST)
++
++ASFLAGS := $(ASFLAGS) $(CFLAGS)
++LDFLAGS := $(LDFLAGS) $(OPTLDFLAGS)
++
++###############################################################################
++# lib-shared defaults
++###############################################################################
++
++# Default library extension
++ifeq ($(COMPONENT_TYPE),lib-static)
++  LIBEXT ?= .a
++else
++  LIBEXT ?= .so
++endif
++
++# If we're building a shared library, modify the flags appropriately
++ifeq ($(COMPONENT_TYPE),lib-shared)
++  # Default CFLAGS/LDFLAGS for shared libraries
++  SHAREDCFLAGS ?= $(CCSHR) $(CCDEF)PIC
++  SHAREDCXXFLAGS ?= $(CXXSHR) $(CCDEF)PIC
++  SHAREDLDFLAGS ?= $(LDSHR)
++  SHAREDLDPATH ?= LD_LIBRARY_PATH="$(BUILDDIR):$(LD_LIBRARY_PATH)"
++endif
++
++################################################################################
++# Package config macros
++################################################################################
++
++include build/makefiles/Makefile.pkgconfig
+diff --git a/build/makefiles/Makefile.top b/build/makefiles/Makefile.top
+new file mode 100644
+index 0000000..99651fc
+--- /dev/null
++++ b/build/makefiles/Makefile.top
+@@ -0,0 +1,603 @@
++# Top-level Makefile fragment
++#
++# Expected inputs:
++#
++# BUILD			Type of build to perform:
++# 				release		-	Release build
++# 				debug		-	Debug build
++# COMPONENT		Name of the component (sans leading "lib" iff a library)
++# COMPONENT_VERSION	Component version number (x.y.z)
++# COMPONENT_TYPE	Type of component:
++# 				binary		-	Executable binary
++# 				lib-static	-	Static library
++# 				lib-shared	-	Shared library
++# 				riscos-module	-	RISC OS module
++# TARGET		Target platform identifier
++#
++# Optional inputs:
++#
++# BUILDDIR		Directory to build into (defaults to 
++# 			build-$(HOST)-$(TARGET)-$(BUILD)-$(COMPONENT_TYPE))
++# CC_CAN_BUILD_AND_DEP	Flag whether $(CC) is capable of calculating dependency
++# 			information at the same time as compiling sources.
++# 			Set to "yes" if it can.
++# DESTDIR		Sandboxed FS root (e.g. for packaging)
++# HOST			Host platform identifier
++# REQUIRED_PKGS		List of required pkg-config packages
++#
++# The client may also override all toolchain settings, including:
++#
++# ARFLAGS		Archiver flags for the current compilation
++# CFLAGS		C compiler flags for the current compilation
++# CXXFLAGS		C++ compiler flags for the current compilation
++# LDFLAGS		Linker flags for the current compilation
++#
++# TESTCFLAGS		Any test-specific CFLAGS
++# TESTCXXFLAGS		Any test-specific CXXFLAGS
++# TESTLDFLAGS		Any test-specific LDFLAGS
++#
++# TESTRUNNER		Test runner invocation command
++# 			The test runner takes a command line in the form
++# 				<build dir> <test dir> <testprefix> <exeext>
++#
++# Targets provided:
++#
++# all			Default target. Builds component using current settings
++# test			Build and run test suite, using current settings.
++# coverage		Determine test suite coverage (requires lcov)
++# profile		Build with profiling support enabled (requires gprof)
++# docs			Produce documentation (requires doxygen)
++# clean			Clean the build
++# distclean		Remove distribution files, too
++# install		Install component into prefix.
++# uninstall		Remove component from prefix.
++#
++# Variables provided:
++#
++# major-version		Extracts the major version (x) from COMPONENT_VERSION
++# minor-version		Extracts the minor version (y) from COMPONENT_VERSION
++# patch-version		Extracts the patch version (z) from COMPONENT_VERSION
++# OUTPUT		Path + filename of build target
++
++###############################################################################
++# Sanity checks
++###############################################################################
++
++# Name of component must be defined by client
++ifeq ($(COMPONENT),)
++  $(error COMPONENT not defined)
++endif
++
++# As must the version
++ifeq ($(COMPONENT_VERSION),)
++  $(error COMPONENT_VERSION not defined)
++endif
++
++# As must the component type
++ifeq ($(COMPONENT_TYPE),)
++  $(error COMPONENT_TYPE not defined)
++endif
++
++# Target platform must be defined by the client
++ifeq ($(TARGET),)
++  $(error TARGET not defined)
++endif
++
++# Build type, too
++ifeq ($(BUILD),)
++  $(error BUILD not defined)
++endif
++
++##############################################################################
++# Makefile variables
++##############################################################################
++
++Q ?= @
++VQ ?= @
++
++##############################################################################
++# Exported variables (also OUTPUT, further down)
++##############################################################################
++
++major-version := $(word 1,$(subst ., ,$(COMPONENT_VERSION)))
++minor-version := $(word 2,$(subst ., ,$(COMPONENT_VERSION)))
++patch-version := $(word 3,$(subst ., ,$(COMPONENT_VERSION)))
++
++##############################################################################
++# Build environment
++##############################################################################
++
++# Build directory
++BUILDDIR ?= build-$(HOST)-$(TARGET)-$(BUILD)-$(COMPONENT_TYPE)
++
++# Build tree subdirs
++COVERAGEDIR := $(BUILDDIR)/coverage
++DOCDIR := $(BUILDDIR)/docs
++
++# Determine if we want to build testcases
++ifeq ($(MAKECMDGOALS),test)
++  WANT_TEST := yes
++else ifeq ($(MAKECMDGOALS),profile)
++  WANT_TEST := yes
++else ifeq ($(MAKECMDGOALS),coverage)
++  WANT_TEST := yes
++else
++  WANT_TEST := no
++endif
++
++# List of items to delete on clean
++CLEAN_ITEMS :=
++# List of items to delete on distclean
++DISTCLEAN_ITEMS :=
++
++# List of items to build for testing
++TEST_ITEMS :=
++# List of targets to run for testing
++TEST_TARGETS :=
++# List of targets which are prerequisites for running tests
++TEST_PREREQS :=
++
++# List of items to (un)install
++INSTALL_ITEMS :=
++
++# List of targets to run before building $(OBJECT)
++PRE_TARGETS :=
++# List of targets to run after building $(OBJECT)
++POST_TARGETS :=
++
++# Source files
++SOURCES :=
++
++# Include configuration Makefile fragment
++-include Makefile.config
++
++# Set the default target (before including any children)
++__default: all
++
++# Include Makefile fragments in subdirectories
++define do_include
++DIR := $$(dir $(1))
++include $(1)
++
++endef
++
++MAKE_INCLUDES := $(wildcard */Makefile)
++$(eval $(foreach INC, $(MAKE_INCLUDES), $(call do_include,$(INC))))
++
++# Calculate objects to build
++OBJECTS := $(addprefix $(BUILDDIR)/,$(filter %.o, \
++		$(subst /,_,$(subst .c,.o,$(SOURCES))) \
++		$(subst /,_,$(subst .cpp,.o,$(SOURCES))) \
++		$(subst /,_,$(subst .cmhg,.o,$(SOURCES))) \
++		$(subst /,_,$(subst .s,.o,$(SOURCES)))))
++
++bin_for_test = $(addprefix $(BUILDDIR)/,$(firstword $(subst :, ,$(ITEM))))
++TEST_BINARIES := $(foreach ITEM,$(TEST_ITEMS),$(bin_for_test))
++
++# Determine if we're building any C++ sources
++ifneq ($(filter %.cpp,$(SOURCES)),)
++  CXX_IN_BUILD := yes
++else
++  CXX_IN_BUILD := no
++endif
++
++# Determine the output filename
++ifeq ($(findstring lib,$(COMPONENT_TYPE)),lib)
++  ifeq ($(findstring lib-shared,$(COMPONENT_TYPE)),lib-shared)
++    SHAREDLIBNAME := lib$(COMPONENT)$(LIBEXT)
++    SONAME := $(SHAREDLIBNAME).$(major-version)
++    OUTPUT := $(BUILDDIR)/$(SHAREDLIBNAME).$(COMPONENT_VERSION)
++  else
++    OUTPUT := $(BUILDDIR)/lib$(COMPONENT)$(LIBEXT)
++  endif
++else
++  OUTPUT := $(BUILDDIR)/$(COMPONENT)$(EXEEXT)
++endif
++
++###############################################################################
++# Build targets
++###############################################################################
++
++.PHONY: all test coverage profile docs clean distclean install uninstall \
++	__default __precov __partial_clean __postshared
++
++ifeq ($(COMPONENT_TYPE),lib-shared)
++  POST_TARGETS := __postshared $(POST_TARGETS)
++
++__postshared:
++	$(Q)$(LN) $(LNFLAGS) -f -s $(notdir $(OUTPUT)) $(BUILDDIR)/$(SONAME)
++	$(Q)$(LN) $(LNFLAGS) -f -s $(notdir $(OUTPUT)) $(BUILDDIR)/$(SHAREDLIBNAME)
++endif
++
++# Default target
++all: $(PRE_TARGETS) $(OUTPUT) $(POST_TARGETS)
++
++# Build and execute testsuite 
++test: all $(TEST_PREREQS) $(TEST_BINARIES) $(TEST_TARGETS)
++	$(VQ)$(ECHO) $(ECHOFLAGS) "    TEST: Testing complete"
++
++# Compute coverage
++__precov: __partial_clean
++	$(Q)$(LCOV) --directory . --zerocounters
++
++coverage: __precov test
++	$(Q)$(LCOV) --directory $(BUILDDIR) --base-directory $(CURDIR) \
++		--capture --output-file $(COVERAGEDIR)/$(COMPONENT)_tmp.info
++	$(Q)$(LCOV) --extract $(COVERAGEDIR)/$(COMPONENT)_tmp.info \
++		"$(CURDIR)/src*" -o $(COVERAGEDIR)/$(COMPONENT).info
++	$(Q)$(RM) $(RMFLAGS) $(COVERAGEDIR)/$(COMPONENT)_tmp.info
++	$(Q)$(GENHTML) -o $(COVERAGEDIR) --num-spaces 2 \
++		$(COVERAGEDIR)/$(COMPONENT).info
++
++# Build for profiling
++profile: __partial_clean test
++
++# Compile documentation
++docs: $(BUILDDIR)/stamp
++	$(Q)$(DOXYGEN) build/Doxyfile
++
++# Clean build tree
++__partial_clean:
++	-$(Q)$(RM) $(RMFLAGS) $(CLEAN_ITEMS)
++	-$(Q)$(RM) $(RMFLAGS) gmon.out
++	-$(Q)$(RM) $(RMFLAGS) $(wildcard $(BUILDDIR)/*.d)
++	-$(Q)$(RM) $(RMFLAGS) $(wildcard $(BUILDDIR)/*.gcda)
++	-$(Q)$(RM) $(RMFLAGS) $(wildcard $(BUILDDIR)/*.gcno)
++	-$(Q)$(RM) $(RMFLAGS) $(wildcard $(BUILDDIR)/*.o)
++
++clean: __partial_clean
++	-$(Q)$(RM) $(RMFLAGS) -r build/docs
++	-$(Q)$(RM) $(RMFLAGS) -r $(BUILDDIR)
++
++# Remove auto-generated non-build-tree items
++distclean: clean
++	-$(Q)$(RM) $(RMFLAGS) $(DISTCLEAN_ITEMS)
++
++# The installation target, and associated canned command sequences.
++# For reference, the syntax of INSTALL_ITEMS is:
++#
++# <destination>:<file>[';'<file>]*
++#
++# We also permit a trailing ';' in the file list.
++
++__comma := ,
++__empty := 
++__space := $(empty) $(empty)
++__required = $(if $(REQUIRED_PKGS),Requires: $(subst $(__space),$(__comma) ,$(strip $(REQUIRED_PKGS))),)
++
++# Install a pkg-config control file ($1) to the specified location ($2)
++define install_pkgconfig
++	$(Q)$(ECHO) $(ECHOFLAGS) "sed -e... $1 >$(BUILDDIR)/$(1:.in=)"
++	$(Q)$(SED) \
++		-e 's#PREFIX#$(PREFIX)#' \
++		-e 's#MAJOR#$(major-version)#' \
++		-e 's#MINOR#$(minor-version)#' \
++		-e 's#PATCH#$(patch-version)#' \
++		-e 's#VERSION#$(COMPONENT_VERSION)#' \
++		-e 's#REQUIRED#$(__required)#' \
++		$1 >$(BUILDDIR)/$(1:.in=)
++	$(INSTALL) $(INSTALLFLAGS) -m 644 $(BUILDDIR)/$(1:.in=) \
++		$2/$(1:.in=)
++
++endef
++
++# TODO: Is this scheme portable?
++define install_shared_lib
++  $(INSTALL) $(INSTALLFLAGS) -m 755 $1 $2/$(notdir $1)
++  $(LN) $(LNFLAGS) -f -s $(notdir $1) $2/$(SONAME)
++  $(LN) $(LNFLAGS) -f -s $(notdir $1) $2/$(SHAREDLIBNAME)
++endef
++
++# Install a file ($1) to the specified location ($2)
++define install_file
++  $(if $1, \
++    $(if $(findstring .pc.in,$1), \
++      $(call install_pkgconfig,$1,$2), \
++      $(if $(and $(filter lib-shared,$(COMPONENT_TYPE)), \
++		$(filter $(OUTPUT),$1)), \
++	$(call install_shared_lib,$1,$2), \
++	$(INSTALL) $(INSTALLFLAGS) -m 644 $1 $2)))
++
++endef
++
++# Install a list of files ($2) to the specified location ($1)
++# We create the installation location if it doesn't already exist
++define install_to_dest
++	$(Q)$(MKDIR) $(MKDIRFLAGS) $(DESTDIR)$(PREFIX)$1
++	$(foreach FILE,$(strip $(subst ;, ,$2)), \
++		$(call install_file,$(FILE),$(DESTDIR)$(PREFIX)$1))
++
++endef
++
++install: all
++	$(foreach ITEM,$(INSTALL_ITEMS), \
++		$(call install_to_dest,$(firstword $(subst :, ,$(ITEM))), \
++			$(lastword $(subst :, ,$(ITEM)))))
++
++# Uninstallation
++
++# TODO: Work out how to safely remove symlinks
++define uninstall_shared_lib
++	$(RM) $(RMFLAGS) $2/$(notdir $1).$(COMPONENT_VERSION)
++endef
++
++# Uninstall a file ($1) from the specified location ($2)
++define uninstall_file
++  $(if $1, \
++    $(if $(findstring .pc.in,$1), \
++      $(RM) $(RMFLAGS) $2/$(1:.pc.in=.pc), \
++      $(if $(and $(filter lib-shared,$(COMPONENT_TYPE)), \
++		$(filter $(OUTPUT),$1)), \
++	$(call uninstall_shared_lib,$1,$2), \
++	$(RM) $(RMFLAGS) $2/$(notdir $1))))
++
++endef
++
++# Uninstall a list of files ($2) from the specified location ($1)
++# TODO: Come up with a safe way of removing directories, too
++define uninstall_from_dest
++	$(foreach FILE,$(strip $(subst ;, ,$2)), \
++		$(call uninstall_file,$(FILE),$(DESTDIR)$(PREFIX)$1))
++
++endef
++
++uninstall:
++	$(foreach ITEM,$(INSTALL_ITEMS), \
++		$(call uninstall_from_dest,$(firstword $(subst :, ,$(ITEM))), \
++			$(lastword $(subst :, ,$(ITEM)))))
++
++###############################################################################
++# Actual rules
++###############################################################################
++
++$(BUILDDIR)/stamp:
++	$(Q)$(MKDIR) $(MKDIRFLAGS) $(BUILDDIR)
++	$(Q)$(MKDIR) $(MKDIRFLAGS) $(COVERAGEDIR)
++	$(Q)$(MKDIR) $(MKDIRFLAGS) $(DOCDIR)
++	$(Q)$(TOUCH) $(TOUCHFLAGS) $(BUILDDIR)/stamp
++
++$(OUTPUT): $(BUILDDIR)/stamp $(OBJECTS)
++ifeq ($(COMPONENT_TYPE),lib-static)
++	$(VQ)$(ECHO) $(ECHOFLAGS) "      AR: $@"
++	$(Q)$(RM) $(RMFLAGS) $@
++	$(Q)$(AR) $(ARFLAGS) $@ $(OBJECTS)
++else
++	$(VQ)$(ECHO) $(ECHOFLAGS) "    LINK: $@"
++  ifeq ($(CXX_IN_BUILD),yes)
++	$(Q)$(CXX) -o $@ $(OBJECTS) $(LDFLAGS) $(SHAREDLDFLAGS)
++  else
++	$(Q)$(CC) -o $@ $(OBJECTS) $(LDFLAGS) $(SHAREDLDFLAGS)
++  endif
++endif
++
++###############################################################################
++# Autogenerated, implied rules
++###############################################################################
++
++DEPFILES :=
++BUILDFILES :=
++
++ifeq ($(CC_CAN_BUILD_AND_DEP),yes)
++  # C compiler can compile and dep simultaneously
++
++  define dep_c
++    ifeq ($$(findstring $$(BUILDDIR)/$2,$$(DEPFILES)),)
++      $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++
++      DEPFILES += $$(BUILDDIR)/$2
++    endif
++
++  endef
++
++  define dep_cxx
++    ifeq ($$(findstring $$(BUILDDIR)/$2,$$(DEPFILES)),)
++      $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++
++      DEPFILES += $$(BUILDDIR)/$2
++    endif
++
++  endef
++
++  define build_c
++    ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++      $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) " COMPILE: $1"
++	$$(Q)$$(CC) -MMD -MP $$($3) -o $$@ -c $1
++
++      BUILDFILES += $$(BUILDDIR)/$2
++    endif
++
++  endef
++
++  define build_cxx
++    ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++      $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) " COMPILE: $1"
++	$$(Q)$$(CXX) -MMD -MP $$($3) -o $$@ -c $1
++
++      BUILDFILES += $$(BUILDDIR)/$2
++    endif
++
++  endef
++else
++  ifeq ($(CC_CANNOT_DEP),yes)
++    # C compiler cannot calculate dependencies
++
++    define dep_c
++    endef
++
++    define dep_cxx
++    endef
++
++    define build_c
++      ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++        $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) " COMPILE: $1"
++	$$(Q)$$(CC) $$($3) -o $$@ -c $1
++
++        BUILDFILES += $$(BUILDDIR)/$2
++      endif
++
++    endef
++
++    define build_cxx
++      ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++        $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) " COMPILE: $1"
++	$$(Q)$$(CXX) $$($3) -o $$@ -c $1
++
++        BUILDFILES += $$(BUILDDIR)/$2
++      endif
++
++    endef
++  else
++    # C compiler must calculate dependencies first, then compile (default)
++
++    define dep_c
++      ifeq ($$(findstring $$(BUILDDIR)/$2,$$(DEPFILES)),)
++        $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) "     DEP: $1"
++	$$(Q)$$(RM) $$(RMFLAGS) $($@)
++	$$(Q)$$(CC) $$($3) -MM $1 > $$@.tmp
++	$$(Q)$$(SED) $$(SEDFLAGS) 's,^.*:,$$@ $$(@:.d=.o):,' < $$@.tmp > $$@
++	$$(Q)$$(RM) $$@.tmp
++
++        DEPFILES += $$(BUILDDIR)/$2
++      endif
++
++    endef
++
++    define dep_cxx
++      ifeq ($$(findstring $$(BUILDDIR)/$2,$$(DEPFILES)),)
++        $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) "     DEP: $1"
++	$$(Q)$$(RM) $$(RMFLAGS) $($@)
++	$$(Q)$$(CXX) $$($3) -MM $1 > $$@.tmp
++	$$(Q)$$(SED) $$(SEDFLAGS) 's,^.*:,$$@ $$(@:.d=.o):,' < $$@.tmp > $$@
++	$$(Q)$$(RM) $$@.tmp
++
++        DEPFILES += $$(BUILDDIR)/$2
++      endif
++
++    endef
++
++    define build_c
++      ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++        $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) " COMPILE: $1"
++	$$(Q)$$(CC) $$($3) -o $$@ -c $1
++
++        BUILDFILES += $$(BUILDDIR)/$2
++      endif
++
++    endef
++
++    define build_cxx
++      ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++        $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) " COMPILE: $1"
++	$$(Q)$$(CXX) $$($3) -o $$@ -c $1
++
++        BUILDFILES += $$(BUILDDIR)/$2
++      endif
++
++    endef
++  endif
++endif
++
++define build_cmhg
++  ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++    $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) "    CMHG: $1"
++	$$(Q)$$(CMHG) $$(CMHGFLAGS) $1 -o $$@
++
++    BUILDFILES += $$(BUILDDIR)/$2
++  endif
++
++endef
++
++define build_s
++  ifeq ($$(findstring $$(BUILDDIR)/$2,$$(BUILDFILES)),)
++    $$(BUILDDIR)/$2: $$(BUILDDIR)/stamp $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) "ASSEMBLE: $1"
++	$$(Q)$$(CC) $$($3) $1 -c -o $$@
++    BUILDFILES += $$(BUILDDIR)/$2
++  endif
++
++endef
++
++BUILDCFLAGS = $(CFLAGS) $(SHAREDCFLAGS)
++BUILDCXXFLAGS = $(CXXFLAGS) $(SHAREDCXXFLAGS)
++BUILDASFLAGS = $(ASFLAGS) $(SHAREDCFLAGS)
++
++# Generate dependency rules
++$(eval $(foreach SOURCE,$(filter %.c,$(SOURCES)), \
++	$(call dep_c,$(SOURCE),$(subst /,_,$(SOURCE:.c=.d)),BUILDCFLAGS)))
++$(eval $(foreach SOURCE,$(filter %.cpp,$(SOURCES)), \
++	$(call dep_cxx,$(SOURCE),$(subst /,_,$(SOURCE:.cpp=.d)),BUILDCXXFLAGS)))
++
++# Generate compilation rules
++$(eval $(foreach SOURCE,$(filter %.c,$(SOURCES)), \
++	$(call build_c,$(SOURCE),$(subst /,_,$(SOURCE:.c=.o)),BUILDCFLAGS)))
++
++$(eval $(foreach SOURCE,$(filter %.cpp,$(SOURCES)), \
++	$(call build_cxx,$(SOURCE),$(subst /,_,$(SOURCE:.cpp=.o)),BUILDCXXFLAGS)))
++
++$(eval $(foreach SOURCE,$(filter %.cmhg,$(SOURCES)), \
++	$(call build_cmhg,$(SOURCE),$(subst /,_,$(SOURCE:.cmhg=.o)))))
++
++$(eval $(foreach SOURCE,$(filter %.s,$(SOURCES)), \
++	$(call build_s,$(SOURCE),$(subst /,_,$(SOURCE:.s=.o)),BUILDASFLAGS)))
++
++# Similarly for test sources
++ifeq ($(WANT_TEST),yes)
++  ifeq ($(findstring lib,$(COMPONENT_TYPE)),lib)
++    TESTLIB := $(OUTPUT)
++    TESTLDFLAGS += -L$(BUILDDIR)/ -l$(COMPONENT)
++  endif
++
++  TESTCFLAGS := $(CFLAGS) $(TESTCFLAGS)
++  TESTCXXFLAGS += $(CXXFLAGS)
++  TESTLDFLAGS += $(LDFLAGS)
++
++  define link_test
++    $2: $($3) $1
++	$$(VQ)$$(ECHO) $$(ECHOFLAGS) "    LINK: $2"
++      ifeq ($$(CXX_IN_BUILD),yes)
++	$$(Q)$$(CXX) -o $$@ $1 $$($4)
++      else
++	$$(Q)$$(CC) -o $$@ $1 $$($4)
++      endif
++
++  endef
++
++  srcs_for_test = $(subst ;, ,$(lastword $(subst :, ,$(ITEM))))
++  objs_for_test = $(addprefix $(BUILDDIR)/, \
++		$(subst /,_,$(addsuffix .o,$(basename $(srcs_for_test)))))
++
++  $(eval $(foreach ITEM,$(TEST_ITEMS), \
++	$(foreach SOURCE,$(filter %.c,$(srcs_for_test)), \
++	$(call dep_c,$(SOURCE),$(subst /,_,$(SOURCE:.c=.d)),TESTCFLAGS))))
++
++  $(eval $(foreach ITEM,$(TEST_ITEMS), \
++	$(foreach SOURCE,$(filter %.cpp,$(srcs_for_test)), \
++	$(call dep_cxx,$(SOURCE),$(subst /,_,$(SOURCE:.cpp=.d)),TESTCXXFLAGS))))
++
++  $(eval $(foreach ITEM,$(TEST_ITEMS), \
++	$(foreach SOURCE,$(filter %.c,$(srcs_for_test)), \
++	$(call build_c,$(SOURCE),$(subst /,_,$(SOURCE:.c=.o)),TESTCFLAGS))))
++
++  $(eval $(foreach ITEM,$(TEST_ITEMS), \
++	$(foreach SOURCE,$(filter %.cpp,$(srcs_for_test)), \
++	$(call build_cxx,$(SOURCE),$(subst /,_,$(SOURCE:.cpp=.o)),TESTCXXFLAGS))))
++
++  $(eval $(foreach ITEM,$(TEST_ITEMS), \
++	$(call link_test,$(objs_for_test),$(bin_for_test),TESTLIB,TESTLDFLAGS)))
++
++endif
++
++# Include dependency makefiles
++ifneq ($(findstring clean,$(MAKECMDGOALS)),clean)
++-include $(sort $(DEPFILES))
++endif
++
+-- 
+2.1.0
+
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 3fc759f..aa4fd5f 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
-LIBSVGTINY_VERSION = 12121
+LIBSVGTINY_SITE = http://git.netsurf-browser.org/libsvgtiny.git
+LIBSVGTINY_SITE_METHOD = git
+LIBSVGTINY_VERSION = ea9d99fc8b231c22d06168135e181d61f4eb2f06
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
 LIBSVGTINY_LICENSE = MIT
-- 
2.1.0
