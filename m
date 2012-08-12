From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:58 +0200
Subject: [Buildroot] [PATCH 10/36] package/spice-server: new package
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-10-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in       |    1 +
 package/spice/Config.in |   22 ++++++++++++++++++++++
 package/spice/spice.mk  |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 package/spice/Config.in
 create mode 100644 package/spice/spice.mk

diff --git a/package/Config.in b/package/Config.in
index d916128..3109591 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -601,6 +601,7 @@ source "package/socat/Config.in"
 source "package/socketcand/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/spice-protocol/Config.in"
+source "package/spice/Config.in"
 source "package/squid/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
diff --git a/package/spice/Config.in b/package/spice/Config.in
new file mode 100644
index 0000000..5a42730
--- /dev/null
+++ b/package/spice/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_SPICE
+	bool "spice server"
+	depends on BR2_PACKAGE_PYTHON_PYPARSING
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
+
+comment "spice server depends on python-pyparsing"
+	depends on !BR2_PACKAGE_PYTHON_PYPARSING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
new file mode 100644
index 0000000..7e3fe5c
--- /dev/null
+++ b/package/spice/spice.mk
@@ -0,0 +1,39 @@
+#-----------------------------------------------------------------------------
+# Package description
+
+SPICE_VERSION         = 0.11.0
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
+#----------------------------------------------------------------------------
+# Package build process
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
+  --without-x               \
+
+SPICE_DEPENDENCIES += host-pkg-config
+
+SPICE_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+SPICE_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+$(eval $(autotools-package))
-- 
1.7.2.5
