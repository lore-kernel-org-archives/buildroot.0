From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 09:55:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20070811165553.186D6A5D3C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 09:55:52 -0700 (Sat, 11 Aug 2007)
New Revision: 19430

Log:
Bump version of openssl, add threads

Removed:
   trunk/buildroot/package/openssl/openssl-0.9.7e-no-fips.patch

Modified:
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/openssl/openssl.patch


Changeset:
Deleted: trunk/buildroot/package/openssl/openssl-0.9.7e-no-fips.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.7e-no-fips.patch	2007-08-11 16:52:57 UTC (rev 19429)
+++ trunk/buildroot/package/openssl/openssl-0.9.7e-no-fips.patch	2007-08-11 16:55:52 UTC (rev 19430)
@@ -1,43 +0,0 @@
-Ripped from fedora
-
---- openssl-0.9.7e/Configure
-+++ openssl-0.9.7e/Configure
-@@ -1161,15 +1161,21 @@
- 
- $bn_obj = $bn_asm unless $bn_obj ne "";
- 
-+my $fips_des_obj;
-+my $fips_sha1_obj;
- if ($fips)
- 	{
-+	if ($des_obj =~ /\-elf\.o$/ && $no_shared) # FIPS DES module is not PIC
-+		{
-+		$fips_des_obj='asm/fips-dx86-elf.o';
-+		$openssl_other_defines.="#define OPENSSL_FIPS_DES_ASM\n";
-+		}
-+	else {	$fips_des_obj=$fips_des_enc;  }
-+	$fips_sha1_obj='asm/sx86-elf.o' if ($sha1_obj =~ /\-elf\.o$/);
- 	$des_obj=$sha1_obj="";
- 	$openssl_other_defines.="#define OPENSSL_FIPS\n";
- 	}
--$des_obj=$des_enc	unless (!$fips && $des_obj =~ /\.o$/);
--my $fips_des_obj='asm/fips-dx86-elf.o';
--$fips_des_obj=$fips_des_enc unless $processor eq '386';
--my $fips_sha1_obj='asm/sx86-elf.o' if $processor eq '386';
-+$des_obj=$des_enc	unless ($des_obj =~ /\.o$/);
- $bf_obj=$bf_enc		unless ($bf_obj =~ /\.o$/);
- $cast_obj=$cast_enc	unless ($cast_obj =~ /\.o$/);
- $rc4_obj=$rc4_enc	unless ($rc4_obj =~ /\.o$/);
---- openssl-0.9.7e/Makefile.org
-+++ openssl-0.9.7e/Makefile.org
-@@ -176,8 +176,8 @@
- # we might set SHLIB_MARK to '$(SHARED_LIBS)'.
- SHLIB_MARK=
- 
--DIRS=   crypto fips ssl $(SHLIB_MARK) sigs apps test tools
--SHLIBDIRS= fips crypto ssl
-+DIRS=   crypto ssl $(SHLIB_MARK) sigs apps test tools
-+SHLIBDIRS= crypto ssl
- 
- # dirs in crypto to build
- SDIRS=  objects \

Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2007-08-11 16:52:57 UTC (rev 19429)
+++ trunk/buildroot/package/openssl/openssl.mk	2007-08-11 16:55:52 UTC (rev 19430)
@@ -5,7 +5,7 @@
 #############################################################
 
 # TARGETS
-OPENSSL_VERSION:=0.9.7e
+OPENSSL_VERSION:=0.9.7m
 OPENSSL_SITE:=http://www.openssl.org/source
 OPENSSL_SOURCE:=openssl-$(OPENSSL_VERSION).tar.gz
 OPENSSL_CAT:=$(ZCAT)
@@ -45,7 +45,7 @@
 	PATH=$(TARGET_PATH) \
 	./Configure linux-$(OPENSSL_TARGET_ARCH) --prefix=/ \
 		--openssldir=/usr/lib/ssl -L$(STAGING_DIR)/lib -ldl \
-		-I$(STAGING_DIR)/usr/include $(OPENSSL_OPTS) no-threads \
+		-I$(STAGING_DIR)/usr/include $(OPENSSL_OPTS) threads \
 		shared no-idea no-mdc2 no-rc5)
 
 $(OPENSSL_DIR)/apps/openssl: $(OPENSSL_DIR)/Makefile

Modified: trunk/buildroot/package/openssl/openssl.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl.patch	2007-08-11 16:52:57 UTC (rev 19429)
+++ trunk/buildroot/package/openssl/openssl.patch	2007-08-11 16:55:52 UTC (rev 19430)
@@ -1,12 +1,13 @@
---- openssl-0.9.7.orig/Configure
-+++ openssl-0.9.7/Configure
+diff -ruN openssl-0.9.7m.orig/Configure openssl-0.9.7m/Configure
+--- openssl-0.9.7m.orig/Configure	2007-02-22 17:30:49.000000000 -0500
++++ openssl-0.9.7m/Configure	2007-07-23 21:10:15.000000000 -0400
 @@ -1,4 +1,4 @@
 -:
 +#!/usr/bin/perl
  eval 'exec perl -S $0 ${1+"$@"}'
      if $running_under_some_shell;
  ##
-@@ -373,6 +373,41 @@
+@@ -390,6 +390,41 @@
  # assembler versions -- currently defunct:
  ##"OpenBSD-alpha","gcc:-DTERMIOS -O3 -fomit-frame-pointer:::(unknown):SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:${alpha_asm}",
  
@@ -48,17 +49,18 @@
  # The intel boxes :-), It would be worth seeing if bsdi-gcc can use the
  # bn86-elf.o file file since it is hand tweaked assembler.
  "linux-elf",	"gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-@@ -416,6 +451,7 @@
- 
- # Linux on ARM
- "linux-elf-arm","gcc:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+@@ -437,6 +472,7 @@
+ # ARM comes in both little- and big-endian flavors. The following line is
+ # endian neutral, but ./config is free to throw in -D[BL]_ENDIAN...
+ "linux-elf-arm","gcc:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-elf-armeb","gcc:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  
  # SCO/Caldera targets.
  #
---- openssl-0.9.7.orig/crypto/md5/asm/md5-sparcv9.S
-+++ openssl-0.9.7/crypto/md5/asm/md5-sparcv9.S
-@@ -72,14 +72,14 @@
+diff -ruN openssl-0.9.7m.orig/crypto/md5/asm/md5-sparcv9.S openssl-0.9.7m/crypto/md5/asm/md5-sparcv9.S
+--- openssl-0.9.7m.orig/crypto/md5/asm/md5-sparcv9.S	2003-05-29 18:22:34.000000000 -0400
++++ openssl-0.9.7m/crypto/md5/asm/md5-sparcv9.S	2007-07-23 21:09:34.000000000 -0400
+@@ -74,14 +74,14 @@
  #define Dval	R8
  
  #if defined(MD5_BLOCK_DATA_ORDER)
@@ -76,8 +78,9 @@
  #else
  # define	LOAD			ld
  # define	X(i)			[%i1+i*4]
---- openssl-0.9.7.orig/crypto/opensslconf.h
-+++ openssl-0.9.7/crypto/opensslconf.h
+diff -ruN openssl-0.9.7m.orig/include/openssl/opensslconf.h openssl-0.9.7m/include/openssl/opensslconf.h
+--- openssl-0.9.7m.orig/include/openssl/opensslconf.h	2007-02-23 07:52:32.000000000 -0500
++++ openssl-0.9.7m/include/openssl/opensslconf.h	2007-07-23 21:09:34.000000000 -0400
 @@ -4,17 +4,38 @@
  /* OpenSSL was configured with the following options: */
  #ifndef OPENSSL_DOING_MAKEDEPEND
@@ -170,8 +173,9 @@
  #endif
  
  /* These default values were supplied by
---- openssl-0.9.7.orig/ssl/ssl_algs.c
-+++ openssl-0.9.7/ssl/ssl_algs.c
+diff -ruN openssl-0.9.7m.orig/ssl/ssl_algs.c openssl-0.9.7m/ssl/ssl_algs.c
+--- openssl-0.9.7m.orig/ssl/ssl_algs.c	2001-02-20 03:11:58.000000000 -0500
++++ openssl-0.9.7m/ssl/ssl_algs.c	2007-07-23 21:09:34.000000000 -0400
 @@ -109,3 +109,8 @@
  	return(1);
  	}
@@ -181,64 +185,63 @@
 +    {
 +         return SSL_library_init();
 +    }
---- openssl-0.9.7.orig/tools/c_rehash.in
-+++ openssl-0.9.7/tools/c_rehash.in
+diff -ruN openssl-0.9.7m.orig/tools/c_rehash.in openssl-0.9.7m/tools/c_rehash.in
+--- openssl-0.9.7m.orig/tools/c_rehash.in	2002-10-11 16:35:45.000000000 -0400
++++ openssl-0.9.7m/tools/c_rehash.in	2007-07-23 21:09:34.000000000 -0400
 @@ -1,4 +1,4 @@
 -#!/usr/local/bin/perl
 +#!/usr/bin/perl
  
  
  # Perl c_rehash script, scan all files in a directory
---- openssl-0.9.7.orig/util/clean-depend.pl
-+++ openssl-0.9.7/util/clean-depend.pl
+diff -ruN openssl-0.9.7m.orig/util/clean-depend.pl openssl-0.9.7m/util/clean-depend.pl
+--- openssl-0.9.7m.orig/util/clean-depend.pl	2001-10-10 04:27:28.000000000 -0400
++++ openssl-0.9.7m/util/clean-depend.pl	2007-07-23 21:09:34.000000000 -0400
 @@ -1,4 +1,4 @@
 -#!/usr/local/bin/perl -w
 +#!/usr/bin/perl
  # Clean the dependency list in a makefile of standard includes...
  # Written by Ben Laurie <ben@algroup.co.uk> 19 Jan 1999
  
---- openssl-0.9.7.orig/util/extract-names.pl
-+++ openssl-0.9.7/util/extract-names.pl
+diff -ruN openssl-0.9.7m.orig/util/mkdef.pl openssl-0.9.7m/util/mkdef.pl
+--- openssl-0.9.7m.orig/util/mkdef.pl	2006-02-04 18:05:40.000000000 -0500
++++ openssl-0.9.7m/util/mkdef.pl	2007-07-23 21:09:34.000000000 -0400
 @@ -1,4 +1,4 @@
--#!/usr/bin/perl
-+#!/usr/bin/perl
- 
- $/ = "";			# Eat a paragraph at once.
- while(<STDIN>) {
---- openssl-0.9.7.orig/util/mkdef.pl
-+++ openssl-0.9.7/util/mkdef.pl
-@@ -1,4 +1,4 @@
 -#!/usr/local/bin/perl -w
 +#!/usr/bin/perl
  #
  # generate a .def file
  #
---- openssl-0.9.7.orig/util/mkerr.pl
-+++ openssl-0.9.7/util/mkerr.pl
+diff -ruN openssl-0.9.7m.orig/util/mkerr.pl openssl-0.9.7m/util/mkerr.pl
+--- openssl-0.9.7m.orig/util/mkerr.pl	2006-11-21 14:19:09.000000000 -0500
++++ openssl-0.9.7m/util/mkerr.pl	2007-07-23 21:09:34.000000000 -0400
 @@ -1,4 +1,4 @@
 -#!/usr/local/bin/perl -w
 +#!/usr/bin/perl
  
  my $config = "crypto/err/openssl.ec";
  my $debug = 0;
---- openssl-0.9.7.orig/util/mkstack.pl
-+++ openssl-0.9.7/util/mkstack.pl
+diff -ruN openssl-0.9.7m.orig/util/mkstack.pl openssl-0.9.7m/util/mkstack.pl
+--- openssl-0.9.7m.orig/util/mkstack.pl	2004-10-04 12:27:36.000000000 -0400
++++ openssl-0.9.7m/util/mkstack.pl	2007-07-23 21:09:34.000000000 -0400
 @@ -1,4 +1,4 @@
 -#!/usr/local/bin/perl -w
 +#!/usr/bin/perl
  
  # This is a utility that searches out "DECLARE_STACK_OF()"
  # declarations in .h and .c files, and updates/creates/replaces
---- openssl-0.9.7.orig/util/pod2man.pl
-+++ openssl-0.9.7/util/pod2man.pl
+diff -ruN openssl-0.9.7m.orig/util/pod2man.pl openssl-0.9.7m/util/pod2man.pl
+--- openssl-0.9.7m.orig/util/pod2man.pl	2005-06-18 00:27:11.000000000 -0400
++++ openssl-0.9.7m/util/pod2man.pl	2007-07-23 21:09:34.000000000 -0400
 @@ -1,4 +1,4 @@
 -: #!/usr/bin/perl-5.005
 +#!/usr/bin/perl
      eval 'exec /usr/bin/perl -S $0 ${1+"$@"}'
  	if $running_under_some_shell;
  
---- openssl-0.9.7.orig/util/selftest.pl
-+++ openssl-0.9.7/util/selftest.pl
+diff -ruN openssl-0.9.7m.orig/util/selftest.pl openssl-0.9.7m/util/selftest.pl
+--- openssl-0.9.7m.orig/util/selftest.pl	2005-06-20 16:45:44.000000000 -0400
++++ openssl-0.9.7m/util/selftest.pl	2007-07-23 21:09:34.000000000 -0400
 @@ -1,4 +1,4 @@
 -#!/usr/local/bin/perl -w
 +#!/usr/bin/perl
