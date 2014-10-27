From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Oct 2014 21:00:14 +0100
Subject: [Buildroot] [PATCH v5 1/3] package/dovecot: New package
Message-ID: <1414440016-3863-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: bumped to 2.2.15
v4: bumped to 2.2.14
v3: DOVECOT_CONF_OPT -> DOVECOT_CONF_OPTS
v2: - Reworked dependencies (Thomas)
    - added MySQL/SQLite support
    - removed cruft from CONV_OPT not needed for buildroot (Thomas)

 package/Config.in          |    1 +
 package/dovecot/Config.in  |   56 +++++++++++++++++++++++++
 package/dovecot/dovecot.mk |   97 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 package/dovecot/Config.in
 create mode 100644 package/dovecot/dovecot.mk

diff --git a/package/Config.in b/package/Config.in
index 79fd9a4..26c7a72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -954,6 +954,7 @@ menu "Miscellaneous"
 endmenu
 
 menu "Mail"
+	source "package/dovecot/Config.in"
 	source "package/exim/Config.in"
 	source "package/fetchmail/Config.in"
 	source "package/heirloom-mailx/Config.in"
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
new file mode 100644
index 0000000..c692402
--- /dev/null
+++ b/package/dovecot/Config.in
@@ -0,0 +1,56 @@
+menuconfig BR2_PACKAGE_DOVECOT
+	bool "dovecot"
+	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
+	help
+	  Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-
+	  like systems, written with security primarily in mind. Dovecot is an
+	  excellent choice for both small and large installations. It's fast,
+	  simple to set up, requires no special administration and it uses very
+	  little memory.
+
+	  http://www.dovecot.org
+
+if BR2_PACKAGE_DOVECOT
+
+config BR2_PACKAGE_DOVECOT_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bzip2 support.
+
+config BR2_PACKAGE_DOVECOT_MYSQL
+	bool "mysql"
+	select BR2_PACKAGE_MYSQL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Enable MySQL support.
+
+comment "MySQL needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_DOVECOT_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable OpenSSL support.
+
+config BR2_PACKAGE_DOVECOT_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Enable SQLite support.
+
+config BR2_PACKAGE_DOVECOT_ZLIB
+	bool "zlib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable zlib support.
+
+endif # BR2_PACKAGE_DOVECOT
+
+comment "dovecot needs a toolchain w/ ipv6"
+	depends on BR2_USE_MMU
+	depends on !BR2_INET_IPV6
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
new file mode 100644
index 0000000..5b6d8eb
--- /dev/null
+++ b/package/dovecot/dovecot.mk
@@ -0,0 +1,97 @@
+################################################################################
+#
+# dovecot
+#
+################################################################################
+
+DOVECOT_VERSION_MAJOR = 2.2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).15
+DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
+DOVECOT_INSTALL_STAGING = YES
+DOVECOT_LICENSE = LGPLv2.1 with exceptions
+DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
+DOVECOT_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+DOVECOT_CONF_ENV = \
+	RPCGEN=__disable_RPCGEN_rquota \
+	i_cv_epoll_works=yes \
+	i_cv_inotify_works=yes \
+	i_cv_posix_fallocate_works=no \
+	i_cv_signed_size_t=no \
+	i_cv_gmtime_max_time_t=32 \
+	i_cv_signed_time_t=yes \
+	i_cv_mmap_plays_with_write=yes \
+	i_cv_fd_passing=yes \
+	i_cv_c99_vsnprintf=yes \
+	lib_cv_va_copy=yes \
+	lib_cv___va_copy=yes \
+	lib_cv_va_val_copy=yes
+
+DOVECOT_CONF_OPTS = --without-docs
+
+ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL)$(BR2_PACKAGE_DOVECOT_SQLITE),)
+DOVECOT_CONF_OPTS += --without-sql
+endif
+
+ifeq ($(BR2_PACKAGE_DOVECOT_BZIP2),y)
+DOVECOT_CONF_OPTS += --with-bzlib
+DOVECOT_DEPENDENCIES += bzip2
+else
+DOVECOT_CONF_OPTS += --without-bzlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+DOVECOT_CONF_OPTS += --with-libcap
+DOVECOT_DEPENDENCIES += libcap
+else
+DOVECOT_CONF_OPTS += --without-libcap
+endif
+
+ifeq ($(BR2_PACKAGE_DOVECOT_MYSQL),y)
+DOVECOT_CONF_ENV += MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
+DOVECOT_CONF_OPTS += --with-mysql
+DOVECOT_DEPENDENCIES += mysql
+else
+DOVECOT_CONF_OPTS += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_DOVECOT_OPENSSL),y)
+DOVECOT_CONF_OPTS += --with-ssl=openssl
+DOVECOT_DEPENDENCIES += openssl
+else
+DOVECOT_CONF_OPTS += --with-ssl=no
+endif
+
+ifeq ($(BR2_PACKAGE_DOVECOT_SQLITE),y)
+DOVECOT_CONF_OPTS += --with-sqlite
+DOVECOT_DEPENDENCIES += sqlite
+else
+DOVECOT_CONF_OPTS += --without-sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_DOVECOT_ZLIB),y)
+DOVECOT_CONF_OPTS += --with-zlib
+DOVECOT_DEPENDENCIES += zlib
+else
+DOVECOT_CONF_OPTS += --without-zlib
+endif
+
+# fix paths to avoid using /usr/lib/dovecot
+define DOVECOT_POST_CONFIGURE
+	for i in $$(find $(@D) -name "Makefile"); do \
+		$(SED) 's%^pkglibdir =.*%pkglibdir = \$$(libdir)%' $$i; \
+		$(SED) 's%^pkglibexecdir =.*%pkglibexecdir = \$$(libexecdir)%' $$i; \
+	done
+endef
+
+DOVECOT_POST_CONFIGURE_HOOKS += DOVECOT_POST_CONFIGURE
+
+# dovecot installs dovecot-config in usr/lib/, therefore DOVECOT_CONFIG_SCRIPTS
+# can not be used to rewrite paths
+define DOVECOT_FIX_STAGING_DOVECOT_CONFIG
+	$(SED) 's,^LIBDOVECOT_INCLUDE=.*$$,LIBDOVECOT_INCLUDE=\"-I$(STAGING_DIR)/usr/include/dovecot\",' $(STAGING_DIR)/usr/lib/dovecot-config
+endef
+
+DOVECOT_POST_INSTALL_STAGING_HOOKS += DOVECOT_FIX_STAGING_DOVECOT_CONFIG
+
+$(eval $(autotools-package))
-- 
1.7.10.4
