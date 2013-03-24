From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Mar 2013 23:50:45 +0100
Subject: [Buildroot] [PATCH 10/14] Added package Gutenprint
In-Reply-To: <cover.1364165310.git.yann.morin.1998@free.fr>
References: <cover.1364165310.git.yann.morin.1998@free.fr>
Message-ID: <639aebbbbadcf25a5e814763c5bef25ae68d1485.1364165310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Olivier Schonken <olivier.schonken@gmail.com>

Gutenprint, formerly named Gimp-Print, is a suite of printer
drivers that may be used with most common UNIX print spooling
systems, including CUPS, lpr, LPRng, or others

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
[yann.morin.1998 at free.fr: needs libiconv, cleanup]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |    1 +
 package/gutenprint/Config.in                       |   14 ++++
 .../gutenprint-000-use-pregen-xmli18n-header.patch |   48 +++++++++++++
 package/gutenprint/gutenprint.mk                   |   73 ++++++++++++++++++++
 4 files changed, 136 insertions(+), 0 deletions(-)
 create mode 100644 package/gutenprint/Config.in
 create mode 100644 package/gutenprint/gutenprint-000-use-pregen-xmli18n-header.patch
 create mode 100644 package/gutenprint/gutenprint.mk

diff --git a/package/Config.in b/package/Config.in
index 74537e4..5d8f4f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -646,6 +646,7 @@ source "package/ctorrent/Config.in"
 source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
 source "package/foomatic-filters/Config.in"
+source "package/gutenprint/Config.in"
 source "package/hplip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
new file mode 100644
index 0000000..eb06efd
--- /dev/null
+++ b/package/gutenprint/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_GUTENPRINT
+	bool "gutenprint"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Gutenprint, formerly named Gimp-Print, is a suite of printer
+	  drivers that may be used with most common UNIX print spooling
+	  systems, including CUPS, lpr, LPRng, or others
+
+	  http://gimp-print.sourceforge.net/
+
+comment "gutenprint requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gutenprint/gutenprint-000-use-pregen-xmli18n-header.patch b/package/gutenprint/gutenprint-000-use-pregen-xmli18n-header.patch
new file mode 100644
index 0000000..533fe33
--- /dev/null
+++ b/package/gutenprint/gutenprint-000-use-pregen-xmli18n-header.patch
@@ -0,0 +1,48 @@
+src/xml: use preg-gen xmli18n_tmp.h if specified
+
+Ideally, the programs needed at build-time should be built with
+CC_FOR_BUILD, and not with CC_FOR_HOST.
+
+Unfortunately, this program wants to link against the gutenprint libs,
+so we would also need to build them with CC_FOR_HOST, that is build them
+twice, once for build, once for host.
+
+Instead, in the Buildroot context, we first build gutenprint for the build
+system, use that to generate the incriminated header, and then re-use that
+header to build the gutenprint for the host.
+
+It is not possible to have such constructs in Makefile.am:
+    ifeq ($(FOO),)
+    bar: bla
+        cat $< >$@
+    else
+    bar:
+        echo $(FOO) >$@
+    endif
+
+as autoreconf will yell loudly that there is an 'endif' without an 'if'.
+Sigh... :-(
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN gutenprint-5.2.9.orig/src/xml/Makefile.am gutenprint-5.2.9/src/xml/Makefile.am
+--- gutenprint-5.2.9.orig/src/xml/Makefile.am	2011-03-30 02:43:24.000000000 +0200
++++ gutenprint-5.2.9/src/xml/Makefile.am	2013-03-24 17:08:08.435918773 +0100
+@@ -52,10 +52,13 @@
+ 
+ 
+ xmli18n-tmp.h: xml-stamp extract-strings
+-	-rm -f $@ $@.tmp
+-	./extract-strings `cat xml-stamp | sed -e 's;^;$(srcdir)/;'` > $@.tmp
+-	mv $@.tmp $@
+-
++	if [ -z "$(BR2_USE_PREGEN_XMLI18N_TMP_H)" ]; then \
++	    rm -f $@ $@.tmp; \
++	    ./extract-strings `cat xml-stamp | sed -e 's;^;$(srcdir)/;'` > $@.tmp; \
++	    mv $@.tmp $@; \
++	else \
++	    cp $(BR2_USE_PREGEN_XMLI18N_TMP_H) $@; \
++	fi
+ 
+ dist-hook: xmli18n-tmp.h xml-stamp
+ # xmli18n-tmp.h is needed by po/POTFILES.in at dist time
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
new file mode 100644
index 0000000..138c3ff
--- /dev/null
+++ b/package/gutenprint/gutenprint.mk
@@ -0,0 +1,73 @@
+#############################################################
+#
+# gutenprint
+#
+#############################################################
+
+GUTENPRINT_VERSION = 5.2.9
+GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
+GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
+GUTENPRINT_LIBTOOL_PATCH = YES
+
+# Needed, as we touch Makefile.am
+GUTENPRINT_AUTORECONF = YES
+
+GUTENPRINT_DEPENDENCIES = cups $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+# host-gutenprint is needed to generate XML as part of compilation
+# the program that generates the xml also links against libgutenprint
+# so we ened to build both a host package and a target package
+GUTENPRINT_DEPENDENCIES += host-gutenprint
+
+GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
+                      --disable-samples \
+                      --without-gimp2 \
+                      --without-foomatic \
+                      --without-foomatic3 \
+                      --prefix=/usr \
+                      --disable-escputil \
+                      --disable-test \
+                      --disable-testpattern \
+                      --with-cups="/usr" \
+                      --with-sysroot="$(STAGING_DIR)" \
+                      --disable-cups-ppds
+
+# USE_PREGEN_XMLI18N_TMP_H is added by our patch
+GUTENPRINT_MAKE_ENV = BR2_USE_PREGEN_XMLI18N_TMP_H=$(HOST_DIR)/usr/include/xmli18n-tmp.h
+
+# We have no host dependencies
+HOST_GUTENPRINT_DEPENDENCIES =
+# The host-gutenprint shall create the required header
+HOST_GUTENPRINT_MAKE_ENV =
+
+HOST_GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
+                           --disable-samples \
+                           --without-gimp2 \
+                           --without-doc \
+                           --disable-nls \
+                           --disable-nls-macos \
+                           --without-foomatic \
+                           --without-foomatic3 \
+                           --disable-escputil \
+                           --disable-test \
+                           --disable-testpattern
+
+# Needed by autoreconf
+define GUTENPRINT_CREATE_M4_DIR
+	mkdir -p $(@D)/m4local
+endef
+GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
+
+define HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
+	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/usr/include
+endef
+HOST_GUTENPRINT_POST_BUILD_HOOKS += HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
+
+define GUTENPRINT_POST_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/usr/share/gutenprint/5.2
+	cp -rf $(HOST_DIR)/usr/share/gutenprint/5.2/xml $(TARGET_DIR)/usr/share/gutenprint/5.2
+endef
+GUTENPRINT_POST_INSTALL_TARGET_HOOKS += GUTENPRINT_POST_INSTALL_TARGET_FIXUP
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.2.5
