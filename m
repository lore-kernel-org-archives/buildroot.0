From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:32 -0400
Subject: [Buildroot] [PATCH 05/13] mosquitto: add libressl support patch
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-6-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a program checks for openssl 1.1 or higher, it will pass that
check because libressl sets it's version number to 2.x.

Add simple checks to see if LIBRESSL_VERSION_NUMBER is defined.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/mosquitto/0001-fix-libressl-support.patch | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/mosquitto/0001-fix-libressl-support.patch

diff --git a/package/mosquitto/0001-fix-libressl-support.patch b/package/mosquitto/0001-fix-libressl-support.patch
new file mode 100644
index 0000000000..8db1e58370
--- /dev/null
+++ b/package/mosquitto/0001-fix-libressl-support.patch
@@ -0,0 +1,68 @@
+From c2c5e05dc606a2f6299245004e222671cc41c625 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Thu, 3 Aug 2017 14:21:14 -0400
+Subject: [PATCH] fix libressl support
+
+When a program checks for openssl 1.1 or higher, it will pass that
+check because libressl sets it's version number to 2.x.
+
+Add simple checks to see if libressl_version_number is defined.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ lib/net_mosq.c         | 2 +-
+ src/mosquitto_passwd.c | 4 ++--
+ src/security_default.c | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/net_mosq.c b/lib/net_mosq.c
+index 063c4a2..cdbc83f 100644
+--- a/lib/net_mosq.c
++++ b/lib/net_mosq.c
+@@ -114,7 +114,7 @@ void _mosquitto_net_init(void)
+ void _mosquitto_net_cleanup(void)
+ {
+ #ifdef WITH_TLS
+-	#if OPENSSL_VERSION_NUMBER < 0x10100000L
++	#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 		ERR_remove_state(0);
+ 	#endif
+ 	ENGINE_cleanup();
+diff --git a/src/mosquitto_passwd.c b/src/mosquitto_passwd.c
+index c3dd05a..6305ee0 100644
+--- a/src/mosquitto_passwd.c
++++ b/src/mosquitto_passwd.c
+@@ -90,7 +90,7 @@ int output_new_password(FILE *fptr, const char *username, const char *password)
+ 	unsigned char hash[EVP_MAX_MD_SIZE];
+ 	unsigned int hash_len;
+ 	const EVP_MD *digest;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	EVP_MD_CTX context;
+ #else
+ 	EVP_MD_CTX *context;
+@@ -117,7 +117,7 @@ int output_new_password(FILE *fptr, const char *username, const char *password)
+ 		return 1;
+ 	}
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	EVP_MD_CTX_init(&context);
+ 	EVP_DigestInit_ex(&context, digest, NULL);
+ 	EVP_DigestUpdate(&context, password, strlen(password));
+diff --git a/src/security_default.c b/src/security_default.c
+index 43cd3f0..e307b7a 100644
+--- a/src/security_default.c
++++ b/src/security_default.c
+@@ -790,7 +790,7 @@ int mosquitto_psk_key_get_default(struct mosquitto_db *db, const char *hint, con
+ int _pw_digest(const char *password, const unsigned char *salt, unsigned int salt_len, unsigned char *hash, unsigned int *hash_len)
+ {
+ 	const EVP_MD *digest;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	EVP_MD_CTX context;
+ 
+ 	digest = EVP_get_digestbyname("sha512");
+-- 
+2.13.3
+
-- 
2.13.6
