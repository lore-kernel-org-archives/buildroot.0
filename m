From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Oct 2019 17:10:21 +0200
Subject: [Buildroot] [PATCH] core/pkg-meson: simplify sed-expression to add
 to [binaries]
Message-ID: <20191006151021.9127-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to memorise the matched pattern; it's a left-over from
a previous attempt.

However, ensure the pattern is correctly anchored to the beginning and
end of the line, to avoid accidentally matching it anywhere else (e,g,
in a comment).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f5c7b8ced3..184a22a44a 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -80,7 +80,7 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
 	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
-	        -e "/\(\[binaries\]\)/s:$$$$:\n$$(x):" \
+	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
 	    ) \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
-- 
2.20.1
