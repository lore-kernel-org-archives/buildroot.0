From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 19 Aug 2017 20:55:33 -0300
Subject: [Buildroot] [PATCH] util-linux: add menu items for login utilities
Message-ID: <20170819235533.18373-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change extends to the login utilities the current policy of having
a selection item in the configuration menu for each utility that has an
--enable/--disable knob in the "configure" script:

- add selection items for login, runuser, su and sulogin(*).
- make "login utilities" select last, login, runuser, su and sulogin
- move the "login utilities" selection to the top of the list, right
  below "basic set"
- add "Utility groups" and "Individual utilities" section titles

(*) there was already an item for "last".

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/Config.in     | 66 +++++++++++++++++++++++++++++++---------
 package/util-linux/util-linux.mk |  7 +++--
 2 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index cba590c4f9..b1c64e831b 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -42,6 +42,8 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libuuid.
 
+comment "Utility groups"
+
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	bool "basic set"
 	depends on BR2_USE_MMU # fork()
@@ -64,6 +66,26 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
 
+config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
+	bool "login utilities"
+	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	select BR2_PACKAGE_UTIL_LINUX_LAST
+	select BR2_PACKAGE_UTIL_LINUX_LOGIN
+	select BR2_PACKAGE_UTIL_LINUX_RUNUSER
+	select BR2_PACKAGE_UTIL_LINUX_SU
+	select BR2_PACKAGE_UTIL_LINUX_SULOGIN
+	help
+	  Login utilities (last, login, runuser, su, sulogin)
+
+comment "Individual utilities"
+
+comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	depends on BR2_USE_MMU # fork()
@@ -164,26 +186,20 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
 	help
 	  Read one line
 
-config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
-	bool "login utilities"
-	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
-	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
-	depends on BR2_USE_MMU # linux-pam
-	select BR2_PACKAGE_LINUX_PAM
-	help
-	  Login utilities (last, login, runuser, su, sulogin)
-
-comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-
 config BR2_PACKAGE_UTIL_LINUX_LOGGER
 	bool "logger"
 	help
 	  Enter messages into the system log
 
+config BR2_PACKAGE_UTIL_LINUX_LOGIN
+	bool "login"
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # fork(), linux-pam
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  Begin a session on the system
+
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
 	depends on BR2_USE_MMU # libsmartcols
@@ -296,6 +312,14 @@ config BR2_PACKAGE_UTIL_LINUX_RESET
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
@@ -313,6 +337,18 @@ config BR2_PACKAGE_UTIL_LINUX_SETTERM
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
index fc32668869..179e55dddf 100644
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
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU),y)
 define UTIL_LINUX_INSTALL_PAMFILES
 	$(INSTALL) -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su
-- 
2.13.5
