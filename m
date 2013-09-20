From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 16:14:10 +0200
Subject: [Buildroot] [git commit] civetweb: new package
Message-ID: <20130920141451.0FEE39B80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fe1165e619fdaa2fedc027137974797796f80aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Davis <sunsetbrew@sunsetbrew.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/civetweb/Config.in   |   26 +++++++++++++++++++
 package/civetweb/civetweb.mk |   55 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c3725f2..e1dfd5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ source "package/bridge-utils/Config.in"
 source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/chrony/Config.in"
+source "package/civetweb/Config.in"
 source "package/connman/Config.in"
 source "package/crda/Config.in"
 source "package/ctorrent/Config.in"
diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
new file mode 100644
index 0000000..f7a31f5
--- /dev/null
+++ b/package/civetweb/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_CIVETWEB
+	bool "civetweb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Full featured embedded web server with Lua support.
+
+	  https://sourceforge.net/projects/civetweb
+
+if BR2_PACKAGE_CIVETWEB
+
+config BR2_CIVETWEB_WITH_LUA
+	bool "enable Lua support"
+	# required by the bundled Sqlite3 and Lua code
+	depends on BR2_LARGEFILE
+	help
+	  Enable Lua support in Civetweb. Note that this will use a
+	  version of Lua and Sqlite bundled within the Civetweb
+	  sources, and not the packages from Buildroot.
+
+comment "Lua support requires largefile support in toolchain"
+	depends on !BR2_LARGEFILE
+
+endif
+
+comment "civetweb requires a toolchain with PTHREAD support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
new file mode 100644
index 0000000..e34da06
--- /dev/null
+++ b/package/civetweb/civetweb.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# civetweb
+#
+################################################################################
+
+CIVETWEB_VERSION = 1.3
+CIVETWEB_SITE = http://github.com/sunsetbrew/civetweb/tarball/v$(CIVETWEB_VERSION)
+CIVETWEB_LICENSE = MIT
+CIVETWEB_LICENSE_FILES = LICENSE.md
+
+CIVETWEB_CONF_OPT = TARGET_OS=LINUX
+CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
+CIVETWEB_LDFLAGS = $(TARGET_LDFLAGS)
+CIVETWEB_SYSCONFDIR = /etc
+CIVETWEB_HTMLDIR = /var/www
+
+ifneq ($(BR2_LARGEFILE),y)
+	CIVETWEB_COPT += -DSQLITE_DISABLE_LFS
+endif
+
+ifeq ($(BR2_INET_IPV6),y)
+	CIVETWEB_CONF_OPT += WITH_IPV6=1
+endif
+
+ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
+	CIVETWEB_CONF_OPT += WITH_LUA=1
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	CIVETWEB_COPT += -DNO_SSL_DL -lcrypt -lssl
+	CIVETWEB_DEPENDENCIES += openssl
+else
+	CIVETWEB_COPT += -DNO_SSL
+endif
+
+define CIVETWEB_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D) build \
+		$(CIVETWEB_CONF_OPT) \
+		COPT="$(CIVETWEB_COPT)"
+endef
+
+define CIVETWEB_INSTALL_TARGET_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D) install \
+		DOCUMENT_ROOT="$(CIVETWEB_HTMLDIR)" \
+		CONFIG_FILE2="$(CIVETWEB_SYSCONFDIR)/civetweb.conf" \
+		HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
+		SYSCONFDIR="$(TARGET_DIR)$(CIVETWEB_SYSCONFDIR)" \
+		PREFIX="$(TARGET_DIR)/usr" \
+		$(CIVETWEB_CONF_OPT) \
+		COPT='$(CIVETWEB_COPT)'
+endef
+
+$(eval $(generic-package))
+
