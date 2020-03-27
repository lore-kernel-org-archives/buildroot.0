From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 27 Mar 2020 10:02:25 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/libtalloc: new package
Message-ID: <20200327150225.15277-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libtalloc is a hierarchical, reference counted memory pool
system with destructors. It is the core memory allocator
used in Samba.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v2: - updated commit message to fit new package standard
    - updated to waf package type
    - added developers entry
    - added toolchain dependencies
    - license and license file updates
    - removed TARGET_NLS_LIBS dependency
    - removed empty python_LDFLAGS and python_LIBDIR
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libtalloc/Config.in      | 20 +++++++++
 package/libtalloc/libtalloc.hash |  4 ++
 package/libtalloc/libtalloc.mk   | 72 ++++++++++++++++++++++++++++++++
 5 files changed, 98 insertions(+)
 create mode 100644 package/libtalloc/Config.in
 create mode 100644 package/libtalloc/libtalloc.hash
 create mode 100644 package/libtalloc/libtalloc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fd312a44af..afad4fad12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1166,6 +1166,7 @@ F:	package/zynq-boot-bin/
 
 N:	Jared Bents <jared.bents@rockwellcollins.com>
 F:	package/davici/
+F:	package/libtalloc/
 
 N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 F:	package/quota/
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
index 0000000000..333d7305ac
--- /dev/null
+++ b/package/libtalloc/Config.in
@@ -0,0 +1,20 @@
+comment "libtalloc needs a uClibc or glibc toolchain w/ wchar, dynamic library, NPTL"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_MUSL \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_LIBTALLOC
+	bool "libtalloc"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # python -> libffi
+	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	help
+	  talloc is a hierarchical, reference counted memory pool
+	  system with destructors. It is the core memory allocator
+	  used in Samba.
+
+	  https://talloc.samba.org/talloc/doc/html/index.html
diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
new file mode 100644
index 0000000000..34e41ddd9f
--- /dev/null
+++ b/package/libtalloc/libtalloc.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking pgp signature
+sha256 ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
+sha256 15c2767545d1e43dc35832736253bde5be956f8ffec0474a6d0f70349b646ed3  talloc.h
+sha256 8742f2dad3aaf885c7b4b699c20bfa0e9edeab380689f91a88aa90af03e6947b  pytalloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
new file mode 100644
index 0000000000..c050cf2033
--- /dev/null
+++ b/package/libtalloc/libtalloc.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# libtalloc
+#
+################################################################################
+
+LIBTALLOC_VERSION = 2.3.1
+LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
+LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
+LIBTALLOC_LICENSE = LGPL-3.0+, GPL-3.0+
+LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
+LIBTALLOC_INSTALL_STAGING = YES
+LIBTALLOC_CFLAGS = $(TARGET_CFLAGS)
+LIBTALLOC_LDFLAGS = $(TARGET_LDFLAGS)
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
+	$(LIBTALLOC_PYTHON)
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
+$(eval $(waf-package))
-- 
2.17.1
