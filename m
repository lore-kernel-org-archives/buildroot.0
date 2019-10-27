From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 16:39:11 +0100
Subject: [Buildroot] [git commit] package/softether: bump to version
 4.30-9700-beta
Message-ID: <20191027153554.4D2438A30D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=639a21440349caccd860b53c965bc068f8752c3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update first patch
- Drop last patch, not needed since
  https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/commit/553978c9a505c2fa427dba7633e69c8f147e9223
- License is Apache-2.0 since version 4.29-9678-rtm and
  https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/commit/0e317124ae6e266d8d5c8c5e6b208633b7706af2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Create-autotools-plumbing-for-SoftEther.patch | 12 ++--
 ...-default-RSA-key-size-to-1024-everywhere-.patch | 78 ----------------------
 package/softether/softether.hash                   |  4 +-
 package/softether/softether.mk                     |  4 +-
 4 files changed, 11 insertions(+), 87 deletions(-)

diff --git a/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch b/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
index 3f17a74dba..92c2885a66 100644
--- a/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
+++ b/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
@@ -28,6 +28,8 @@ NB: http://www.gnu.org/software/autoconf-archive/
 
 [Upstream commit: https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Fabrice: update for 4.30-9700-beta]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile.am                    |  21 ++
  autotools/ax_check_openssl.m4  | 124 ++++++++++
@@ -1502,12 +1504,12 @@ index 00000000..4a3fc2ba
 -echo '---------------------------------------------------------------------'
 -echo 'SoftEther VPN for Unix'
 -echo
--echo 'Copyright (c) SoftEther VPN Project at University of Tsukuba, Japan.'
--echo 'Copyright (c) Daiyuu Nobori. All Rights Reserved.'
+-echo 'Copyright (c) Daiyuu Nobori.'
+-echo 'Copyright (c) SoftEther VPN Project, University of Tsukuba, Japan.'
+-echo 'Copyright (c) SoftEther Corporation.'
+-echo 'Copyright (c) all contributors on SoftEther VPN project in GitHub.'
 -echo
--echo 'This program is free software; you can redistribute it and/or'
--echo 'modify it under the terms of the GNU General Public License'
--echo 'version 2 as published by the Free Software Foundation.'
+-echo 'License: The Apache License, Version 2.0'
 -echo
 -echo 'Read and understand README.TXT, LICENSE.TXT and WARNING.TXT before use.'
 -echo '---------------------------------------------------------------------'
diff --git a/package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch b/package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch
deleted file mode 100644
index 20a1f06229..0000000000
--- a/package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 1fad008e1adba5cb596da6f9ec6a244d49a585cf Mon Sep 17 00:00:00 2001
-From: Davide Beatrici <davidebeatrici@gmail.com>
-Date: Mon, 9 Apr 2018 22:02:34 +0200
-Subject: [PATCH] Encrypt: set default RSA key size to 1024 everywhere, using
- the RSA_KEY_SIZE macro
-
-This commit also fixes the problem described in #31, which was caused by the test key generated in RsaCheck() being too small for newer OpenSSL versions.
-
-Failure looks like
--- Alert: RsaCheck() --
-OpenSSL Library Init Failed. (too old?)
-Please install the latest version of OpenSSL.
-
-Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/commit/1fad008e1adba5cb596da6f9ec6a244d49a585cf
-(Currently still on an active pull request https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/pull/1)
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/Mayaqua/Encrypt.c | 8 ++++----
- src/Mayaqua/Encrypt.h | 2 +-
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/Mayaqua/Encrypt.c b/src/Mayaqua/Encrypt.c
-index 381d1c5..a557052 100644
---- a/src/Mayaqua/Encrypt.c
-+++ b/src/Mayaqua/Encrypt.c
-@@ -2194,7 +2194,7 @@ bool RsaVerifyEx(void *data, UINT data_size, void *sign, K *k, UINT bits)
- 	}
- 	if (bits == 0)
- 	{
--		bits = 1024;
-+		bits = RSA_KEY_SIZE;
- 	}
- 
- 	// Hash the data
-@@ -2233,7 +2233,7 @@ bool RsaSignEx(void *dst, void *src, UINT size, K *k, UINT bits)
- 	}
- 	if (bits == 0)
- 	{
--		bits = 1024;
-+		bits = RSA_KEY_SIZE;
- 	}
- 
- 	Zero(dst, bits / 8);
-@@ -2302,7 +2302,7 @@ bool RsaCheck()
- 	BIO *bio;
- 	char errbuf[MAX_SIZE];
- 	UINT size = 0;
--	UINT bit = 32;
-+	UINT bit = RSA_KEY_SIZE;
- 	// Validate arguments
- 
- 	// Key generation
-@@ -2372,7 +2372,7 @@ bool RsaGen(K **priv, K **pub, UINT bit)
- 	}
- 	if (bit == 0)
- 	{
--		bit = 1024;
-+		bit = RSA_KEY_SIZE;
- 	}
- 
- 	// Key generation
-diff --git a/src/Mayaqua/Encrypt.h b/src/Mayaqua/Encrypt.h
-index d795d2d..0c48161 100644
---- a/src/Mayaqua/Encrypt.h
-+++ b/src/Mayaqua/Encrypt.h
-@@ -128,7 +128,7 @@ void RAND_Free_For_SoftEther();
- #define	DES_IV_SIZE					8			// DES IV size
- #define DES_BLOCK_SIZE				8			// DES block size
- #define DES3_KEY_SIZE				(8 * 3)		// 3DES key size
--#define RSA_KEY_SIZE				128			// RSA key size
-+#define RSA_KEY_SIZE				1024		// RSA key size
- #define DH_KEY_SIZE					128			// DH key size
- #define	RSA_MIN_SIGN_HASH_SIZE		(15 + SHA1_HASH_SIZE)	// Minimum RSA hash size
- #define	RSA_SIGN_HASH_SIZE			(RSA_MIN_SIGN_HASH_SIZE)	// RSA hash size
--- 
-1.9.1
-
diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 986aac859b..01bdc629f0 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fbf6e04c4451d0cb1555c3a53c178b5453c7d761119f82fd693538c9f115fecb softether-4.28-9669-beta.tar.gz
-sha256 0a889e7e7a277397d0a2d56c37814eefd8c6b6129d8b74ee2d27fc3415fad561 LICENSE
+sha256 f579fa938f6d5d0622f23b3c163b3de5dc171e30175e44511bf269b3bb9fb1fc softether-4.30-9700-beta.tar.gz
+sha256 5da6241ddb987c4543bf1cbba6b40a3cd3ecb624dbd4a63daf04440911656bde LICENSE
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index b7c6738b9a..2dbe7edbf3 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 4.28-9669-beta
+SOFTETHER_VERSION = 4.30-9700-beta
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,v$(SOFTETHER_VERSION))
-SOFTETHER_LICENSE = GPL-2.0
+SOFTETHER_LICENSE = Apache-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline
 SOFTETHER_AUTORECONF = YES
