From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Tue,  1 Oct 2019 13:41:32 +0100
Subject: [Buildroot] [PATCH 3/3] pkgconf: Configure using pkgconf-personality
In-Reply-To: <20191001124132.107700-1-thomas.preston@codethink.co.uk>
References: <20191001124132.107700-1-thomas.preston@codethink.co.uk>
Message-ID: <20191001124132.107700-3-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The correct way to configure pkgconf when cross-compiling is to use
pkgconf-personality, rather than using environment variables. The
personality is selected with a symbolic link mechanism, which we now use
in the pkg-config wrapper script.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/pkgconf/pkg-config.in      | 11 +----------
 package/pkgconf/pkgconf.mk         | 12 +++++++++++-
 package/pkgconf/target.personality |  5 +++++
 3 files changed, 17 insertions(+), 11 deletions(-)
 create mode 100644 package/pkgconf/target.personality

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 894069c492..51db4d87e1 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,12 +1,3 @@
 #!/bin/sh
 PKGCONFDIR=$(dirname $0)
-DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib
-DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/include
-DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
-DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
-
-PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
-	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
-	PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
-	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
-	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
+exec ${PKGCONFDIR}/@GNU_TARGET_NAME at -pkg-config @STATIC@ "$@"
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 1851ecfca4..66bc61d797 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -11,15 +11,25 @@ PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
+PKG_CONFIG_HOST_PERSONALITYD = $(HOST_DIR)/usr/share/pkgconfig/personality.d
 
 define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
 endef
 
 define HOST_PKGCONF_INSTALL_WRAPPER
+	$(INSTALL) -m 0775 -D package/pkgconf/target.personality \
+		$(PKG_CONFIG_HOST_PERSONALITYD)/$(GNU_TARGET_NAME).personality
+	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),g' \
+		$(PKG_CONFIG_HOST_PERSONALITYD)/$(GNU_TARGET_NAME).personality
+	$(SED) 's, at GNU_TARGET_NAME@,$(GNU_TARGET_NAME),g' \
+		$(PKG_CONFIG_HOST_PERSONALITYD)/$(GNU_TARGET_NAME).personality
+	ln -sf $(HOST_DIR)/bin/pkgconf \
+		$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-pkg-config
+
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/bin/pkg-config
-	$(SED) 's, at STAGING_SUBDIR@,$(STAGING_SUBDIR),g' \
+	$(SED) 's, at GNU_TARGET_NAME@,$(GNU_TARGET_NAME),g' \
 		$(HOST_DIR)/bin/pkg-config
 endef
 
diff --git a/package/pkgconf/target.personality b/package/pkgconf/target.personality
new file mode 100644
index 0000000000..cee4d236c4
--- /dev/null
+++ b/package/pkgconf/target.personality
@@ -0,0 +1,5 @@
+Triplet: @GNU_TARGET_NAME@
+SysrootDir: @STAGING_DIR@
+DefaultSearchPaths: @STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig
+SystemIncludePaths: @STAGING_DIR@/usr/include
+SystemLibraryPaths: @STAGING_DIR@/usr/lib
-- 
2.20.1
