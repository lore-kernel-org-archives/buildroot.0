From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Oct 2018 11:28:25 +0100
Subject: [Buildroot] [PATCH v2,1/1] pppd: fix build with glibc 2.28
Message-ID: <20181031102825.30422-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since glibc 2.28
(https://savannah.gnu.org/forum/forum.php?forum_id=9205), the obsolete
functions encrypt, encrypt_r, setkey, setkey_r, cbc_crypt, ecb_crypt,
and des_setparity are no longer available to newly linked binaries, and
the headers <rpc/des_crypt.h> and <rpc/rpc_des.h> are no longer
installed. These functions encrypted and decrypted data with the DES
block cipher, which is no longer considered secure. Software that still
uses these functions should switch to a modern cryptography library,
such as libgcrypt.

So retrieve an upstream patch to use openssl instead of these functions
and a new patch to remove the unsafe header/library path
'-I/usr/include/openssl'

Fixes:
 - http://autobuild.buildroot.org/results/c13ca8b8afa8de700caf8cd2fa1812b8552b3f4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add Signed-off-by and upstream link for upstream patch

 ...he-DES-instead-of-the-libcrypt-glibc.patch | 113 ++++++++++++++++++
 .../pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch   |  38 ++++++
 package/pppd/Config.in                        |   1 +
 package/pppd/pppd.mk                          |   5 +-
 4 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch
 create mode 100644 package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch

diff --git a/package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch b/package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch
new file mode 100644
index 0000000000..3804edc6db
--- /dev/null
+++ b/package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch
@@ -0,0 +1,113 @@
+From 3c7b86229f7bd2600d74db14b1fe5b3896be3875 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
+Date: Fri, 6 Apr 2018 14:27:18 +0200
+Subject: [PATCH] pppd: Use openssl for the DES instead of the libcrypt / glibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It seems the latest glibc (in Fedora glibc-2.27.9000-12.fc29) dropped
+libcrypt.  The libxcrypt standalone package can be used instead, but
+it dropped the old setkey/encrypt API which ppp uses for DES.  There
+is support for using openssl in pppcrypt.c, but it contains typos
+preventing it from compiling and seems to be written for an ancient
+openssl version.
+
+This updates the code to use current openssl.
+
+[paulus at ozlabs.org - wrote the commit description, fixed comment in
+ Makefile.linux.]
+
+Signed-off-by: Jaroslav ?karvada <jskarvad@redhat.com>
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/paulusmack/ppp/commit/3c7b86229f7bd2600d74db14b1fe5b3896be3875]
+---
+ pppd/Makefile.linux |  7 ++++---
+ pppd/pppcrypt.c     | 18 +++++++++---------
+ 2 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
+index 36d2b036..8d5ce99d 100644
+--- a/pppd/Makefile.linux
++++ b/pppd/Makefile.linux
+@@ -35,10 +35,10 @@ endif
+ COPTS = -O2 -pipe -Wall -g
+ LIBS =
+ 
+-# Uncomment the next 2 lines to include support for Microsoft's
++# Uncomment the next line to include support for Microsoft's
+ # MS-CHAP authentication protocol.  Also, edit plugins/radius/Makefile.linux.
+ CHAPMS=y
+-USE_CRYPT=y
++#USE_CRYPT=y
+ # Don't use MSLANMAN unless you really know what you're doing.
+ #MSLANMAN=y
+ # Uncomment the next line to include support for MPPE.  CHAPMS (above) must
+@@ -137,7 +137,8 @@ endif
+ 
+ ifdef NEEDDES
+ ifndef USE_CRYPT
+-LIBS     += -ldes $(LIBS)
++CFLAGS   += -I/usr/include/openssl
++LIBS     += -lcrypto
+ else
+ CFLAGS   += -DUSE_CRYPT=1
+ endif
+diff --git a/pppd/pppcrypt.c b/pppd/pppcrypt.c
+index 8b85b132..6b35375e 100644
+--- a/pppd/pppcrypt.c
++++ b/pppd/pppcrypt.c
+@@ -64,7 +64,7 @@ u_char *des_key;	/* OUT 64 bit DES key with parity bits added */
+ 	des_key[7] = Get7Bits(key, 49);
+ 
+ #ifndef USE_CRYPT
+-	des_set_odd_parity((des_cblock *)des_key);
++	DES_set_odd_parity((DES_cblock *)des_key);
+ #endif
+ }
+ 
+@@ -158,25 +158,25 @@ u_char *clear;	/* OUT 8 octets */
+ }
+ 
+ #else /* USE_CRYPT */
+-static des_key_schedule	key_schedule;
++static DES_key_schedule	key_schedule;
+ 
+ bool
+ DesSetkey(key)
+ u_char *key;
+ {
+-	des_cblock des_key;
++	DES_cblock des_key;
+ 	MakeKey(key, des_key);
+-	des_set_key(&des_key, key_schedule);
++	DES_set_key(&des_key, &key_schedule);
+ 	return (1);
+ }
+ 
+ bool
+-DesEncrypt(clear, key, cipher)
++DesEncrypt(clear, cipher)
+ u_char *clear;	/* IN  8 octets */
+ u_char *cipher;	/* OUT 8 octets */
+ {
+-	des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
+-	    key_schedule, 1);
++	DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
++	    &key_schedule, 1);
+ 	return (1);
+ }
+ 
+@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
+ u_char *cipher;	/* IN  8 octets */
+ u_char *clear;	/* OUT 8 octets */
+ {
+-	des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
+-	    key_schedule, 0);
++	DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
++	    &key_schedule, 0);
+ 	return (1);
+ }
+ 
diff --git a/package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch b/package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch
new file mode 100644
index 0000000000..e629a2dec1
--- /dev/null
+++ b/package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch
@@ -0,0 +1,38 @@
+From 24dd10608bfb554390c17f709a5afa30060c994b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 31 Oct 2018 10:49:16 +0100
+Subject: [PATCH] Add OPENSSL_INCLUDE_DIR
+
+Add OPENSSL_INCLUDE_DIR to be able to override openssl include directory
+as -I/usr/include/openssl can't be used when cross-compiling
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/paulusmack/ppp/pull/107]
+---
+ pppd/Makefile.linux | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
+index 8d5ce99..b258d86 100644
+--- a/pppd/Makefile.linux
++++ b/pppd/Makefile.linux
+@@ -84,6 +84,7 @@ USE_LIBUTIL=y
+ MAXOCTETS=y
+ 
+ INCLUDE_DIRS= -I../include
++OPENSSL_INCLUDE_DIR= /usr/include/openssl
+ 
+ COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP
+ 
+@@ -137,7 +138,7 @@ endif
+ 
+ ifdef NEEDDES
+ ifndef USE_CRYPT
+-CFLAGS   += -I/usr/include/openssl
++CFLAGS   += -I$(OPENSSL_INCLUDE_DIR)
+ LIBS     += -lcrypto
+ else
+ CFLAGS   += -DUSE_CRYPT=1
+-- 
+2.17.1
+
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index ee89a577f2..bf05689f53 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PPPD
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_OPENSSL
 	help
 	  An implementation of the Point-to-point protocol.
 
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 6b86a4d3dc..4dffc17941 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -12,7 +12,10 @@ PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
 
-PPPD_MAKE_OPTS = HAVE_INET6=y
+PPPD_DEPENDENCIES = openssl
+PPPD_MAKE_OPTS = \
+	HAVE_INET6=y \
+	OPENSSL_INCLUDE_DIR=$(STAGING_DIR)/usr/include/openssl
 PPPD_INSTALL_STAGING = YES
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_RADIUS_CONF = \
-- 
2.17.1
