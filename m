From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 10 Feb 2020 16:55:47 +0100
Subject: [Buildroot] [PATCH v2 1/2] pkgconf: Add a host-pkg-config wrapper
 script.
Message-ID: <20200210155548.31928-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-pkg-config wrapper script replicate the configuration
present in HOST_MAKE_ENV, with the exception of PKG_CONFIG_LIBDIR
whose default is already equal to what we want.

This wrapper script can be used with build systems that recognise the
difference between a host dependency and a target dependency.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

--

HOST_MAKE_ENV could be modified to use host-pkg-config, but since we
cannot guarantee that every host package will use the PKG_CONFIG
environment variable (instead of e.g. finding pkg-config in $PATH), the
other PKG_CONFIG_* variables probably need to be kept as well, so it
wouldn't be useful to use it there.
---
 package/pkgconf/host-pkg-config | 8 ++++++++
 package/pkgconf/pkgconf.mk      | 3 +++
 2 files changed, 11 insertions(+)
 create mode 100644 package/pkgconf/host-pkg-config

diff --git a/package/pkgconf/host-pkg-config b/package/pkgconf/host-pkg-config
new file mode 100644
index 0000000000..de23ce2737
--- /dev/null
+++ b/package/pkgconf/host-pkg-config
@@ -0,0 +1,8 @@
+#!/bin/sh
+PKGCONFDIR=$(dirname $0)
+
+# Default PKG_CONFIG_LIBDIR is HOST_DIR/lib/pkgconfig:HOST_DIR/share/pkgconfig
+PKG_CONFIG_SYSROOT_DIR="/" \
+	exec ${PKGCONFDIR}/pkgconf \
+		--keep-system-cflags \
+		--keep-system-libs "$@"
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 1851ecfca4..f3eb47931a 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -11,6 +11,7 @@ PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
+HOST_PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/host-pkg-config
 
 define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
@@ -19,6 +20,8 @@ endef
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/bin/pkg-config
+	$(INSTALL) -m 0755 -D package/pkgconf/host-pkg-config \
+		$(HOST_DIR)/bin/host-pkg-config
 	$(SED) 's, at STAGING_SUBDIR@,$(STAGING_SUBDIR),g' \
 		$(HOST_DIR)/bin/pkg-config
 endef
-- 
2.25.0
