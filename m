From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 16:57:12 +0100
Subject: [Buildroot] [git commit] package/pkg-meson: force-disable binary
 stripping
Message-ID: <20201225154534.237E38227D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f39f902b3cd685c3c971941138e0df50947737c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In buildroot, stripping for the target is configured and implemented
with the global `BR2_STRIP_strip` option that drive the stripping in
the target-finalize step.

So, we explicitly disable stripping at build time for the target
variants.

For the host variants, however, we don't much care about symbols and
stuff, but smaller executables will hopefully load faster than bigger
ones (disputable, given that sections in ELF files are paged-in
on-demand), so we explictly enable stripping.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
[yann.morin.1998 at free.fr:
  - add burb about the target-finalize step
  - enable stripping for host variants
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 3a34ba703b..e0b843dc3c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
@@ -105,6 +106,7 @@ define $(2)_CONFIGURE_CMDS
 		--localstatedir=$$(HOST_DIR)/var \
 		--default-library=shared \
 		--buildtype=release \
+		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
