From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:11:42 +0200
Subject: [Buildroot] [git commit] cups: bump version to 2.2.4
Message-ID: <20170902130620.48CFE8016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=901f9bfbed70f7df81ca4f4eff8f065173bb2024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tweak 0003-Sanitize-the-installation-process.patch for 2.2.4
Tweak 0004-Remove-PIE-flags-from-the-build.patch for 2.2.4
Remove 0005-Fix-static-linking-with-GnuTLS.patch as it was merged upstream

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-Sanitize-the-installation-process.patch   | 10 +++---
 .../0004-Remove-PIE-flags-from-the-build.patch     |  7 ++--
 .../cups/0005-Fix-static-linking-with-GnuTLS.patch | 39 ----------------------
 package/cups/cups.hash                             |  2 +-
 package/cups/cups.mk                               |  2 +-
 5 files changed, 12 insertions(+), 48 deletions(-)

diff --git a/package/cups/0003-Sanitize-the-installation-process.patch b/package/cups/0003-Sanitize-the-installation-process.patch
index bf81f68..f1128da 100644
--- a/package/cups/0003-Sanitize-the-installation-process.patch
+++ b/package/cups/0003-Sanitize-the-installation-process.patch
@@ -18,10 +18,10 @@ cross-compiling:
    prevent overwriting those files/directories, which meant calling
    "make install" twice was failing.
 
-[Vincent: tweak the patch for 2.2.2 release]
+[Olivier: tweak the patch for 2.2.4 release]
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 ---
  Makedefs.in        | 12 ++++++------
  conf/Makefile      |  6 +++---
@@ -37,7 +37,7 @@ index 3afef0a..3e4f1bd 100644
  # Installation programs...
  #
  
--INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -c -m 555 @INSTALL_STRIP@
+-INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -c -m @CUPS_EXE_FILE_PERM@ @INSTALL_STRIP@
 -INSTALL_COMPDATA =	$(INSTALL) -c -m 444 @INSTALL_GZIP@
 +INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -c -m 755
 +INSTALL_COMPDATA =	$(INSTALL) -c -m 644 @INSTALL_GZIP@
@@ -45,9 +45,9 @@ index 3afef0a..3e4f1bd 100644
 -INSTALL_DATA	=	$(INSTALL) -c -m 444
 +INSTALL_DATA	=	$(INSTALL) -c -m 644
  INSTALL_DIR	=	$(INSTALL) -d
--INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -c -m 555 @INSTALL_STRIP@
+-INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -c -m @CUPS_EXE_FILE_PERM@ @INSTALL_STRIP@
 -INSTALL_MAN	=	$(INSTALL) -c -m 444
--INSTALL_SCRIPT	=	$(INSTALL) -c -m 555
+-INSTALL_SCRIPT	=	$(INSTALL) -c -m @CUPS_EXE_FILE_PERM@
 +INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -c -m 755
 +INSTALL_MAN	=	$(INSTALL) -c -m 644
 +INSTALL_SCRIPT	=	$(INSTALL) -c -m 755
diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
index 492418f..ea4f0b4 100644
--- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
+++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
@@ -7,7 +7,10 @@ Generating a statically linked binary built with PIE requires the
 Scrt1.o file, which isn't part of Buildroot uClibc toolchains. To
 solve this, we simply disable the PIE flags.
 
+[olivier tweak patch for 2.2.4]
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 ---
  Makedefs.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -16,13 +19,13 @@ diff --git a/Makedefs.in b/Makedefs.in
 index 3afef0a..299b297 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
-@@ -142,7 +142,7 @@ IPPFIND_BIN	=	@IPPFIND_BIN@
+@@ -148,7 +148,7 @@ IPPFIND_BIN	=	@IPPFIND_BIN@
  IPPFIND_MAN	=	@IPPFIND_MAN@
  LDFLAGS		=	-L../cgi-bin -L../cups -L../filter -L../ppdc \
  			-L../scheduler @LDARCHFLAGS@ \
 -			@LDFLAGS@ @RELROFLAGS@ @PIEFLAGS@ $(OPTIM)
 +			@LDFLAGS@ @RELROFLAGS@ $(OPTIM)
- LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
+ LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(SSLLIBS) $(LIBZ)
  LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
  LIBS		=	$(LINKCUPS) $(COMMONLIBS)
 -- 
diff --git a/package/cups/0005-Fix-static-linking-with-GnuTLS.patch b/package/cups/0005-Fix-static-linking-with-GnuTLS.patch
deleted file mode 100644
index 5702caa..0000000
--- a/package/cups/0005-Fix-static-linking-with-GnuTLS.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 79a2389f590f4d16885bdd0715f3f04fd9fa6cc5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sun, 28 Feb 2016 16:35:56 +0100
-Subject: [PATCH] Fix static linking with GnuTLS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-cups forgets to link against the libs found by pkg-config if it is build with
-GnuTLS support.
-
-Otherwise, static build fails with:
-../cups/libcups.a(tls.o): In function `http_gnutls_create_credential':
-cups-2.1.2/cups/tls-gnutls.c:762: undefined reference to `gnutls_x509_crt_init'
-[..]
-
-Status upstream: Pending
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- Makedefs.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makedefs.in b/Makedefs.in
-index 299b297..ce9d535 100644
---- a/Makedefs.in
-+++ b/Makedefs.in
-@@ -143,7 +143,7 @@ IPPFIND_MAN	=	@IPPFIND_MAN@
- LDFLAGS		=	-L../cgi-bin -L../cups -L../filter -L../ppdc \
- 			-L../scheduler @LDARCHFLAGS@ \
- 			@LDFLAGS@ @RELROFLAGS@ $(OPTIM)
--LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
-+LINKCUPS	=	@LINKCUPS@ $(SSLLIBS) $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
- LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
- LIBS		=	$(LINKCUPS) $(COMMONLIBS)
- ONDEMANDFLAGS	=	@ONDEMANDFLAGS@
--- 
-2.7.4
-
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 0eb415e..f9eed42 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 66701fe15838f2c892052c913bde1ba106bbee2e0a953c955a62ecacce76885f  cups-2.2.3-source.tar.gz
+sha256 596d4db72651c335469ae5f37b0da72ac9f97d73e30838d787065f559dea98cc  cups-2.2.4-source.tar.gz
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 6e95a43..f5e2a3f 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.2.3
+CUPS_VERSION = 2.2.4
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = GPL-2.0, LGPL-2.0
