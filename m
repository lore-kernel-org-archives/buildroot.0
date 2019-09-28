From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 08:56:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.3.0
Message-ID: <20190928065611.25788-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update first, second and fourth patches
- Update license to Apache-2.0 with GPL2/LGPL2 exception, see:
  https://github.com/apple/cups/commit/e310189747c161ac6e737eedadf8f45d11bf2253
  https://github.com/apple/cups/commit/7b6d49eec95fef100d017df6f1f577c72ca60577
- Remove CUPS_INSTALL_{STAGING,TARGET}_OPTS as setting DSTROOT is not
  needed since
  https://github.com/apple/cups/commit/083672b18ce39071613f0924df904ef91b65ded2
- --{with,without}-{java,perl,php,python} are not supported anymore:
  https://github.com/apple/cups/commit/98491ecc6fb571869d0947096982a64d6ec16a7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...emove-man-from-BUILDDIRS-in-configure.patch |  6 ++++--
 package/cups/0002-Do-not-use-genstrings.patch  |  8 +++++---
 .../0004-Remove-PIE-flags-from-the-build.patch | 18 ++++++++++--------
 package/cups/cups.hash                         |  5 +++--
 package/cups/cups.mk                           | 18 +++---------------
 5 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index 30002d3c8f..b1ab7cbace 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -4,6 +4,8 @@ Date: Sun, 29 May 2016 19:31:50 +0200
 Subject: [PATCH] Remove man from BUILDDIRS in configure
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Fabrice: updated for 2.3.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  config-scripts/cups-common.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -16,8 +18,8 @@ index fbba715..77d0f5c 100644
  
  case "$COMPONENTS" in
  	all)
--		BUILDDIRS="filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
-+		BUILDDIRS="filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
+-		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
++		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
  		;;
  
  	core)
diff --git a/package/cups/0002-Do-not-use-genstrings.patch b/package/cups/0002-Do-not-use-genstrings.patch
index 325483ea8f..b3566b8b15 100644
--- a/package/cups/0002-Do-not-use-genstrings.patch
+++ b/package/cups/0002-Do-not-use-genstrings.patch
@@ -14,6 +14,8 @@ Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 it, remove useless and potentially confusing 'echo' before the
 genstrings call.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Fabrice: updated for 2.3.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  ppdc/Makefile | 2 --
  1 file changed, 2 deletions(-)
@@ -23,9 +25,9 @@ index 68bf6b2..d57a0c9 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
 @@ -242,8 +242,6 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
- 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
- 		libcupsppdc.a ../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) \
- 		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
+	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
+		libcupsppdc.a $(LINKCUPSSTATIC)
+	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
 -	echo Generating localization strings...
 -	./genstrings >sample.c
  
diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
index ea4f0b4a59..8401e133e9 100644
--- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
+++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
@@ -11,6 +11,8 @@ solve this, we simply disable the PIE flags.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+[Fabrice: updated for 2.3.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makedefs.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -20,14 +22,14 @@ index 3afef0a..299b297 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
 @@ -148,7 +148,7 @@ IPPFIND_BIN	=	@IPPFIND_BIN@
- IPPFIND_MAN	=	@IPPFIND_MAN@
- LDFLAGS		=	-L../cgi-bin -L../cups -L../filter -L../ppdc \
- 			-L../scheduler @LDARCHFLAGS@ \
--			@LDFLAGS@ @RELROFLAGS@ @PIEFLAGS@ $(OPTIM)
-+			@LDFLAGS@ @RELROFLAGS@ $(OPTIM)
- LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(SSLLIBS) $(LIBZ)
- LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
- LIBS		=	$(LINKCUPS) $(COMMONLIBS)
+ 			$(ONDEMANDFLAGS) $(OPTIONS)
+ ALL_DSOFLAGS	=	-L../cups @ARCHFLAGS@ @RELROFLAGS@ $(DSOFLAGS) $(OPTIM)
+ ALL_LDFLAGS	=	-L../cups @LDARCHFLAGS@ @RELROFLAGS@ $(LDFLAGS)  \
+-			@PIEFLAGS@ $(OPTIM)
++			$(OPTIM)
+ ARCHFLAGS	=	@ARCHFLAGS@
+ ARFLAGS		=	@ARFLAGS@
+ BACKLIBS	=	@BACKLIBS@
 -- 
 2.7.4
 
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index d75387c405..5cc758f519 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,3 +1,4 @@
 # Locally calculated:
-sha256 0f61ab449e4748a24c6ab355b481ff7691247a140d327b2b7526fce34b7f9aa8  cups-2.2.12-source.tar.gz
-sha256 6e0e0ffbde118aae709f7ef65590de9071e8b2cd322f84fd645c6b64f3cc452c  LICENSE.txt
+sha256 acaf0229cf008ea8f06353ffd1bbd62d71dbe88990dd3330650ef87edb95a1a5  cups-2.3.0-source.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256 a5d616e6322a9cb1a971e18765025edfca4f3cd9c0eafc32d6d2eb4b8c8787b5  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 21e4c221fb..bc2913b428 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.2.12
+CUPS_VERSION = 2.3.0
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
-CUPS_LICENSE = GPL-2.0, LGPL-2.0
-CUPS_LICENSE_FILES = LICENSE.txt
+CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+CUPS_LICENSE_FILES = LICENSE NOTICE
 CUPS_INSTALL_STAGING = YES
-CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
-CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
 
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
 define CUPS_RUN_AUTOCONF
@@ -20,9 +18,6 @@ endef
 CUPS_PRE_CONFIGURE_HOOKS += CUPS_RUN_AUTOCONF
 
 CUPS_CONF_OPTS = \
-	--without-perl \
-	--without-java \
-	--without-php \
 	--disable-gssapi \
 	--disable-pam \
 	--libdir=/usr/lib
@@ -54,13 +49,6 @@ else
 CUPS_CONF_OPTS += --disable-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-CUPS_CONF_OPTS += --with-python
-CUPS_DEPENDENCIES += python
-else
-CUPS_CONF_OPTS += --without-python
-endif
-
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 CUPS_CONF_OPTS += --enable-libusb
 CUPS_DEPENDENCIES += libusb
-- 
2.23.0
