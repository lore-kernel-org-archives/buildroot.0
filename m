From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 May 2021 11:16:35 +0200
Subject: [Buildroot] [git commit] Revert "package/pkg-meson: handle b_pie"
Message-ID: <20210529084938.3FA568A437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfceec6b5f17a993470ad4fdeb4c3afb1f513635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a8a147f6046f9d11d4685ddfa5c2a6a01f4d7219.

That commit incorrectly made use of BR2_TOOLCHAIN_SUPPORTS_PIE, when it
should have been using BR2_PIC_PIE.

Besides, another attempt is pending, that unconditionally disables it as
it will be set by the toolchain wrapper already.

For both reasons, revert rather than switch over to BR2_PIC_PIE.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index a55063d58e..a57820d4d2 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -91,7 +91,6 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
-		-Db_pie=$(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),true,false) \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		$$($$(PKG)_CONF_OPTS) \
