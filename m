From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:42:18 +0100
Subject: [Buildroot] [PATCH 10/10] manual: adding packages luarocks
In-Reply-To: <cover.1387744636.git.yann.morin.1998@free.fr>
References: <cover.1387744636.git.yann.morin.1998@free.fr>
Message-ID: <5b7cd02db21a11fd581e9c1032a091d2bf44b3df.1387744636.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr: some cleanups and rephrasing]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-luarocks.txt | 93 ++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt          |  2 +
 2 files changed, 95 insertions(+)
 create mode 100644 docs/manual/adding-packages-luarocks.txt

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
new file mode 100644
index 0000000..6e68852
--- /dev/null
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -0,0 +1,93 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+Infrastructure for LuaRocks-based packages
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+[[luarocks-package-tutorial]]
+
++luarocks-package+ tutorial
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+First, let's see how to write a +.mk+ file for a LuaRocks-based package,
+with an example :
+
+------------------------
+01: ################################################################################
+02: #
+03: # luafoo
+04: #
+05: ################################################################################
+06:
+07: LUAFOO_VERSION = 1.0.2-1
+08: LUAFOO_DEPENDENCIES = foo
+09:
+10: LUAFOO_BUILD_OPT += FOO_INCDIR=$(STAGING_DIR)/usr/include
+11: LUAFOO_BUILD_OPT += FOO_LIBDIR=$(STAGING_DIR)/usr/lib
+12: LUAFOO_LICENSE = luaFoo license
+13: LUAFOO_LICENSE_FILES = COPYING
+14:
+15: $(eval $(luarocks-package))
+------------------------
+
+On line 7, we declare the version of the package (the same as in the rockspec,
+which is the concatenation of the upstream version and the rockspec revision,
+separated by a hyphen '-').
+
+On line 8, we declare our dependencies against native libraries, so that they
+are built before the build process of our package starts.
+
+On lines 10-11, we tell Buildroot to pass custom options to LuaRocks when it is
+building the package.
+
+On lines 12-13, we specify the licensing terms for the package.
+
+Finally, on line 15, we invoke the +luarocks-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[luarocks-package-reference]]
+
++luarocks-package+ reference
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+LuaRocks is a deployment and management system for Lua modules, and supports
+various +build.type+: +builtin+, +make+ and +cmake+. In the contetx of
+Buildroot, the +luarocks-package+ infrastructure only supports the +builtin+
+mode. LuaRocks packages that use the +make+ or +cmake+ build mechanisms
+should instead be packaged using the +generic-package+ and +cmake-package+
+infrastructures in Buildroot, respectively.
+
+The main macro of the LuaRocks package infrastructure is +luarocks-package+:
+like +generic-package+ it works by defining a number of variables providing
+meta informations about the package, and then calling +luarocks-package+. It
+is worth mentioning that building LuaRocks packages for the host is not
+supported, so the macro +host-luarocks-package+ is not implemented.
+
+Just like the generic infrastructure, the LuaRocks infrastructure works
+by defining a number of variables before calling the +luarocks-package+
+macro.
+
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the LuaRocks infrastructure:
++LUAFOO_VERSION+, +LUAFOO_SOURCE+, +LUAFOO_SITE+,
++LUAFOO_DEPENDENCIES+, +LUAFOO_LICENSE+, +LUAFOO_LICENSE_FILES+.
+
+Two of them are populated by the LuaRocks infrastructure (for the
++download+ step). If your package is not hosted on the LuaRocks mirror
++$(BR2_LUAROCKS_MIRROR)+, you can override them:
+
+* +LUAFOO_SITE+, which defaults to +$(BR2_LUAROCKS_MIRROR)+
+
+* +LUAFOO_SOURCE+, which defaults to +luafoo-$(LUAFOO_VERSION).src.rock+
+
+A few additional variables, specific to the LuaRocks infrastructure, are
+also defined. They can be overridden in specific cases.
+
+* +LUAFOO_ROCKSPEC+, which defaults to +luafoo-$(LUAFOO_VERSION).rockspec+
+
+* +LUAFOO_SUBDIR+, which defaults to
+  +luafoo-$(LUAFOO_VERSION_WITHOUT_ROCKSPEC_REVISION)+
+
+* +LUAFOO_BUILD_OPT+ contains additional build options for the
+  +luarocks build+ call.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 01277d8..cc86529 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -20,6 +20,8 @@ include::adding-packages-cmake.txt[]
 
 include::adding-packages-python.txt[]
 
+include::adding-packages-luarocks.txt[]
+
 include::adding-packages-hooks.txt[]
 
 include::adding-packages-gettext.txt[]
-- 
1.8.1.2
