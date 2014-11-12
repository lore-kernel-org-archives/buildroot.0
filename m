From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:57 +0100
Subject: [Buildroot] [PATCH 11/24 v3] docs/manual: add documentation for the
	pkg-rebar infrastructure
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <a744b7136606da1b2259357090a8ee0ebf8182c3.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998 at free.fr: split the doc into its own patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-rebar.txt | 157 ++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt       |   2 +
 2 files changed, 159 insertions(+)
 create mode 100644 docs/manual/adding-packages-rebar.txt

diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.txt
new file mode 100644
index 0000000..c132a4a
--- /dev/null
+++ b/docs/manual/adding-packages-rebar.txt
@@ -0,0 +1,157 @@
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
+08: ERLANG_FOOBAR_SOURCE = erlang-foobar-$(ERLANG_FOOBAR_VERSION).tar.gz
+09: ERLANG_FOOBAR_SITE = http://www.foosoftware.org/download
+10: ERLANG_FOOBAR_INSTALL_STAGING = YES
+11: ERLANG_FOOBAR_CONF_OPTS = --enable-bar
+12: ERLANG_FOOBAR_DEPENDENCIES = host-libaaa libbbb
+13:
+14: $(eval $(rebar-package))
+--------------------------------
+
+On line 7, we declare the version of the package.
+
+On line 8 and 9, we declare the name of the tarball (xz-ed tarball recommended)
+and the location of the tarball on the Web. Buildroot will automatically
+download the tarball from this location.
+
+On line 10, we tell Buildroot to install the package to the staging
+directory. The staging directory, located in +output/staging/+
+is the directory where all the packages are installed, including their
+development files, etc. By default, packages are not installed to the
+staging directory, since usually, only libraries need to be installed in
+the staging directory: their development files are needed to compile
+other libraries or applications depending on them.
+
+On line 11, we tell Buildroot to pass a custom configure option, that
+will be passed to the +./configure+ script before configuring
+and building the package.
+
+On line 12, we declare our dependencies, so that they are built
+before the build process of our package starts.
+
+Finally, on line line 14, we invoke the +rebar-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[rebar-package-reference]]
+
+==== +rebar-package+ reference
+
+The main macro of the rebar package infrastructure is
++rebar-package+. It is similar to the +generic-package+ macro. The
+ability to have target and host packages is also available, with the
++host-rebar-package+ macro.
+
+Just like the generic infrastructure, the rebar infrastructure works
+by defining a number of variables before calling the +rebar-package+
+macro.
+
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the rebar infrastructure:
++ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
++ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
++ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
++ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+.
+
+Note that the rebar infrastructure does not expect a configure script,
+but does call such a script when it exists.  When a package uses both
+the Autotools and rebar, it should use the rebar infrastructure.  In
+this case however, the build commands do not call make, but only
++rebar compile+; this avoids triggering the download of dependencies
+(as most Makefile's do when combined with rebar).  Also, note that the
+install commands never call +make install+.  Instead, they install
+Erlang's application directories (ebin, priv, etc.)  into a proper
+location.  If this is not what you want, add custom hooks or override
+rebar commands (see below).
+
+A few additional variables, specific to the rebar infrastructure,
+can also be defined. Many of them are only useful in very specific
+cases, typical packages will therefore only use a few of them.
+
+* +ERLANG_FOOBAR_CONF_ENV+, to specify additional environment
+  variables to pass to the configure script. By default, empty.
+
+* +ERLANG_FOOBAR_CONF_OPTS+, to specify additional configure options
+  to pass to the configure script. By default, empty.
+
+* +ERLANG_FOOBAR_AUTORECONF+, tells whether the package should be
+  autoreconfigured or not (i.e. if the configure script and
+  Makefile.in files should be re-generated by re-running autoconf,
+  automake, libtool, etc.). Valid values are +YES+ and +NO+. By
+  default, the value is +NO+
+
+* +ERLANG_FOOBAR_AUTORECONF_ENV+, to specify additional environment
+  variables to pass to the 'autoreconf' program if
+  +ERLANG_FOOBAR_AUTORECONF=YES+. These are passed in the environment
+  of the 'autoreconf' command. By default, empty.
+
+* +ERLANG_FOOBAR_AUTORECONF_OPTS+ to specify additional options passed
+  to the 'autoreconf' program if +ERLANG_FOOBAR_AUTORECONF=YES+. By
+  default, empty.
+
+* +ERLANG_FOOBAR_REBAR_ENV+, to specify additional environment
+  variables to pass to rebar.  By default, the value sets a minimal
+  PATH that only includes +HOST_DIR/bin+, +HOST_DIR/usr/bin+, and
+  +/bin+.
+
+* +ERLANG_FOOBAR_REBAR_FLAGS+, to specify rebar flags. By default, the
+  value is +deps_dir=ERLANG_FOOBAR_REBAR_DEPS_DIR+.
+
+* +ERLANG_FOOBAR_REBAR_DEPS_DIR+, to specify where to look for the
+  package's dependencies.  By default, the value is
+  +output/build/erlang-rebar-deps/target+, or
+  +output/build/erlang-rebar-deps/host+ for host packages.  Note that
+  if the package installs to staging as well, the rebar infrastructure
+  then creates a symbolic link in this directory to
+  +ERLANG_FOOBAR_ERLANG_LIBDIR+ so other packages may use it as
+  a dependency.
+
+* +ERLANG_FOOBAR_ERLANG_LIBDIR+, to specify where to install the
+  Erlang application.  By default, the value is
+  +/usr/lib/erlang/lib/ERLANG_FOOBAR_ERLANG_APP-ERLANG_FOOBAR_VERSION+.
+
+* +ERLANG_FOOBAR_ERLANG_APP+, to specify the name of the Erlang
+  application to be installed.  This modifies where the application is
+  installed (e.g., +/usr/lib/erlang/lib/ERLANG_FOOBAR_ERLANG_APP-ERLANG_FOOBAR_VERSION+)
+  and the name of the symbolic link in +ERLANG_FOOBAR_REBAR_DEPS_DIR+,
+  if any (e.g., +output/build/erlang-rebar-deps/target/ERLANG_FOOBAR_ERLANG_APP+.
+  By default, the value is the lowercase package name stripped from
+  any +erlang-+ prefix, and with dashes converted to underscores.
+
+* +ERLANG_FOOBAR_ENV+, to specify additional environment variables to
+  pass both to the configure script and rebar.  By default, sets CC,
+  CFLAGS, LDFLAGS, ERL_COMPILER_OPTIONS, and ERL_EI_LIBDIR.
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
+  own +ERLANG_FOOBAR_CONFIGURE_CMDS+ variable, it will be used
+  instead of the default rebar one. However, using this method
+  should be restricted to very specific cases. Do not use it in the
+  general case.
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
1.9.1
