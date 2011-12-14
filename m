From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Dec 2011 22:54:04 +0100
Subject: [Buildroot] [git commit] beecrypt: bump version,
	build with C++ support if available
Message-ID: <20111214215543.8533D8F959@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8145105ee348fe560222cb8a244188659d636690
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The issue with cppglue.cxx is still present in 4.2.1, but the previous
workaround had to be extended to allow builds with C++ support.
Similary, the ICU check didn't handle cross compilation.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/beecrypt/Config.in                         |    4 ++
 package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch  |   12 -------
 .../beecrypt-cppglue.cxx-cplusplus-only.patch      |   28 ++++++++++++++++++
 .../beecrypt-icu-check-cross-compile.patch         |   31 ++++++++++++++++++++
 package/beecrypt/beecrypt.mk                       |   23 +++++++++++---
 5 files changed, 81 insertions(+), 17 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 264516e..2673877 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
+	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
 	help
 	  Beecrypt is a general-purpose cryptography library.
 
 	  http://beecrypt.sf.net
+
+comment "beecrypt C++ support requires a toolchain with WCHAR enabled"
+	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
diff --git a/package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch b/package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch
deleted file mode 100644
index 6c40936..0000000
--- a/package/beecrypt/beecrypt-4.1.2_no-cxx-glue.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ru beecrypt-4.1.2_vanilla/Makefile.am beecrypt-4.1.2_disable-cxxglue/Makefile.am
---- beecrypt-4.1.2_vanilla/Makefile.am	2004-12-22 07:06:31.000000000 +0000
-+++ beecrypt-4.1.2_disable-cxxglue/Makefile.am	2008-03-21 23:24:51.000000000 +0000
-@@ -49,7 +49,7 @@
- 
- libalt_LTLIBRARIES = libbeecrypt.la
- 
--libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhaes.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha256.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c rsa.c rsakp.c rsapk.c sha1.c sha256.c sha384.c sha512.c sha_k.c timestamp.c cppglue.cxx
-+libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhaes.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha256.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c rsa.c rsakp.c rsapk.c sha1.c sha256.c sha384.c sha512.c sha_k.c timestamp.c
- libbeecrypt_la_DEPENDENCIES = $(BEECRYPT_OBJECTS)
- libbeecrypt_la_LIBADD = aesopt.lo blowfishopt.lo mpopt.lo sha1opt.lo
- libbeecrypt_la_LDFLAGS = -no-undefined -version-info $(LIBBEECRYPT_LT_CURRENT):$(LIBBEECRYPT_LT_REVISION):$(LIBBEECRYPT_LT_AGE)
diff --git a/package/beecrypt/beecrypt-cppglue.cxx-cplusplus-only.patch b/package/beecrypt/beecrypt-cppglue.cxx-cplusplus-only.patch
new file mode 100644
index 0000000..298e3eb
--- /dev/null
+++ b/package/beecrypt/beecrypt-cppglue.cxx-cplusplus-only.patch
@@ -0,0 +1,28 @@
+Makefile.am: Only compile/link cppglue.cxx if --with-cplusplus is used
+
+Bloats libbeecrypt for no use and breaks build on systems without a C++
+compiler.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile.am |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+Index: beecrypt-4.2.1/Makefile.am
+===================================================================
+--- beecrypt-4.2.1.orig/Makefile.am
++++ beecrypt-4.2.1/Makefile.am
+@@ -62,7 +62,12 @@
+ 
+ lib_LTLIBRARIES = libbeecrypt.la
+ 
+-libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhies.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha224.c hmacsha256.c md4.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c ripemd128.c ripemd160.c ripemd256.c ripemd320.c rsa.c rsakp.c rsapk.c sha1.c sha224.c sha256.c sha384.c sha512.c sha2k32.c sha2k64.c timestamp.c cppglue.cxx
++libbeecrypt_la_SOURCES = aes.c base64.c beecrypt.c blockmode.c blockpad.c blowfish.c dhies.c dldp.c dlkp.c dlpk.c dlsvdp-dh.c dsa.c elgamal.c endianness.c entropy.c fips186.c hmac.c hmacmd5.c hmacsha1.c hmacsha224.c hmacsha256.c md4.c md5.c hmacsha384.c hmacsha512.c memchunk.c mp.c mpbarrett.c mpnumber.c mpprime.c mtprng.c pkcs1.c pkcs12.c ripemd128.c ripemd160.c ripemd256.c ripemd320.c rsa.c rsakp.c rsapk.c sha1.c sha224.c sha256.c sha384.c sha512.c sha2k32.c sha2k64.c timestamp.c
++
++if WITH_CPLUSPLUS
++libbeecrypt_la_SOURCES += cppglue.cxx
++endif
++
+ libbeecrypt_la_DEPENDENCIES = $(BEECRYPT_OBJECTS)
+ libbeecrypt_la_LIBADD = blowfishopt.lo mpopt.lo sha1opt.lo $(OPENMP_LIBS)
+ libbeecrypt_la_LDFLAGS = -no-undefined -version-info $(LIBBEECRYPT_LT_CURRENT):$(LIBBEECRYPT_LT_REVISION):$(LIBBEECRYPT_LT_AGE)
diff --git a/package/beecrypt/beecrypt-icu-check-cross-compile.patch b/package/beecrypt/beecrypt-icu-check-cross-compile.patch
new file mode 100644
index 0000000..cc02116
--- /dev/null
+++ b/package/beecrypt/beecrypt-icu-check-cross-compile.patch
@@ -0,0 +1,31 @@
+configure: Use AC_COMPILE_IFELSE for ICU check for cross compilation compat
+
+AC_RUN_IFELSE doesn't work when cross compiling, but we can do the
+check in the preprocessor instead, so use AC_COMPILE_IFELSE instead.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure.ac |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: beecrypt-4.2.1/configure.ac
+===================================================================
+--- beecrypt-4.2.1.orig/configure.ac
++++ beecrypt-4.2.1/configure.ac
+@@ -295,13 +295,13 @@
+ if test "$ac_with_cplusplus" = yes; then
+   AC_MSG_CHECKING([for IBM's ICU library version >= 2.8])
+   AC_LANG_PUSH(C)
+-  AC_RUN_IFELSE([
++  AC_COMPILE_IFELSE([
+     AC_LANG_PROGRAM([[#include <unicode/uversion.h>]],[[
+       #if U_ICU_VERSION_MAJOR_NUM < 2
+-      exit(1);
++      #error too old
+       #elif U_ICU_VERSION_MAJOR_NUM == 2
+       # if U_ICU_VERSION_MINOR_NUM < 8
+-      exit(1);
++      #error too old
+       # else
+       exit(0);
+       # endif
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 06c359e..a0187ce 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -3,14 +3,27 @@
 # beecrypt
 #
 #############################################################
-BEECRYPT_VERSION = 4.1.2
+BEECRYPT_VERSION = 4.2.1
 BEECRYPT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/beecrypt
 BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
-
-BEECRYPT_CONF_OPT =  --without-cplusplus \
+BEECRYPT_CONF_OPT = \
 		--without-java \
-		--without-python  \
-		--disable-rpath
+		--without-python
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+# C++ support needs icu
+BEECRYPT_DEPENDENCIES += icu
+else
+BEECRYPT_CONF_OPT += --without-cplusplus
+
+# automake/libtool uses the C++ compiler to link libbeecrypt because of
+# (the optional) cppglue.cxx. Force it to use the C compiler instead.
+define BEECRYPT_LINK_WITH_CC
+	$(SED) 's/--tag=CXX/--tag=CC/g' $(@D)/Makefile
+endef
+
+BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
+endif
 
 $(eval $(call AUTOTARGETS))
