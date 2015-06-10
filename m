From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jun 2015 21:22:06 +0200
Subject: [Buildroot] [PATCH 02/11 v2] docs/manual: add kernel-module
In-Reply-To: <cover.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <97e1da52cd44a346541ddb2e1c6a445fffb79c5b.1433964001.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - some rephrasing and refactoring  (Arnout)
---
 docs/manual/adding-packages-kernel-module.txt | 129 ++++++++++++++++++++++++++
 docs/manual/adding-packages.txt               |   2 +
 2 files changed, 131 insertions(+)
 create mode 100644 docs/manual/adding-packages-kernel-module.txt

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
new file mode 100644
index 0000000..39927b2
--- /dev/null
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -0,0 +1,129 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for packages building kernel modules
+
+Buildroot offers a helper infrastructure to make it easy to write packages that
+build and install Linux kernel modules. Some packages only contain a kernel
+module, other packages contain programs and libraries in addition to kernel
+modules. Buildroot's helper infrastructure supports either case.
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
+10: FOO_LICENSE = GPLv2
+11: FOO_LICENSE_FILES = COPYING
+12: 
+13: $(eval $(kernel-module))
+14: $(eval $(generic-package))
+----
+
+Lines 7-11 define the usual meta-data to specify the version, archive name,
+remote URI where to find the package source, licensing information.
+
+On line 13, we invoke the +kernel-module+ helper infrastructure, that
+generates all the appropriate Makefile rules and variables to build
+that kernel module.
+
+Finally, on line 14, we invoke the
+xref:generic-package-tutorial[+generic-package+ infrastructure].
+
+The dependency on +linux+ is automatically added, so it is not needed to
+specify it in +FOO_DEPENDENCIES+.
+
+What you may have noticed is that, unlike other package infrastructures,
+we explicitly invoke a second infrastructure. This allows a package to
+build a kernel module, but also, if needed, use any one of other package
+infrastructures to build normal userland components (libraries,
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
+10: FOO_LICENSE = GPLv2
+11: FOO_LICENSE_FILES = COPYING
+12: 
+13: FOO_MODULE_SUBDIRS = driver/base
+14: FOO_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
+15: 
+16: ifeq ($(BR2_PACKAGE_LIBBAR),y)
+17: FOO_DEPENDENCIES = libbar
+18: FOO_CONF_OPTS = --enable-bar
+19: FOO_MODULE_SUBDIRS += driver/bar
+20: else
+21: FOO_CONF_OPTS = --disable-bar
+22: endif
+23: 
+24: $(eval $(kernel-module))
+26: $(eval $(autotools-package))
+----
+
+Here, we see that we have an autotools-based package, that also builds
+the kernel module located in sub-directory +driver/base+ and, if libbar
+is enabled, the kernel module located in sub-directory +driver/bar+, and
+defines the variable +KVERSION+ to be passed to the Linux buildsystem
+when building the module(s).
+
+
+[[kernel-module-reference]]
+==== +kernel-module+ reference
+
+The main macro for the  kernel module infrastructure is +kernel-module+.
+Unlike other package infrastructures, it is not stand-alone, and requires
+any of the other +*-package+ macros be called after it.
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
+The following additional variables can optionally be defined to further
+configure the build of the kernel module:
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
