From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  7 Dec 2017 19:48:06 +0200
Subject: [Buildroot] [PATCH] fastd: fix build with newer libsodium
Message-ID: <c807b9a816f86998b946f7508e1adbcc42aaa3b1.1512668886.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch removing aes128-ctr support that libsodium no longer
provides.

Fixes:
http://autobuild.buildroot.net/results/90c/90c526491a9eb6b5ceb38a0218fd480c03208217/
http://autobuild.buildroot.net/results/f81/f815dbfee7099f3b8fea7036e1fd10385f8c6a80/
http://autobuild.buildroot.net/results/329/3299d413ee98963e62c0df4087604c9872fcad68/

Cc: Alexander Dahl <post@lespocky.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...her-remove-aes128-ctr-NaCl-implementation.patch | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 package/fastd/0001-cipher-remove-aes128-ctr-NaCl-implementation.patch

diff --git a/package/fastd/0001-cipher-remove-aes128-ctr-NaCl-implementation.patch b/package/fastd/0001-cipher-remove-aes128-ctr-NaCl-implementation.patch
new file mode 100644
index 000000000000..854b3e74cbf6
--- /dev/null
+++ b/package/fastd/0001-cipher-remove-aes128-ctr-NaCl-implementation.patch
@@ -0,0 +1,137 @@
+From 4b8c4f54bbd70849fc91679bea44b4e1dfb0526d Mon Sep 17 00:00:00 2001
+From: Matthias Schiffer <mschiffer@universe-factory.net>
+Date: Wed, 18 Oct 2017 20:11:30 +0200
+Subject: [PATCH] cipher: remove aes128-ctr NaCl implementation
+
+New versions of libsodium have dropped support for aes128-ctr. AES support
+is only available with OpenSSL now.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 4b8c4f54bb
+
+ doc/source/manual/config.rst                       |  1 -
+ src/crypto/cipher/aes128_ctr/CMakeLists.txt        |  1 -
+ src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt   |  6 --
+ .../aes128_ctr/nacl/cipher_aes128_ctr_nacl.c       | 76 ----------------------
+ 4 files changed, 84 deletions(-)
+ delete mode 100644 src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt
+ delete mode 100644 src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c
+
+diff --git a/doc/source/manual/config.rst b/doc/source/manual/config.rst
+index 0abebeb4c245..94d7a9495ef0 100644
+--- a/doc/source/manual/config.rst
++++ b/doc/source/manual/config.rst
+@@ -70,7 +70,6 @@ Example config:
+   * ``aes128-ctr``: AES128 in counter mode
+ 
+     - ``openssl``: Use implementation from OpenSSL's libcrypto
+-    - ``nacl``: Use implementation from NaCl or libsodium
+ 
+   * ``null``: No encryption (for authenticated-only methods using composed_gmac)
+ 
+diff --git a/src/crypto/cipher/aes128_ctr/CMakeLists.txt b/src/crypto/cipher/aes128_ctr/CMakeLists.txt
+index 0588fed798e2..58e8c6b3371c 100644
+--- a/src/crypto/cipher/aes128_ctr/CMakeLists.txt
++++ b/src/crypto/cipher/aes128_ctr/CMakeLists.txt
+@@ -1,3 +1,2 @@
+ fastd_cipher(aes128-ctr aes128_ctr.c)
+ add_subdirectory(openssl)
+-add_subdirectory(nacl)
+diff --git a/src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt b/src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt
+deleted file mode 100644
+index 676aa5d48ec4..000000000000
+--- a/src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt
++++ /dev/null
+@@ -1,6 +0,0 @@
+-fastd_cipher_impl(aes128-ctr nacl
+-  cipher_aes128_ctr_nacl.c
+-)
+-fastd_cipher_impl_include_directories(aes128-ctr nacl ${NACL_INCLUDE_DIRS})
+-fastd_cipher_impl_link_libraries(aes128-ctr nacl ${NACL_LIBRARIES})
+-fastd_cipher_impl_require(aes128-ctr nacl NACL)
+diff --git a/src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c b/src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c
+deleted file mode 100644
+index ead632640414..000000000000
+--- a/src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c
++++ /dev/null
+@@ -1,76 +0,0 @@
+-/*
+-  Copyright (c) 2012-2016, Matthias Schiffer <mschiffer@universe-factory.net>
+-  All rights reserved.
+-
+-  Redistribution and use in source and binary forms, with or without
+-  modification, are permitted provided that the following conditions are met:
+-
+-    1. Redistributions of source code must retain the above copyright notice,
+-       this list of conditions and the following disclaimer.
+-    2. Redistributions in binary form must reproduce the above copyright notice,
+-       this list of conditions and the following disclaimer in the documentation
+-       and/or other materials provided with the distribution.
+-
+-  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+-  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+-  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+-  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
+-  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+-  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+-  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+-  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+-  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+-  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+-*/
+-
+-/**
+-   \file
+-
+-   The aes128-ctr implementation from NaCl
+-*/
+-
+-
+-#include "../../../../crypto.h"
+-#include "../../../../alloc.h"
+-
+-#include <crypto_stream_aes128ctr.h>
+-
+-
+-/** The cipher state */
+-struct __attribute__((aligned(16))) fastd_cipher_state {
+-	uint8_t d[crypto_stream_aes128ctr_BEFORENMBYTES] __attribute__((aligned(16))); /**< The unpacked AES key */
+-};
+-
+-
+-/** Initializes the cipher state */
+-static fastd_cipher_state_t * aes128_ctr_init(const uint8_t *key) {
+-	fastd_block128_t k;
+-	memcpy(k.b, key, sizeof(fastd_block128_t));
+-
+-	fastd_cipher_state_t *state = fastd_new_aligned(fastd_cipher_state_t, 16);
+-	crypto_stream_aes128ctr_beforenm(state->d, k.b);
+-
+-	return state;
+-}
+-
+-/** XORs data with the aes128-ctr cipher stream */
+-static bool aes128_ctr_crypt(const fastd_cipher_state_t *state, fastd_block128_t *out, const fastd_block128_t *in, size_t len, const uint8_t *iv) {
+-	crypto_stream_aes128ctr_xor_afternm(out->b, in->b, len, iv, state->d);
+-	return true;
+-}
+-
+-/** Frees the cipher state */
+-static void aes128_ctr_free(fastd_cipher_state_t *state) {
+-	if (state) {
+-		secure_memzero(state, sizeof(*state));
+-		free(state);
+-	}
+-}
+-
+-
+-/** The nacl aes128-ctr implementation */
+-const fastd_cipher_t fastd_cipher_aes128_ctr_nacl = {
+-	.init = aes128_ctr_init,
+-	.crypt = aes128_ctr_crypt,
+-	.free = aes128_ctr_free,
+-};
+-- 
+2.15.0
+
-- 
2.15.0
