From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 19:25:36 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: New package
Message-ID: <1411925137-11284-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          |    1 +
 package/dovecot/Config.in  |   17 +++++++++++
 package/dovecot/dovecot.mk |   72 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 package/dovecot/Config.in
 create mode 100644 package/dovecot/dovecot.mk

diff --git a/package/Config.in b/package/Config.in
index 26dc69c..39084cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -930,6 +930,7 @@ menu "Miscellaneous"
 endmenu
 
 menu "Mail"
+	source "package/dovecot/Config.in"
 	source "package/exim/Config.in"
 	source "package/fetchmail/Config.in"
 	source "package/heirloom-mailx/Config.in"
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
new file mode 100644
index 0000000..a529a54
--- /dev/null
+++ b/package/dovecot/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_DOVECOT
+	select BR2_PACKAGE_OPENSSL
+	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
+	bool "dovecot"
+	help
+	  Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-
+	  like systems, written with security primarily in mind. Dovecot is an
+	  excellent choice for both small and large installations. It's fast,
+	  simple to set up, requires no special administration and it uses very
+	  little memory.
+
+	  http://www.dovecot.org
+
+comment "dovecot needs a toolchain w/ ipv6"
+	depends on BR2_USE_MMU
+	depends on !BR2_INET_IPV6
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
new file mode 100644
index 0000000..91805a7
--- /dev/null
+++ b/package/dovecot/dovecot.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# dovecot
+#
+################################################################################
+
+DOVECOT_VERSION_MAJOR = 2.2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).13
+DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
+DOVECOT_INSTALL_STAGING = YES
+DOVECOT_LICENSE = LGPLv2.1; some exceptions are mentioned in COPYING
+DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
+DOVECOT_DEPENDENCIES = host-pkgconf openssl zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+DOVECOT_CONF_ENV= \
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
+DOVECOT_CONF_OPT = \
+	--with-dovecot=/usr/lib \
+	--without-dovecot-install-dirs \
+	--libexecdir=/usr/bin/dovecot \
+	--with-moduledir=/usr/lib \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
+	--without-sql \
+	--with-zlib \
+	--with-ssl=openssl \
+	--without-docs
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+DOVECOT_CONF_OPT += --with-bzlib
+DOVECOT_DEPENDENCIES += bzip2
+else
+DOVECOT_CONF_OPT += --without-bzlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+DOVECOT_CONF_OPT += --with-libcap
+DOVECOT_DEPENDENCIES += libcap
+else
+DOVECOT_CONF_OPT += --without-libcap
+endif
+
+define DOVECOT_POST_CONFIGURE
+	for i in $$(find $(@D) -name "Makefile"); do \
+		$(SED) 's%^pkglibdir =.*%pkglibdir = \$$(libdir)%' $$i; \
+		$(SED) 's%^pkglibexecdir =.*%pkglibexecdir = \$$(libexecdir)%' $$i; \
+	done
+endef
+
+DOVECOT_POST_CONFIGURE_HOOKS += DOVECOT_POST_CONFIGURE
+
+define DOVECOT_FIX_STAGING_DOVECOT_CONFIG
+	$(SED) 's,^LIBDOVECOT_INCLUDE=.*$$,LIBDOVECOT_INCLUDE=\"-I$(STAGING_DIR)/usr/include/dovecot\",' $(STAGING_DIR)/usr/lib/dovecot-config
+	$(SED) 's,^dovecot_pkglibexecdir=.*$$,dovecot_pkglibexecdir=/usr/bin,' $(STAGING_DIR)/usr/lib/dovecot-config
+endef
+
+DOVECOT_POST_INSTALL_STAGING_HOOKS += DOVECOT_FIX_STAGING_DOVECOT_CONFIG
+
+$(eval $(autotools-package))
-- 
1.7.10.4
