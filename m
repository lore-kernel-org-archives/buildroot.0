From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:15 +0000
Subject: [Buildroot] [RFC PATCH v3 01/30] pkgconf: Configure using
 pkgconf-personality
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-2-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The correct way to configure pkgconf when cross-compiling is to use
pkgconf-personality, rather than using environment variables. The
personality can be selected with a symbolic link mechanism, however in
Buildroot we also want to configure the `--static` flag so we continue
to use the pkg-config wrapper script and select personality via the
flag.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Makefile.in                   |  6 +-----
 package/pkgconf/host-pkg-config.in    |  9 ++++++++
 package/pkgconf/host.personality.in   |  6 ++++++
 package/pkgconf/pkg-config.in         | 15 +++++---------
 package/pkgconf/pkgconf.mk            | 30 +++++++++++++++++++++++----
 package/pkgconf/target.personality.in |  6 ++++++
 6 files changed, 53 insertions(+), 19 deletions(-)
 create mode 100644 package/pkgconf/host-pkg-config.in
 create mode 100644 package/pkgconf/host.personality.in
 create mode 100644 package/pkgconf/target.personality.in

diff --git a/package/Makefile.in b/package/Makefile.in
index 285e2837ef..3b764baa47 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -286,11 +286,7 @@ TARGET_CONFIGURE_OPTS = \
 
 HOST_MAKE_ENV = \
 	PATH=$(BR_PATH) \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY_HOST)"
 
 HOST_CONFIGURE_OPTS = \
 	$(HOST_MAKE_ENV) \
diff --git a/package/pkgconf/host-pkg-config.in b/package/pkgconf/host-pkg-config.in
new file mode 100644
index 0000000000..9eaf6e0c19
--- /dev/null
+++ b/package/pkgconf/host-pkg-config.in
@@ -0,0 +1,9 @@
+#!/bin/sh
+# This is the Buildroot host pkgconf wrapper which is requried to allow host
+# packages to query system cflags and system libs.
+PKGCONFDIR=$(dirname $0)
+BR2_PKGCONF_PERSONALITY=${BR2_PKGCONF_PERSONALITY:- at DEFAULT_HOST_PERSONALITY@}
+exec ${PKGCONFDIR}/pkgconf \
+	--keep-system-cflags \
+	--keep-system-libs \
+	--personality=$BR2_PKGCONF_PERSONALITY "$@"
diff --git a/package/pkgconf/host.personality.in b/package/pkgconf/host.personality.in
new file mode 100644
index 0000000000..8099d26435
--- /dev/null
+++ b/package/pkgconf/host.personality.in
@@ -0,0 +1,6 @@
+# Buildroot host pkgconf-personality
+Triplet: @GNU_HOST_NAME@
+SysrootDir: /
+DefaultSearchPaths: @HOST_DIR@/usr/lib/pkgconfig:@HOST_DIR@/usr/share/pkgconfig
+SystemIncludePaths: @HOST_DIR@/usr/include
+SystemLibraryPaths: @HOST_DIR@/usr/lib
diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index f411eb0926..c40cefbc2e 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,12 +1,7 @@
 #!/bin/sh
+# This is the Buildroot pkgconf wrapper which is requried to build static
+# libraries for the target. Normally personality can be selected using a symlink
+# mechanism: triple-pkg-config -> pkgconf, with triple personality.
 PKGCONFDIR=$(dirname $0)
-DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
-DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
-DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/include
-DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib
-
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
-	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
-	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
-	PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
-	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
+BR2_PKGCONF_PERSONALITY=${BR2_PKGCONF_PERSONALITY:- at DEFAULT_TARGET_PERSONALITY@}
+exec ${PKGCONFDIR}/pkgconf --personality=$BR2_PKGCONF_PERSONALITY @STATIC@ "$@"
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 1851ecfca4..28ea12be39 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -9,7 +9,11 @@ PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
+PKGCONF_HOST_PERSONALITYD = $(HOST_DIR)/share/pkgconfig/personality.d
 
+HOST_PKGCONF_CONF_OPTS += --with-personality-dir=$(PKGCONF_HOST_PERSONALITYD)
+
+PKG_CONFIG_HOST_BINARY_HOST = $(HOST_DIR)/bin/host-pkg-config
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
 
 define PKGCONF_LINK_PKGCONFIG
@@ -17,10 +21,28 @@ define PKGCONF_LINK_PKGCONFIG
 endef
 
 define HOST_PKGCONF_INSTALL_WRAPPER
-	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
-		$(HOST_DIR)/bin/pkg-config
-	$(SED) 's, at STAGING_SUBDIR@,$(STAGING_SUBDIR),g' \
-		$(HOST_DIR)/bin/pkg-config
+	mkdir -p $(PKGCONF_HOST_PERSONALITYD)
+
+	# Install pkgconf target personality
+	sed -e 's, at STAGING_DIR@,$(STAGING_DIR),g' \
+		-e 's, at GNU_TARGET_NAME@,$(GNU_TARGET_NAME),g' \
+		$(PKGCONF_PKGDIR)/target.personality.in \
+		> $(PKGCONF_HOST_PERSONALITYD)/$(GNU_TARGET_NAME).personality
+	$(INSTALL) -m 0755 -D $(PKGCONF_PKGDIR)/pkg-config.in \
+		$(PKG_CONFIG_HOST_BINARY)
+	$(SED) 's, at DEFAULT_TARGET_PERSONALITY@,$(GNU_TARGET_NAME),g' \
+		$(PKG_CONFIG_HOST_BINARY)
+
+	# Install pkgconf host personality
+	sed -e 's, at HOST_DIR@,$(HOST_DIR),g' \
+		-e 's, at GNU_HOST_NAME@,$(GNU_HOST_NAME),g' \
+		$(PKGCONF_PKGDIR)/host.personality.in \
+		> $(PKGCONF_HOST_PERSONALITYD)/$(GNU_HOST_NAME).personality
+	$(INSTALL) -m 0755 -D $(PKGCONF_PKGDIR)/host-pkg-config.in \
+		$(PKG_CONFIG_HOST_BINARY_HOST)
+	$(SED) 's, at DEFAULT_HOST_PERSONALITY@,$(GNU_HOST_NAME),g' \
+		$(PKG_CONFIG_HOST_BINARY_HOST)
+
 endef
 
 define HOST_PKGCONF_STATIC
diff --git a/package/pkgconf/target.personality.in b/package/pkgconf/target.personality.in
new file mode 100644
index 0000000000..3959d833ee
--- /dev/null
+++ b/package/pkgconf/target.personality.in
@@ -0,0 +1,6 @@
+# Buildroot target pkgconf-personality
+Triplet: @GNU_TARGET_NAME@
+SysrootDir: @STAGING_DIR@
+DefaultSearchPaths: @STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig
+SystemIncludePaths: @STAGING_DIR@/usr/include
+SystemLibraryPaths: @STAGING_DIR@/usr/lib
-- 
2.20.1
