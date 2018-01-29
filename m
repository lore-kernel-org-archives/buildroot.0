From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:24:14 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/matchbox-lib:
 correctly fix the .pc file
Message-ID: <20180129213708.84F4488015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=441e222d2411a34dea46fc765ad344cd6c21997f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 84a2645e5b2600d28d91005937c17bec554dd4d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-fakekey/matchbox-fakekey.mk | 4 ++--
 package/matchbox-lib/matchbox-lib.mk         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index ea8e6dcd61..d694e61c12 100644
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
index 8c909e676c..ea6abf1151 100644
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
 
