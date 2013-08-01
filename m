From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 17:19:05 +0200
Subject: [Buildroot] [git commit] dropwatch: link with libintl if present
Message-ID: <20130801151900.64E0A9AF9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e45583106bb7dcbf7b28624432899bee69f71cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

binutils libbfd links to libintl if present, so dropwatch needs it too.
Ugly hardcoded LDFLAGS, but then that's what the dropwatch Makefile
does. Fixes:
http://autobuild.buildroot.net/results/549/54917e7943143e47263b60b4eee3dfc6f0801407/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropwatch/dropwatch.mk |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

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
