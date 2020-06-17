From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 17 Jun 2020 19:28:45 +0200
Subject: [Buildroot] [PATCH 3/6] package/cups: bump to version 2.3.3
In-Reply-To: <20200617172848.2601-1-angelo@amarulasolutions.com>
References: <20200617172848.2601-1-angelo@amarulasolutions.com>
Message-ID: <20200617172848.2601-4-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps cups to version 2.3.3.
While bumping, fixing also the wrong installation of service files:
the rcdir was left to the default value, that means installing the
service files into the wrong /etc/rcX.d directory.
Adding also a simplified systemv service file for loading cupsd.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...move-man-from-BUILDDIRS-in-configure.patch |  8 ++++---
 package/cups/0002-Do-not-use-genstrings.patch | 14 ++++++-----
 ...0004-Remove-PIE-flags-from-the-build.patch |  8 ++++---
 package/cups/S81cupsd                         | 23 +++++++++++++++++++
 package/cups/cups.hash                        |  2 +-
 package/cups/cups.mk                          | 11 +++++++--
 6 files changed, 51 insertions(+), 15 deletions(-)
 create mode 100644 package/cups/S81cupsd

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index b1ab7cbace..7fcf7133c8 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -6,15 +6,17 @@ Subject: [PATCH] Remove man from BUILDDIRS in configure
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Fabrice: updated for 2.3.0]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Michael: updated for 2.3.3]
+Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
 ---
  config-scripts/cups-common.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
-index fbba715..77d0f5c 100644
+index a460a73..d427acb 100644
 --- a/config-scripts/cups-common.m4
 +++ b/config-scripts/cups-common.m4
-@@ -446,7 +446,7 @@ AC_ARG_WITH(components, [  --with-components       set components to build:
+@@ -434,7 +434,7 @@ LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
  
  case "$COMPONENTS" in
  	all)
@@ -24,5 +26,5 @@ index fbba715..77d0f5c 100644
  
  	core)
 -- 
-2.8.1
+2.17.1
 
diff --git a/package/cups/0002-Do-not-use-genstrings.patch b/package/cups/0002-Do-not-use-genstrings.patch
index b3566b8b15..c7d6735b5f 100644
--- a/package/cups/0002-Do-not-use-genstrings.patch
+++ b/package/cups/0002-Do-not-use-genstrings.patch
@@ -16,23 +16,25 @@ genstrings call.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Fabrice: updated for 2.3.0]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Michael: updated for 2.3.3]
+Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
 ---
  ppdc/Makefile | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/ppdc/Makefile b/ppdc/Makefile
-index 68bf6b2..d57a0c9 100644
+index 32e2e0b..7b18879 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
-@@ -242,8 +242,6 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
-	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
-		libcupsppdc.a $(LINKCUPSSTATIC)
-	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
+@@ -186,8 +186,6 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+ 	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
+ 		libcupsppdc.a $(LINKCUPSSTATIC)
+ 	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
 -	echo Generating localization strings...
 -	./genstrings >sample.c
  
  
  #
 -- 
-2.6.4
+2.17.1
 
diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
index 8401e133e9..c2765dff09 100644
--- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
+++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
@@ -13,15 +13,17 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 [Fabrice: updated for 2.3.0]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Michael: updated for 2.3.3]
+Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
 ---
  Makedefs.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makedefs.in b/Makedefs.in
-index 3afef0a..299b297 100644
+index 5f1d32f..d669ea8 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
-@@ -148,7 +148,7 @@ IPPFIND_BIN	=	@IPPFIND_BIN@
+@@ -155,7 +155,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
  			$(ONDEMANDFLAGS) $(OPTIONS)
  ALL_DSOFLAGS	=	-L../cups @ARCHFLAGS@ @RELROFLAGS@ $(DSOFLAGS) $(OPTIM)
  ALL_LDFLAGS	=	-L../cups @LDARCHFLAGS@ @RELROFLAGS@ $(LDFLAGS)  \
@@ -31,5 +33,5 @@ index 3afef0a..299b297 100644
  ARFLAGS		=	@ARFLAGS@
  BACKLIBS	=	@BACKLIBS@
 -- 
-2.7.4
+2.17.1
 
diff --git a/package/cups/S81cupsd b/package/cups/S81cupsd
new file mode 100644
index 0000000000..f527d55f1e
--- /dev/null
+++ b/package/cups/S81cupsd
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		printf "Starting cupsd: "
+		start-stop-daemon -S -q -m -p /var/run/cupsd.pid \
+			-b -x cupsd -- -C /etc/cups/cupsd.conf -s /etc/cups/cups-files
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping cupsd: "
+		start-stop-daemon -K -q -p /var/run/cupsd.pid
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart)
+		"$0" stop
+		sleep 1
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 8f037c6420..2eb289e209 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256 1bca9d89507e3f68cbc84482fe46ae8d5333af5bc2b9061347b2007182ac77ce  cups-2.3.1-source.tar.gz
+sha256 261fd948bce8647b6d5cb2a1784f0c24cc52b5c4e827b71d726020bcc502f3ee  cups-2.3.3-source.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256 a5d616e6322a9cb1a971e18765025edfca4f3cd9c0eafc32d6d2eb4b8c8787b5  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 18f01d8484..461e0d9143 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.3.1
+CUPS_VERSION = 2.3.3
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
@@ -21,7 +21,8 @@ CUPS_CONF_OPTS = \
 	--with-docdir=/usr/share/cups/doc-root \
 	--disable-gssapi \
 	--disable-pam \
-	--libdir=/usr/lib
+	--libdir=/usr/lib \
+	--with-rcdir=no
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
 	host-autoconf \
@@ -71,4 +72,10 @@ else
 CUPS_CONF_OPTS += --disable-avahi
 endif
 
+define CUPS_INSTALL_INIT_SYSV
+	@$(RM) $(TARGET_DIR)/etc/init.d/cups
+	$(INSTALL) -D -m 0755 package/cups/S81cupsd \
+		$(TARGET_DIR)/etc/init.d/S81cupsd
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1
