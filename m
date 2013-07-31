From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 16:26:41 -0300
Subject: [Buildroot] [PATCH 2/2] dropwatch: link with libintl if present
In-Reply-To: <1375298801-18548-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375298801-18548-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1375298801-18548-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils libbfd links to libintl if present, so dropwatch needs it too.
Ugly hardcoded LDFLAGS, but then that's what the dropwatch Makefile
does. Fixes:
http://autobuild.buildroot.net/results/549/54917e7943143e47263b60b4eee3dfc6f0801407/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropwatch/dropwatch.mk | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 6c3dc75..09dff6b 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -11,20 +11,28 @@ DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
 DROPWATCH_LICENSE = GPLv2
 DROPWATCH_LICENSE_FILES = COPYING
 
+# libbfd may be linked to libintl
+# Ugly... but LDFLAGS are hardcoded anyway
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+DROPWATCH_LDFLAGS = LDFLAGS="-lintl -lbfd -lreadline -lnl-3 -lnl-genl-3"
+endif
+
 define DROPWATCH_BUILD_CMDS
-  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(DROPWATCH_LDFLAGS) build
 endef
 
 define DROPWATCH_CLEAN_CMDS
-  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
 endef
 
 define DROPWATCH_INSTALL_TARGET_CMDS
-  $(INSTALL) -D -m 0755 $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin/dropwatch
+	$(INSTALL) -D -m 0755 $(@D)/src/dropwatch \
+		$(TARGET_DIR)/usr/bin/dropwatch
 endef
 
 define DROPWATCH_UNINSTALL_CMDS
-  rm -f $(TARGET_DIR)/usr/bin/dropwatch
+	rm -f $(TARGET_DIR)/usr/bin/dropwatch
 endef
 
 $(eval $(generic-package))
-- 
1.8.1.5
