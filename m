From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:33:32 +0100
Subject: [Buildroot] [git commit] package/spice: new package
Message-ID: <20121216204048.92D159A2B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93d4e38450639aef401adfcc2c4e412efaef3da9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/spice/Config.in |   23 +++++++++++++++++
 package/spice/spice.mk  |   62 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3de0140..d3f5e80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -666,6 +666,7 @@ source "package/socat/Config.in"
 source "package/socketcand/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/spice-protocol/Config.in"
+source "package/spice/Config.in"
 source "package/squid/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
diff --git a/package/spice/Config.in b/package/spice/Config.in
new file mode 100644
index 0000000..086b1bc
--- /dev/null
+++ b/package/spice/Config.in
@@ -0,0 +1,23 @@
+comment "spice server depends on python (for pyparsing)"
+	depends on !BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_SPICE
+	bool "spice server"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_CELT051
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_PYTHON_PYPARSING
+	select BR2_PACKAGE_SPICE_PROTOCOL
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
index 0000000..2752b8a
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
+    alsa-lib            \
+    celt051             \
+    jpeg                \
+    openssl             \
+    pixman              \
+    python-pyparsing    \
+    spice-protocol      \
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
