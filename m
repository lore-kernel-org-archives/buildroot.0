From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:27 +0200
Subject: [Buildroot] [PATCH 53/53] policycoreutils: rework host installation
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-54-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

policycoreutils has a pretty peculiar interpretation of DESTDIR and
PREFIX.  PREFIX is not consistently used: some installation paths and
include paths are forced to $(DESTDIR)/usr/... . In other cases,
PREFIX is indeed used. PREFIX defaults to $(DESTDIR)/usr

Try to be a little bit more correct by passing both DESTDIR and PREFIX,
both set to $(HOST_DIR). This is not a complete fix: some things are
still installed in $(HOST_DIR)/usr - but nothing we care about (just
manpages, systemd services, ...). More importantly, however, it still
looks for e.g. D-Bus in $(DESTDIR)/usr/include/dbus-1.0.

Still, it's better than nothing.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/policycoreutils/policycoreutils.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 480fd6e09d..6fec4afb25 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -87,13 +87,18 @@ HOST_POLICYCOREUTILS_DEPENDENCIES = \
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+# We need to pass DESTDIR at build time because it's used by
+# policycoreutils build system to find headers and libraries.
+# We also need to pass PREFIX because it defaults to $(DESTDIR)/usr
 HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
 	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	PYTHON="$(HOST_DIR)/bin/python" \
 	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
-	ARCH="$(HOSTARCH)"
+	ARCH="$(HOSTARCH)" \
+	DESTDIR=$(HOST_DIR) \
+	PREFIX=$(HOST_DIR)
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
@@ -112,19 +117,15 @@ HOST_POLICYCOREUTILS_MAKE_DIRS = \
 	semodule_package setfiles restorecond \
 	audit2allow scripts semanage sepolicy
 
-# We need to pass DESTDIR at build time because it's used by
-# policycoreutils build system to find headers and libraries.
 define HOST_POLICYCOREUTILS_BUILD_CMDS
 	$(foreach d,$(HOST_POLICYCOREUTILS_MAKE_DIRS),
-		$(MAKE) -C $(@D)/$(d) $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
-			DESTDIR=$(HOST_DIR) all
+		$(MAKE) -C $(@D)/$(d) $(HOST_POLICYCOREUTILS_MAKE_OPTS) all
 	)
 endef
 
 define HOST_POLICYCOREUTILS_INSTALL_CMDS
 	$(foreach d,$(HOST_POLICYCOREUTILS_MAKE_DIRS),
-		$(MAKE) -C $(@D)/$(d) $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
-			DESTDIR=$(HOST_DIR) install
+		$(MAKE) -C $(@D)/$(d) $(HOST_POLICYCOREUTILS_MAKE_OPTS) install
 	)
 	# Fix python paths
 	$(SED) 's%/usr/bin/%$(HOST_DIR)/bin/%g' $(HOST_DIR)/bin/audit2allow
-- 
2.11.0
