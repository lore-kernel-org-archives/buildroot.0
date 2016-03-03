From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Mar 2016 23:46:10 +0200
Subject: [Buildroot] [PATCH] zsh: don't use host pcre-config
Message-ID: <0f3d133b0082f11b75b9fad170d1b81211352dd6.1457041570.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5e05faec7b4 (zsh: use the correct target pcre-config) set
ac_cv_prog_PCRECONF to the location of staging pcre-config. Unfortunately zsh
configure script does not actually use this variable when running pcre-config.
Complete the fix with a patch that makes use of ac_cv_prog_PCRECONF.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-configure-use-user-set-pcre-config.patch  | 33 ++++++++++++++++++++++
 package/zsh/zsh.mk                                 |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 package/zsh/0001-configure-use-user-set-pcre-config.patch

diff --git a/package/zsh/0001-configure-use-user-set-pcre-config.patch b/package/zsh/0001-configure-use-user-set-pcre-config.patch
new file mode 100644
index 000000000000..d4cf59bdddca
--- /dev/null
+++ b/package/zsh/0001-configure-use-user-set-pcre-config.patch
@@ -0,0 +1,33 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 3 Mar 2016 23:14:39 +0200
+Subject: [PATCH] configure: use user set pcre-config
+
+Setting a non default configuration script location is common practice when
+cross compiling, since the target library might need different flags. zsh
+configure scripts allows the user to set pcre-config location but doesn't
+actually use it. Fix this.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: sent upstream
+(http://www.zsh.org/mla/workers/2016/msg00619.html)
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c3bd713c126a..9947b16066b6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -925,7 +925,7 @@ fi
+ if test x$enable_pcre = xyes; then
+ dnl pcre-config should probably be employed here
+ dnl AC_SEARCH_LIBS(pcre_compile, pcre)
+-  LIBS="`pcre-config --libs` $LIBS"
++  LIBS="`$ac_cv_prog_PCRECONF --libs` $LIBS"
+ fi
+ 
+ dnl ---------------------
+-- 
+2.7.0
+
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 84dbbde56f92..aa4029f1a296 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -9,6 +9,8 @@ ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
+# Patching configure.ac
+ZSH_AUTORECONF = YES
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 
-- 
2.7.0
