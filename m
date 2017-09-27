From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 27 Sep 2017 13:41:54 -0300
Subject: [Buildroot] [PATCH 2/2] dash: enable line editting if libedit is
	selected.
In-Reply-To: <1506530514-27185-1-git-send-email-casantos@datacom.ind.br>
References: <1506530514-27185-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1506530514-27185-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, add a profile snippet enabling line editing, Emacs style.

Change-Id: I68c6dbbafa95e266860329cb9c7ff5519fda5bf8
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/dash/dash.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 72ef722..5c26994 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -10,6 +10,17 @@ DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
+# Enable line editing, Emacs style
+define DASH_INSTALL_PROFILE
+	echo 'set -E' > $(TARGET_DIR)/etc/profile.d/dash.sh
+endef
+
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+DASH_DEPENDENCIES += libedit
+DASH_CONF_OPTS += --with-libedit
+DASH_POST_INSTALL_TARGET_HOOKS += DASH_INSTALL_PROFILE
+endif
+
 define DASH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
-- 
2.7.5
