From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 21 Jan 2016 00:17:43 +0200
Subject: [Buildroot] [PATCH v4 1/5] package/cups: Un-deprecate,
	and update CUPS to 2.1.2
In-Reply-To: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1453328267-31962-2-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0001-fix-static.patch - Fixed upstream
Remove 0002-fix-stack-protector-check.patch - Fixed upstream
Remove 0003-mantohtml.patch - Replaced by 0001-Remove-man-from-BUILDDIRS-in-
configure.patch
Add 0002-Do-not-use-genstrings.patch
Add CUPS_PDFTOPS option to Config.in.legacy - This support was moved to the
cups-filters package.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 Config.in.legacy                                   |  7 +++
 ...01-Remove-man-from-BUILDDIRS-in-configure.patch | 28 ++++++++++++
 package/cups/0001-fix-static.patch                 | 28 ------------
 package/cups/0002-Do-not-use-genstrings.patch      | 30 +++++++++++++
 package/cups/0002-fix-stack-protector-check.patch  | 25 -----------
 package/cups/0003-mantohtml.patch                  | 11 -----
 package/cups/Config.in                             | 16 ++-----
 package/cups/cups.hash                             |  2 +
 package/cups/cups.mk                               | 50 ++++++++++++++--------
 9 files changed, 102 insertions(+), 95 deletions(-)
 create mode 100644 package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
 delete mode 100644 package/cups/0001-fix-static.patch
 create mode 100644 package/cups/0002-Do-not-use-genstrings.patch
 delete mode 100644 package/cups/0002-fix-stack-protector-check.patch
 delete mode 100644 package/cups/0003-mantohtml.patch
 create mode 100644 package/cups/cups.hash

diff --git a/Config.in.legacy b/Config.in.legacy
index 9111c01..793b116 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_CUPS_PDFTOPS
+	bool "Pdftops support has been removed from Cups"
+	select BR2_LEGACY
+	help
+	  Pdftops support has been removed from the cups package
+	  It is now part of the cups-filters package.
+
 config BR2_KERNEL_HEADERS_3_16
 	bool "kernel headers version 3.16.x are no longer supported"
 	select BR2_KERNEL_HEADERS_3_18
diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
new file mode 100644
index 0000000..253bd0e
--- /dev/null
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -0,0 +1,28 @@
+From a77bb18a5584bb23687ed3c522dbd91a9987d5a7 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Wed, 20 Jan 2016 22:13:11 +0200
+Subject: [PATCH] Remove man from BUILDDIRS in configure
+
+Removing it by using AUTORECONF and makedefs.in causes a lot of missing template errors
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 4170ff3..3879a75 100755
+--- a/configure
++++ b/configure
+@@ -5921,7 +5921,7 @@ fi
+ 
+ case "$COMPONENTS" in
+ 	all)
+-		BUILDDIRS="filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
++		BUILDDIRS="filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
+ 		;;
+ 
+ 	core)
+-- 
+2.5.0
+
diff --git a/package/cups/0001-fix-static.patch b/package/cups/0001-fix-static.patch
deleted file mode 100644
index 4c9d0d4..0000000
--- a/package/cups/0001-fix-static.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-cups: fix static linking
-
-Append -lz to the cups linking libs to fix a problem like this one:
-
-../cups/libcups.a(file.o): In function `cupsFileSeek':
-/home/test/test/1/output/build/cups-1.3.11/cups/file.c:1444: undefined 
-reference to `inflateEnd'
-collect2: error: ld returned 1 exit status
-make[2]: *** [ipp] Error 1
-make[2]: *** Waiting for unfinished jobs....
-
-This solution is the same used upstream in newer versions.
-
-Fixes:
-   http://autobuild.buildroot.net/results/f3d/f3d4f67ce7ee1d54f5bd4c87dfddb7417db614e5/
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---- cups-1.3.11/Makedefs.in.orig	2014-03-05 13:28:10.175437880 +0000
-+++ cups-1.3.11/Makedefs.in	2014-03-05 13:28:35.398845162 +0000
-@@ -132,7 +132,7 @@ LDFLAGS		=	-L../cups -L../filter @LDARCH
- LEGACY_BACKENDS	=	@LEGACY_BACKENDS@
- LIBCUPSORDER	=	@LIBCUPSORDER@
- LIBCUPSIMAGEORDER =	@LIBCUPSIMAGEORDER@
--LINKCUPS	=	@LINKCUPS@ $(SSLLIBS)
-+LINKCUPS	=	@LINKCUPS@ $(SSLLIBS) $(LIBZ)
- LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
- LIBS		=	$(LINKCUPS) $(COMMONLIBS)
- OPTIM		=	@OPTIM@
diff --git a/package/cups/0002-Do-not-use-genstrings.patch b/package/cups/0002-Do-not-use-genstrings.patch
new file mode 100644
index 0000000..03af0c8
--- /dev/null
+++ b/package/cups/0002-Do-not-use-genstrings.patch
@@ -0,0 +1,30 @@
+From a863814f6dadda054c964897210789eafff6f605 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Wed, 18 Mar 2015 20:33:41 +0200
+Subject: [PATCH] Do not use genstrings
+
+Using cross compiled genstrings while cross-compiling will break compilation.
+Genstrings is still compiled because some power users might want to do ppd
+compilation on their target machine, and for that they would need to use the
+native compiled genstrings binary, to generate a sample.c file for their target
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ ppdc/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ppdc/Makefile b/ppdc/Makefile
+index bc8bb64..f6bae25 100644
+--- a/ppdc/Makefile
++++ b/ppdc/Makefile
+@@ -243,7 +243,7 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+		libcupsppdc.a ../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) \
+		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
+	echo Generating localization strings...
+-	./genstrings >sample.c
++	#./genstrings >sample.c
+
+
+ #
+--
+1.9.1
diff --git a/package/cups/0002-fix-stack-protector-check.patch b/package/cups/0002-fix-stack-protector-check.patch
deleted file mode 100644
index 1db35ff..0000000
--- a/package/cups/0002-fix-stack-protector-check.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH]: use AC_TRY_LINK for stack protector check
-
-Actually try to link an executable to test for stack protector support,
-as gcc seems to accept the -fstack-protector argument even when it's
-compiled with --disable-libssp (but linking fails with a error
-finding -lssp_nonshared).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- config-scripts/cups-compiler.m4 |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: cups-1.3.9/config-scripts/cups-compiler.m4
-===================================================================
---- cups-1.3.9.orig/config-scripts/cups-compiler.m4
-+++ cups-1.3.9/config-scripts/cups-compiler.m4
-@@ -109,7 +109,7 @@ if test -n "$GCC"; then
- 	AC_MSG_CHECKING(if GCC supports -fstack-protector)
- 	OLDCFLAGS="$CFLAGS"
- 	CFLAGS="$CFLAGS -fstack-protector"
--	AC_TRY_COMPILE(,,
-+	AC_TRY_LINK(,,
- 		OPTIM="$OPTIM -fstack-protector"
- 		AC_MSG_RESULT(yes),
- 		AC_MSG_RESULT(no))
diff --git a/package/cups/0003-mantohtml.patch b/package/cups/0003-mantohtml.patch
deleted file mode 100644
index e6a10b0..0000000
--- a/package/cups/0003-mantohtml.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- cups-1.3.5/man/Makefile	2007-07-12 21:01:14.000000000 -0400
-+++ cups-1.3.5/man/Makefile	2008-02-11 08:55:24.000000000 -0500
-@@ -173,7 +173,7 @@ html:	$(MAN1) $(MAN5) $(MAN7) $(MAN8) ma
- 	done
- 
- mantohtml:	mantohtml.o
--	$(CC) $(LDFLAGS) -o $@ mantohtml.o
-+	gcc -I/usr/include -I../ -L/usr/lib mantohtml.c -o mantohtml
- 
- 
- #
diff --git a/package/cups/Config.in b/package/cups/Config.in
index 8e60221..3f5460c 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CUPS
 	bool "cups"
-	# serious security issues, needs upgrading
-	depends on BR2_DEPRECATED_SINCE_2015_05
+	# needs libstdcpp for ppdc
+	depends on BR2_INSTALL_LIBSTDCPP
 	# needs fork()
 	depends on BR2_USE_MMU
 	help
@@ -9,15 +9,5 @@ config BR2_PACKAGE_CUPS
 
 	  http://www.cups.org
 
-if BR2_PACKAGE_CUPS
-
-config BR2_PACKAGE_CUPS_PDFTOPS
-	bool "pdftops support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Enable pdftops support
-
-comment "pdftops support needs a toolchain w/ C++"
+comment "cups needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-
-endif
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
new file mode 100644
index 0000000..f38399f
--- /dev/null
+++ b/package/cups/cups.hash
@@ -0,0 +1,2 @@
+# Locally calculated:
+sha256 bab0ca3ba80eae48319b3a6b19a5b14fad5ce230f30151a0cfa4c0271df281ad  cups-2.1.2-source.tar.bz2
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index c028ef4..c07dcb4 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 1.3.11
+CUPS_VERSION = 2.1.2
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
 CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
 CUPS_LICENSE = GPLv2 LGPLv2
@@ -12,20 +12,24 @@ CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
+
 CUPS_CONF_OPTS = \
 	--without-perl \
 	--without-java \
 	--without-php \
-	--disable-gnutls \
 	--disable-gssapi \
 	--libdir=/usr/lib
 CUPS_CONFIG_SCRIPTS = cups-config
-
 CUPS_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_ZLIB),zlib) \
-	$(if $(BR2_PACKAGE_LIBPNG),libpng) \
-	$(if $(BR2_PACKAGE_JPEG),jpeg) \
-	$(if $(BR2_PACKAGE_TIFF),tiff)
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CUPS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system \
+	--enable-systemd
+CUPS_DEPENDENCIES += systemd
+else
+CUPS_CONF_OPTS += --disable-systemd
+endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 CUPS_CONF_OPTS += --enable-dbus
@@ -34,8 +38,11 @@ else
 CUPS_CONF_OPTS += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-CUPS_DEPENDENCIES += xlib_libX11
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+CUPS_CONF_OPTS += --enable-gnutls
+CUPS_DEPENDENCIES += gnutls
+else
+CUPS_CONF_OPTS += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
@@ -45,18 +52,25 @@ else
 CUPS_CONF_OPTS += --without-python
 endif
 
-ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
-CUPS_CONF_OPTS += --enable-pdftops
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+CUPS_CONF_OPTS += --enable-libusb
+CUPS_DEPENDENCIES += libusb
 else
-CUPS_CONF_OPTS += --disable-pdftops
+CUPS_CONF_OPTS += --disable-libusb
 endif
 
-# standard autoreconf fails with autoheader failures
-define CUPS_FIXUP_AUTOCONF
-	cd $(@D) && $(AUTOCONF)
-endef
-CUPS_DEPENDENCIES += host-autoconf
+ifeq ($(BR2_PACKAGE_LIBPAPER),y)
+CUPS_CONF_OPTS += --enable-libpaper
+CUPS_DEPENDENCIES += libpaper
+else
+CUPS_CONF_OPTS += --disable-libpaper
+endif
 
-CUPS_PRE_CONFIGURE_HOOKS += CUPS_FIXUP_AUTOCONF
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+CUPS_DEPENDENCIES += avahi
+CUPS_CONF_OPTS += --enable-avahi
+else
+CUPS_CONF_OPTS += --disable-avahi
+endif
 
 $(eval $(autotools-package))
-- 
2.5.0
