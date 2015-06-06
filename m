From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2015 00:20:38 +0200
Subject: [Buildroot] [PATCH 02/11] docs/manual: add kernel-module
In-Reply-To: <cover.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <5c16fb51d4dd1fdf8d5660ccc2121895f28ca17c.1433628825.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-kernel-module.txt | 120 ++++++++++++++++++++++++++
 docs/manual/adding-packages.txt               |   2 +
 2 files changed, 122 insertions(+)
 create mode 100644 docs/manual/adding-packages-kernel-module.txt

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
new file mode 100644
index 0000000..1fe359a
--- /dev/null
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -0,0 +1,120 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for packages building kernel modules
+
+Some packages, in addition to the usual user-space components it builds,
+may also need to build and install kernel modules.
+
+Buildroot offers a helper infrastructure to ease writing such packages.
+
+[[kernel-module-tutorial]]
+==== +kernel-module+ tutorial
+
+Let's start with an example on how to prepare a simple package that only
+builds a kernel module, and no other component:
+
+----
+01: ################################################################################
+02: #
+03: # foo
+04: #
+05: ################################################################################
+06: 
+07: FOO_VERSION = 1.2.3
+08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
+09: FOO_SITE = http://www.foosoftware.org/download
+10: 
+11: $(eval $(kernel-module))
+12: $(eval $(generic-package))
+----
+
+Lines 7-9 define the usual meta-data to specify the version, archive name
+and remote URI where to find the package source.
+
+On line 11, we invoke the +kernel-module+ helper infrastructure, that
+generates all the appropriate Makefile rules and variables to build
+that kernel module.
+
+Finally, on line 12, we invoke the
+xref:generic-package-tutorial[+generic-package+ infrastructure].
+
+The dependency on +linux+ is automatically added, so it is not needed to
+specify it in +FOO_DEPENDENCIES+.
+
+What you may have noticed is that, unlike other package infrastructures,
+we explicitly invoke a second infrastructure. This allows a package to
+build a kernel module, but also, if needed, use any one of other package
+inftrastructures to build normal userland components (libraries,
+executables...). Using the +kernel-module+ infrastructure on its own is
+not sufficient; another package infrastructure *must* be used.
+
+Let's look at a more complex example:
+
+----
+01: ################################################################################
+02: #
+03: # foo
+04: #
+05: ################################################################################
+06: 
+07: FOO_VERSION = 1.2.3
+08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
+09: FOO_SITE = http://www.foosoftware.org/download
+10: FOO_DEPENDENCIES = libbar
+11: 
+12: FOO_CONF_OPTS = --enable-bar
+13: 
+14: FOO_MODULE_SUBDIRS = driver-base driver-bar
+15: FOO_MODULE_MAKE_OPTS = FOO_STUFF=some-value
+16: 
+17: $(eval $(kernel-module))
+18: $(eval $(autotools-package))
+----
+
+Here, we see that we have an autotools-based package, that also builds
+kernel modules located into sub-directories +driver-base+ and +driver-bar+,
+and defines the variable +FOO_STUFF+ to be passed to the Linux buildsystem
+when building the module(s) (see below for the reference for those two
+variables).
+
+
+[[kernel-module-reference]]
+==== +kernel-module+ reference
+
+The main macro for the  kernel module infrastructure is +kernel-module+.
+Unlike other package infrastructures, it is not stand-alone, and requires
+any of the other +*-package+ macro be called after it.
+
+The +kernel-module+ macro defines post-build and post-target-install
+hooks to build the kernel modules. If the package's +.mk+ needs access
+to the built kernel modules, it should do so in a post-build hook,
+registered after the call to +kernel-module+. Similarly, if the package's
++.mk+ needs access to the kernel module after it has been installed, it
+should do so in a post-install hook, registered after the call to
++kernel-module+. Here's an example:
+
+----
+$(eval $(kernel-module))
+
+define FOO_DO_STUFF_WITH_KERNEL_MODULE
+    # Do something with it...
+endef
+FOO_POST_BUILD_HOOKS += FOO_DO_STUFF_WITH_KERNEL_MODULE
+
+$(eval $(generic-package))
+----
+
+Finally, unlike the other package infrastructures, there is no
++host-kernel-module+ variant to build a host kernel module.
+
+Additional variable are available to further configure the build of
+the kernel module:
+
+* +FOO_MODULE_SUBDIRS+ may be set to one or more sub-directories (relative
+  to the package source top-directory) where the kernel module sources are.
+  If empty or not set, the sources for the kernel module(s) are considered
+  to be located at the top of the package source tree.
+
+* +FOO_MODULE_MAKE_OPTS+ may be set to contain extra variable definitions
+  to pass to the Linux buildsystem.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index b8674f8..721fe39 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -29,6 +29,8 @@ include::adding-packages-kconfig.txt[]
 
 include::adding-packages-rebar.txt[]
 
+include::adding-packages-kernel-module.txt[]
+
 include::adding-packages-asciidoc.txt[]
 
 include::adding-packages-hooks.txt[]
-- 
1.9.1
