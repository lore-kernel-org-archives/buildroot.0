From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 23 Sep 2014 18:21:09 +0200
Subject: [Buildroot] [PATCH 1/3] host-pkgconf: install pkg-config-native
In-Reply-To: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1411489271-26899-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package host-pkgconf now provides `pkg-config-native`, which uses the
host native sysroot. It is useful for packages which compile build-time
helper tools (such as Gtk+ 3.0).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/pkgconf/pkg-config-native.in | 3 +++
 package/pkgconf/pkgconf.mk           | 8 ++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 package/pkgconf/pkg-config-native.in

diff --git a/package/pkgconf/pkg-config-native.in b/package/pkgconf/pkg-config-native.in
new file mode 100644
index 0000000..7e25cd2
--- /dev/null
+++ b/package/pkgconf/pkg-config-native.in
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+PKG_CONFIG_LIBDIR=@HOST_DIR@/usr/lib/pkgconfig:@HOST_DIR@/usr/share/pkgconfig @HOST_DIR@/usr/bin/pkgconf $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index c961536..b6e7c12 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -24,6 +24,13 @@ define HOST_PKGCONF_INSTALL_WRAPPER
 		$(HOST_DIR)/usr/bin/pkg-config
 endef
 
+define HOST_PKGCONF_INSTALL_NATIVE
+	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config-native.in \
+		$(HOST_DIR)/usr/bin/pkg-config-native
+	$(SED) 's, at HOST_DIR@,$(HOST_DIR),g' \
+		$(HOST_DIR)/usr/bin/pkg-config-native
+endef
+
 define HOST_PKGCONF_STATIC
 	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/usr/bin/pkg-config
 endef
@@ -34,6 +41,7 @@ endef
 
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
+HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_NATIVE
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
-- 
1.9.1
