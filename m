From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 22:37:34 +0100
Subject: [Buildroot] [git commit] package/pkg-meson.mk: add
 FOO_MESON_EXTRA_PROPERTIES
Message-ID: <20200322212431.5EAB48621E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c89d006ca1ce20f0d043165627415a78ef8f66b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With autoconf packages, we often specify ac_cv_func_... cached values to
avoid runtime checks during configure.  With meson the equivalent is
setting properties in cross-compilation.conf which we cannot do in
Buildroot at the moment.

For example, libglib2 used to set ac_cv_func_printf_unix98 and
ac_cv_func_vsnprintf_c99 so that the system printf could be used, but
with the conversion to meson these checks fail and the gnulib fallback
is used.

Add infrastructure in the same way as FOO_MESON_EXTRA_BINARIES to allow
per-package modification to the cross-compilation properties.

Signed-off-by: John Keeping <john@metanate.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998 at free.fr: do a single substitution as in a1e3c7b693]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-meson.txt | 9 +++++++++
 package/pkg-meson.mk                  | 1 +
 2 files changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index e84bf7f60a..029c8c2488 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -116,6 +116,15 @@ will therefore only use a few of them.
   single quotes. By default, empty. Note that Buildroot already sets the
   correct values for +c+, +cpp+, +ar+, +strip+, and +pkgconfig+.
 
+* +FOO_MESON_EXTRA_PROPERTIES+, to specify a space-separated list of
+  properties to add to the `[properties]` section of the meson
+  `cross-compilation.conf` configuration file. The format is
+  `property-name=<value>` with no space around the +=+ sign, and with
+  single quotes around string values. By default, empty. Note that
+  Buildroot already sets values for +needs_exe_wrapper+, +c_args+,
+  +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
+  +pkg_config_libdir+.
+
 * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
   +ninja+, meson companion tool in charge of the build operations. By default,
   empty.
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 835098b85c..b234d0672f 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -77,6 +77,7 @@ define $(2)_CONFIGURE_CMDS
 	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
 	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
 	    -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
+	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
