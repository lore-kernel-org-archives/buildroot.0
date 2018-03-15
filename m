From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 15 Mar 2018 15:50:53 -0400
Subject: [Buildroot] [PATCH v2 3/4] pkgconf: add host-pkg-config wrapper
In-Reply-To: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
References: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180315195054.15991-4-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-pkg-config wrapper gets package data compiled for host.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
Unchanged since v1.

 package/pkgconf/host-pkg-config | 4 ++++
 package/pkgconf/pkgconf.mk      | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 package/pkgconf/host-pkg-config

diff --git a/package/pkgconf/host-pkg-config b/package/pkgconf/host-pkg-config
new file mode 100644
index 0000000000..3362a3f927
--- /dev/null
+++ b/package/pkgconf/host-pkg-config
@@ -0,0 +1,4 @@
+#!/bin/sh
+PKGCONFDIR=$(dirname "$0")
+DEFAULT_PKG_CONFIG_PATH=${PKGCONFDIR}/../lib/pkgconfig:${PKGCONFDIR}/../share/pkgconfig
+PKG_CONFIG_PATH=${PKG_CONFIG_PATH:-${DEFAULT_PKG_CONFIG_PATH}} exec ${PKGCONFDIR}/pkgconf "$@"
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 00b2d017ee..54b4570419 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -16,11 +16,13 @@ define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
 endef
 
-define HOST_PKGCONF_INSTALL_WRAPPER
+define HOST_PKGCONF_INSTALL_WRAPPERS
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/bin/pkg-config
 	$(SED) 's, at STAGING_SUBDIR@,$(STAGING_SUBDIR),g' \
 		$(HOST_DIR)/bin/pkg-config
+	$(INSTALL) -m 0755 -D package/pkgconf/host-pkg-config \
+		$(HOST_DIR)/bin/host-pkg-config
 endef
 
 define HOST_PKGCONF_STATIC
@@ -32,7 +34,7 @@ define HOST_PKGCONF_SHARED
 endef
 
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
-HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
+HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPERS
 
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
-- 
2.16.1
