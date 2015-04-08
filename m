From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed,  8 Apr 2015 09:56:11 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/cups: Un-deprecate,
	and update CUPS to 2.0.2
Message-ID: <1428479774-29241-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0001-fix-static.patch - Fixed upstream
Remove 0002-fix-stack-protector-check.patch - Fixed upstream
Remove 0003-mantohtml.patch - Replaced by 0001-Remove-building-html-from-man-
makefile.patch
Add 0002-Do-not-use-genstrings.patch

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

Changes v2 -> v3:
Removed --{enable,disable}-{shared,static}
Removed dependency on cups-filters (run-time dependency)
Add comment for dependency on LIBSTDCPP
Deprecate CUPS_PDFTOPS
Correct Avahi option selection check to BR2_PACKAGE_CUPS_AVAHI
Genstrings patch left as is.  Genstrings could be run from target
command line if sample.c is needed for ppd compiler.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 ...01-Remove-building-html-from-man-makefile.patch | 28 ++++++++++++++
 package/cups/0001-fix-static.patch                 | 28 --------------
 package/cups/0002-Do-not-use-genstrings.patch      | 27 +++++++++++++
 package/cups/0002-fix-stack-protector-check.patch  | 25 ------------
 package/cups/0003-mantohtml.patch                  | 11 ------
 package/cups/Config.in                             | 19 ++++++----
 package/cups/cups.hash                             |  2 +
 package/cups/cups.mk                               | 44 +++++++++++++---------
 8 files changed, 95 insertions(+), 89 deletions(-)
 create mode 100644 package/cups/0001-Remove-building-html-from-man-makefile.patch
 delete mode 100644 package/cups/0001-fix-static.patch
 create mode 100644 package/cups/0002-Do-not-use-genstrings.patch
 delete mode 100644 package/cups/0002-fix-stack-protector-check.patch
 delete mode 100644 package/cups/0003-mantohtml.patch
 create mode 100644 package/cups/cups.hash

diff --git a/package/cups/0001-Remove-building-html-from-man-makefile.patch b/package/cups/0001-Remove-building-html-from-man-makefile.patch
new file mode 100644
index 0000000..05e8a54
--- /dev/null
+++ b/package/cups/0001-Remove-building-html-from-man-makefile.patch
@@ -0,0 +1,28 @@
+From da960a1384625d2550ffbf5765a10fe9b3aa5a51 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Wed, 18 Mar 2015 20:30:39 +0200
+Subject: [PATCH 1/2] Remove building html from man makefile
+
+Building and using mantohtml causes problems for cross-compiling
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ man/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/man/Makefile b/man/Makefile
+index dc1a8c0..0ad42a1 100644
+--- a/man/Makefile
++++ b/man/Makefile
+@@ -73,7 +73,7 @@ MAN8	=	cupsaccept.$(MAN8EXT) \
+ # Make everything...
+ #
+ 
+-all:	$(MAN1) $(MAN5) $(MAN7) $(MAN8) html
++all:	$(MAN1) $(MAN5) $(MAN7) $(MAN8)
+ 
+ 
+ #
+-- 
+1.9.1
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
index 0000000..e5b2de3
--- /dev/null
+++ b/package/cups/0002-Do-not-use-genstrings.patch
@@ -0,0 +1,27 @@
+From a863814f6dadda054c964897210789eafff6f605 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Wed, 18 Mar 2015 20:33:41 +0200
+Subject: [PATCH 2/2] Do not use genstrings
+
+Using cross compiled genstrings while cross-compiling will break compilation.
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
index 8e60221..d89c86b 100644
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
@@ -13,11 +13,16 @@ if BR2_PACKAGE_CUPS
 
 config BR2_PACKAGE_CUPS_PDFTOPS
 	bool "pdftops support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Enable pdftops support
+	depends on BR2_DEPRECATED_SINCE_2015_05
 
-comment "pdftops support needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+config BR2_PACKAGE_CUPS_AVAHI
+	bool "avahi support"
+	depends on !BR2_STATIC_LIBS # avahi
+	depends on !BR2_TOOLCHAIN_HAS_THREADS # avahi
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	help
+	  Enable Avahi support.
+	  Select this if you want cups to support Bonjour protocol.
 
 endif
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
new file mode 100644
index 0000000..8e99ea8
--- /dev/null
+++ b/package/cups/cups.hash
@@ -0,0 +1,2 @@
+# From https://www.cups.org/
+md5	6e0ea72dbafcf5baaa1cf4178e71096d	cups-2.0.2-source.tar.bz2
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index c028ef4..da199d5 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 1.3.11
+CUPS_VERSION = 2.0.2
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
 CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
 CUPS_LICENSE = GPLv2 LGPLv2
@@ -16,16 +16,14 @@ CUPS_CONF_OPTS = \
 	--without-perl \
 	--without-java \
 	--without-php \
-	--disable-gnutls \
 	--disable-gssapi \
 	--libdir=/usr/lib
 CUPS_CONFIG_SCRIPTS = cups-config
 
-CUPS_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_ZLIB),zlib) \
-	$(if $(BR2_PACKAGE_LIBPNG),libpng) \
-	$(if $(BR2_PACKAGE_JPEG),jpeg) \
-	$(if $(BR2_PACKAGE_TIFF),tiff)
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CUPS_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
+CUPS_DEPENDENCIES += systemd
+endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 CUPS_CONF_OPTS += --enable-dbus
@@ -34,8 +32,11 @@ else
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
@@ -45,18 +46,25 @@ else
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
+ifeq ($(BR2_PACKAGE_CUPS_AVAHI),y)
+CUPS_DEPENDENCIES += avahi
+CUPS_CONF_OPTS += --enable-avahi
+else
+CUPS_CONF_OPTS += --disable-avahi
+endif
 
 $(eval $(autotools-package))
-- 
1.9.1
