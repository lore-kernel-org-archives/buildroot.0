From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat, 12 Apr 2008 02:45:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  beecrypt
Message-ID: <20080412094550.0F6653C59C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-12 02:45:49 -0700 (Sat, 12 Apr 2008)
New Revision: 21715

Log:
* Added beecrypt


Added:
   trunk/buildroot/package/beecrypt/
   trunk/buildroot/package/beecrypt/Config.in
   trunk/buildroot/package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch
   trunk/buildroot/package/beecrypt/beecrypt.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-12 09:44:42 UTC (rev 21714)
+++ trunk/buildroot/package/Config.in	2008-04-12 09:45:49 UTC (rev 21715)
@@ -58,6 +58,7 @@
 
 comment "Other stuff"
 source "package/at/Config.in"
+source "package/beecrypt/Config.in"
 source "package/berkeleydb/Config.in"
 source "package/bsdiff/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

Added: trunk/buildroot/package/beecrypt/Config.in
===================================================================
--- trunk/buildroot/package/beecrypt/Config.in	                        (rev 0)
+++ trunk/buildroot/package/beecrypt/Config.in	2008-04-12 09:45:49 UTC (rev 21715)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BEECRYPT
+	bool "beecrypt"
+	default n
+	help
+	  Beecrypt is a general-purpose cryptography library.
+
+	  http://beecrypt.sf.net

Added: trunk/buildroot/package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch
===================================================================
--- trunk/buildroot/package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch	                        (rev 0)
+++ trunk/buildroot/package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch	2008-04-12 09:45:49 UTC (rev 21715)
@@ -0,0 +1,12 @@
+diff -ru beecrypt-4.1.2_vanilla/Makefile.am beecrypt-4.1.2_disable-cxxglue/Makefile.am
+--- beecrypt-4.1.2_vanilla/Makefile.am	2004-12-22 07:06:31.000000000 +0000
++++ beecrypt-4.1.2_disable-cxxglue/Makefile.am	2008-03-21 23:24:51.000000000 +0000
+@@ -49,7 +49,7 @@
+ 
+ libalt_LTLIBRARIES = libbeecrypt.la
+ 
+-libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhaes.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha256.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c rsa.c rsakp.c rsapk.c sha1.c sha256.c sha384.c sha512.c sha_k.c timestamp.c cppglue.cxx
++libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhaes.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha256.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c rsa.c rsakp.c rsapk.c sha1.c sha256.c sha384.c sha512.c sha_k.c timestamp.c
+ libbeecrypt_la_DEPENDENCIES = $(BEECRYPT_OBJECTS)
+ libbeecrypt_la_LIBADD = aesopt.lo blowfishopt.lo mpopt.lo sha1opt.lo
+ libbeecrypt_la_LDFLAGS = -no-undefined -version-info $(LIBBEECRYPT_LT_CURRENT):$(LIBBEECRYPT_LT_REVISION):$(LIBBEECRYPT_LT_AGE)

Added: trunk/buildroot/package/beecrypt/beecrypt.mk
===================================================================
--- trunk/buildroot/package/beecrypt/beecrypt.mk	                        (rev 0)
+++ trunk/buildroot/package/beecrypt/beecrypt.mk	2008-04-12 09:45:49 UTC (rev 21715)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# beecrypt
+#
+#############################################################
+BEECRYPT_VERSION = 4.1.2
+BEECRYPT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/beecrypt
+BEECRYPT_AUTORECONF = YES
+BEECRYPT_INSTALL_STAGING = YES
+
+BEECRYPT_CONF_OPT =  --without-cplusplus \
+		--without-java \
+		--without-python  \
+		--disable-rpath
+
+BEECRYPT_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+
+$(eval $(call AUTOTARGETS,package,beecrypt))
