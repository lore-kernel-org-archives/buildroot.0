From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 19:00:11 -0300
Subject: [Buildroot] [PATCH 1/2] ncurses: fix gpm support
Message-ID: <1418680812-24778-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CF_LIB_SONAME macro doesn't work when cross compiling so we need to
specify the lib name for libgpm explicitly. While at it make gpm support
explicit in the form of --without-gpm when it's not selected and adding
it to dependencies when it is. Fixes:
http://autobuild.buildroot.net/results/32a/32a5ba3905772a3f2f2ec9d1b290a109fe22d9f9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncurses/ncurses.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 7febed6..47378f7 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -43,6 +43,14 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 NCURSES_CONF_OPTS += --with-shared --with-normal
 endif
 
+# configure can't find the soname for libgpm when cross compiling
+ifeq ($(BR2_PACKAGE_GPM),y)
+NCURSES_CONF_OPTS += --with-gpm=libgpm.so.2
+NCURSES_DEPENDENCIES += gpm
+else
+NCURSES_CONF_OPTS += --without-gpm
+endif
+
 NCURSES_LIBS-y = ncurses
 NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += menu
 NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += panel
-- 
2.0.4
