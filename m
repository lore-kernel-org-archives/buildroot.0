From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Oct 2014 10:19:46 -0300
Subject: [Buildroot] [PATCH 2/5] zsh: security bump to version 5.0.7
In-Reply-To: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412774389-11297-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes shellshock-alike exploits.
Add /bin/sh -> zsh symlink, install binary to /bin as all shells should
be, add hash file and build after busybox.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zsh/Config.in |  2 +-
 package/zsh/zsh.hash  |  2 ++
 package/zsh/zsh.mk    | 17 ++++++++++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 package/zsh/zsh.hash

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
index f4daeeb..87c24af 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,10 +4,21 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.0.6
-ZSH_SITE = http://downloads.sourceforge.net/project/zsh/zsh/$(ZSH_VERSION)
+ZSH_VERSION = 5.0.7
+ZSH_SITE = http://www.zsh.org/pub
+# Build after since zsh is better than busybox shells
+ZSH_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) \
+	ncurses
+ZSH_CONF_OPTS = --bindir=/bin
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
-ZSH_DEPENDENCIES = ncurses
+
+# Make /bin/sh -> zsh (no other shell, better than busybox shells)
+# Remove versioned zsh-x.y.z binary taking up space
+define ZSH_TARGET_INSTALL_FIXUPS
+	ln -sf zsh $(TARGET_DIR)/bin/sh
+	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
+endef
+ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_TARGET_INSTALL_FIXUPS
 
 $(eval $(autotools-package))
-- 
2.0.4
