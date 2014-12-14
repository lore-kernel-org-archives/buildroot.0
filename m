From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 17:04:40 +0100
Subject: [Buildroot] [PATCH 5/5] pckage/ncurses: fix pkg-config files for
	ncursesw
In-Reply-To: <cover.1418572993.git.yann.morin.1998@free.fr>
References: <cover.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <50b4b144f7de56b1d0a60ec133c6fbf89c265dc3.1418572993.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, ncurses creates symlinks from the non-'w' variants to the
equivalent 'w' variant, but forgets to do so for pkg-config files.

Do that for the pkg-config files too.

Should fix numerous autobuild failures:
    http://autobuild.buildroot.net/results/3c4/3c44dfc6e3f151bef751f39cac336fef3d6a0099/
    http://autobuild.buildroot.net/results/38c/38c81407bb8d0677e87b3a01f9a1fc1372ab4738/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 9b660fd..7febed6 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -70,6 +70,13 @@ define NCURSES_LINK_LIBS_SHARED
 		$(1)/usr/lib/libcurses.so
 endef
 
+define NCURSES_LINK_PC
+	for pc in $(NCURSES_LIBS-y); do \
+		ln -sf $${pc}$(NCURSES_LIB_SUFFIX).pc \
+			$(1)/usr/lib/pkgconfig/$${pc}.pc; \
+	done
+endef
+
 NCURSES_LINK_TARGET_LIBS = \
 	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(TARGET_DIR))) \
 	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(TARGET_DIR)))
@@ -77,7 +84,10 @@ NCURSES_LINK_STAGING_LIBS = \
 	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(STAGING_DIR))) \
 	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(STAGING_DIR)))
 
+NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC,$(STAGING_DIR))
+
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
 
 endif
 
-- 
1.9.1
