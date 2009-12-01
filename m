From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Dec 2009 12:21:55 +0100
Subject: [Buildroot] [git commit master] package/autoconf: hardcode m4 config
Message-ID: <20091201120542.1BC6A777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9d998ad1d79ffb6f878a55c8f2ed60fe7e973f34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hardcode m4 config instead of letting configure detect it automatically.
This hopefully fixes the build issues some (Ubuntu) users seems to be
having lately (E.G. #679).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    4 ++--
 package/autoconf/autoconf.mk |    5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1452823..6e5eef3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,8 @@
 
 	Additional fixes and cleanups.
 
-	Updated/fixed packages: alsamixergui, coreutils, fltk, microperl,
-	ncurses, vim
+	Updated/fixed packages: alsamixergui, autoconf, coreutils, fltk,
+	microperl, ncurses, vim
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index d3ef136..32f10e3 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -11,7 +11,8 @@ ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
 AUTOCONF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 endif
 
-AUTOCONF_CONF_ENV = EMACS="no"
+AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+		    ac_cv_prog_gnu_m4_gnu=no
 
 AUTOCONF_DEPENDENCIES = microperl
 
@@ -39,6 +40,8 @@ $(STAMP_DIR)/host_autoconf_configured: $(STAMP_DIR)/host_autoconf_unpacked $(STA
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
+		ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+		ac_cv_prog_gnu_m4_gnu=no \
 		./configure $(QUIET) \
 		--prefix="$(HOST_DIR)/usr" \
 		--sysconfdir="$(HOST_DIR)/etc" \
-- 
1.6.3.3
