From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:09:58 +0100
Subject: [Buildroot] [git commit] docs/manual: document meson-based packages
Message-ID: <20171228222027.6991181338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d0dba6411c95b38d2bec2682f5bc8a1f450257f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add instructions for adding a package which uses the Meson build system.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                            |   1 +
 docs/manual/adding-packages-meson.txt | 101 ++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt       |   2 +
 3 files changed, 104 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 368d6a7..b6cc7a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -536,6 +536,7 @@ N:	Ed Swierk <eswierk@skyportsystems.com>
 F:	package/xxhash/
 
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
+F:	docs/manual/adding-packages-meson.txt
 F:	package/adwaita-icon-theme/
 F:	package/darkhttpd/
 F:	package/eudev/
diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
new file mode 100644
index 0000000..65a0f6a
--- /dev/null
+++ b/docs/manual/adding-packages-meson.txt
@@ -0,0 +1,101 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Integration of Meson-based packages
+
+[[meson-package-tutorial]]
+
+==== +meson-package+ tutorial
+
+http://mesonbuild.com[Meson] is an open source build system meant to be both
+extremely fast, and, even more importantly, as user friendly as possible.
+
+Buildroot does not (yet) provide a dedicated package infrastructure for
+meson-based packages. So, we will explain how to write a +.mk+ file for such a
+package. Let's start with an example:
+
+------------------------------
+01: ################################################################################
+02: #
+03: # foo
+04: #
+05: ################################################################################
+06:
+07: FOO_VERSION = 1.0
+08: FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
+09: FOO_SITE = http://www.foosoftware.org/download
+10: FOO_LICENSE = GPLv3+
+11: FOO_LICENSE_FILES = COPYING
+12: FOO_INSTALL_STAGING = YES
+13:
+14: FOO_DEPENDENCIES = host-meson host-pkgconf bar
+15:
+16: FOO_CONF_OPTS += \
+17: 	--prefix=/usr \
+18: 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
+19: 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
+20:
+21: FOO_NINJA_OPTS = $(if $(VERBOSE),-v)
+22:
+23: ifeq ($(BR2_PACKAGE_BAZ),y)
+24: FOO_CONF_OPTS += -Dbaz
+25: endif
+26:
+27: define FOO_CONFIGURE_CMDS
+28: 	rm -rf $(@D)/build
+29: 	mkdir -p $(@D)/build
+30: 	$(TARGET_MAKE_ENV) meson $(FOO_CONF_OPTS) $(@D) $(@D)/build
+31: endef
+32:
+33: define FOO_BUILD_CMDS
+34: 	$(TARGET_MAKE_ENV) ninja $(FOO_NINJA_OPTS) -C $(@D)/build
+35: endef
+36:
+37: define FOO_INSTALL_TARGET_CMDS
+38: 	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja $(FOO_NINJA_OPTS) \
+39: 		-C $(@D)/build install
+40: endef
+41:
+42: define FOO_INSTALL_STAGING_CMDS
+43: 	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) ninja $(FOO_NINJA_OPTS) \
+44: 		-C $(@D)/build install
+45: endef
+46:
+47: $(eval $(generic-package))
+--------------------------------
+
+The Makefile starts with the definition of the standard variables for package
+declaration (lines 7 to 11).
+
+As seen in line 47, it is based on the
+xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
+the variables required by this particular infrastructure, where Meson and its
+companion tool, Ninja, are invoked:
+
+* +FOO_CONFIGURE_CMDS+: the build directory required by Meson is created, and
+  Meson is invoked to generate the Ninja build file. The options required to
+  configure the cross-compilation of the package are passed via
+  +FOO_CONF_OPTS+.
+
+* +FOO_BUILD_CMDS+: Ninja is invoked to perform the build.
+
+* +FOO_INSTALL_TARGET_CMDS+: Ninja is invoked to install the files generated
+  during the build step in the target directory.
+
+* +FOO_INSTALL_STAGING_CMDS+: Ninja is invoked to install the files generated
+  during the build step in the staging directory, as +FOO_INSTALL_STAGING+ is
+  set to "YES".
+
+In order to have Meson available for the build, +FOO_DEPENDENCIES+ needs to
+contain +host-meson+. In the example, +host-pkgconf+ and +bar+ are also
+declared as dependencies because the Meson build file of +foo+ uses `pkg-config`
+to determine the compilation flags and libraries of package +bar+.
+
+If the "baz" package is selected, then support for the "baz" feature in "foo"
+is activated by adding +-Dbaz+ to +FOO_CONF_OPTS+, as specified in the
++meson_options.txt+ file in "foo" source tree.
+
+To sum it up, to add a new meson-based package, the Makefile example can be
+copied verbatim then edited to replace all occurences of +FOO+ with the
+uppercase name of the new package and update the values of the standard
+variables.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index d577ff0..e542124 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -34,6 +34,8 @@ include::adding-packages-rebar.txt[]
 
 include::adding-packages-waf.txt[]
 
+include::adding-packages-meson.txt[]
+
 include::adding-packages-kernel-module.txt[]
 
 include::adding-packages-asciidoc.txt[]
