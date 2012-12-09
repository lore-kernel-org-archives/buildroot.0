From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:34:46 +0100
Subject: [Buildroot] [PATCH 13/51] package/spice: new package
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-14-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in       |    1 +
 package/spice/Config.in |   23 +++++++++++++++++
 package/spice/spice.mk  |   62 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100644 package/spice/Config.in
 create mode 100644 package/spice/spice.mk

diff --git a/package/Config.in b/package/Config.in
index 8651fb7..02f65fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -658,6 +658,7 @@ source "package/socat/Config.in"
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
index 0000000..dbd2d5f
--- /dev/null
+++ b/package/spice/spice.mk
@@ -0,0 +1,62 @@
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
+SPICE_DEPENDENCIES += host-pkgconf
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
+# It is currently not possible to detect if stack-protection is available
+# or not, because it requires support from both the compiler *and* the
+# C library, but the C library (eg. uClibc) can be compiled without that
+# support, even if gcc accepts the -fstack-protector-all option.
+# spice's ./configure only checks for gcc's -fstack-protector-all option,
+# so it misses the case where the C library doe not provide the requires
+# support.
+# A correct fix would be to fix spice's ./configure to also check the C
+# library, but it might be much more involved.
+# So, we simply disable it for now. After all, as uClibc's help puts it:
+#     Note that NOEXECSTACK on a kernel with address space randomization
+#     is generally sufficient to prevent most buffer overflow exploits
+#     without increasing code size.
+SPICE_CONF_OPT += gl_cv_warn__fstack_protector_all=no
+
+$(eval $(autotools-package))
-- 
1.7.2.5
