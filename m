From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 12:48:35 +0200
Subject: [Buildroot] [git commit] zsh: security bump to version 5.0.7
Message-ID: <20141012105052.BC454B23B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3bf16f884b8c5518a47dd95922bb4fc0bfc9d4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes shellshock-alike exploits.

Install binary to /bin as all shells should be and add hash file.

[Peter: drop /bin/sh handling as we're going to handle it globally]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/Config.in |    2 +-
 package/zsh/zsh.hash  |    2 ++
 package/zsh/zsh.mk    |   13 ++++++++++---
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/zsh/Config.in b/package/zsh/Config.in
index 6853249..261df42 100644
--- a/package/zsh/Config.in
+++ b/package/zsh/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_ZSH
 	  ksh, and tcsh were incorporated into zsh; many original features
 	  were added.
 
-	  http://zsh.sourceforge.net/
+	  http://www.zsh.org/
diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
new file mode 100644
index 0000000..358033f
--- /dev/null
+++ b/package/zsh/zsh.hash
@@ -0,0 +1,2 @@
+# From http://www.zsh.org/pub/MD5SUM
+md5	76726ff50309e628de670476e0508b3a	zsh-5.0.7.tar.gz
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index f4daeeb..ffc567d 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,10 +4,17 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.0.6
-ZSH_SITE = http://downloads.sourceforge.net/project/zsh/zsh/$(ZSH_VERSION)
+ZSH_VERSION = 5.0.7
+ZSH_SITE = http://www.zsh.org/pub
+ZSH_DEPENDENCIES = ncurses
+ZSH_CONF_OPTS = --bindir=/bin
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
-ZSH_DEPENDENCIES = ncurses
+
+# Remove versioned zsh-x.y.z binary taking up space
+define ZSH_TARGET_INSTALL_FIXUPS
+	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
+endef
+ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_TARGET_INSTALL_FIXUPS
 
 $(eval $(autotools-package))
