From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Oct 2014 10:19:47 -0300
Subject: [Buildroot] [PATCH 3/5] bash: minor install tweaks
In-Reply-To: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412774389-11297-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the old symlink backup since we don't do uninstalls now.
Make the busybox dependency conditional shorter.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bash/bash.mk | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index acd64f1..6510af5 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -6,7 +6,9 @@
 
 BASH_VERSION = 4.3
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
-BASH_DEPENDENCIES = ncurses readline host-bison
+# Build after since bash is better than busybox shells
+BASH_DEPENDENCIES = ncurses readline host-bison \
+	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
 BASH_CONF_OPTS = --with-installed-readline
 BASH_LICENSE = GPLv3+
 BASH_LICENSE_FILES = COPYING
@@ -28,19 +30,11 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
 endif
 
-# Make sure we build after busybox so that /bin/sh links to bash
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-BASH_DEPENDENCIES += busybox
-endif
-
-# Save the old sh file/link if there is one and symlink bash->sh
+# Make /bin/sh -> bash (no other shell, better than busybox shells)
 define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
 	rm -f $(TARGET_DIR)/bin/bashbug
-	if [ -e $(TARGET_DIR)/bin/sh ]; then \
-		mv -f $(TARGET_DIR)/bin/sh $(TARGET_DIR)/bin/sh.prebash; \
-	fi
 	ln -sf bash $(TARGET_DIR)/bin/sh
 endef
 
-- 
2.0.4
