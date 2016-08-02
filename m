From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Aug 2016 22:34:36 +0200
Subject: [Buildroot] [PATCH 2/2] ncurses: use foreach make loops instead of
	shell for loops
In-Reply-To: <1470170076-28901-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470170076-28901-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470170076-28901-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The main benefit of using make foreach loops is that they will abort
if one of the iteration of the loop fails. The current for loops will
continue, and only report a failure if the last iteration was a
failure, but will silently ignore other errors.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 0ae8835..614b6ce 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -74,28 +74,26 @@ NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
 
 define NCURSES_LINK_LIBS_STATIC
-	for lib in $(NCURSES_LIBS-y:%=lib%); do \
-		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
-			$(1)/usr/lib/$${lib}.a; \
-	done
+	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
+		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).a $(1)/usr/lib/$(lib).a
+	)
 	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
 		$(1)/usr/lib/libcurses.a
 endef
 
 define NCURSES_LINK_LIBS_SHARED
-	for lib in $(NCURSES_LIBS-y:%=lib%); do \
-		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
-			$(1)/usr/lib/$${lib}.so; \
-	done
+	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
+		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).so $(1)/usr/lib/$(lib).so
+	)
 	ln -sf libncurses$(NCURSES_LIB_SUFFIX).so \
 		$(1)/usr/lib/libcurses.so
 endef
 
 define NCURSES_LINK_PC
-	for pc in $(NCURSES_LIBS-y); do \
-		ln -sf $${pc}$(NCURSES_LIB_SUFFIX).pc \
-			$(1)/usr/lib/pkgconfig/$${pc}.pc; \
-	done
+	$(foreach pc,$(NCURSES_LIBS-y), \
+		ln -sf $(pc)$(NCURSES_LIB_SUFFIX).pc \
+			$(1)/usr/lib/pkgconfig/$(pc).pc
+	)
 endef
 
 NCURSES_LINK_TARGET_LIBS = \
@@ -135,19 +133,19 @@ endef
 
 ifneq ($(BR2_STATIC_LIBS),y)
 define NCURSES_INSTALL_TARGET_LIBS
-	for lib in $(NCURSES_LIBS-y:%=lib%); do \
-		cp -dpf $(NCURSES_DIR)/lib/$${lib}$(NCURSES_LIB_SUFFIX).so* \
-			$(TARGET_DIR)/usr/lib/; \
-	done
+	$(foreach lib,$(NCURSES_LIBS-y:%=lib%), \
+		cp -dpf $(NCURSES_DIR)/lib/$(lib)$(NCURSES_LIB_SUFFIX).so* \
+			$(TARGET_DIR)/usr/lib/
+	)
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PROGS),y)
 define NCURSES_INSTALL_TARGET_PROGS
-	for x in $(NCURSES_PROGS); do \
-		$(INSTALL) -m 0755 $(NCURSES_DIR)/progs/$$x \
-			$(TARGET_DIR)/usr/bin/$$x; \
-	done
+	$(foreach prog,$(NCURSES_PROGS), \
+		$(INSTALL) -m 0755 $(NCURSES_DIR)/progs/$(prog) \
+			$(TARGET_DIR)/usr/bin/$(prog)
+	)
 	ln -sf tset $(TARGET_DIR)/usr/bin/reset
 endef
 endif
-- 
2.7.4
