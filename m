From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Aug 2014 15:48:09 -0300
Subject: [Buildroot] [PATCH 2/4] package/ncurses: fixup wide support for
	static targets
In-Reply-To: <1408474091-25947-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408474091-25947-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1408474091-25947-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated on the list we need to copy static libraries when doing static
targets so add the logic for that.

Also exclude the wide option for blackfin flat since there seem to be
toolchain issues with that combination - since it's a new feature option
someone interested might look into it later.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncurses/Config.in  | 2 ++
 package/ncurses/ncurses.mk | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index b90ec9e..3cc0a37 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -13,6 +13,8 @@ if BR2_PACKAGE_NCURSES
 config BR2_PACKAGE_NCURSES_WCHAR
 	bool "enable wide char support"
 	depends on BR2_USE_WCHAR
+	# Build broken @ curses.priv.h with bad declarations
+	depends on !(BR2_bfin && BR2_BINFMT_FLAT)
 	help
 	  Enable wide char & UTF-8 support in ncurses libraries
 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index bd2aac0..5eb8b98 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -40,12 +40,21 @@ ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPT += --enable-widec
 NCURSES_LIB_SUFFIX = w
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define NCURSES_LINK_LIBS
+	for lib in $(NCURSES_LIBS-y); do \
+		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
+			$(1)/usr/lib/$${lib}.a; \
+	done
+endef
+else
 define NCURSES_LINK_LIBS
 	for lib in $(NCURSES_LIBS-y); do \
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
 			$(1)/usr/lib/$${lib}.so; \
 	done
 endef
+endif
 
 NCURSES_LINK_TARGET_LIBS =  $(call NCURSES_LINK_LIBS, $(TARGET_DIR))
 NCURSES_LINK_STAGING_LIBS =  $(call NCURSES_LINK_LIBS, $(STAGING_DIR))
-- 
1.8.5.5
