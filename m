From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 11 Oct 2017 08:50:05 +0200
Subject: [Buildroot] [Patch v3 2/2] docs/manual: document meson-based
	packages
In-Reply-To: <20171011065005.9235-1-eric.le.bihan.dev@free.fr>
References: <20171011065005.9235-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171011065005.9235-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add instructions for adding a package which uses the Meson build system.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/adding-packages-meson.txt | 80 +++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt       |  2 +
 2 files changed, 82 insertions(+)
 create mode 100644 docs/manual/adding-packages-meson.txt

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
new file mode 100644
index 0000000000..14153a2ad3
--- /dev/null
+++ b/docs/manual/adding-packages-meson.txt
@@ -0,0 +1,80 @@
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
+13: FOO_DEPENDENCIES = host-meson host-pkgconf bar
+14:
+15: FOO_CONF_OPTS += \
+16: 	--prefix=/usr \
+17: 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
+18: 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
+19:
+20: define FOO_CONFIGURE_CMDS
+21: 	rm -rf $(@D)/build
+22: 	mkdir -p $(@D)/build
+23: 	$(TARGET_MAKE_ENV) meson.py $(FOO_CONF_OPTS) $(@D) $(@D)/build
+24: endef
+25:
+26: define FOO_BUILD_CMDS
+27: 	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
+28: endef
+29:
+30: define FOO_INSTALL_TARGET_CMDS
+31: 	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
+32: endef
+33:
+34: $(eval $(generic-package))
+--------------------------------
+
+The Makefile starts with the definition of the standard variables for package
+declaration (lines 7 to 11).
+
+As seen in line 34, it is based on the
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
+  during the build step.
+
+In order to have Meson available for the build, +FOO_DEPENDENCIES+ needs to
+contain +host-meson+. In the example, +host-pkgconf+ and +bar+ are also
+declared as dependencies because the Meson build file of +foo+ uses `pkg-config`
+to determine the compilation flags and libraries of package +bar+.
+
+To sum it up, to add a new meson-based package, the Makefile example can be
+copied verbatim then edited to replace all occurences of +FOO+ with the
+uppercase name of the new package and update the values of the standard
+variables.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index d577ff030e..e542124cf9 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -34,6 +34,8 @@ include::adding-packages-rebar.txt[]
 
 include::adding-packages-waf.txt[]
 
+include::adding-packages-meson.txt[]
+
 include::adding-packages-kernel-module.txt[]
 
 include::adding-packages-asciidoc.txt[]
-- 
2.13.6
