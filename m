From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2020 15:24:56 +0100
Subject: [Buildroot] [PATCH 5/5] package/pkg-meson: use TARGET_MAKE_ENV in
 configure
In-Reply-To: <20200204142456.1537358-1-arnout@mind.be>
References: <20200204142456.1537358-1-arnout@mind.be>
Message-ID: <20200204142456.1537358-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure step doesn't use TARGET_MAKE_ENV, but sets PATH
explicitly. Thus, it missed the update of PATH with HOST_BIN_CROSS.

Instead of adding it explicitly again, just use TARGET_MAKE_ENV. Yes,
it's not really a 'make environment' that we're expecting to use in the
configure step, 'conf environment' would make more sense. However,
TARGET_MAKE_ENV is indeed used in the configure step since it's part of
TARGET_CONFIGURE_OPTS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index e7eea2aa58..7bb08157f5 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -84,7 +84,7 @@ define $(2)_CONFIGURE_CMDS
 	    ) \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
-	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
-- 
2.24.1
