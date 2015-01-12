From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jan 2015 10:32:07 +0100
Subject: [Buildroot] [PATCH v6 03/16] docs/manual: add documentation for the
	pkg-rebar infrastructure
In-Reply-To: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1421055140-5092-4-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998 at free.fr: split the doc into its own patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v4 -> v5:  (Thomas)
  - drop unused variables
  - drop implementation details
  - properly document the autotools case
  - add missing licensing variables
  - some rewording about everywhere  (YEM)

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 docs/manual/adding-packages-rebar.txt | 102 ++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt       |   2 +
 2 files changed, 104 insertions(+)
 create mode 100644 docs/manual/adding-packages-rebar.txt

diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.txt
new file mode 100644
index 0000000..be9ede0
--- /dev/null
+++ b/docs/manual/adding-packages-rebar.txt
@@ -0,0 +1,102 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for rebar-based packages
+
+[[rebar-package-tutorial]]
+
+==== +rebar-package+ tutorial
+
+First, let's see how to write a +.mk+ file for a rebar-based package,
+with an example :
+
+------------------------------
+01: ################################################################################
+02: #
+03: # erlang-foobar
+04: #
+05: ################################################################################
+06:
+07: ERLANG_FOOBAR_VERSION = 1.0
+08: ERLANG_FOOBAR_SOURCE = erlang-foobar-$(ERLANG_FOOBAR_VERSION).tar.xz
+09: ERLANG_FOOBAR_SITE = http://www.foosoftware.org/download
+10: ERLANG_FOOBAR_DEPENDENCIES = host-libaaa libbbb
+11:
+12: $(eval $(rebar-package))
+--------------------------------
+
+On line 7, we declare the version of the package.
+
+On line 8 and 9, we declare the name of the tarball (xz-ed tarball
+recommended) and the location of the tarball on the Web. Buildroot
+will automatically download the tarball from this location.
+
+On line 10, we declare our dependencies, so that they are built
+before the build process of our package starts.
+
+Finally, on line 12, we invoke the +rebar-package+ macro that
+generates all the Makefile rules that actually allows the package to
+be built.
+
+[[rebar-package-reference]]
+
+==== +rebar-package+ reference
+
+The main macro of the +rebar+ package infrastructure is
++rebar-package+. It is similar to the +generic-package+ macro. The
+ability to have host packages is also available, with the
++host-rebar-package+ macro.
+
+Just like the generic infrastructure, the +rebar+ infrastructure works
+by defining a number of variables before calling the +rebar-package+
+macro.
+
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the +rebar+ infrastructure:
++ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
++ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
++ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
++ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+,
++ERLANG_FOOBAR_LICENSE+ and +ERLANG_FOOBAR_LICENSE_FILES+.
+
+A few additional variables, specific to the +rebar+ infrastructure,
+can also be defined. Many of them are only useful in very specific
+cases, typical packages will therefore only use a few of them.
+
+* +ERLANG_FOOBAR_USE_AUTOCONF+, to specify that the package uses
+  _autoconf_ at the configuration step.  When a package sets this
+  variable to +YES+, the +autotools+ infrastructure is used.
++
+.Note
+You can also use some of the variables from the +autotools+
+  infrastructure: +ERLANG_FOOBAR_CONF_ENV+, +ERLANG_FOOBAR_CONF_OPTS+,
+  +ERLANG_FOOBAR_AUTORECONF+, +ERLANG_FOOBAR_AUTORECONF_ENV+ and
+  +ERLANG_FOOBAR_AUTORECONF_OPTS+.
+
+* +ERLANG_FOOBAR_USE_BUNDLED_REBAR+, to specify that the package has
+  a bundled version of _rebar_ *and* that it shall be used. Valid
+  values are +YES+ or +NO+ (the default).
++
+.Note
+If the package bundles a _rebar_ utility, but can use the generic
+  one that Buildroot provides, just say +NO+ (i.e., do not specify
+  this variable). Only set if it is mandatory to use the _rebar_
+  utility bundled in this package.
+
+* +ERLANG_FOOBAR_REBAR_ENV+, to specify additional environment
+  variables to pass to the _rebar_ utility.
+
+With the rebar infrastructure, all the steps required to build
+and install the packages are already defined, and they generally work
+well for most rebar-based packages. However, when required, it is
+still possible to customize what is done in any particular step:
+
+* By adding a post-operation hook (after extract, patch, configure,
+  build or install). See xref:hooks[] for details.
+
+* By overriding one of the steps. For example, even if the rebar
+  infrastructure is used, if the package +.mk+ file defines its
+  own +ERLANG_FOOBAR_BUILD_CMDS+ variable, it will be used instead
+  of the default rebar one. However, using this method should be
+  restricted to very specific cases. Do not use it in the general
+  case.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index feb0d13..b8674f8 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -27,6 +27,8 @@ include::adding-packages-virtual.txt[]
 
 include::adding-packages-kconfig.txt[]
 
+include::adding-packages-rebar.txt[]
+
 include::adding-packages-asciidoc.txt[]
 
 include::adding-packages-hooks.txt[]
-- 
2.1.0
