From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 16:56:43 +0100
Subject: [Buildroot] [git commit] package/pkg-meson.mk: explicitly specify
 pkg-config settings
Message-ID: <20200205155417.CB1FF83A52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e0bc29993376613d200e892d491e31ea5a49622
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

meson is able to distinguish between host (= native) and target (=
cross) compilation. It will explicitly pass different options to
pkg-config to distinguish them. Therefore, we don't need to use the
pkg-config wrapper when using meson, and can instead pass the pkg-config
settings through the cross-compilation.conf.

This is important because in some situations (e.g. for the Python
configuration), meson sets the PKG_CONFIG_LIBDIR variable to a different
value before calling pkg-config. Relying on our wrapper script doesn't
work in that case (except if the script would unconditionally set
PKG_CONFIG_LIBDIR, which it doesn't do at the moment).

Add the sys_root and pkg_config_lib settings to cross-compilation.conf
and use pkgconf directly instead of the wrapper.

Note that this requires us to substitute STAGING_DIR as well, with an
absolute path. This is not a big deal since cross-compilation.conf is
regenerated for every package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/meson/cross-compilation.conf.in | 4 +++-
 package/pkg-meson.mk                    | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index fc8e27f7eb..369e225b3e 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -8,7 +8,7 @@ c = '@TARGET_CROSS at gcc'
 cpp = '@TARGET_CROSS at g++'
 ar = '@TARGET_CROSS at ar'
 strip = '@TARGET_CROSS at strip'
-pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
+pkgconfig = '@HOST_DIR@/bin/pkgconf'
 
 [properties]
 needs_exe_wrapper = true
@@ -16,6 +16,8 @@ c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+sys_root = '@STAGING_DIR@'
+pkg_config_libdir = '@STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig'
 
 [host_machine]
 system = 'linux'
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 1f3aaadf5d..642b715938 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -75,6 +75,7 @@ define $(2)_CONFIGURE_CMDS
 	    -e 's%@TARGET_LDFLAGS@%$$(call make-comma-list,$$($(2)_LDFLAGS))%g' \
 	    -e 's%@TARGET_CXXFLAGS@%$$(call make-comma-list,$$($(2)_CXXFLAGS))%g' \
 	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
+	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
 	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
 	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
 	    ) \
@@ -192,6 +193,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    -e 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
 	    -e 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g' \
 	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
+	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
 	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
