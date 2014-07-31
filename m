From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Jul 2014 12:21:18 -0300
Subject: [Buildroot] [PATCHv2] samba4: bump to version 4.1.10
Message-ID: <1406820078-29391-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lots of bugfixes, enhancements to provisioning and printing support via
cups.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e2336e7..9e3178a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.9
+SAMBA4_VERSION = 4.1.10
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
@@ -20,6 +20,14 @@ else
 	SAMBA4_CONF_OPT += --without-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_CUPS),y)
+	SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
+	SAMBA4_CONF_OPT += --enable-cups
+	SAMBA4_DEPENDENCIES += cups
+else
+	SAMBA4_CONF_OPT += --disable-cups
+endif
+
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 	SAMBA4_CONF_OPT += --with-aio-support
 	SAMBA4_DEPENDENCIES += libaio
@@ -69,6 +77,7 @@ define SAMBA4_CONFIGURE_CMDS
 		python_LDFLAGS="" \
 		python_LIBDIR="" \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(SAMBA4_CONF_ENV) \
 		./buildtools/bin/waf configure \
 			--prefix=/usr \
 			--sysconfdir=/etc \
@@ -80,7 +89,6 @@ define SAMBA4_CONFIGURE_CMDS
 			--hostcc=gcc \
 			--disable-rpath \
 			--disable-rpath-install \
-			--disable-cups \
 			--disable-iprint \
 			--without-pam \
 			--without-dmapi \
@@ -101,6 +109,16 @@ define SAMBA4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
+# Samba just installs .py files so the purge causes problems with some tools
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+define SAMBA4_BUILD_PYC_FILES
+	PYTHONPATH="$(PYTHON_PATH)" \
+		$(HOST_DIR)/usr/bin/python -c "import compileall; \
+		compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/samba')"
+endef
+SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_BUILD_PYC_FILES
+endif
+
 define SAMBA4_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/samba4/S91smb \
 		$(TARGET_DIR)/etc/init.d/S91smb
-- 
1.8.5.5
