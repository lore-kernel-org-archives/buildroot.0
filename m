From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  7 May 2018 12:57:36 +0200
Subject: [Buildroot] [RFC PATCH 2/7] docs/manual: document pkg-meson infra
In-Reply-To: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180507105741.31747-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update documentation about adding meson-based packages with instructions for
using pkg-meson infrastructure.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/adding-packages-meson.txt | 107 +++++++++++++++-------------------
 1 file changed, 47 insertions(+), 60 deletions(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index f8aa08fa91..9863b69797 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Integration of Meson-based packages
+=== Infrastructure for Meson-based packages
 
 [[meson-package-tutorial]]
 
@@ -10,9 +10,7 @@
 http://mesonbuild.com[Meson] is an open source build system meant to be both
 extremely fast, and, even more importantly, as user friendly as possible.
 
-Buildroot does not (yet) provide a dedicated package infrastructure for
-meson-based packages. So, we will explain how to write a +.mk+ file for such a
-package. Let's start with an example:
+Let's see how to write a +.mk+ file for a Meson-based package, with an example:
 
 ------------------------------
 01: ################################################################################
@@ -28,74 +26,63 @@ package. Let's start with an example:
 11: FOO_LICENSE_FILES = COPYING
 12: FOO_INSTALL_STAGING = YES
 13:
-14: FOO_DEPENDENCIES = host-meson host-pkgconf bar
+14: FOO_DEPENDENCIES = host-pkgconf bar
 15:
-16: FOO_CONF_OPTS += \
-17: 	--prefix=/usr \
-18: 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
-19: 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
-20:
-21: FOO_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
-22:
-23: ifeq ($(BR2_PACKAGE_BAZ),y)
-24: FOO_CONF_OPTS += -Dbaz
-25: endif
-26:
-27: define FOO_CONFIGURE_CMDS
-28: 	rm -rf $(@D)/build
-29: 	mkdir -p $(@D)/build
-30: 	$(TARGET_MAKE_ENV) meson $(FOO_CONF_OPTS) $(@D) $(@D)/build
-31: endef
-32:
-33: define FOO_BUILD_CMDS
-34: 	$(TARGET_MAKE_ENV) ninja $(FOO_NINJA_OPTS) -C $(@D)/build
-35: endef
-36:
-37: define FOO_INSTALL_TARGET_CMDS
-38: 	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja $(FOO_NINJA_OPTS) \
-39: 		-C $(@D)/build install
-40: endef
-41:
-42: define FOO_INSTALL_STAGING_CMDS
-43: 	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) ninja $(FOO_NINJA_OPTS) \
-44: 		-C $(@D)/build install
-45: endef
-46:
-47: $(eval $(generic-package))
+16: ifeq ($(BR2_PACKAGE_BAZ),y)
+17: FOO_CONF_OPTS += -Dbaz
+18: endif
+19:
+20: $(eval $(meson-package))
 --------------------------------
 
 The Makefile starts with the definition of the standard variables for package
 declaration (lines 7 to 11).
 
-As seen in line 47, it is based on the
-xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
-the variables required by this particular infrastructure, where Meson and its
-companion tool, Ninja, are invoked:
+On line line 20, we invoke the +meson-package+ macro that generates all the
+Makefile rules that actually allows the package to be built.
 
-* +FOO_CONFIGURE_CMDS+: the build directory required by Meson is created, and
-  Meson is invoked to generate the Ninja build file. The options required to
-  configure the cross-compilation of the package are passed via
-  +FOO_CONF_OPTS+.
+In the example, +host-pkgconf+ and +bar+ are declared as dependencies in
++FOO_DEPENDENCIES+ at line 14 because the Meson build file of +foo+ uses
+`pkg-config` to determine the compilation flags and libraries of package +bar+.
 
-* +FOO_BUILD_CMDS+: Ninja is invoked to perform the build.
+Note that it is not necessary to add +host-meson+ in the +FOO_DEPENDENCIES+
+variable of a package, since this basic dependency is automatically added as
+needed by the Meson package infrastructure.
 
-* +FOO_INSTALL_TARGET_CMDS+: Ninja is invoked to install the files generated
-  during the build step in the target directory.
-
-* +FOO_INSTALL_STAGING_CMDS+: Ninja is invoked to install the files generated
-  during the build step in the staging directory, as +FOO_INSTALL_STAGING+ is
-  set to "YES".
-
-In order to have Meson available for the build, +FOO_DEPENDENCIES+ needs to
-contain +host-meson+. In the example, +host-pkgconf+ and +bar+ are also
-declared as dependencies because the Meson build file of +foo+ uses `pkg-config`
-to determine the compilation flags and libraries of package +bar+.
-
-If the "baz" package is selected, then support for the "baz" feature in "foo"
-is activated by adding +-Dbaz+ to +FOO_CONF_OPTS+, as specified in the
+If the "baz" package is selected, then support for the "baz" feature in "foo" is
+activated by adding +-Dbaz+ to +FOO_CONF_OPTS+ at line 17, as specified in the
 +meson_options.txt+ file in "foo" source tree.
 
 To sum it up, to add a new meson-based package, the Makefile example can be
 copied verbatim then edited to replace all occurences of +FOO+ with the
 uppercase name of the new package and update the values of the standard
 variables.
+
+[[meson-package-reference]]
+
+==== +meson-package+ reference
+
+The main macro of the Meson package infrastructure is +meson-package+. It is
+similar to the +generic-package+ macro.
+
+Just like the generic infrastructure, the Meson infrastructure works by defining
+a number of variables before calling the +meson-package+ macro.
+
+First, all the package metadata information variables that exist in the generic
+infrastructure also exist in the Meson infrastructure: +FOO_VERSION+,
++FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
++FOO_INSTALL_STAGING+, +FOO_INSTALL_TARGET+.
+
+A few additional variables, specific to the Meson infrastructure, can also be
+defined. Many of them are only useful in very specific cases, typical packages
+will therefore only use a few of them.
+
+* +FOO_CONF_ENV+, to specify additional environment variables to pass to
+  +meson+ for the configuration step. By default, empty.
+
+* +FOO_CONF_OPTS+, to specify additional options to pass to +meson+ for the
+  configuration step. By default, empty.
+
+* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
+  +ninja+, meson companion tool in charge of the build operations. By default,
+  empty.
-- 
2.14.3
