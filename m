From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 May 2021 11:10:00 +0200
Subject: [Buildroot] [git commit] package/pkg-meson: handle b_pie
Message-ID: <20210529084114.32FFD8772F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8a147f6046f9d11d4685ddfa5c2a6a01f4d7219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pipewire unconditionally enables b_pie since version 0.3.20 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/abe73c9146cd223b40b22581b1fd58bc044c671e
which will raise the following build failure on m68k since commit
a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:

/srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/9.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
(.text+0x4): undefined reference to `__shared_flat_add_library'

Fixes:
 - http://autobuild.buildroot.org/results/c258a2736661af8ea73abeda2503d8682e65f1e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index a57820d4d2..a55063d58e 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -91,6 +91,7 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		-Db_pie=$(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),true,false) \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		$$($$(PKG)_CONF_OPTS) \
