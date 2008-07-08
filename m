From: John Voltz <john.voltz@gmail.com>
Date: Tue, 8 Jul 2008 11:34:03 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <87prpobeqx.fsf@macbook.be.48ers.dk>
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
	<87lk0cjyh3.fsf@macbook.be.48ers.dk>
	<d6cda7730807080635m5c2949e2me4b4cca844e82e07@mail.gmail.com>
	<87vdzgh4ko.fsf@macbook.be.48ers.dk>
	<d6cda7730807080756qb660dd7k19a618ce9d90ad7b@mail.gmail.com>
	<87prpobeqx.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670807080834i61e09b53t93d7e8284e95759d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's a patch to add SSL certificates to buildroot. It builds them from
mozilla's svn, so the certs are not likely to have been tampered with. It's
really pretty slick.

diff -Nwrup -x .svn buildroot-orig/package/ca-certificates/
ca-certificates.mk buildroot/package/ca-certificates/ca-certificates.mk
--- buildroot-orig/package/ca-certificates/ca-certificates.mk    1969-12-31
19:00:00.000000000 -0500
+++ buildroot/package/ca-certificates/ca-certificates.mk    2008-07-03
07:33:36.000000000 -0400
@@ -0,0 +1,25 @@
+#############################################################
+#
+# ca-certificates
+#
+#############################################################
+
+package/ca-certificates/ca-bundle.crt:
+    package/ca-certificates/mkcabundle.pl > $@
+
+$(TARGET_DIR)/usr/lib/ssl/cert.pem: package/ca-certificates/ca-bundle.crt
+    mkdir -p $(TARGET_DIR)/usr/lib/ssl/certs/
+    mkdir -p $(TARGET_DIR)/usr/lib/ssl/CA/private
+    cp package/ca-certificates/ca-bundle.crt
$(TARGET_DIR)/usr/lib/ssl/certs
+    ln -s certs/ca-bundle.crt $(TARGET_DIR)/usr/lib/ssl/cert.pem
+
+ca-certificates: $(TARGET_DIR)/usr/lib/ssl/cert.pem
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_CA_CERTIFICATES)),y)
+TARGETS+=ca-certificates
+endif
\ No newline at end of file
diff -Nwrup -x .svn buildroot-orig/package/ca-certificates/Config.in
buildroot/package/ca-certificates/Config.in
--- buildroot-orig/package/ca-certificates/Config.in    1969-12-31
19:00:00.000000000 -0500
+++ buildroot/package/ca-certificates/Config.in    2008-07-03
07:33:36.000000000 -0400
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_CA_CERTIFICATES
+    bool "ssl certificates"
+    default n
+    help
+      SSL certificates for OpenSSL
diff -Nwrup -x .svn buildroot-orig/package/ca-certificates/mkcabundle.pl
buildroot/package/ca-certificates/mkcabundle.pl
--- buildroot-orig/package/ca-certificates/mkcabundle.pl    1969-12-31
19:00:00.000000000 -0500
+++ buildroot/package/ca-certificates/mkcabundle.pl    2008-07-03
07:33:36.000000000 -0400
@@ -0,0 +1,41 @@
+#!/usr/bin/perl -w
+#
+# Used to regenerate ca-bundle.crt from the Mozilla certdata.txt.
+# Run as ./mkcabundle.pl > ca-bundle.crt
+#
+
+my $cvsroot = ':pserver:anonymous at cvs-mirror.mozilla.org:/cvsroot';
+my $certdata = 'mozilla/security/nss/lib/ckfw/builtins/certdata.txt';
+
+open(IN, "cvs -d $cvsroot co -p $certdata|")
+    || die "could not check out certdata.txt";
+
+my $incert = 0;
+
+print<<EOH;
+# This is a bundle of X.509 certificates of public Certificate
+# Authorities.  It was generated from the Mozilla root CA list.
+#
+# Source: $certdata
+#
+EOH
+
+while (<IN>) {
+    if (/^CKA_VALUE MULTILINE_OCTAL/) {
+        $incert = 1;
+        open(OUT, "|openssl x509 -text -inform DER -fingerprint")
+            || die "could not pipe to openssl x509";
+    } elsif (/^END/ && $incert) {
+        close(OUT);
+        $incert = 0;
+        print "\n\n";
+    } elsif ($incert) {
+        my @bs = split(/\\/);
+        foreach my $b (@bs) {
+            chomp $b;
+            printf(OUT "%c", oct($b)) unless $b eq '';
+        }
+    } elsif (/^CVS_ID.*Revision: ([^ ]*).*/) {
+        print "# Generated from certdata.txt RCS revision $1\n#\n";
+    }
+}
\ No newline at end of file
diff -Nwrup -x .svn buildroot-orig/package/Config.in
buildroot/package/Config.in
--- buildroot-orig/package/Config.in    2008-07-08 11:19:53.000000000 -0400
+++ buildroot/package/Config.in    2008-07-08 11:26:07.000000000 -0400
@@ -150,6 +150,7 @@ source "package/axel/Config.in"
 source "package/boa/Config.in"
 source "package/bind/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/ca-certificates/Config.in"
 source "package/curl/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080708/e821259b/attachment.htm 
