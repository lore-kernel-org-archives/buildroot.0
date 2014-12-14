From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 17:04:37 +0100
Subject: [Buildroot] [PATCH 2/5] package/ncurses: fix shared-only libs
In-Reply-To: <cover.1418572993.git.yann.morin.1998@free.fr>
References: <cover.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <4568871b23d156c89631a83942d49e0116e9b4ad.1418572993.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For a shared-only build, do not create the symlinks to the static
libraries, sonce they do not exist.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index f54f379..ec64663 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -47,8 +47,7 @@ ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
 
-ifeq ($(BR2_STATIC_LIBS),y)
-define NCURSES_LINK_LIBS
+define NCURSES_LINK_LIBS_STATIC
 	for lib in $(NCURSES_LIBS-y); do \
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
 			$(1)/usr/lib/$${lib}.a; \
@@ -56,23 +55,22 @@ define NCURSES_LINK_LIBS
 	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
 		$(1)/usr/lib/libcurses.a
 endef
-else
-define NCURSES_LINK_LIBS
+
+define NCURSES_LINK_LIBS_SHARED
 	for lib in $(NCURSES_LIBS-y); do \
-		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
-			$(1)/usr/lib/$${lib}.a; \
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
 			$(1)/usr/lib/$${lib}.so; \
 	done
-	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
-		$(1)/usr/lib/libcurses.a
 	ln -sf libncurses$(NCURSES_LIB_SUFFIX).so \
 		$(1)/usr/lib/libcurses.so
 endef
-endif
 
-NCURSES_LINK_TARGET_LIBS = $(call NCURSES_LINK_LIBS, $(TARGET_DIR))
-NCURSES_LINK_STAGING_LIBS = $(call NCURSES_LINK_LIBS, $(STAGING_DIR))
+NCURSES_LINK_TARGET_LIBS = \
+	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(TARGET_DIR))) \
+	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(TARGET_DIR)))
+NCURSES_LINK_STAGING_LIBS = \
+	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(STAGING_DIR))) \
+	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(STAGING_DIR)))
 
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
 
-- 
1.9.1
