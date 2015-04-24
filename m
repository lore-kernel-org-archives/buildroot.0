From: Pascal Mazon <pascal.mazon@6wind.com>
Date: Fri, 24 Apr 2015 14:54:26 +0200
Subject: [Buildroot] [PATCH 1/1] ncurses: generate libtermcap
Message-ID: <1429880066-7743-1-git-send-email-pascal.mazon@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no libtermcap package in buildroot, but ncurses implements termcap
natively. Furthermore, ncurses already provides the termcap.h header file.

With this patch, we fix an issue encountered with some external toolchains
that include a libtermcap.a (typically the GNU libtermcap version) in their
sysroot folder.
Bash, for instance, would be linking with this libtermcap while using
headers from ncurses.

In order to be consistent, let's make sure there is only the ncurses'
termcap library. To that effect, we:
- remove any libtermcap.* in the staging dir,
- install a link to libncurses static and/or shared in staging and target
  dirs.

Signed-off-by: Pascal Mazon <pascal.mazon@6wind.com>
---
 package/ncurses/ncurses.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 8368c690b606..f4b03ed5db15 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -112,6 +112,20 @@ ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPTS += --without-debug
 endif
 
+define NCURSES_LINK_LIBTERMCAP
+	ln -sf libncurses$(NCURSES_LIB_SUFFIX).$(2) $(1)/usr/lib/libtermcap.$(2)
+endef
+
+NCURSES_LINK_STAGING_TERMCAP = \
+	rm -f $(STAGING_DIR)/usr/lib/libtermcap.*; \
+	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBTERMCAP,$(STAGING_DIR),a);) \
+	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBTERMCAP,$(STAGING_DIR),so))
+NCURSES_LINK_TARGET_TERMCAP = \
+	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBTERMCAP,$(TARGET_DIR),a);) \
+	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBTERMCAP,$(TARGET_DIR),so))
+
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_TERMCAP
+
 # ncurses breaks with parallel build, but takes quite a while to
 # build single threaded. Work around it similar to how Gentoo does
 define NCURSES_BUILD_CMDS
@@ -143,6 +157,7 @@ define NCURSES_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
 	$(NCURSES_INSTALL_TARGET_LIBS)
 	$(NCURSES_LINK_TARGET_LIBS)
+	$(NCURSES_LINK_TARGET_TERMCAP)
 	$(NCURSES_INSTALL_TARGET_PROGS)
 	ln -snf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
-- 
2.3.0.rc0
