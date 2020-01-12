From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Jan 2020 23:06:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/pppd: bump to version 2.4.8
Message-ID: <20200112220634.3720101-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github to get latest release
- Drop first and second patches (already in version)
- Drop third patch and OPENSSL_INCLUDE_DIR (not needed since
  https://github.com/paulusmack/ppp/commit/4e713175eae56cb863b39bc19d377f95a35823a8)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...net-in.h-above-linux-header-includes.patch |  22 ----
 ...he-DES-instead-of-the-libcrypt-glibc.patch | 113 ------------------
 .../pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch   |  38 ------
 package/pppd/pppd.hash                        |   6 +-
 package/pppd/pppd.mk                          |   6 +-
 5 files changed, 4 insertions(+), 181 deletions(-)
 delete mode 100644 package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch
 delete mode 100644 package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch
 delete mode 100644 package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch

diff --git a/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch b/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch
deleted file mode 100644
index 2f6933f5e5..0000000000
--- a/package/pppd/0001-Move-netinet-in.h-above-linux-header-includes.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
-index 9ab2eee..b827620 100644
---- a/pppd/plugins/rp-pppoe/pppoe.h
-+++ b/pppd/plugins/rp-pppoe/pppoe.h
-@@ -47,6 +47,8 @@
- #include <sys/socket.h>
- #endif
- 
-+#include <netinet/in.h>
-+
- /* Ugly header files on some Linux boxes... */
- #if defined(HAVE_LINUX_IF_H)
- #include <linux/if.h>
-@@ -84,8 +86,6 @@ typedef unsigned long UINT32_t;
- #include <linux/if_ether.h>
- #endif
- 
--#include <netinet/in.h>
--
- #ifdef HAVE_NETINET_IF_ETHER_H
- #include <sys/types.h>
- 
diff --git a/package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch b/package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch
deleted file mode 100644
index 3804edc6db..0000000000
--- a/package/pppd/0002-pppd-Use-openssl-for-the-DES-instead-of-the-libcrypt-glibc.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 3c7b86229f7bd2600d74db14b1fe5b3896be3875 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
-Date: Fri, 6 Apr 2018 14:27:18 +0200
-Subject: [PATCH] pppd: Use openssl for the DES instead of the libcrypt / glibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-It seems the latest glibc (in Fedora glibc-2.27.9000-12.fc29) dropped
-libcrypt.  The libxcrypt standalone package can be used instead, but
-it dropped the old setkey/encrypt API which ppp uses for DES.  There
-is support for using openssl in pppcrypt.c, but it contains typos
-preventing it from compiling and seems to be written for an ancient
-openssl version.
-
-This updates the code to use current openssl.
-
-[paulus at ozlabs.org - wrote the commit description, fixed comment in
- Makefile.linux.]
-
-Signed-off-by: Jaroslav ?karvada <jskarvad@redhat.com>
-Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/paulusmack/ppp/commit/3c7b86229f7bd2600d74db14b1fe5b3896be3875]
----
- pppd/Makefile.linux |  7 ++++---
- pppd/pppcrypt.c     | 18 +++++++++---------
- 2 files changed, 13 insertions(+), 12 deletions(-)
-
-diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
-index 36d2b036..8d5ce99d 100644
---- a/pppd/Makefile.linux
-+++ b/pppd/Makefile.linux
-@@ -35,10 +35,10 @@ endif
- COPTS = -O2 -pipe -Wall -g
- LIBS =
- 
--# Uncomment the next 2 lines to include support for Microsoft's
-+# Uncomment the next line to include support for Microsoft's
- # MS-CHAP authentication protocol.  Also, edit plugins/radius/Makefile.linux.
- CHAPMS=y
--USE_CRYPT=y
-+#USE_CRYPT=y
- # Don't use MSLANMAN unless you really know what you're doing.
- #MSLANMAN=y
- # Uncomment the next line to include support for MPPE.  CHAPMS (above) must
-@@ -137,7 +137,8 @@ endif
- 
- ifdef NEEDDES
- ifndef USE_CRYPT
--LIBS     += -ldes $(LIBS)
-+CFLAGS   += -I/usr/include/openssl
-+LIBS     += -lcrypto
- else
- CFLAGS   += -DUSE_CRYPT=1
- endif
-diff --git a/pppd/pppcrypt.c b/pppd/pppcrypt.c
-index 8b85b132..6b35375e 100644
---- a/pppd/pppcrypt.c
-+++ b/pppd/pppcrypt.c
-@@ -64,7 +64,7 @@ u_char *des_key;	/* OUT 64 bit DES key with parity bits added */
- 	des_key[7] = Get7Bits(key, 49);
- 
- #ifndef USE_CRYPT
--	des_set_odd_parity((des_cblock *)des_key);
-+	DES_set_odd_parity((DES_cblock *)des_key);
- #endif
- }
- 
-@@ -158,25 +158,25 @@ u_char *clear;	/* OUT 8 octets */
- }
- 
- #else /* USE_CRYPT */
--static des_key_schedule	key_schedule;
-+static DES_key_schedule	key_schedule;
- 
- bool
- DesSetkey(key)
- u_char *key;
- {
--	des_cblock des_key;
-+	DES_cblock des_key;
- 	MakeKey(key, des_key);
--	des_set_key(&des_key, key_schedule);
-+	DES_set_key(&des_key, &key_schedule);
- 	return (1);
- }
- 
- bool
--DesEncrypt(clear, key, cipher)
-+DesEncrypt(clear, cipher)
- u_char *clear;	/* IN  8 octets */
- u_char *cipher;	/* OUT 8 octets */
- {
--	des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
--	    key_schedule, 1);
-+	DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
-+	    &key_schedule, 1);
- 	return (1);
- }
- 
-@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
- u_char *cipher;	/* IN  8 octets */
- u_char *clear;	/* OUT 8 octets */
- {
--	des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
--	    key_schedule, 0);
-+	DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
-+	    &key_schedule, 0);
- 	return (1);
- }
- 
diff --git a/package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch b/package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch
deleted file mode 100644
index e629a2dec1..0000000000
--- a/package/pppd/0003-Add-OPENSSL_INCLUDE_DIR.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 24dd10608bfb554390c17f709a5afa30060c994b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 31 Oct 2018 10:49:16 +0100
-Subject: [PATCH] Add OPENSSL_INCLUDE_DIR
-
-Add OPENSSL_INCLUDE_DIR to be able to override openssl include directory
-as -I/usr/include/openssl can't be used when cross-compiling
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/paulusmack/ppp/pull/107]
----
- pppd/Makefile.linux | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
-index 8d5ce99..b258d86 100644
---- a/pppd/Makefile.linux
-+++ b/pppd/Makefile.linux
-@@ -84,6 +84,7 @@ USE_LIBUTIL=y
- MAXOCTETS=y
- 
- INCLUDE_DIRS= -I../include
-+OPENSSL_INCLUDE_DIR= /usr/include/openssl
- 
- COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP
- 
-@@ -137,7 +138,7 @@ endif
- 
- ifdef NEEDDES
- ifndef USE_CRYPT
--CFLAGS   += -I/usr/include/openssl
-+CFLAGS   += -I$(OPENSSL_INCLUDE_DIR)
- LIBS     += -lcrypto
- else
- CFLAGS   += -DUSE_CRYPT=1
--- 
-2.17.1
-
diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index 2baa6939e4..a923158576 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,9 +1,7 @@
-# Locally calculated after checking pgp signature
-sha256	02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30	ppp-2.4.7.tar.gz
-
 # Locally calculated
+sha256	91fbff784ad16a1111a7f22df4675aeb161d958bb79f1cc4c1f0c81944e7cb40	pppd-2.4.8.tar.gz
 sha256	3990c65c506885f7bb75455d1d6188743a14ad46f5b62e136ef3739aed52c532	pppd/tdb.c
 sha256	1822ead9d2854adfbd282322b29730a3fec4cc67f6f6a2e487aad3476e3afd59	pppd/plugins/pppoatm/COPYING
 sha256	91a5e9c173e0e001e081e15bf7850cfd782a0baa02f5921e327ae3b449beff3f	pppdump/bsd-comp.c
-sha256	41f7dbfa7c80940be74803c456c3a28f218b13a9e51e9777d3e9cb4cb6b4e692	pppd/ccp.c
+sha256	ee1c28551c87cdcdaf80eb3922726f015201614cb560a5ed18a7a0c15f2b4aa4	pppd/ccp.c
 sha256	6fa4c3dad059f6ef15c1c5e5219d9d0d40991dd3a162098a89967a1720de059e	pppd/plugins/passprompt.c
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 29e52be978..4784fe79f8 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PPPD_VERSION = 2.4.7
-PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
-PPPD_SITE = https://download.samba.org/pub/ppp
+PPPD_VERSION = 2.4.8
+PPPD_SITE = $(call github,paulusmack,ppp,ppp-$(PPPD_VERSION))
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
@@ -15,7 +14,6 @@ PPPD_LICENSE_FILES = \
 PPPD_MAKE_OPTS = HAVE_INET6=y
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 PPPD_DEPENDENCIES += openssl
-PPPD_MAKE_OPTS += OPENSSL_INCLUDE_DIR=$(STAGING_DIR)/usr/include/openssl
 else
 PPPD_MAKE_OPTS += USE_CRYPT=y
 endif
-- 
2.24.1
