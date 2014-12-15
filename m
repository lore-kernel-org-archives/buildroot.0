From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 23:32:20 +0100
Subject: [Buildroot] [git commit] ncurses: fix gpm support
Message-ID: <20141215223922.2DDED8043B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ab0c37e41e8cd36b90b97bce1bafe668c0c0a20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CF_LIB_SONAME macro doesn't work when cross compiling so we need to
specify the lib name for libgpm explicitly. While at it make gpm support
explicit in the form of --without-gpm when it's not selected and adding
it to dependencies when it is. Fixes:
http://autobuild.buildroot.net/results/32a/32a5ba3905772a3f2f2ec9d1b290a109fe22d9f9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
