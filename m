From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 28 Feb 2016 17:07:20 +0100
Subject: [Buildroot] [PATCH] package/cups: fix static linking with GnuTLS
Message-ID: <1456675640-22176-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../cups/0004-Fix-static-linking-with-GnuTLS.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/cups/0004-Fix-static-linking-with-GnuTLS.patch

diff --git a/package/cups/0004-Fix-static-linking-with-GnuTLS.patch b/package/cups/0004-Fix-static-linking-with-GnuTLS.patch
new file mode 100644
index 0000000..67df4dc
--- /dev/null
+++ b/package/cups/0004-Fix-static-linking-with-GnuTLS.patch
@@ -0,0 +1,39 @@
+From ceaed5f1efe917c70e5ae9161695ba1c559b912d Mon Sep 17 00:00:00 2001
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
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makedefs.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makedefs.in b/Makedefs.in
+index 5d261c3..1d00c73 100644
+--- a/Makedefs.in
++++ b/Makedefs.in
+@@ -143,7 +143,7 @@ IPPFIND_MAN	=	@IPPFIND_MAN@
+ LDFLAGS		=	-L../cgi-bin -L../cups -L../filter -L../ppdc \
+ 			-L../scheduler @LDARCHFLAGS@ \
+ 			@LDFLAGS@ @RELROFLAGS@ @PIEFLAGS@ $(OPTIM)
+-LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
++LINKCUPS	=	@LINKCUPS@ $(SSLLIBS) $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
+ LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
+ LIBS		=	$(LINKCUPS) $(COMMONLIBS)
+ ONDEMANDFLAGS	=	@ONDEMANDFLAGS@
+-- 
+2.7.2
+
-- 
2.7.2
