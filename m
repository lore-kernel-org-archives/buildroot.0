From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 14 Nov 2013 21:17:29 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 10/10] manual: adding packages
	luarocks
In-Reply-To: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384460249-32410-10-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-luarocks.txt |   91 ++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt          |    2 +
 2 files changed, 93 insertions(+)
 create mode 100644 docs/manual/adding-packages-luarocks.txt

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
new file mode 100644
index 0000000..d3a883b
--- /dev/null
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -0,0 +1,91 @@
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
+12:
+13: $(eval $(luarocks-package))
+------------------------
+
+On line 7, we declare the version of the package (the same as in the rockspec,
+which is the concatenation of the upstream version and the rockspec revision).
+
+On line 8, we declare our dependencies, so that they are built
+before the build process of our package starts.
+
+On line 10-11, we tell Buildroot to pass custom options to LuaRocks when it is
+building the package.
+
+Finally, on line 13, we invoke the +luarocks-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[luarocks-package-reference]]
+
++luarocks-package+ reference
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+LuaRocks is a deployment and management system for Lua modules.
+
+LuaRocks supports various +build.type+ : +builtin+, +make+, +cmake+.
+This infrastructure supports only the +builtin+ mode,
+the +make+ & +cmake+ modes could be directly handled by generic & cmake infrastructure.
+
+The main macro of the LuaRocks package infrastructure is
++luarocks-package+. It is similar to the +generic-package+ macro.
+The +host-luarocks-package+ macro is not available,
+only the +luarocks-package+ macro is available.
+
+Just like the generic infrastructure, the LuaRocks infrastructure works
+by defining a number of variables before calling the +luarocks-package+
+macro.
+
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the LuaRocks infrastructure:
++LUAFOO_VERSION+, +LUAFOO_SOURCE+, +LUAFOO_SITE+,
++LUAFOO_DEPENDENCIES+.
+
+Two of them are populate by the LuaRocks infrastructure (for the
++download+ step) :
+
+* +LUAFOO_SITE+ with the +BR2_LUAROCKS_MIRROR+ value
+
+* +LUAFOO_SOURCE+ with +foo-$(FOO_VERSION).src.rock+
+
+A few additional variables, specific to the LuaRocks infrastructure, are
+also defined. They could be overrided in specific cases.
+
+* +LUAFOO_ROCKSPEC+ with +foo-$(FOO_VERSION).rockspec+
+
+* +LUAFOO_SUBDIR+ with +foo-$(FOO_VERSION_WITHOUT_ROCKSPEC_REVISION)+
+
+* +LUAFOO_BUILD_OPT+ contains the build option for +luarocks build+ call.
+  The default is empty.
+
+With the LuaRocks infrastructure, only 2 steps use +luarocks+ :
+extract and install target. +luarocks+ handles building and install
+in the same step.
+
+The step +patch+ is handled by the generic infrastructure.
+The step +configure+ and +build+ stay empty.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index ae76e74..b9ac058 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -18,6 +18,8 @@ include::adding-packages-autotools.txt[]
 
 include::adding-packages-cmake.txt[]
 
+include::adding-packages-luarocks.txt[]
+
 include::adding-packages-hooks.txt[]
 
 include::adding-packages-gettext.txt[]
-- 
1.7.9.5
