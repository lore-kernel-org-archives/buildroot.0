From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  5 Apr 2015 17:33:45 +0300
Subject: [Buildroot] [PATCH] ncurses: symlink include directory in WCHAR
	build
Message-ID: <276f85257fbbca568c2056c3f4c7575f2501ccbe.1428244425.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages, like procps-ng, expect the wchar version of ncurses headers
under the ncursesw directory. Add a symlink to the real location of the
headers to satisfy this requirement.

Fixes:
http://autobuild.buildroot.net/results/3b3/3b38e0f3163f0a45b487d30530ecef024555bfa8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ncurses/ncurses.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 8368c690b606..f66ed2c8c44c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -94,6 +94,10 @@ NCURSES_LINK_STAGING_LIBS = \
 
 NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC,$(STAGING_DIR))
 
+define NCURSES_WIDE_HEADERS_DIR
+	ln -sf . $(STAGING_DIR)/usr/include/ncursesw
+endef
+
 NCURSES_CONF_OPTS += --enable-ext-colors
 NCURSES_ABI_VERSION = 6
 define NCURSES_INSTALL_TARGET_256_COLORS_TERMINFO
@@ -103,6 +107,7 @@ endef
 
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_WIDE_HEADERS_DIR
 
 else # BR2_PACKAGE_NCURSES_WCHAR
 NCURSES_ABI_VERSION = 5
-- 
2.1.4
