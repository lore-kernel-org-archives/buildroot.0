From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Apr 2019 22:53:01 +0200
Subject: [Buildroot] [PATCH v6 1/2] meson: add per package optional
 compiler/linker flags
Message-ID: <20190423205302.14382-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add LIBFOO_MESON_CFLAGS, LIBFOO_MESON_LDFLAGS and LIBFOO_MESON_CXXFLAGS
variables to allow per package additional compiler/linker flags.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v5 -> v6:
  - add documentation for the new meson flags variables

Changes v4 -> v5:
  - no changes

Changes v4:
  - new patch (base on the original '[RFC v3 2/4] meson: change from
    global to per package  cross-compilation.conf', see [1])

[1] http://lists.busybox.net/pipermail/buildroot/2018-July/226313.html
---
 docs/manual/adding-packages-meson.txt   | 12 ++++++++++++
 package/meson/cross-compilation.conf.in |  8 ++++----
 package/meson/meson.mk                  |  3 +++
 package/pkg-meson.mk                    |  7 +++++++
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 30c338f486..dbc22d3a7f 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -97,6 +97,18 @@ will therefore only use a few of them.
 * +FOO_CONF_OPTS+, to specify additional options to pass to +meson+ for the
   configuration step. By default, empty.

+* +FOO_MESON_CFLAGS+, to specify additional compiler arguments added to
+  the package specific +cross-compile.conf+ file +c_args+ property.  By
+  default, empty.
+
+* +FOO_MESON_CXXFLAGS+, to specify additional compiler arguments added to
+  the package specific +cross-compile.conf+ file +cpp_args+ property. By
+  default, empty.
+
+* +FOO_MESON_LDFLAGS+, to specify additional compiler arguments added to
+  the package specific +cross-compile.conf+ file +c_link_args+ and
+  +cpp_link_args+ properties.  By default, empty.
+
 * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
   +ninja+, meson companion tool in charge of the build operations. By default,
   empty.
diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index fc8e27f7eb..4056c2b2f4 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -12,10 +12,10 @@ pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'

 [properties]
 needs_exe_wrapper = true
-c_args = [@TARGET_CFLAGS@]
-c_link_args = [@TARGET_LDFLAGS@]
-cpp_args = [@TARGET_CXXFLAGS@]
-cpp_link_args = [@TARGET_LDFLAGS@]
+c_args = [@TARGET_CFLAGS@@PKG_TARGET_CFLAGS@]
+c_link_args = [@TARGET_LDFLAGS@@PKG_TARGET_LDFLAGS@]
+cpp_args = [@TARGET_CXXFLAGS@@PKG_TARGET_CXXFLAGS@]
+cpp_link_args = [@TARGET_LDFLAGS@@PKG_TARGET_LDFLAGS@]

 [host_machine]
 system = 'linux'
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 49e27f5527..70128f6bad 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -60,6 +60,9 @@ define HOST_MESON_INSTALL_CROSS_CONF
 	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
 	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
 	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
+	    -e "s%@PKG_TARGET_CFLAGS@%%g" \
+	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
+	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \
 	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 886fcf7205..9974b1e513 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -57,6 +57,10 @@ $(2)_NINJA_ENV		?=
 ifndef $(2)_CONFIGURE_CMDS
 ifeq ($(4),target)

+$(2)_MESON_SED_CFLAGS = $(if $($(2)_MESON_CFLAGS),`printf '"%s"$(comma) ' $($(2)_MESON_CFLAGS)`)
+$(2)_MESON_SED_LDFLAGS = $(if $($(2)_MESON_LDFLAGS),`printf '"%s"$(comma) ' $($(2)_MESON_LDFLAGS)`)
+$(2)_MESON_SED_CXXFLAGS = $(if $($(2)_MESON_CXXFLAGS),`printf '"%s"$(comma) ' $$($$(2)_MESON_CXXFLAGS)`)
+
 # Configure package for target
 #
 #
@@ -70,6 +74,9 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
 	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
 	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
+	    -e "s%@PKG_TARGET_CFLAGS@%$$($$(PKG)_MESON_SED_CFLAGS)%g" \
+	    -e "s%@PKG_TARGET_LDFLAGS@%$$($$(PKG)_MESON_SED_LDFLAGS)%g" \
+	    -e "s%@PKG_TARGET_CXXFLAGS@%$$($$(PKG)_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
--
2.21.0
