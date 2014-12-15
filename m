From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:16:11 +0100
Subject: [Buildroot] [git commit] pckage/ncurses: fix pkg-config files for
	ncursesw
Message-ID: <20141215211813.238E180425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb58f40c5323488bb86f01380a8b0400582bda7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, ncurses creates symlinks from the non-'w' variants to the
equivalent 'w' variant, but forgets to do so for pkg-config files.

Do that for the pkg-config files too.

Should fix numerous autobuild failures:
    http://autobuild.buildroot.net/results/3c4/3c44dfc6e3f151bef751f39cac336fef3d6a0099/
    http://autobuild.buildroot.net/results/38c/38c81407bb8d0677e87b3a01f9a1fc1372ab4738/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

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
 
