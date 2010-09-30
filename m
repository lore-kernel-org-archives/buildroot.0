From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Thu, 30 Sep 2010 20:38:32 +0200
Subject: [Buildroot] [PATCH] cups: updating to version 1.4.x and autotargets
In-Reply-To: <1285871912-11737-1-git-send-email-marcus.osdoba@googlemail.com>
References: <1285871912-11737-1-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <1285871912-11737-2-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch introduces
- new version 1.4.4

this patch fixes
- do not install libs under target/usr/lib64
- rename etc/init.d-skript from cups->S89cups (which makes it run by default inittab)
- build only 32bit (need to be sure if building on 64bit hosts)

problems encountered
- this version still builds some executables, which are launched during the
build process, if cross comiling, this won't work
e.g. man2html -> modifying former patch from cups 1.3.x
- ppdc runs during build process, this is not desired for cross compiling,
Open Embedded solved these issues with switching off these optional features,
patches for switching off running ppdc on host were borrowed from OE

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/cups/cups-configure.patch                 |  117 ++++++++++++++++++
 package/cups/cups-fix-stack-protector-check.patch |   25 ----
 package/cups/cups-mantohtml.patch                 |    8 +-
 package/cups/cups-no-tests-man.patch              |   13 --
 package/cups/cups-skip-tools.patch                |   51 ++++++++
 package/cups/cups.mk                              |  132 ++++++---------------
 6 files changed, 209 insertions(+), 137 deletions(-)
 create mode 100644 package/cups/cups-configure.patch
 delete mode 100644 package/cups/cups-fix-stack-protector-check.patch
 delete mode 100644 package/cups/cups-no-tests-man.patch
 create mode 100644 package/cups/cups-skip-tools.patch

diff --git a/package/cups/cups-configure.patch b/package/cups/cups-configure.patch
new file mode 100644
index 0000000..877e8d3
--- /dev/null
+++ b/package/cups/cups-configure.patch
@@ -0,0 +1,117 @@
+--- cups-1.4.3/configure.orig	2010-04-08 11:14:19.092296014 +0200
++++ cups-1.4.3/configure	2010-04-08 11:19:02.661417938 +0200
+@@ -10940,114 +10940,6 @@
+     		OPTIM="-fPIC $OPTIM"
+ 	fi
+ 
+-	# The -fstack-protector option is available with some versions of
+-	# GCC and adds "stack canaries" which detect when the return address
+-	# has been overwritten, preventing many types of exploit attacks.
+-	{ echo "$as_me:$LINENO: checking if GCC supports -fstack-protector" >&5
+-echo $ECHO_N "checking if GCC supports -fstack-protector... $ECHO_C" >&6; }
+-	OLDCFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -fstack-protector"
+-	cat >conftest.$ac_ext <<_ACEOF
+-/* confdefs.h.  */
+-_ACEOF
+-cat confdefs.h >>conftest.$ac_ext
+-cat >>conftest.$ac_ext <<_ACEOF
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-rm -f conftest.$ac_objext conftest$ac_exeext
+-if { (ac_try="$ac_link"
+-case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_link") 2>conftest.er1
+-  ac_status=$?
+-  grep -v '^ *+' conftest.er1 >conftest.err
+-  rm -f conftest.er1
+-  cat conftest.err >&5
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); } && {
+-	 test -z "$ac_c_werror_flag" ||
+-	 test ! -s conftest.err
+-       } && test -s conftest$ac_exeext &&
+-       $as_test_x conftest$ac_exeext; then
+-  OPTIM="$OPTIM -fstack-protector"
+-		{ echo "$as_me:$LINENO: result: yes" >&5
+-echo "${ECHO_T}yes" >&6; }
+-else
+-  echo "$as_me: failed program was:" >&5
+-sed 's/^/| /' conftest.$ac_ext >&5
+-
+-	{ echo "$as_me:$LINENO: result: no" >&5
+-echo "${ECHO_T}no" >&6; }
+-fi
+-
+-rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
+-      conftest$ac_exeext conftest.$ac_ext
+-	CFLAGS="$OLDCFLAGS"
+-
+-	# The -pie option is available with some versions of GCC and adds
+-	# randomization of addresses, which avoids another class of exploits
+-	# that depend on a fixed address for common functions.
+-	{ echo "$as_me:$LINENO: checking if GCC supports -pie" >&5
+-echo $ECHO_N "checking if GCC supports -pie... $ECHO_C" >&6; }
+-	OLDCFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -pie -fPIE"
+-	cat >conftest.$ac_ext <<_ACEOF
+-/* confdefs.h.  */
+-_ACEOF
+-cat confdefs.h >>conftest.$ac_ext
+-cat >>conftest.$ac_ext <<_ACEOF
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-rm -f conftest.$ac_objext
+-if { (ac_try="$ac_compile"
+-case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_compile") 2>conftest.er1
+-  ac_status=$?
+-  grep -v '^ *+' conftest.er1 >conftest.err
+-  rm -f conftest.er1
+-  cat conftest.err >&5
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); } && {
+-	 test -z "$ac_c_werror_flag" ||
+-	 test ! -s conftest.err
+-       } && test -s conftest.$ac_objext; then
+-  PIEFLAGS="-pie -fPIE"
+-		{ echo "$as_me:$LINENO: result: yes" >&5
+-echo "${ECHO_T}yes" >&6; }
+-else
+-  echo "$as_me: failed program was:" >&5
+-sed 's/^/| /' conftest.$ac_ext >&5
+-
+-	{ echo "$as_me:$LINENO: result: no" >&5
+-echo "${ECHO_T}no" >&6; }
+-fi
+-
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-	CFLAGS="$OLDCFLAGS"
+-
+ 	if test "x$with_optim" = x; then
+ 		# Add useful warning options for tracking down problems...
+ 		OPTIM="-Wall -Wno-format-y2k $OPTIM"
diff --git a/package/cups/cups-fix-stack-protector-check.patch b/package/cups/cups-fix-stack-protector-check.patch
deleted file mode 100644
index 1db35ff..0000000
--- a/package/cups/cups-fix-stack-protector-check.patch
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
diff --git a/package/cups/cups-mantohtml.patch b/package/cups/cups-mantohtml.patch
index e6a10b0..0b24573 100644
--- a/package/cups/cups-mantohtml.patch
+++ b/package/cups/cups-mantohtml.patch
@@ -1,10 +1,10 @@
---- cups-1.3.5/man/Makefile	2007-07-12 21:01:14.000000000 -0400
-+++ cups-1.3.5/man/Makefile	2008-02-11 08:55:24.000000000 -0500
-@@ -173,7 +173,7 @@ html:	$(MAN1) $(MAN5) $(MAN7) $(MAN8) ma
+--- cups-1.4.4.orig/man/Makefile	2007-07-12 21:01:14.000000000 -0400
++++ cups-1.4.4/man/Makefile	2008-02-11 08:55:24.000000000 -0500
+@@ -230,7 +230,7 @@ html:	$(MAN1) $(MAN5) $(MAN7) $(MAN8) ma
  	done
  
  mantohtml:	mantohtml.o
--	$(CC) $(LDFLAGS) -o $@ mantohtml.o
+-	$(CC) $(ARCHFLAGS) $(LDFLAGS) -o $@ mantohtml.o
 +	gcc -I/usr/include -I../ -L/usr/lib mantohtml.c -o mantohtml
  
  
diff --git a/package/cups/cups-no-tests-man.patch b/package/cups/cups-no-tests-man.patch
deleted file mode 100644
index 567c801..0000000
--- a/package/cups/cups-no-tests-man.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- cups-1.3.5/Makefile	2007-12-06 15:09:39.000000000 -0500
-+++ cups-1.3.5/Makefile	2008-02-09 21:53:03.000000000 -0500
-@@ -19,8 +19,8 @@ include Makedefs
- # Directories to make...
- #
- 
--DIRS	=	cups backend berkeley cgi-bin filter locale man monitor \
--		notifier $(PDFTOPS) scheduler systemv test \
-+DIRS	=	cups backend berkeley cgi-bin filter locale monitor \
-+		notifier $(PDFTOPS) scheduler systemv \
- 		$(PHPDIR) \
- 		conf data doc $(FONTS) ppd templates
- 
diff --git a/package/cups/cups-skip-tools.patch b/package/cups/cups-skip-tools.patch
new file mode 100644
index 0000000..ed95583
--- /dev/null
+++ b/package/cups/cups-skip-tools.patch
@@ -0,0 +1,51 @@
+--- cups-1.4.3.orig/ppdc/Makefile.orig	2010-04-07 12:38:56.650327699 +0200
++++ cups-1.4.3/ppdc/Makefile	2010-04-07 12:40:05.842418876 +0200
+@@ -243,8 +243,8 @@
+ 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
+ 		libcupsppdc.a ../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) \
+ 		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
+-	echo Generating localization strings...
+-	./genstrings >sample.c
++#	echo Generating localization strings...
++#	./genstrings >sample.c
+ 
+ 
+ #
+@@ -261,9 +261,9 @@
+ 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
+ 		../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
+ 		$(COMMONLIBS) $(LIBZ)
+-	echo Testing PPD compiler...
+-	./ppdc-static -l en,fr -I ../data foo.drv
+-	./ppdc-static -l en,fr -z -I ../data foo.drv
++#	echo Testing PPD compiler...
++#	./ppdc-static -l en,fr -I ../data foo.drv
++#	./ppdc-static -l en,fr -z -I ../data foo.drv
+ 
+ 
+ #
+@@ -291,15 +291,15 @@
+ 		$(COMMONLIBS) $(LIBZ)
+ 	echo Testing PPD importer...
+ 	$(RM) -r ppd ppd2 sample-import.drv
+-	./ppdc-static -I ../data sample.drv
+-	./ppdi-static -I ../data -o sample-import.drv ppd/*
+-	./ppdc-static -I ../data -d ppd2 sample-import.drv
+-	if diff -qr ppd ppd2; then \
+-		echo PPD import OK; \
+-	else \
+-		echo PPD import FAILED; \
+-		exit 1; \
+-	fi
++#	./ppdc-static -I ../data sample.drv
++#	./ppdi-static -I ../data -o sample-import.drv ppd/*
++#	./ppdc-static -I ../data -d ppd2 sample-import.drv
++#	if diff -qr ppd ppd2; then \
++#		echo PPD import OK; \
++#	else \
++#		echo PPD import FAILED; \
++#		exit 1; \
++#	fi
+ 
+ 
+ #
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 776fb57..886d90a 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -3,13 +3,27 @@
 # cups
 #
 ################################################################################
-CUPS_VERSION = 1.3.9
-CUPS_NAME = cups-$(CUPS_VERSION)
-CUPS_DIR = $(BUILD_DIR)/$(CUPS_NAME)
-CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
-CUPS_SOURCE:=$(CUPS_NAME)-source.tar.bz2
-CUPS_DESTDIR:=$(STAGING_DIR)/usr/lib
-CUPS_CAT:=$(BZCAT)
+CUPS_MAJORVERSION = 1.4
+CUPS_VERSION      = $(CUPS_MAJORVERSION).4
+CUPS_SITE         = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
+CUPS_SOURCE       = cups-$(CUPS_VERSION)-source.tar.bz2
+CUPS_CONF_OPT = --enable-shared --disable-doc
+CUPS_CONF_OPT += --without-java
+CUPS_CONF_OPT += --disable-64bit
+CUPS_CONF_OPT += --without-arch64flags
+# at least for amd64 squeeze, cups installed the libs under usr/lib64
+# even after disabeling 64bit above,
+# the strip command showed ELF 32bit ARM 
+# - so make sure to install them really in usr/lib (not lib64)
+CUPS_CONF_OPT += --libdir=/usr/lib
+# cups would be the first package, which uses /usr/var
+# for reasons of simplicity,
+# this points to /var for small systems built with buildroot
+CUPS_CONF_OPT += --localstatedir=/var
+
+CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
+
+CUPS_LIBTOOL_PATCH = YES
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	CUPS_CONF_OPT += --enable-dbus
@@ -22,40 +36,26 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 	CUPS_DEPENDENCIES += xlib_libX11
 endif
 
-CUPS_CONF_OPT +=	--disable-perl
-CUPS_CONF_OPT +=	--disable-java
-CUPS_CFLAGS = $(TARGET_CFLAGS)
-
-
 ifeq ($(BR2_PACKAGE_PERL),disabled)	# We do not provide perl (yet)
-	CUPS_CONF_ENV +=	ac_cv_path_perl=$(STAGING_DIR)/usr/bin/perl
-	CUPS_CONF_OPT +=	--with-perl
-	CUPS_DEPENDENCIES +=	microperl
+	CUPS_CONF_ENV += ac_cv_path_perl=$(STAGING_DIR)/usr/bin/perl
+	CUPS_CONF_OPT += --with-perl
+	CUPS_DEPENDENCIES += microperl
 else
-	CUPS_CONF_OPT +=	--disable-perl
+	CUPS_CONF_OPT += --without-perl
 endif
 
 ifeq ($(BR2_PACKAGE_PHP),y)
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/main
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/regex
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/TSRM
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/Zend
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/ext
-	CUPS_CONF_ENV +=	ac_cv_path_php=$(STAGING_DIR)/usr/bin/php
-	CUPS_CONF_OPT +=	--with-php
-	CUPS_DEPENDENCIES +=	php
+	CUPS_CONF_OPT += --with-php
+	CUPS_DEPENDENCIES += php
 else
-	CUPS_CONF_OPT +=	--disable-php
+	CUPS_CONF_OPT += --without-php
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-	CUPS_CONF_ENV +=	ac_cv_path_python=$(STAGING_DIR)/usr/bin/python
-	CUPS_CONF_OPT +=	--with-python
-	CUPS_DEPENDENCIES +=	python
+	CUPS_CONF_OPT += --with-python
+	CUPS_DEPENDENCIES += python
 else
-	CUPS_CONF_OPT +=	--disable-python
+	CUPS_CONF_OPT += --without-python
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
@@ -64,68 +64,10 @@ else
 	CUPS_CONF_OPT += --disable-pdftops
 endif
 
-$(DL_DIR)/$(CUPS_SOURCE):
-	 $(call DOWNLOAD,$(CUPS_SITE),$(CUPS_SOURCE))
-
-$(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
-	$(CUPS_CAT) $(DL_DIR)/$(CUPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(CUPS_DIR) package/cups/ \*.patch
-	$(CONFIG_UPDATE) $(CUPS_DIR)
-	touch $@
-
-$(CUPS_DIR)/.configured: $(CUPS_DIR)/.unpacked
-	cd $(CUPS_DIR) && $(AUTOCONF)
-	(cd $(CUPS_DIR) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(CUPS_CONF_ENV) \
-		CFLAGS="$(CUPS_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--with-config-file-path=/etc \
-		--disable-gnutls \
-		--disable-gssapi \
-		$(CUPS_CONF_OPT) \
-		)
-	touch $@
-
-$(CUPS_DIR)/.compiled: $(CUPS_DIR)/.configured
-	$(MAKE) CFLAGS="$(CUPS_CFLAGS)" -C $(CUPS_DIR) cups backend berkeley cgi-bin filter \
-	locale monitor notifier pdftops scheduler systemv scripting/php \
-	conf data doc fonts ppd templates
-	touch $@
-
-$(CUPS_DIR)/.installed: $(CUPS_DIR)/.compiled
-	$(MAKE) -C $(CUPS_DIR) DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
-	$(MAKE) -C $(CUPS_DIR) DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/cups-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/cups-config
-	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/cups-config
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/cups-config
-	touch $@
-
-cups: host-autoconf $(CUPS_DEPENDENCIES) $(CUPS_DIR)/.installed
-
-cups-source: $(DL_DIR)/$(CUPS_SOURCE)
-
-cups-clean:
-	-$(MAKE) -C $(CUPS_DIR) clean
-
-cups-dirclean:
-	rm -fr $(CUPS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_CUPS),y)
-TARGETS+=cups
-endif
+define CUPS_RENAME_INIT_SKRIPT_INSTALL
+        $(call MESSAGE,"Renaming skript named 'cups' in etc/init.d to 'SXXcups'")
+        mv $(TARGET_DIR)/etc/init.d/cups $(TARGET_DIR)/etc/init.d/S89cups
+endef
+CUPS_POST_INSTALL_TARGET_HOOKS += CUPS_RENAME_INIT_SKRIPT_INSTALL
 
+$(eval $(call AUTOTARGETS,package,cups))
-- 
1.7.1
