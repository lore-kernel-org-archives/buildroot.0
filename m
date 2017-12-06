From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Dec 2017 11:56:54 +0100
Subject: [Buildroot] [PATCH 2/5] docs/manual: adding documentation for the
 golang infrastructure
In-Reply-To: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
References: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1512557817-431-3-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds the documentation for the golang infrastructure.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 docs/manual/adding-packages-golang.txt | 114 +++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt        |   2 +
 2 files changed, 116 insertions(+)
 create mode 100644 docs/manual/adding-packages-golang.txt

diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
new file mode 100644
index 0000000..3761cac
--- /dev/null
+++ b/docs/manual/adding-packages-golang.txt
@@ -0,0 +1,114 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for Go packages
+
+This infrastructure applies to Go packages that use the standard
+build system and use bundled dependencies.
+
+[[golang-package-tutorial]]
+
+==== +golang-package+ tutorial
+
+First, let's see how to write a +.mk+ file for a go package,
+with an example :
+
+------------------------
+01: ################################################################################
+02: #
+03: # go-foo
+04: #
+05: ################################################################################
+06:
+07: GO_FOO_VERSION = 1.0
+08: GO_FOO_SOURCE = go-foo-$(GO_FOO_VERSION).tar.xz
+09: GO_FOO_SITE = http://www.foosoftware.org/download
+10: GO_FOO_LICENSE = BSD-3-Clause
+11: GO_FOO_LICENSE_FILES = LICENSE
+12:
+13: $(eval $(golang-package))
+------------------------
+
+On line 7, we declare the version of the package.
+
+On line 8 and 9, we declare the name of the tarball (xz-ed tarball
+recommended) and the location of the tarball on the Web. Buildroot
+will automatically download the tarball from this location.
+
+On line 10 and 11, we give licensing details about the package (its
+license on line 10, and the file containing the license text on line
+11).
+
+Finally, on line 13, we invoke the +golang-package+ macro that
+generates all the Makefile rules that actually allow the package to be
+built.
+
+[[golang-package-reference]]
+
+==== +golang-package+ reference
+
+As a policy packages can freely choose their name (existing example in 
+Buildroot is +flannel+).
+
+In their +Config.in+ file, they should depend on 
++BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS+ and
++BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS+ cause host-go will compile when Buildroot will add the
+dependency automatically.
+
+The main macro of the Go package infrastructure is
++golang-package+. It is similar to the +generic-package+ macro.
+
+Just like the generic infrastructure, the Go infrastructure works
+by defining a number of variables before calling the +golang-package+.
+
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Go infrastructure: +GO_FOO_VERSION+,
++GO_FOO_SOURCE+, +GO_FOO_PATCH+, +GO_FOO_SITE+,
++GO_FOO_SUBDIR+, +GO_FOO_DEPENDENCIES+, +GO_FOO_LICENSE+,
++GO_FOO_LICENSE_FILES+, +GO_FOO_INSTALL_STAGING+, etc.
+
+Note that:
+
+ * It is not necessary to add +go+ or +host-go+ in the
+   +GO_FOO_DEPENDENCIES+ variable of a package, since these basic
+   dependencies are automatically added as needed by the Go
+   package infrastructure.
+
+A few additional variables, specific to the Go infrastructure, can
+optionally be defined, depending on the package's needs. Many of them
+are only useful in very specific cases, typical packages will
+therefore only use a few of them, or none.
+
+* If your package need a custom GOPATH to be compiled in, you can use the
+  +GO_FOO_GOPATH+.
+
+* +GO_FOO_GO_SRC_PATH+ is the path where your source will be compiled
+  relatively to the GOPATH.
+  The golang package infrastructure tries to guess the correct 
+  sub folder to compile in but if guessing is not correct for you or your
+  package behaves differently, you can use this variable to
+  redefine the path.
+
+* +GOO_FOO_GO_LDFLAGS+ and +GO_FOO_GO_TAGS+ can be used to pass
+  respectively the LDFLAGS or the TAGS to the build command.
+  +GOO_FOO_GO_LDFLAGS+ and +GO_FOO_GO_TAGS+ will be combined into
+  the proper command line options to be passed to the compiler.
+
+* If you need to customize the install location for you binaries, you
+  can use +GOO_FOO_BINDIR+ to know where the binaries are.
+
+With the Go infrastructure, all the steps required to build and
+install the packages are already defined, and they generally work well
+for most Go-based packages. However, when required, it is still
+possible to customize what is done in any particular step:
+
+* By adding a post-operation hook (after extract, patch, configure,
+  build or install). See xref:hooks[] for details.
+
+* By overriding one of the steps. For example, even if the Go
+  infrastructure is used, if the package +.mk+ file defines its own
+  +GO_FOO_BUILD_CMDS+ variable, it will be used instead of the
+  default Go one. However, using this method should be restricted
+  to very specific cases. Do not use it in the general case.
+
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index d577ff0..be7468b 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -34,6 +34,8 @@ include::adding-packages-rebar.txt[]
 
 include::adding-packages-waf.txt[]
 
+include::adding-packages-golang.txt[]
+
 include::adding-packages-kernel-module.txt[]
 
 include::adding-packages-asciidoc.txt[]
-- 
2.7.4
