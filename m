From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Dec 2017 17:15:40 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/matchbox-lib: correctly fix the
 .pc file
In-Reply-To: <cover.1514045682.git.yann.morin.1998@free.fr>
References: <cover.1514045682.git.yann.morin.1998@free.fr>
Message-ID: <92f0878e530274e8e883f96c4eee06f4dce7241e.1514045682.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, the .pc file was so far fixed as a post-configure hook of the
matchbox-fakekey package, by directly tweaking the .pc file installed in
staging by matchbox-lib. That's uterly wrong and bad.

So, we move the fix to matchbox-lib.

Second, it was incorreclty tweaking the .pc file when xlib_libXft was
not enabled, because only then a path to staging was present.

Third, even when xlib_libXft was enabled, the tweaking was still wrong,
because unnecessary.

Fix all that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - fix existing hook, rather than adding a new one
---
 package/matchbox-fakekey/matchbox-fakekey.mk | 4 ++--
 package/matchbox-lib/matchbox-lib.mk         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index 996206e266..e607c48c15 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox-fakekey/matchbox-fakekey.mk
@@ -14,8 +14,8 @@ MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPTS = --enable-expat
 
 define MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
-	$(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
-	$(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' $(MATCHBOX_FAKEKEY_DIR)/Makefile
+	$(SED) 's:^SUBDIRS = fakekey src tests.*:SUBDIRS = fakekey src:g' \
+		$(@D)/Makefile
 endef
 
 MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 18204d2d0b..5541867699 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -15,7 +15,8 @@ MATCHBOX_LIB_CONF_OPTS = --disable-doxygen-docs
 MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
-	$(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' \
+	$(SED) 's:-I$(STAGING_DIR)/:-I/:g' \
+		-e 's:-I/usr/include\( \|$$\)::g' \
 		$(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
 endef
 
-- 
2.11.0
