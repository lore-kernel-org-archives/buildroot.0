From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 24 Jun 2016 21:22:29 +0200
Subject: [Buildroot] [Patch v3 3/3] docs/manual: document meson-based
	packages
In-Reply-To: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1466796149-25218-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add instructions for adding a package which uses the Meson build system.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/adding-packages-meson.txt | 84 +++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt       |  2 +
 2 files changed, 86 insertions(+)
 create mode 100644 docs/manual/adding-packages-meson.txt

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
new file mode 100644
index 0000000..b8202ed
--- /dev/null
+++ b/docs/manual/adding-packages-meson.txt
@@ -0,0 +1,84 @@
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
+12:
+13: FOO_DEPENDENCIES = host-python-meson host-pkgconf bar
+14:
+15: ifeq ($(BR2_ENABLE_DEBUG),y)
+16: FOO_MESON_MODE = debug
+17: else
+18: FOO_MESON_MODE = release
+19: endif
+20:
+21: FOO_MESON_OPTS += \
+22: 	--prefix=/usr \
+23: 	--buildtype $(FOO_MESON_MODE) \
+24: 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
+25:
+26: define FOO_CONFIGURE_CMDS
+27: 	rm -rf $(@D)/build
+28: 	mkdir -p $(@D)/build
+29: 	$(TARGET_MAKE_ENV) meson.py $(FOO_MESON_OPTS) $(@D) $(@D)/build
+30: endef
+31:
+32: define FOO_BUILD_CMDS
+33: 	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
+34: endef
+35:
+36: define FOO_INSTALL_TARGET_CMDS
+37: 	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
+38: endef
+39:
+40: $(eval $(generic-package))
+--------------------------------
+
+The Makefile starts with the definition of the standard variables for package
+declaration (lines 7 to 11).
+
+As seen in line 40, it is based on the
+xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
+the variables required by this particular infrastructure, where Meson and its
+companion tool, Ninja, are invoked:
+
+* +FOO_CONFIGURE_CMDS+: the build directory required by Meson is created, and
+  Meson is invoked to generate the Ninja build file. The options required to
+  configure the cross-compilation of the package are passed via +FOO_MESON_OPTS+.
+
+* +FOO_BUILD_CMDS+: Ninja is invoked to perform the build.
+
+* +FOO_INSTALL_TARGET_CMDS+: Ninja is invoked to install the files generated
+  during the build step.
+
+In order to have Meson available for the build, +FOO_DEPENDENCIES+ needs to
+contain +host-python-meson+. In the example, +host-pkgconf+ and +bar+ are also
+declared as dependencies because the Meson build file of +foo+ uses `pkg-config`
+to determine the compilation flags and libraries of package +bar+.
+
+To sum it up, to add a new meson-based package, the Makefile example can be
+copied verbatim then edited to replace all occurences of +FOO+ with the uppercase
+name of the new package and update the values of the standard variables.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 76f90c9..8b80a63 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -29,6 +29,8 @@ include::adding-packages-kconfig.txt[]
 
 include::adding-packages-rebar.txt[]
 
+include::adding-packages-meson.txt[]
+
 include::adding-packages-kernel-module.txt[]
 
 include::adding-packages-asciidoc.txt[]
-- 
2.4.11
