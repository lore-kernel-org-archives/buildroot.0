From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Nov 2018 13:14:26 +0100
Subject: [Buildroot] [PATCH v2,1/2] ngrep: bump to version 1.47
Message-ID: <20181104121427.14889-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site from sourceforge to github as there is no new releases on
  sourceforge and http://ngrep.sourceforge.net/ is redirected to
  https://github.com/jpr5/ngrep/
- Remove first patch, not needed since version 1.46 and
  https://github.com/jpr5/ngrep/commit/997c9d81d34d3a6646e6c5e363645015e644b3de
  as this commit added the support for system pcre
- Remove second patch, not needed since version 1.46 and
  https://github.com/jpr5/ngrep/commit/2d8fd9ac7ef1ac6947f738f6005e7b533654f331
- Remove third patch and LIBS=-lpcap -lpcre, not needed since 1.46 and
  https://github.com/jpr5/ngrep/commit/cca6e3121f2d80dd32a5a33dead9495fe40eed70
- LICENSE.txt has been renamed to LICENSE since version 1.47 and
  https://github.com/jpr5/ngrep/commit/3cb4c580a9de4afe11c2c17b0f354b59b74ae974
- Add an upstream patch to fix --enable-pcre: keep pcre as a mandatory
  dependency as this is the current behavior in version 1.45. PCRE will
  made optional in an other patch
- Remove --with-pcre which is not recognized anymore
- Add two other patches to fix --disable-tcpkill
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add --disable-tcpkill
 - Remove NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"

 ...nfigure-in-when-testing-for-use_pcre.patch | 25 ++++++++++++
 package/ngrep/0001-make-objs.patch            | 23 -----------
 ...heck-for-libnet_init-in-configure-in.patch | 28 +++++++++++++
 package/ngrep/0002-pcre-header.patch          | 16 --------
 package/ngrep/0003-fix-disable-tcpkill.patch  | 39 +++++++++++++++++++
 package/ngrep/0003-fix-static-link.patch      | 25 ------------
 package/ngrep/Config.in                       |  2 +-
 package/ngrep/ngrep.hash                      |  3 +-
 package/ngrep/ngrep.mk                        | 17 ++++----
 9 files changed, 103 insertions(+), 75 deletions(-)
 create mode 100644 package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
 delete mode 100644 package/ngrep/0001-make-objs.patch
 create mode 100644 package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
 delete mode 100644 package/ngrep/0002-pcre-header.patch
 create mode 100644 package/ngrep/0003-fix-disable-tcpkill.patch
 delete mode 100644 package/ngrep/0003-fix-static-link.patch

diff --git a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
new file mode 100644
index 0000000000..69c5c887e8
--- /dev/null
+++ b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
@@ -0,0 +1,25 @@
+From b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe Mon Sep 17 00:00:00 2001
+From: Romain Francoise <romain@rfr.io>
+Date: Mon, 1 Jan 2018 18:00:34 +0100
+Subject: [PATCH] Fix typo in configure.in when testing for use_pcre
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe]
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index cff37e9..06c050a 100644
+--- a/configure.in
++++ b/configure.in
+@@ -146,7 +146,7 @@ AC_ARG_ENABLE(pcre,
+ [ use_pcre="$enableval" ],
+ [ use_pcre="no" ])
+ 
+-if test use_pcre = yes; then
++if test $use_pcre = yes; then
+   USE_PCRE="1"
+   EXTRA_LIBS="$EXTRA_LIBS -lpcre"
+ else
diff --git a/package/ngrep/0001-make-objs.patch b/package/ngrep/0001-make-objs.patch
deleted file mode 100644
index 8b55e3f456..0000000000
--- a/package/ngrep/0001-make-objs.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-ngrep: don't include regex objects since we're using pcre
-
-Signed-off-by: Wade Berrier <wberrier@gmail.com>
-
---- ngrep-1.45/Makefile.in.orig	2006-11-28 06:35:37.000000000 -0700
-+++ ngrep-1.45/Makefile.in	2011-06-29 14:05:27.000000000 -0600
-@@ -32,13 +32,13 @@
- 
- INSTALL = ./install-sh
- 
--REGEX_DIR=@REGEX_DIR@
--REGEX_OBJS=@REGEX_OBJS@
-+REGEX_DIR=
-+REGEX_OBJS=
- 
- 
- all: $(TARGET) 
- 
--$(TARGET): $(REGEX_OBJS) $(OBJS) 
-+$(TARGET): $(OBJS) 
- 	$(CC) $(CFLAGS) $(LDFLAGS) $(STRIPFLAG) -o $(TARGET) $(OBJS) $(REGEX_OBJS) $(LIBS) 
- 
- debug: $(REGEX_OBJS) $(OBJS)
diff --git a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
new file mode 100644
index 0000000000..22b18ab7ee
--- /dev/null
+++ b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
@@ -0,0 +1,28 @@
+From 0a51c8bc62c7b49b8d67a360daa6b1957256f4f5 Mon Sep 17 00:00:00 2001
+From: Romain Francoise <romain@rfr.io>
+Date: Mon, 1 Jan 2018 18:01:13 +0100
+Subject: [PATCH] Check for libnet_init in configure.in
+
+libnet_init_packet was the old libnet 1.0 function which is now long
+deprecated.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5]
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 06c050a..dbef39b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -174,7 +174,7 @@ dnl
+ AC_ARG_ENABLE(tcpkill,
+ [  --enable-tcpkill        enable connection killing support (default off)],
+ [
+-  AC_CHECK_LIB(net, libnet_init_packet,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
++  AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
+   use_tcpkill="$enableval"
+ ],
+ [ use_tcpkill="no" ])
diff --git a/package/ngrep/0002-pcre-header.patch b/package/ngrep/0002-pcre-header.patch
deleted file mode 100644
index 40b9234dbc..0000000000
--- a/package/ngrep/0002-pcre-header.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-ngrep: don't use versioned header
-
-Signed-off-by: Wade Berrier <wberrier@gmail.com>
-
-diff -ur ngrep-1.45/ngrep.c ngrep-1.45.mod/ngrep.c
---- ngrep-1.45/ngrep.c  Tue Nov 28 15:38:43 2006
-+++ ngrep-1.45.mod/ngrep.c      Sat May 19 10:21:27 2007
-@@ -92,7 +92,7 @@
- #endif
- 
- #if USE_PCRE
--#include "pcre-5.0/pcre.h"
-+#include "pcre.h"
- #else
- #include "regex-0.12/regex.h"
- #endif
diff --git a/package/ngrep/0003-fix-disable-tcpkill.patch b/package/ngrep/0003-fix-disable-tcpkill.patch
new file mode 100644
index 0000000000..1264fd7e3b
--- /dev/null
+++ b/package/ngrep/0003-fix-disable-tcpkill.patch
@@ -0,0 +1,39 @@
+From e8522284ef326bd9f222e04c4a970ffafa56fba6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 3 Nov 2018 23:23:36 +0100
+Subject: [PATCH] fix --disable-tcpkill
+
+If the user uses --disable-tcpkill, build can fail if libnet is not
+found on the system.
+
+To fix this, move AC_CHECK_LIB to found libnet outside AC_ARG_ENABLE
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/jpr5/ngrep/pull/15]
+---
+ configure.in | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index dbef39b..7c3dd43 100644
+--- a/configure.in
++++ b/configure.in
+@@ -173,13 +173,11 @@ dnl
+ 
+ AC_ARG_ENABLE(tcpkill,
+ [  --enable-tcpkill        enable connection killing support (default off)],
+-[
+-  AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
+-  use_tcpkill="$enableval"
+-],
++[ use_tcpkill="$enableval" ],
+ [ use_tcpkill="no" ])
+ 
+ if test $use_tcpkill = yes; then
++  AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
+   USE_TCPKILL="1"
+   EXTRA_OBJS="$EXTRA_OBJS tcpkill.o"
+   EXTRA_DEFINES="$EXTRA_DEFINES $(libnet-config --defines)"
+-- 
+2.17.1
+
diff --git a/package/ngrep/0003-fix-static-link.patch b/package/ngrep/0003-fix-static-link.patch
deleted file mode 100644
index 98c262696d..0000000000
--- a/package/ngrep/0003-fix-static-link.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-ngrep: fix static link with pcre
-
-Libraries must be placed after object files.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 2ae4506..761d7d9 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -11,7 +11,7 @@ CFLAGS=@CFLAGS@ -D at OS@ @DEFS@ @EXTRA_DEFINES@
- INCLUDES=-I at srcdir@ @PCAP_INCLUDE@ @EXTRA_INCLUDES@
- 
- LDFLAGS=@LDFLAGS@ @PCAP_LINK@
--LIBS=-lpcap @EXTRA_LIBS@ 
-+LIBS=@LIBS@ @EXTRA_LIBS@
- 
- STRIPFLAG=@STRIPFLAG@
- 
--- 
-1.8.1.4
-
diff --git a/package/ngrep/Config.in b/package/ngrep/Config.in
index cd91225791..5f87f2f79b 100644
--- a/package/ngrep/Config.in
+++ b/package/ngrep/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_NGREP
 	help
 	  Network grep.
 
-	  http://ngrep.sourceforge.net/
+	  https://github.com/jpr5/ngrep/
diff --git a/package/ngrep/ngrep.hash b/package/ngrep/ngrep.hash
index e0a6a2580b..bf9e621a89 100644
--- a/package/ngrep/ngrep.hash
+++ b/package/ngrep/ngrep.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  aea6dd337da8781847c75b3b5b876e4de9c58520e0d77310679a979fc6402fa7  ngrep-1.45.tar.bz2
+sha256  dc4dbe20991cc36bac5e97e99475e2a1522fd88c59ee2e08f813432c04c5fff3  ngrep-1_47.tar.gz
+sha256  d46e593e048e0b9fc803561ed4c283f37a2d5447e4dcfa10cad29b394c2b8b9e  LICENSE
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 3f569374b4..fbfb999730 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -4,25 +4,24 @@
 #
 ################################################################################
 
-NGREP_VERSION = 1.45
-NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
-NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
+NGREP_VERSION = 1_47
+NGREP_SITE = $(call github,jpr5,ngrep,V$(NGREP_VERSION))
 NGREP_LICENSE = BSD-4-Clause-like
-NGREP_LICENSE_FILES = LICENSE.txt
+NGREP_LICENSE_FILES = LICENSE
 NGREP_INSTALL_STAGING = YES
+# We're patching configure.in
+NGREP_AUTORECONF = YES
 
-NGREP_LIBS = -lpcap -lpcre
 ifeq ($(BR2_STATIC_LIBS),y)
-NGREP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
+NGREP_CONF_ENV += LIBS="$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs"
 endif
-NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
 
 NGREP_CONF_OPTS = \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
 	--enable-pcre \
-	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-dropprivs \
-	--disable-pcap-restart
+	--disable-pcap-restart \
+	--disable-tcpkill
 
 NGREP_DEPENDENCIES = libpcap pcre
 
-- 
2.17.1
