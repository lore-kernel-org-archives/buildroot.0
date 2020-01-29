From: jared.bents at rockwellcollins.com <jared.bents@rockwellcollins.com>
Date: Wed, 29 Jan 2020 09:08:41 -0600
Subject: [Buildroot] [PATCH v1 1/1] package/libtalloc: update to add
 libtalloc
Message-ID: <20200129150841.9546-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jared Bents <jared.bents@rockwellcollins.com>

update to add libtalloc as a package

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/Config.in                |  1 +
 package/libtalloc/Config.in      |  8 ++++
 package/libtalloc/libtalloc.hash |  2 +
 package/libtalloc/libtalloc.mk   | 74 ++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/libtalloc/Config.in
 create mode 100644 package/libtalloc/libtalloc.hash
 create mode 100644 package/libtalloc/libtalloc.mk

diff --git a/package/Config.in b/package/Config.in
index 091f5d39f7..37c2c3df12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1769,6 +1769,7 @@ menu "Other"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libspatialindex/Config.in"
+	source "package/libtalloc/Config.in"
 	source "package/libtasn1/Config.in"
 	source "package/libtommath/Config.in"
 	source "package/libtpl/Config.in"
diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
new file mode 100644
index 0000000000..168d367793
--- /dev/null
+++ b/package/libtalloc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBTALLOC
+	bool "libtalloc"
+	help
+	  talloc is a hierarchical, reference counted memory pool
+	  system with destructors. It is the core memory allocator
+	  used in Samba.
+
+	  https://talloc.samba.org/talloc/doc/html/index.html
diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
new file mode 100644
index 0000000000..ff1df0f8a9
--- /dev/null
+++ b/package/libtalloc/libtalloc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256 ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
new file mode 100644
index 0000000000..82a5bcb45e
--- /dev/null
+++ b/package/libtalloc/libtalloc.mk
@@ -0,0 +1,74 @@
+################################################################################
+#
+# libtalloc
+#
+################################################################################
+
+LIBTALLOC_VERSION = 2.3.1
+LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
+LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
+LIBTALLOC_LICENSE = LGPL-3.0+
+# no license file but available in source at man/talloc.3.xml
+LIBTALLOC_INSTALL_STAGING = YES
+LIBTALLOC_CFLAGS = $(TARGET_CFLAGS)
+LIBTALLOC_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+LIBTALLOC_CONF_ENV = \
+	CFLAGS="$(LIBTALLOC_CFLAGS)" \
+	LDFLAGS="$(LIBTALLOC_LDFLAGS)" \
+	XSLTPROC=false \
+	WAF_NO_PREFORK=1
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
+LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBTALLOC_PYTHON = \
+	PYTHON="$(HOST_DIR)/bin/python3" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+LIBTALLOC_DEPENDENCIES += host-python3 python3
+LIBTALLOC_CONF_ENV += \
+	$(LIBTALLOC_PYTHON) \
+	python_LDFLAGS="" \
+	python_LIBDIR=""
+# There is not a --enable-python configuration option
+else
+LIBTALLOC_CONF_OPTS += --disable-python
+endif
+
+define LIBTALLOC_CONFIGURE_CMDS
+	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
+	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(LIBTALLOC_CONF_ENV) \
+		./buildtools/bin/waf configure \
+			--prefix=/usr \
+			--sysconfdir=/etc \
+			--localstatedir=/var \
+			--with-libiconv=$(STAGING_DIR)/usr \
+			--cross-compile \
+			--cross-answers=$(@D)/cache.txt \
+			--hostcc=gcc \
+			--disable-rpath \
+			--disable-rpath-install \
+			--bundled-libraries='!asn1_compile,!compile_et' \
+			$(LIBTALLOC_CONF_OPTS) \
+	)
+endef
+
+define LIBTALLOC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(LIBTALLOC_PYTHON) $(MAKE) -C $(@D)
+endef
+
+define LIBTALLOC_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(LIBTALLOC_PYTHON) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBTALLOC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(LIBTALLOC_PYTHON) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.18.0
