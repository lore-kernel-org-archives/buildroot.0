From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 28 Mar 2019 01:08:31 +0200
Subject: [Buildroot] [PATCH v4 2/2] package/gettext-tiny: new package
In-Reply-To: <20190327230831.31468-1-vadim4j@gmail.com>
References: <20190327230831.31468-1-vadim4j@gmail.com>
Message-ID: <20190327230831.31468-3-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add gettext-tiny package from the sabotage-linux project:

    gettext-tiny provides lightweight replacements for tools typically used
    from the GNU gettext suite, which is incredibly bloated and takes a lot
    of time to build (in the order of an hour on slow devices). the most
    notable component is msgfmt which is used to create binary translation
    files in the .mo format out of textual input files in .po format. this
    is the most important tool for building software from source, because it
    is used from the build processes of many software packages.

Some files were taken from gettext-gnu (some po/* files and gettextize
script) to make possible perform gettextizing of packages.

The main purpose of gettext-tiny is to replace gettext for the "host" if
NLS support is not needed. There is no option to manually select
gettext-gnu or gettext-tiny, it is done automatically by virtual gettext
package. For the target gettext-tiny only installs gettext tool echo-wrapper
which might be called from shell scripts (i.e. ecryptfs-utils).

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 package/gettext-gnu/Config.in                      |   2 +-
 ...-format-not-a-string-literal-error-for-gc.patch |  55 ++++++++++
 package/gettext-tiny/Config.in                     |  18 ++++
 package/gettext-tiny/gettext-tiny.hash             |   5 +
 package/gettext-tiny/gettext-tiny.mk               | 114 +++++++++++++++++++++
 package/gettext-tiny/gettext-wrapper               |  24 +++++
 package/gettext/Config.in                          |   7 +-
 9 files changed, 221 insertions(+), 6 deletions(-)
 create mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
 create mode 100644 package/gettext-tiny/Config.in
 create mode 100644 package/gettext-tiny/gettext-tiny.hash
 create mode 100644 package/gettext-tiny/gettext-tiny.mk
 create mode 100644 package/gettext-tiny/gettext-wrapper

diff --git a/DEVELOPERS b/DEVELOPERS
index 3dfdf894d7..9446dfee3d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2197,6 +2197,7 @@ F:	package/tstools/
 
 N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
+F:	package/gettext-tiny/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
diff --git a/package/Config.in b/package/Config.in
index 31749a06a9..c04c57c643 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -154,6 +154,7 @@ menu "Development tools"
 	source "package/gawk/Config.in"
 	source "package/gettext/Config.in"
 	source "package/gettext-gnu/Config.in"
+	source "package/gettext-tiny/Config.in"
 	source "package/git/Config.in"
 	source "package/git-crypt/Config.in"
 	source "package/gperf/Config.in"
diff --git a/package/gettext-gnu/Config.in b/package/gettext-gnu/Config.in
index af5feed14b..27e7a3da4c 100644
--- a/package/gettext-gnu/Config.in
+++ b/package/gettext-gnu/Config.in
@@ -21,4 +21,4 @@ config BR2_PACKAGE_PROVIDES_GETTEXT
 endif
 
 config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
-	default "host-gettext-gnu"
+	default "host-gettext-gnu" if BR2_SYSTEM_ENABLE_NLS
diff --git a/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
new file mode 100644
index 0000000000..44cda55998
--- /dev/null
+++ b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
@@ -0,0 +1,55 @@
+From 34f631ce80700aa1eaadc032026f12f86584bd8a Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Mon, 31 Dec 2018 00:40:29 +0200
+Subject: [PATCH] gettext-tiny: Fix format not a string literal error
+
+Add 'format_arg' attribute for the functions which may return string
+as formatted parameter, otherwise it fails to compile on high versions
+of gcc.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ include/libintl.h | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/include/libintl.h b/include/libintl.h
+index b1af2b4..1883e1b 100644
+--- a/include/libintl.h
++++ b/include/libintl.h
+@@ -4,12 +4,27 @@
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+-char *gettext(const char *msgid);
+-char *dgettext(const char *domainname, const char *msgid);
+-char *dcgettext(const char *domainname, const char *msgid, int category);
+-char *ngettext(const char *msgid1, const char *msgid2, unsigned long n);
+-char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n);
+-char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category);
++/* _INTL_MAY_RETURN_STRING_ARG(n) declares that the given function may return
++ *    its n-th argument literally.  This enables GCC to warn for example about
++ *       printf (gettext ("foo %y")).  */
++#if defined __GNUC__ && __GNUC__ >= 3 && !(defined __APPLE_CC__ && __APPLE_CC__ > 1 && defined __cplusplus)
++# define _INTL_MAY_RETURN_STRING_ARG(n) __attribute__ ((__format_arg__ (n)))
++#else
++# define _INTL_MAY_RETURN_STRING_ARG(n)
++#endif
++
++char *gettext(const char *msgid)
++	_INTL_MAY_RETURN_STRING_ARG(1);
++char *dgettext(const char *domainname, const char *msgid)
++	_INTL_MAY_RETURN_STRING_ARG(2);
++char *dcgettext(const char *domainname, const char *msgid, int category)
++	_INTL_MAY_RETURN_STRING_ARG(2);
++char *ngettext(const char *msgid1, const char *msgid2, unsigned long n)
++	_INTL_MAY_RETURN_STRING_ARG(1) _INTL_MAY_RETURN_STRING_ARG(2);
++char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n)
++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
++char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category)
++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
+ 
+ char *textdomain(const char *domainname);
+ char *bind_textdomain_codeset(const char *domainname, const char *codeset);
+-- 
+2.14.1
+
diff --git a/package/gettext-tiny/Config.in b/package/gettext-tiny/Config.in
new file mode 100644
index 0000000000..6f91a00b09
--- /dev/null
+++ b/package/gettext-tiny/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_GETTEXT_TINY
+	bool
+	select BR2_PACKAGE_HAS_GETTEXT
+	help
+	  Stub and/or lightweight replacements of the gnu gettext
+	  suite; because the GNU one takes ages to compile.
+
+	  https://github.com/sabotage-linux/gettext-tiny
+
+if BR2_PACKAGE_GETTEXT_TINY
+
+config BR2_PACKAGE_PROVIDES_GETTEXT
+	default "gettext-tiny"
+
+endif
+
+config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
+	default "host-gettext-tiny" if !BR2_SYSTEM_ENABLE_NLS
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
new file mode 100644
index 0000000000..755f7f6ecf
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -0,0 +1,5 @@
+# Locally Computed:
+sha256 654dcd52f2650476c8822b60bee89c20a0aa7f6a1bf6001701eeacd71a9e388b  gettext-tiny-v0.3.1.tar.gz
+# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
+md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
+sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
new file mode 100644
index 0000000000..9efd798451
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -0,0 +1,114 @@
+################################################################################
+#
+# gettext-tiny
+#
+################################################################################
+
+GETTEXT_TINY_VERSION = v0.3.1
+GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
+GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
+GETTEXT_TINY_INSTALL_STAGING = YES
+GETTEXT_TINY_LICENSE_FILES = LICENSE, extra/COPYING
+GETTEXT_TINY_OPTS = LIBINTL=NOOP
+
+GETTEXT_TINY_PROVIDES = gettext
+
+# needed for gettextize
+GETTEXT_TINY_ARCHIVE_VERSION = 0.19.8
+
+GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
+	gettext-tools/misc/gettextize.in \
+	gettext-tools/po/Makevars.template \
+	gettext-runtime/m4/lock.m4 \
+	gettext-runtime/po/boldquot.sed \
+	gettext-runtime/po/en at boldquot.header \
+	gettext-runtime/po/en at quot.header \
+	gettext-runtime/po/insert-header.sin \
+	gettext-runtime/po/quot.sed \
+	gettext-runtime/po/remove-potcdate.sin \
+	gettext-runtime/po/Rules-quot \
+	gettext-runtime/po/Makefile.in.in \
+	COPYING
+
+HOST_GETTEXT_TINY_EXTRA_DOWNLOADS = $(GETTEXT_GNU_SITE)/$(GETTEXT_GNU_SOURCE)
+
+define HOST_GETTEXT_TINY_EXTRACT_GNU_GETTEXT
+	mkdir -p $(@D)/gettext-gnu
+	$(call suitable-extractor,$(GETTEXT_GNU_SOURCE)) \
+		$(GETTEXT_GNU_DL_DIR)/$(GETTEXT_GNU_SOURCE) | \
+		$(TAR) --strip-components=1 -C $(@D)/gettext-gnu $(TAR_OPTIONS) -
+endef
+HOST_GETTEXT_TINY_POST_EXTRACT_HOOKS += HOST_GETTEXT_TINY_EXTRACT_GNU_GETTEXT
+
+define HOST_GETTEXT_TINY_COPY_EXTRA_FILES
+	$(foreach f,$(GETTEXT_TINY_EXTRA_GETTEXT_FILES),\
+		$(INSTALL) -D -m 0644 $(@D)/gettext-gnu/$(f) $(@D)/extra/$(notdir $(f))
+	)
+	$(INSTALL) -D -m 0755 $(@D)/gettext-gnu/build-aux/config.rpath \
+		$(@D)/build-aux/config.rpath
+endef
+HOST_GETTEXT_TINY_POST_PATCH_HOOKS += HOST_GETTEXT_TINY_COPY_EXTRA_FILES
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+HOST_GETTEXT_TINY_DEPENDENCIES = libiconv
+endif
+
+define HOST_GETTEXT_TINY_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		$(GETTEXT_TINY_OPTS)
+
+	cp $(@D)/extra/gettextize.in $(@D)/gettextize
+
+	$(SED) 's, at PACKAGE@,gettext-tools,g;' $(@D)/gettextize
+	$(SED) 's, at VERSION@,$(GETTEXT_GNU_VERSION),g;' $(@D)/gettextize
+	$(SED) 's, at ARCHIVE_VERSION@,$(GETTEXT_TINY_ARCHIVE_VERSION),' $(@D)/gettextize
+	$(SED) 's, at prefix@,$(HOST_DIR),g;' $(@D)/gettextize
+	$(SED) 's, at datarootdir@,$${prefix}/share,g;' $(@D)/gettextize
+	$(SED) 's, at datadir@,$${prefix}/share,g;' $(@D)/gettextize
+	$(SED) 's, at PATH_SEPARATOR@,:,g;' $(@D)/gettextize
+	$(SED) 's, at RELOCATABLE@,no,g;' $(@D)/gettextize
+	$(SED) 's, at exec_prefix@,$${prefix},g;' $(@D)/gettextize
+	$(SED) 's, at bindir@,$${exec_prefix}/bin,g;' $(@D)/gettextize
+endef
+
+define HOST_GETTEXT_TINY_INSTALL_CMDS
+	$(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/po
+	$(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/m4
+
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		prefix=$(HOST_DIR) install
+
+	$(SED) '/read dummy/d' $(@D)/gettextize
+
+	$(INSTALL) -m 0755 -D $(@D)/gettextize $(HOST_DIR)/bin/gettextize
+	$(INSTALL) -m 0644 -D $(@D)/build-aux/config.rpath $(HOST_DIR)/share/gettext-tiny/config.rpath
+	$(INSTALL) -m 0644 -D $(@D)/extra/lock.m4 $(HOST_DIR)/share/gettext-tiny/m4/lock.m4
+	$(INSTALL) -m 0644 -D $(@D)/extra/Makefile.in.in $(HOST_DIR)/share/gettext-tiny/po/Makefile.in.in
+	$(INSTALL) -m 0644 -D $(@D)/extra/boldquot.sed $(HOST_DIR)/share/gettext-tiny/po/boldquot.sed
+	$(INSTALL) -m 0644 -D $(@D)/extra/en at boldquot.header $(HOST_DIR)/share/gettext-tiny/po/en at boldquot.header
+	$(INSTALL) -m 0644 -D $(@D)/extra/en at quot.header $(HOST_DIR)/share/gettext-tiny/po/en at quot.header
+	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sin $(HOST_DIR)/share/gettext-tiny/po/insert-header.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/quot.sed $(HOST_DIR)/share/gettext-tiny/po/quot.sed
+	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sin $(HOST_DIR)/share/gettext-tiny/po/remove-potcdate.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/Rules-quot $(HOST_DIR)/share/gettext-tiny/po/Rules-quot
+	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext-tiny/po/Makevars.template
+
+	$(Q)touch $(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
+endef
+
+# Install simple echo wrapper for gettext tool
+define GETTEXT_TINY_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(GETTEXT_TINY_PKGDIR)/gettext-wrapper $(TARGET_DIR)/usr/bin/gettext
+endef
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) \
+	     AUTOM4TE=$(HOST_DIR)/bin/autom4te \
+	     gettext_datadir=$(HOST_DIR)/usr/share/gettext-tiny \
+	     $(HOST_DIR)/bin/gettextize -f
+endif
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/gettext-tiny/gettext-wrapper b/package/gettext-tiny/gettext-wrapper
new file mode 100644
index 0000000000..3791a3a1aa
--- /dev/null
+++ b/package/gettext-tiny/gettext-wrapper
@@ -0,0 +1,24 @@
+#!/bin/sh
+#
+# Thanks to "Yann E. MORIN" <yann.morin.1998@free.fr>
+# for this gettext replacement.
+
+while [ ${#} -ne 0 ]; do
+    case "${1}" in
+        (-h)              printf "no help\n"; return 0;;
+        (-V)              printf "0.0.0\n"; return 0;;
+        (-d|--domain)     shift 2;;
+        (-d*|--domain=*)  shift 1;;
+        (-e|-E|-n)        shift 1;;
+        (-s)              shift 1;;  # Ignore?
+        (-*)              printf "invalid option '%s'\n" "${1}" >&2; return 1;;
+        (*)               break;;
+    esac
+done
+
+case ${#} in
+    (0)   printf "missing arguments\n" >&2; return 1;;
+    (1)   printf "%s" "${1}";;
+    (2)   shift; printf "%s" "${2}";;
+    (*)   printf "too many arguments\n" >&2; return 1;;
+esac
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index ba12d816ee..6d83388ce7 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_GETTEXT
 	bool "gettext"
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT_GNU
-
-comment "gettext needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT_GNU if BR2_SYSTEM_ENABLE_NLS
+	select BR2_PACKAGE_GETTEXT_TINY if !BR2_SYSTEM_ENABLE_NLS
 
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
-- 
2.14.1
