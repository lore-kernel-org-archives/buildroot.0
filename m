From: David GOUARIN <dgouarin@gmail.com>
Date: Wed, 14 Oct 2020 19:02:54 +0200
Subject: [Buildroot] [PATCH v3] package/freeradius-server: new package
In-Reply-To: <20201013195125.6401-1-dgouarin@gmail.com>
References: <20201013195125.6401-1-dgouarin@gmail.com>
Message-ID: <20201014170254.6184-1-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FreeRADIUS is an open source server which implements
a protocol for remote user Authorization, Authentication
and Accounting.

Changes v1 -> v2:
  fix invalid characters in Config.in

Changes v2 -> v3:
  As suggested by Matt, merge with pending upstream patch. Included most of it,
  including patches based on Yocto work :
  http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
  Didn't kept all the --without directive, as they do not seem useful, nor
  the custom INSTALL_TARGET_CMDS.

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-host-jlibtool.patch                  |  17 +++
 package/freeradius-server/Config.in           |  19 +++
 .../freeradius-server-config.cache            |   4 +
 .../freeradius-server/freeradius-server.hash  |   8 ++
 .../freeradius-server/freeradius-server.mk    | 126 ++++++++++++++++++
 7 files changed, 176 insertions(+)
 create mode 100644 package/freeradius-server/0001-host-jlibtool.patch
 create mode 100644 package/freeradius-server/Config.in
 create mode 100644 package/freeradius-server/freeradius-server-config.cache
 create mode 100644 package/freeradius-server/freeradius-server.hash
 create mode 100644 package/freeradius-server/freeradius-server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c856d7ad45..ae688a85c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -711,6 +711,7 @@ N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
 N:	David GOUARIN <dgouarin@gmail.com>
+F:	package/freeradius-server/
 F:	package/librelp/
 F:	package/libtalloc/
 
diff --git a/package/Config.in b/package/Config.in
index a4d6fe02ae..8e3ce4fe20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2079,6 +2079,7 @@ menu "Networking applications"
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
+	source "package/freeradius-server/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/frr/Config.in"
diff --git a/package/freeradius-server/0001-host-jlibtool.patch b/package/freeradius-server/0001-host-jlibtool.patch
new file mode 100644
index 0000000000..18cebcb4e5
--- /dev/null
+++ b/package/freeradius-server/0001-host-jlibtool.patch
@@ -0,0 +1,17 @@
+jlibtool.c: while cross compiling, use host CC instead of target CC to build jlibtool
+
+Signed-off-by: David Gouarin <dgouarin@gmail.com>
+
+--- a/scripts/libtool.mk 2018-10-08 09:22:59.032031858 -0600
++++ b/scripts/libtool.mk 2018-10-08 15:04:18.406661484 -0600
+@@ -43,8 +43,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
+    # binary!
+	${JLIBTOOL}: ${top_makedir}/jlibtool.c
+	$(Q)mkdir -p $(dir $@)
+-	$(Q)echo CC jlibtool.c
+-	$(Q)${CC} $< -o $@
++	$(Q)echo HOSTCC jlibtool.c
++	$(Q)${HOSTCC} $< -o $@
+
+    clean: jlibtool_clean
+
diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
new file mode 100644
index 0000000000..456e05a5a9
--- /dev/null
+++ b/package/freeradius-server/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_FREERADIUS_SERVER
+	bool "freeradius-server"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_COMPILER_PARANOID_UNSAFE_PATH
+	select BR2_PACKAGE_LIBTALLOC
+	help
+	  FreeRADIUS is an open source server which implements
+	  a protocol for remote user Authorization, Authentication
+	  and Accounting.
+
+	  http://wiki.freeradius.org/
+
+comment "freeradius-server needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "freeradius-server needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_COMPILER_PARANOID_UNSAFE_PATH
+
diff --git a/package/freeradius-server/freeradius-server-config.cache b/package/freeradius-server/freeradius-server-config.cache
new file mode 100644
index 0000000000..d554b9a9aa
--- /dev/null
+++ b/package/freeradius-server/freeradius-server-config.cache
@@ -0,0 +1,4 @@
+ax_cv_cc_bounded_attribute=no
+ax_cv_cc_builtin_bswap64=no
+ax_cv_cc_builtin_choose_expr=no
+ax_cv_cc_builtin_types_compatible_p=no
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
new file mode 100644
index 0000000000..a1678b6809
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.hash
@@ -0,0 +1,8 @@
+# Locally computed
+sha256  2bf914d471d4409fd72e708e308fa32ca8d01d698c518497a1d4b867d50132ae  freeradius-server-3.0.21.tar.gz
+sha256  8b9cc1e5d41938be45a368f126a6d1fda03d60a3d622dc75e776be4e90c2d2c6  COPYRIGHT
+sha256  bf25b952f9f92d0fd0e9da3b61fd60e2bbbe4d5971650238151c8d7420780931  freeradius-avoid-searching-host-dirs.patch
+sha256  11441c8016fac480b16d160098c25caec6f5031ebc1310b6e523f90b6e27deb5  freeradius-configure.ac-add-option-for-libcap.patch
+sha256  fe429bf21a1b2f2b6648281ec30599ce1cee6b65aa5089e2cea0dfa89f63f64d  freeradius-configure.ac-allow-cross-compilation.patch
+sha256  9c19e94062b5dd8150b374a9698230db7fce1132c3c1d801f0370c578107159f  freeradius-fix-error-for-expansion-of-macro.patch
+
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
new file mode 100644
index 0000000000..a7ec9443ef
--- /dev/null
+++ b/package/freeradius-server/freeradius-server.mk
@@ -0,0 +1,126 @@
+################################################################################
+#
+# freeradius-server
+#
+################################################################################
+
+FREERADIUS_SERVER_VERSION = 3.0.21
+FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
+FREERADIUS_SERVER_LICENSE = GPL-2.0
+FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
+
+FREERADIUS_SERVER_PATCH = \
+	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch \
+	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch \
+	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch \
+	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
+
+FREERADIUS_SERVER_DEPENDENCIES = libtalloc
+
+# --cache-file= : some compiler checks are not supported while cross compiling.
+#   instead of removing those checks, we use a config.cache file
+FREERADIUS_SERVER_CONF_OPTS += \
+	--cache-file=freeradius-server-config.cache
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-libcap
+FREERADIUS_SERVER_DEPENDENCIES += libcap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-libcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_krb5
+FREERADIUS_SERVER_DEPENDENCIES += libkrb5
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_krb5
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_pam
+FREERADIUS_SERVER_DEPENDENCIES += linux-pam
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_pam
+endif
+
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ldap
+FREERADIUS_SERVER_DEPENDENCIES += openldap
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_ldap
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_mysql
+FREERADIUS_SERVER_DEPENDENCIES += mysql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_mysql
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_sqlite
+FREERADIUS_SERVER_DEPENDENCIES += sqlite
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_unixodbc
+FREERADIUS_SERVER_DEPENDENCIES += unixodbc
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_unixodbc
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_postgresql
+FREERADIUS_SERVER_DEPENDENCIES += postgresql
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_postgresql
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
+FREERADIUS_SERVER_DEPENDENCIES += openssl
+FREERADIUS_SERVER_CONF_OPTS += --with-openssl
+else
+FREERADIUS_CONF_OPTS += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-pcre
+FREERADIUS_SERVER_DEPENDENCIES += pcre
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-pcre
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python --with-rlm-python-bin=$(HOST_DIR)/bin/python --with-rlm-python-include-dir=$(STAGING_INCDIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR) --with-rlm_perl
+FREERADIUS_SERVER_DEPENDENCIES += python3
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python
+endif
+
+ifeq ($(BR2_PACKAGE_RUBY),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
+FREERADIUS_SERVER_DEPENDENCIES += ruby
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-rlm_ruby
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+FREERADIUS_SERVER_CONF_OPTS += --with-systemd
+FREERADIUS_SERVER_DEPENDENCIES += systemd
+else
+FREERADIUS_SERVER_CONF_OPTS += --without-systemd
+endif
+
+define FREERADIUS_SERVER_CACHE_FOR_CROSS_COMPILE
+	$(INSTALL) -m 0644 package/freeradius-server/freeradius-server-config.cache $(@D)/freeradius-server-config.cache
+endef
+FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_CACHE_FOR_CROSS_COMPILE
+
+FREERADIUS_SERVER_MAKE_ENV = R=$(TARGET_DIR) TARGET_DIR=""
+ 
+# make install does not support parallel build
+FREERADIUS_SERVER_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
-- 
2.17.1
