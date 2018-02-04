From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 12:09:09 +0100
Subject: [Buildroot] [git commit] dash: enable line editting if libedit is
 selected
Message-ID: <20180204111049.4FF0884742@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=651af57cf011e6d8764d11932ce87fc064cd9a9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise, explicitly disable it, so that the configure script does not
misdetect a system-installed libedit for example.

Also, add a profile snippet enabling line editing, Emacs style.

[Peter: move DASH_INSTALL_PROFILE inside conditional,
	ensure /etc/profile.d exists]
Change-Id: I68c6dbbafa95e266860329cb9c7ff5519fda5bf8
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index c8b41648b6..87c9cc9f8b 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -9,6 +9,20 @@ DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+DASH_DEPENDENCIES += libedit
+DASH_CONF_OPTS += --with-libedit
+
+# Enable line editing, Emacs style
+define DASH_INSTALL_PROFILE
+	mkdir -p $(TARGET_DIR)/etc/profile.d
+	echo 'set -E' > $(TARGET_DIR)/etc/profile.d/dash.sh
+endef
+DASH_POST_INSTALL_TARGET_HOOKS += DASH_INSTALL_PROFILE
+else
+DASH_CONF_OPTS += --without-libedit
+endif
+
 define DASH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
