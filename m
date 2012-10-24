From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:25:37 +0200
Subject: [Buildroot] [PATCH 11/47] package/spice-server: new package
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-12-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in       |    1 +
 package/spice/Config.in |   23 +++++++++++++++++++++++
 package/spice/spice.mk  |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 package/spice/Config.in
 create mode 100644 package/spice/spice.mk

diff --git a/package/Config.in b/package/Config.in
index 33d4525..844873a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -632,6 +632,7 @@ source "package/socat/Config.in"
 source "package/socketcand/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/spice-protocol/Config.in"
+source "package/spice/Config.in"
 source "package/squid/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
diff --git a/package/spice/Config.in b/package/spice/Config.in
new file mode 100644
index 0000000..ced3ec7
--- /dev/null
+++ b/package/spice/Config.in
@@ -0,0 +1,23 @@
+comment "spice server depends on python"
+	depends on !BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_SPICE
+	bool "spice server"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYPARSING
+	select BR2_PACKAGE_SPICE_PROTOCOL
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_CELT051
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_JPEG
+	help
+	  The Spice project aims to provide a complete open source
+	  solution for interaction with virtualized desktop devices.
+	  The Spice project deals with both the virtualized devices
+	  and the front-end. Interaction between front-end and
+	  back-end is done using VD-Interfaces.
+	  
+	  This package implements the server-part of Spice.
+	  
+	  http://www.spice-space.org/
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
new file mode 100644
index 0000000..37b1bff
--- /dev/null
+++ b/package/spice/spice.mk
@@ -0,0 +1,47 @@
+#############################################################
+#
+# Spice
+#
+#############################################################
+
+SPICE_VERSION         = 0.12.0
+SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
+SPICE_SITE            = http://www.spice-space.org/download/releases/
+SPICE_LICENSE         = LGPLv2.1+
+SPICE_LICENSE_FILES   = COPYING
+SPICE_INSTALL_STAGING = YES
+SPICE_DEPENDENCIES    = \
+    spice-protocol      \
+    pixman              \
+    celt051             \
+    python-pyparsing    \
+    alsa-lib            \
+    openssl             \
+    jpeg                \
+
+# We disable everything for now, because the dependency tree can become
+# quite deep if we try to enable some features, and I have not tested that.
+SPICE_CONF_OPT =            \
+  --disable-tunnel          \
+  --disable-gui             \
+  --disable-opengl          \
+  --disable-smartcard       \
+  --disable-client          \
+  --disable-automated-tests \
+  --without-sasl            \
+
+SPICE_DEPENDENCIES += host-pkg-config
+
+SPICE_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+SPICE_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+# We need to tweak spice.pc because it /forgets/ (for static linking) that
+# it should link against libz and libjpeg. libz is pkg-config-aware, while
+# libjpeg isn't, hence the two-line tweak
+define SPICE_POST_INSTALL_STAGING_FIX_PC
+	$(SED) 's/^\(Requires.private:.*\)$$/\1 zlib/; s/^\(Libs.private:.*\)$$/\1 -ljpeg/;'    \
+	       "$(STAGING_DIR)/usr/lib/pkgconfig/spice-server.pc"
+endef
+SPICE_POST_INSTALL_STAGING_HOOKS += SPICE_POST_INSTALL_STAGING_FIX_PC
+
+$(eval $(autotools-package))
-- 
1.7.2.5
