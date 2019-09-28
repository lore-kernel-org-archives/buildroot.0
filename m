From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Sep 2019 22:04:30 +0200
Subject: [Buildroot] [PATCH 1/2] core/pkg-meson: allow packages to add extra
 [binaries]
In-Reply-To: <cover.1569701061.git.yann.morin.1998@free.fr>
References: <cover.1569701061.git.yann.morin.1998@free.fr>
Message-ID: <be7aee4db475150e52b2c7a36979c89537d79a86.1569701061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

meson does not allow passing path to helper programs (e.g. pkgconfig)
using variables in the environment. Instead, it insists that those paths
be defined in the cross-compilation.conf file, in the [binaries]
section [0]

As such, allow packages to declare such a list of arbitrary entries to
add in the [binaries] section.

[0] https://github.com/mesonbuild/meson/issues/3327 for the LLVM_CONFIG
    example, which we'll address in a follow=up patch.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 docs/manual/adding-packages-meson.txt | 7 +++++++
 package/pkg-meson.mk                  | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 8e2d448788..e84bf7f60a 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -109,6 +109,13 @@ will therefore only use a few of them.
   +cross-compile.conf+ file +c_link_args+ and +cpp_link_args+ properties. By
   default, the value of +TARGET_LDFLAGS+.
 
+* +FOO_MESON_EXTRA_BINARIES+, to specify a space-separated list of programs
+  to add to the `[binaries]` section of the meson `cross-compilation.conf`
+  configuration file. The format is `program-name='/path/to/program'`, with
+  no space around the +=+ sign, and with the path of the program between
+  single quotes. By default, empty. Note that Buildroot already sets the
+  correct values for +c+, +cpp+, +ar+, +strip+, and +pkgconfig+.
+
 * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
   +ninja+, meson companion tool in charge of the build operations. By default,
   empty.
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0b811d1cc0..f5c7b8ced3 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -79,6 +79,9 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
 	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
+	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
+	        -e "/\(\[binaries\]\)/s:$$$$:\n$$(x):" \
+	    ) \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
-- 
2.20.1
