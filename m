From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  1 Sep 2017 21:41:38 -0300
Subject: [Buildroot] [PATCH v5] util-linux: add menu items for login
	utilities
In-Reply-To: <20170825212645.1467-1-casantos@datacom.ind.br>
References: <20170825212645.1467-1-casantos@datacom.ind.br>
Message-ID: <20170902004138.17967-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change extends to the login utilities the current policy of having
a selection item in the configuration menu for each utility that has an
--enable/--disable knob in the "configure" script:

- add selection items for login, runuser, su and sulogin (there was
  already an item for "last")
- move "login utilities" to Config.in.legacy
- make "login utilities" select last, login, runuser, su and sulogin

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

---
Changes v1->v2
  - do not add section titles
  - deprecate the "login utilities" group
Changes v2->v3
  - improve comments
  - fix spelling errors
  - add comment to show when "login" is unavailable
Changes v3->v4
  - install PAM files only if linux-pam is selected
Changes v4->v5
  - Fix merge conflict in Config.in.legacy
---
 Config.in.legacy                 | 15 ++++++++++++++
 package/util-linux/Config.in     | 45 ++++++++++++++++++++++++++++------------
 package/util-linux/util-linux.mk | 10 +++++----
 3 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d35b409423..44303a42bc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,21 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2017.11"
+
+config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
+	bool "util-linux login utilities option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_UTIL_LINUX_LAST
+	select BR2_PACKAGE_UTIL_LINUX_LOGIN
+	select BR2_PACKAGE_UTIL_LINUX_RUNUSER
+	select BR2_PACKAGE_UTIL_LINUX_SU
+	select BR2_PACKAGE_UTIL_LINUX_SULOGIN
+	help
+	  Login utilities (last, login, runuser, su, sulogin) now have
+	  their own configuration options in the util-linux menu.
+
+###############################################################################
 comment "Legacy options removed in 2017.08"
 
 config BR2_PACKAGE_SIMICSFS
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index cba590c4f9..b3494af101 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -164,26 +164,25 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
 	help
 	  Read one line
 
-config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
-	bool "login utilities"
-	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
-	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
-	depends on !BR2_STATIC_LIBS
+config BR2_PACKAGE_UTIL_LINUX_LOGGER
+	bool "logger"
+	help
+	  Enter messages into the system log
+
+config BR2_PACKAGE_UTIL_LINUX_LOGIN
+	bool "login"
+	depends on BR2_ENABLE_LOCALE # linux-pam
+	depends on BR2_USE_WCHAR # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_USE_MMU # fork(), linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
-	  Login utilities (last, login, runuser, su, sulogin)
+	  Begin a session on the system
 
-comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
-config BR2_PACKAGE_UTIL_LINUX_LOGGER
-	bool "logger"
-	help
-	  Enter messages into the system log
-
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
 	depends on BR2_USE_MMU # libsmartcols
@@ -296,6 +295,14 @@ config BR2_PACKAGE_UTIL_LINUX_RESET
 	help
 	  Reset the terminal
 
+config BR2_PACKAGE_UTIL_LINUX_RUNUSER
+	bool "runuser"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Run a command with substitute user and group ID (does not need
+	  to ask for a password, because it may be executed by the root
+	  user only)
+
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
 	help
@@ -313,6 +320,18 @@ config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	help
 	  Set terminal attributes
 
+config BR2_PACKAGE_UTIL_LINUX_SU
+	bool "su"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Run a command with substitute user and group ID
+
+config BR2_PACKAGE_UTIL_LINUX_SULOGIN
+	bool "sulogin"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Single-user login
+
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "switch_root"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index fc32668869..5ebb5e6720 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -118,7 +118,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGGER),--enable-logger,--disable-logger) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN),--enable-login,--disable-login) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LSMEM),--enable-lsmem,--disable-lsmem) \
@@ -136,9 +136,12 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RESET),--enable-reset,--disable-reset) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_RUNUSER),--enable-runuser,--disable-runuser) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),--enable-schedutils,--disable-schedutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SETPRIV),--enable-setpriv,--disable-setpriv) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SETTERM),--enable-setterm,--disable-setterm) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_SU),--enable-su,--disable-su) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_SULOGIN),--enable-sulogin,--disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),--enable-switch_root,--disable-switch_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_TUNELP),--enable-tunelp,--disable-tunelp) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UL),--enable-ul,--disable-ul) \
@@ -200,7 +203,7 @@ UTIL_LINUX_CONF_OPTS += --without-audit
 endif
 
 # Install PAM configuration files
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
 define UTIL_LINUX_INSTALL_PAMFILES
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su
@@ -208,9 +211,8 @@ define UTIL_LINUX_INSTALL_PAMFILES
 		$(TARGET_DIR)/etc/pam.d/su-l
 	$(UTIL_LINUX_SELINUX_PAMFILES_TWEAK)
 endef
-endif
-
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
+endif
 
 # Install agetty->getty symlink to avoid breakage when there's no busybox
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
-- 
2.13.5
