From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 12:43:39 +0200
Subject: [Buildroot] [git commit] cups: fix static linking with GnuTLS
Message-ID: <20160703104344.9B71D81E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ff8fc555c8b9faebf7ec3245c342832be60aa03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cups forgets to link against the libs found by pkg-config if it is build with
GnuTLS support.

Otherwise, static build fails with:
../cups/libcups.a(tls.o): In function `http_gnutls_create_credential':
cups-2.1.2/cups/tls-gnutls.c:762: undefined reference to `gnutls_x509_crt_init'
[..]

Fixes:
http://autobuild.buildroot.net/results/205/20509b7d1edc73dc2a7622f2ae7dbf9f6665a918/
http://autobuild.buildroot.net/results/b86/b86d685caf8cf812f9505fca2de36fb8c18baee1/

Patch is sent upstream.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: refresh and rename patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../cups/0005-Fix-static-linking-with-GnuTLS.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/cups/0005-Fix-static-linking-with-GnuTLS.patch b/package/cups/0005-Fix-static-linking-with-GnuTLS.patch
new file mode 100644
index 0000000..5702caa
--- /dev/null
+++ b/package/cups/0005-Fix-static-linking-with-GnuTLS.patch
@@ -0,0 +1,39 @@
+From 79a2389f590f4d16885bdd0715f3f04fd9fa6cc5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sun, 28 Feb 2016 16:35:56 +0100
+Subject: [PATCH] Fix static linking with GnuTLS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+cups forgets to link against the libs found by pkg-config if it is build with
+GnuTLS support.
+
+Otherwise, static build fails with:
+../cups/libcups.a(tls.o): In function `http_gnutls_create_credential':
+cups-2.1.2/cups/tls-gnutls.c:762: undefined reference to `gnutls_x509_crt_init'
+[..]
+
+Status upstream: Pending
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ Makedefs.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makedefs.in b/Makedefs.in
+index 299b297..ce9d535 100644
+--- a/Makedefs.in
++++ b/Makedefs.in
+@@ -143,7 +143,7 @@ IPPFIND_MAN	=	@IPPFIND_MAN@
+ LDFLAGS		=	-L../cgi-bin -L../cups -L../filter -L../ppdc \
+ 			-L../scheduler @LDARCHFLAGS@ \
+ 			@LDFLAGS@ @RELROFLAGS@ $(OPTIM)
+-LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
++LINKCUPS	=	@LINKCUPS@ $(SSLLIBS) $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
+ LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
+ LIBS		=	$(LINKCUPS) $(COMMONLIBS)
+ ONDEMANDFLAGS	=	@ONDEMANDFLAGS@
+-- 
+2.7.4
+
