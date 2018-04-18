From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 18 Apr 2018 16:24:33 +0200
Subject: [Buildroot] [PATCH 2/3] dropbear: Add configuration options for
 security features
In-Reply-To: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
Message-ID: <20180418142434.7268-2-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dropbear server provides no runtime configuration of ciphers, key
exchange algorithms, etc., but must rather be configured compile time.
With no configurability the default settings will be use which may not
be desired in all scenearios.

These new options allow the selection of
  Ciphers (AES128, AES256, 3DES, BLowfish, Twofish128, Twofish256)
  Cipher modes (CBC, CTR)
  Integrity algorithms (SHA1, SHA1-96, SHA2-256, SHA2-512, MD5)
  Key exchange algorithms (RSA, DSS, ECDSA, Curve25519, ECDH)
  Authenticaton types (Password, Pubkey)

No defaults are changed.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/dropbear/Config.in   | 163 +++++++++++++++++++++++++++++++++++
 package/dropbear/dropbear.mk |  25 +++++-
 2 files changed, 185 insertions(+), 3 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 6700778161..441c521d18 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -55,4 +55,167 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
 	  Enable logging of dropbear access to lastlog. Notice that
 	  Buildroot does not generate lastlog by default.
 
+menu "Dropbear ciphers"
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_AES128
+	bool "AES128"
+	default y
+	help
+	  Enable the AES128 cipher
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_AES256
+	bool "AES256"
+	default y
+	help
+	  Enable the AES256 cipher
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_3DES
+	bool "3DES"
+	default y
+	help
+	  Enable the 3DES cipher
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_BLOWFISH
+	bool "Blowfish"
+	default y	if !BR2_PACKAGE_DROPBEAR_SMALL
+	help
+	  Enable the Blowfish cipher
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_TWOFISH128
+	bool "Twofish128"
+	default y	if !BR2_PACKAGE_DROPBEAR_SMALL
+	help
+	  Enable the Twofish128 cipher
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_TWOFISH256
+	bool "Twofish256"
+	default y	if !BR2_PACKAGE_DROPBEAR_SMALL
+	help
+	  Enable the Twofish256 cipher
+
+endmenu
+
+menu "Dropbear cipher modes"
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_MODE_CBC
+	bool "CBC"
+	default y
+	help
+	  Enable CBC mode for ciphers. This has security issues though
+	  is the most compatible with older SSH implementations
+
+config BR2_PACKAGE_DROPBEAR_CIPHER_MODE_CTR
+	bool "CTR"
+	default y
+	help
+	  Enable "Counter Mode" for ciphers. This is more secure than
+	  normal CBC mode against certain attacks. It is recommended
+	  for security and forwards compatibility
+
+endmenu
+
+menu "Dropbear integrity algorithms"
+
+config BR2_PACKAGE_DROPBEAR_HMAC_SHA1
+	bool "SHA1"
+	default y
+	help
+	  Enable SHA1 integrity algorithm
+
+config BR2_PACKAGE_DROPBEAR_HMAC_SHA1_96
+	bool "SHA1-96"
+	default y
+	help
+	  Enable SHA1-96 integrity algorithm
+
+config BR2_PACKAGE_DROPBEAR_HMAC_SHA2_256
+	bool "SHA2-256"
+	default y
+	help
+	  Enable SHA2-256 integrity algorithm
+
+config BR2_PACKAGE_DROPBEAR_HMAC_SHA2_512
+	bool "SHA2-512"
+	default y
+	help
+	  Enable SHA2-512 integrity algorithm
+
+config BR2_PACKAGE_DROPBEAR_HMAC_MD5
+	bool "MD5"
+	default y
+	help
+	  Enable MD5 integrity algorithm. If you disable MD5, Dropbear
+	  will fall back to SHA1 fingerprints, which are not the
+	  standard form
+
+endmenu
+
+menu "Dropbear key exchange algorithms"
+
+config BR2_PACKAGE_DROPBEAR_KEX_RSA
+	bool "RSA"
+	default y
+	help
+	  Enable RSA key exchange algorithm.
+
+config BR2_PACKAGE_DROPBEAR_KEX_DSS
+	bool "DSS"
+	default y
+	help
+	  Enable DSS key exchange algorithm. SSH2 RFC Draft requires
+	  DSS.
+
+config BR2_PACKAGE_DROPBEAR_KEX_ECDSA
+	bool "ECDSA"
+	default y
+	help
+	  Enable Curve25519 for key exchange. ECDSA is significantly
+	  faster than RSA or DSS. Compiling in ECC code (either ECDSA
+	  or ECDH) increases binary size - around 30kB on x86-64
+
+config BR2_PACKAGE_DROPBEAR_KEX_CURVE25519
+	bool "Curve25519"
+	default y
+	help
+	  Enable Curve25519 for key exchange. This is another elliptic
+	  curve method with good security properties
+
+config BR2_PACKAGE_DROPBEAR_KEX_ECDH
+	bool "ECDH"
+	default y
+	help
+	  Enable elliptic curve Diffie Hellman key exchange algorithm
+
+config BR2_PACKAGE_DROPBEAR_KEX_DH_GROUP1
+	bool "DH Group1"
+	default y
+	help
+	  Enable DH Group1 key exchange algorithm. Group1 is less
+	  secure (1024 bit) than Group14 though is the only option for
+	  interoperability with some older SSH programs
+
+config BR2_PACKAGE_DROPBEAR_KEX_DH_GROUP14
+	bool "DH Group14"
+	default y
+	help
+	  Enable DH Group14 key exchange algorithm
+
+endmenu
+
+menu "Dropbear authenticaton types"
+
+config BR2_PACKAGE_DROPBEAR_AUTH_TYPE_PASSWORD
+	bool "Password"
+	default y
+	help
+	  Enable password based authentication
+
+config BR2_PACKAGE_DROPBEAR_AUTH_TYPE_PUBKEY
+	bool "Public key"
+	default y
+	help
+	  Enable public key based authentication
+
+endmenu
+
 endif
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index dc1fee207f..cdbb77d5c3 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -45,9 +45,28 @@ define DROPBEAR_SET_OPTIONS
 	$(call DROPBEAR_SET_OPT,NO_FAST_EXPTMOD,$(BR2_PACKAGE_DROPBEAR_SMALL))
 	$(call DROPBEAR_SET_OPT,DO_HOST_LOOKUP,$(BR2_PACKAGE_DROPBEAR_ENABLE_REVERSE_DNS))
 	$(call DROPBEAR_SET_OPT,NON_INETD_MODE,$(BR2_USE_MMU))
-	$(call DROPBEAR_SET_OPT,DROPBEAR_BLOWFISH,!$(BR2_PACKAGE_DROPBEAR_SMALL))
-	$(call DROPBEAR_SET_OPT,DROPBEAR_TWOFISH128,!$(BR2_PACKAGE_DROPBEAR_SMALL))
-	$(call DROPBEAR_SET_OPT,DROPBEAR_TWOFISH256,!$(BR2_PACKAGE_DROPBEAR_SMALL))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_AES128,$(BR2_PACKAGE_DROPBEAR_CIPHER_AES128))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_AES256,$(BR2_PACKAGE_DROPBEAR_CIPHER_AES256))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_3DES,$(BR2_PACKAGE_DROPBEAR_CIPHER_3DES))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_BLOWFISH,$(BR2_PACKAGE_DROPBEAR_CIPHER_BLOWFISH))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_TWOFISH128,$(BR2_PACKAGE_DROPBEAR_CIPHER_TWOFISH128))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_TWOFISH256,$(BR2_PACKAGE_DROPBEAR_CIPHER_TWOFISH256))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_ENABLE_CBC_MODE,$(BR2_PACKAGE_DROPBEAR_CIPHER_MODE_CBC))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_ENABLE_CTR_MODE,$(BR2_PACKAGE_DROPBEAR_CIPHER_MODE_CTR))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_SHA1_HMAC,$(BR2_PACKAGE_DROPBEAR_HMAC_SHA1))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_SHA1_96_HMAC,$(BR2_PACKAGE_DROPBEAR_HMAC_SHA1_96))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_SHA2_256_HMAC,$(BR2_PACKAGE_DROPBEAR_HMAC_SHA2_256))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_SHA2_512_HMAC,$(BR2_PACKAGE_DROPBEAR_HMAC_SHA2_512))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_MD5_HMAC,$(BR2_PACKAGE_DROPBEAR_HMAC_MD5))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_RSA,$(BR2_PACKAGE_DROPBEAR_KEX_RSA))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_DSS,$(BR2_PACKAGE_DROPBEAR_KEX_DSS))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_ECDSA,$(BR2_PACKAGE_DROPBEAR_KEX_ECDSA))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_CURCE25519,$(BR2_PACKAGE_DROPBEAR_KEX_CURVE25519))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_ECDH,$(BR2_PACKAGE_DROPBEAR_KEX_ECDH))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_DH_GROUP1,$(BR2_PACKAGE_DROPBEAR_KEX_DH_GROUP1))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_DH_GROUP14,$(BR2_PACKAGE_DROPBEAR_KEX_DH_GROUP14))
+	$(call DROPBEAR_SET_OPT,ENABLE_SVR_PASSWORD_AUTH,$(BR2_PACKAGE_DROPBEAR_AUTH_TYPE_PASSWORD))
+	$(call DROPBEAR_SET_OPT,ENABLE_SVR_PUBKEY_AUTH,$(BR2_PACKAGE_DROPBEAR_AUTH_TYPE_PUBKEY))
 endef
 
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SET_OPTIONS
-- 
2.17.0
