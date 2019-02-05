From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Feb 2019 08:37:09 -0600
Subject: [Buildroot] [PATCH] package/ipmitool: add openssl 1.1.x
 compatibility
Message-ID: <1549377429-14698-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes adapt the current codebase to use support APIs now that
openssl 1.1.x by default disables all depricated items.

Fixes
http://autobuild.buildroot.net/results/97d/97dab568f1f3d342b6bfcb9f597ced4de6f1309e

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...SSL-1.1-compatibility-error-storage-size-.patch | 108 +++++++++++++++
 ...-compiler-happier-about-changes-related-t.patch |  40 ++++++
 ...ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch |  57 ++++++++
 ...-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch | 148 +++++++++++++++++++++
 ...Fix-compile-with-deprecated-APIs-disabled.patch |  50 +++++++
 5 files changed, 403 insertions(+)
 create mode 100644 package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch
 create mode 100644 package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch
 create mode 100644 package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch
 create mode 100644 package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch
 create mode 100644 package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch

diff --git a/package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch b/package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch
new file mode 100644
index 0000000..d43f22e
--- /dev/null
+++ b/package/ipmitool/0002-ID-461-OpenSSL-1.1-compatibility-error-storage-size-.patch
@@ -0,0 +1,108 @@
+From 1ad09f56d461e78ad83c77b654fb65467a68388b Mon Sep 17 00:00:00 2001
+From: Dennis Schridde <dennis.schridde@uni-heidelberg.de>
+Date: Wed, 30 Nov 2016 17:33:00 +0100
+Subject: [PATCH] ID:461 - OpenSSL 1.1 compatibility - "error: storage size
+ of 'ctx' isn't known"
+
+In OpenSSL 1.1 EVP_CIPHER_CTX became opaque, cf. `man 3ssl EVP_EncryptInit`
+
+Fixes: ID:461
+
+Upstream: https://github.com/ipmitool/ipmitool/commit/b57487e360916ab3eaa50aa6d021c73b6337a4a0
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/plugins/lanplus/lanplus_crypt_impl.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
+index d5fac37..3c0df23 100644
+--- a/src/plugins/lanplus/lanplus_crypt_impl.c
++++ b/src/plugins/lanplus/lanplus_crypt_impl.c
+@@ -164,10 +164,10 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint8_t       * output,
+ 							uint32_t        * bytes_written)
+ {
+-	EVP_CIPHER_CTX ctx;
+-	EVP_CIPHER_CTX_init(&ctx);
+-	EVP_EncryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
+-	EVP_CIPHER_CTX_set_padding(&ctx, 0);
++	EVP_CIPHER_CTX* ctx;
++	EVP_CIPHER_CTX_init(ctx);
++	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
++	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 	
+ 
+ 	*bytes_written = 0;
+@@ -191,7 +191,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
+ 
+ 
+-	if(!EVP_EncryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
++	if(!EVP_EncryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
+ 	{
+ 		/* Error */
+ 		*bytes_written = 0;
+@@ -201,7 +201,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 	{
+ 		uint32_t tmplen;
+ 
+-		if(!EVP_EncryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
++		if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
+ 		{
+ 			*bytes_written = 0;
+ 			return; /* Error */
+@@ -210,7 +210,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 		{
+ 			/* Success */
+ 			*bytes_written += tmplen;
+-			EVP_CIPHER_CTX_cleanup(&ctx);
++			EVP_CIPHER_CTX_cleanup(ctx);
+ 		}
+ 	}
+ }
+@@ -239,10 +239,10 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint8_t       * output,
+ 							uint32_t        * bytes_written)
+ {
+-	EVP_CIPHER_CTX ctx;
+-	EVP_CIPHER_CTX_init(&ctx);
+-	EVP_DecryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
+-	EVP_CIPHER_CTX_set_padding(&ctx, 0);
++	EVP_CIPHER_CTX* ctx;
++	EVP_CIPHER_CTX_init(ctx);
++	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
++	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+ 
+ 	if (verbose >= 5)
+@@ -266,7 +266,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
+ 
+ 
+-	if (!EVP_DecryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
++	if (!EVP_DecryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
+ 	{
+ 		/* Error */
+ 		lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
+@@ -277,7 +277,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 	{
+ 		uint32_t tmplen;
+ 
+-		if (!EVP_DecryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
++		if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
+ 		{
+ 			char buffer[1000];
+ 			ERR_error_string(ERR_get_error(), buffer);
+@@ -290,7 +290,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 		{
+ 			/* Success */
+ 			*bytes_written += tmplen;
+-			EVP_CIPHER_CTX_cleanup(&ctx);
++			EVP_CIPHER_CTX_cleanup(ctx);
+ 		}
+ 	}
+ 
+-- 
+1.9.1
+
diff --git a/package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch b/package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch
new file mode 100644
index 0000000..7ff27bd
--- /dev/null
+++ b/package/ipmitool/0003-ID-461-Make-compiler-happier-about-changes-related-t.patch
@@ -0,0 +1,40 @@
+From ccc85e4fd67423e770901ec59975e84b07eed883 Mon Sep 17 00:00:00 2001
+From: Zdenek Styblik <stybla@turnovfree.net>
+Date: Sun, 15 Jan 2017 15:11:25 +0100
+Subject: [PATCH] ID:461 - Make compiler happier about changes related to
+ OpenSSL 1.1
+
+Complaint was that ctx isn't initialized.
+
+Upstream: https://github.com/ipmitool/ipmitool/commit/77fe5635037ebaf411cae46cf5045ca819b5c145
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/plugins/lanplus/lanplus_crypt_impl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
+index 3c0df23..d12d0e3 100644
+--- a/src/plugins/lanplus/lanplus_crypt_impl.c
++++ b/src/plugins/lanplus/lanplus_crypt_impl.c
+@@ -164,7 +164,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint8_t       * output,
+ 							uint32_t        * bytes_written)
+ {
+-	EVP_CIPHER_CTX* ctx;
++	EVP_CIPHER_CTX *ctx = NULL;
+ 	EVP_CIPHER_CTX_init(ctx);
+ 	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+ 	EVP_CIPHER_CTX_set_padding(ctx, 0);
+@@ -239,7 +239,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint8_t       * output,
+ 							uint32_t        * bytes_written)
+ {
+-	EVP_CIPHER_CTX* ctx;
++	EVP_CIPHER_CTX *ctx = NULL;
+ 	EVP_CIPHER_CTX_init(ctx);
+ 	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+ 	EVP_CIPHER_CTX_set_padding(ctx, 0);
+-- 
+1.9.1
+
diff --git a/package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch b/package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch
new file mode 100644
index 0000000..aabcc62
--- /dev/null
+++ b/package/ipmitool/0004-ID-480-ipmitool-coredumps-in-EVP_CIPHER_CTX_init.patch
@@ -0,0 +1,57 @@
+From 72df3eadb27161a292f35b1d97178f70f41e50f6 Mon Sep 17 00:00:00 2001
+From: Zdenek Styblik <stybla@turnovfree.net>
+Date: Sun, 12 Mar 2017 14:00:35 +0100
+Subject: [PATCH] ID:480 - ipmitool coredumps in EVP_CIPHER_CTX_init
+
+IPMI tool coredumps due to changes introduced in ID:461. This shouldn't be
+surprise as a NULL pointer is passed to init. Commit addresses this issue by
+calling EVP_CIPHER_CTX_new() instead of EVP_CIPHER_CTX_init(), which is
+deprecated, and by checking return value of call to former function.
+
+Upstream: https://github.com/ipmitool/ipmitool/commit/f004b4b7197fc83e7d47ec8cbcaefffa9a922717
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/plugins/lanplus/lanplus_crypt_impl.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
+index d12d0e3..0e330c1 100644
+--- a/src/plugins/lanplus/lanplus_crypt_impl.c
++++ b/src/plugins/lanplus/lanplus_crypt_impl.c
+@@ -165,10 +165,13 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint32_t        * bytes_written)
+ {
+ 	EVP_CIPHER_CTX *ctx = NULL;
+-	EVP_CIPHER_CTX_init(ctx);
++	ctx = EVP_CIPHER_CTX_new();
++	if (ctx == NULL) {
++		*bytes_written = 0;
++		return;
++	}
+ 	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+ 	EVP_CIPHER_CTX_set_padding(ctx, 0);
+-	
+ 
+ 	*bytes_written = 0;
+ 
+@@ -240,11 +243,14 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint32_t        * bytes_written)
+ {
+ 	EVP_CIPHER_CTX *ctx = NULL;
+-	EVP_CIPHER_CTX_init(ctx);
++	ctx = EVP_CIPHER_CTX_new();
++	if (ctx == NULL) {
++		*bytes_written = 0;
++		return;
++	}
+ 	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+ 	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+-
+ 	if (verbose >= 5)
+ 	{
+ 		printbuf(iv,  16, "decrypting with this IV");
+-- 
+1.9.1
+
diff --git a/package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch b/package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch
new file mode 100644
index 0000000..b3ce965
--- /dev/null
+++ b/package/ipmitool/0005-ID-480-Call-EVP_CIPHER_CTX_free-instead-of-EVP_CIPHE.patch
@@ -0,0 +1,148 @@
+From d9d6e0bff831da03f4448f0cdb82fc3d143662c8 Mon Sep 17 00:00:00 2001
+From: Holger Liebig <holger.liebig@ts.fujitsu.com>
+Date: Tue, 4 Apr 2017 20:43:05 +0200
+Subject: [PATCH] ID:480 - Call EVP_CIPHER_CTX_free() instead of
+ EVP_CIPHER_CTX_cleanup()
+
+Call EVP_CIPHER_CTX_free() instead of EVP_CIPHER_CTX_cleanup() to fix memory
+leak.
+
+Upstream: https://github.com/ipmitool/ipmitool/commit/1664902525a1c3771b4d8b3ccab7ea1ba6b2bdd1
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/plugins/lanplus/lanplus_crypt_impl.c | 44 +++++++++++++++++---------------
+ 1 file changed, 23 insertions(+), 21 deletions(-)
+
+diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
+index 0e330c1..9652a5e 100644
+--- a/src/plugins/lanplus/lanplus_crypt_impl.c
++++ b/src/plugins/lanplus/lanplus_crypt_impl.c
+@@ -165,13 +165,6 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint32_t        * bytes_written)
+ {
+ 	EVP_CIPHER_CTX *ctx = NULL;
+-	ctx = EVP_CIPHER_CTX_new();
+-	if (ctx == NULL) {
+-		*bytes_written = 0;
+-		return;
+-	}
+-	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+-	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+ 	*bytes_written = 0;
+ 
+@@ -185,6 +178,14 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 		printbuf(input, input_length, "encrypting this data");
+ 	}
+ 
++	ctx = EVP_CIPHER_CTX_new();
++	if (ctx == NULL) {
++		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
++		return;
++	}
++	EVP_CIPHER_CTX_init(ctx);
++	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
++	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+ 	/*
+ 	 * The default implementation adds a whole block of padding if the input
+@@ -198,7 +199,6 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 	{
+ 		/* Error */
+ 		*bytes_written = 0;
+-		return;
+ 	}
+ 	else
+ 	{
+@@ -206,16 +206,17 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 
+ 		if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
+ 		{
++			/* Error */
+ 			*bytes_written = 0;
+-			return; /* Error */
+ 		}
+ 		else
+ 		{
+ 			/* Success */
+ 			*bytes_written += tmplen;
+-			EVP_CIPHER_CTX_cleanup(ctx);
+ 		}
+ 	}
++	/* performs cleanup and free */
++	EVP_CIPHER_CTX_free(ctx);
+ }
+ 
+ 
+@@ -243,13 +244,6 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 							uint32_t        * bytes_written)
+ {
+ 	EVP_CIPHER_CTX *ctx = NULL;
+-	ctx = EVP_CIPHER_CTX_new();
+-	if (ctx == NULL) {
+-		*bytes_written = 0;
+-		return;
+-	}
+-	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+-	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+ 	if (verbose >= 5)
+ 	{
+@@ -258,12 +252,20 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 		printbuf(input, input_length, "decrypting this data");
+ 	}
+ 
+-
+ 	*bytes_written = 0;
+ 
+ 	if (input_length == 0)
+ 		return;
+ 
++	ctx = EVP_CIPHER_CTX_new();
++	if (ctx == NULL) {
++		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
++		return;
++	}
++	EVP_CIPHER_CTX_init(ctx);
++	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
++	EVP_CIPHER_CTX_set_padding(ctx, 0);
++
+ 	/*
+ 	 * The default implementation adds a whole block of padding if the input
+ 	 * data is perfectly aligned.  We would like to keep that from happening.
+@@ -277,7 +279,6 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 		/* Error */
+ 		lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
+ 		*bytes_written = 0;
+-		return;
+ 	}
+ 	else
+ 	{
+@@ -285,20 +286,21 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 
+ 		if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
+ 		{
++			/* Error */
+ 			char buffer[1000];
+ 			ERR_error_string(ERR_get_error(), buffer);
+ 			lprintf(LOG_DEBUG, "the ERR error %s", buffer);
+ 			lprintf(LOG_DEBUG, "ERROR: decrypt final failed");
+ 			*bytes_written = 0;
+-			return; /* Error */
+ 		}
+ 		else
+ 		{
+ 			/* Success */
+ 			*bytes_written += tmplen;
+-			EVP_CIPHER_CTX_cleanup(ctx);
+ 		}
+ 	}
++	/* performs cleanup and free */
++	EVP_CIPHER_CTX_free(ctx);
+ 
+ 	if (verbose >= 5)
+ 	{
+-- 
+1.9.1
+
diff --git a/package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch b/package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch
new file mode 100644
index 0000000..87fdd0a
--- /dev/null
+++ b/package/ipmitool/0006-lanplus-Fix-compile-with-deprecated-APIs-disabled.patch
@@ -0,0 +1,50 @@
+From fc2136969adfb926eed610b8ed0a74b2030b48ed Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 21 Aug 2018 19:29:07 -0700
+Subject: [PATCH] lanplus: Fix compile with deprecated APIs disabled.
+
+From the man page:
+
+EVP_CIPHER_CTX was made opaque in OpenSSL 1.1.0. As a result,
+EVP_CIPHER_CTX_reset() appeared and EVP_CIPHER_CTX_cleanup() disappeared.
+EVP_CIPHER_CTX_init() remains as an alias for EVP_CIPHER_CTX_reset().
+
+Upstream: https://github.com/ipmitool/ipmitool/commit/a8862d7508fb138b1c286eea958700cca63c9476
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/plugins/lanplus/lanplus_crypt_impl.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
+index 9652a5e..e94401e 100644
+--- a/src/plugins/lanplus/lanplus_crypt_impl.c
++++ b/src/plugins/lanplus/lanplus_crypt_impl.c
+@@ -183,7 +183,11 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
+ 		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
+ 		return;
+ 	}
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	EVP_CIPHER_CTX_init(ctx);
++#else
++	EVP_CIPHER_CTX_reset(ctx);
++#endif
+ 	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+ 	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+@@ -262,7 +266,11 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
+ 		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
+ 		return;
+ 	}
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	EVP_CIPHER_CTX_init(ctx);
++#else
++	EVP_CIPHER_CTX_reset(ctx);
++#endif
+ 	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
+ 	EVP_CIPHER_CTX_set_padding(ctx, 0);
+ 
+-- 
+1.9.1
+
-- 
1.9.1
