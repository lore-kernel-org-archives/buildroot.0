From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:39:22 +0200
Subject: [Buildroot] [git commit] package/fastd: bump to v19
Message-ID: <20200618203740.8405B8111E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9856e1d89a65cdb0055c85d1b9bb1b2aaf79a63f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maintenance release, most important is OpenSSL 1.1+ support. See full
release notes for details:

https://fastd.readthedocs.io/en/stable/releases/v19.html

Two patches went upstream.  The last remaining patch was not touched,
LTO might not work as expected, but upstream dropped CMake in favour
of the meson build system after v19, so it seemed not worth the
effort.

The hash of the license file is updated due to a copyright year
change.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...02-CMakeList-do-not-overwrite-module-path.patch |  56 ---------
 ...her-remove-aes128-ctr-NaCl-implementation.patch | 137 ---------------------
 package/fastd/fastd.hash                           |   6 +-
 package/fastd/fastd.mk                             |   4 +-
 4 files changed, 4 insertions(+), 199 deletions(-)

diff --git a/package/fastd/0002-CMakeList-do-not-overwrite-module-path.patch b/package/fastd/0002-CMakeList-do-not-overwrite-module-path.patch
deleted file mode 100644
index 88c1953d82..0000000000
--- a/package/fastd/0002-CMakeList-do-not-overwrite-module-path.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From a925a4cab1b722a2a24b0c1d2a1925f3b766de61 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Thu, 2 Mar 2017 21:43:39 +0100
-Subject: [PATCH] CMakeList: do not overwrite module path
-
-Currently, the CMakeList.txt completely overwrites the CMAKE_MODULE_PATH
-variable.
-
-This is problematic when an upper-layer buildsystem wants to set its own
-module path to use custom modules.
-
-For example, Buldroot [0] provides a custom platform description [1] to fix
-cross-compilation issue. Overwriting the module path means that this
-custom platform description is not found [2].
-
-Providing such a custom platform description is what the upstream cmake
-devs suggest [3], quoting:
-
-    If a toolchain file specifies CMAKE_SYSTEM_NAME such that a custom
-    `Platform/MySystem.cmake` file is loaded then the latter can set
-    them [*] as needed for the target platform.
-
-[*] offending settings causing RPATH issues during cross-compilation.
-
-So we need to append our source tree to the module path, not replace it
-blindly.
-
-[0] https://buildroot.org/
-[1] https://git.buildroot.org/buildroot/tree/support/misc/Buildroot.cmake
-[2] http://autobuild.buildroot.net/results/69f/69fb2e3b549a069e2898506db918423e6742c589/build-end.log
-[3] http://public.kitware.com/pipermail/cmake/2017-February/065063.html
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Patch applied upstream:
-https://git.universe-factory.net/fastd/commit/?id=a925a4cab1b722a2a24b0c1d2a1925f3b766de61
-
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 61689b1..2c9c61a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 2.8.8)
- 
--set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
-+list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
- cmake_policy(SET CMP0017 OLD) # Prefer modules in our module directory
- 
- project(FASTD C ASM)
--- 
-2.7.4
-
diff --git a/package/fastd/0003-cipher-remove-aes128-ctr-NaCl-implementation.patch b/package/fastd/0003-cipher-remove-aes128-ctr-NaCl-implementation.patch
deleted file mode 100644
index 854b3e74cb..0000000000
--- a/package/fastd/0003-cipher-remove-aes128-ctr-NaCl-implementation.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 4b8c4f54bbd70849fc91679bea44b4e1dfb0526d Mon Sep 17 00:00:00 2001
-From: Matthias Schiffer <mschiffer@universe-factory.net>
-Date: Wed, 18 Oct 2017 20:11:30 +0200
-Subject: [PATCH] cipher: remove aes128-ctr NaCl implementation
-
-New versions of libsodium have dropped support for aes128-ctr. AES support
-is only available with OpenSSL now.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 4b8c4f54bb
-
- doc/source/manual/config.rst                       |  1 -
- src/crypto/cipher/aes128_ctr/CMakeLists.txt        |  1 -
- src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt   |  6 --
- .../aes128_ctr/nacl/cipher_aes128_ctr_nacl.c       | 76 ----------------------
- 4 files changed, 84 deletions(-)
- delete mode 100644 src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt
- delete mode 100644 src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c
-
-diff --git a/doc/source/manual/config.rst b/doc/source/manual/config.rst
-index 0abebeb4c245..94d7a9495ef0 100644
---- a/doc/source/manual/config.rst
-+++ b/doc/source/manual/config.rst
-@@ -70,7 +70,6 @@ Example config:
-   * ``aes128-ctr``: AES128 in counter mode
- 
-     - ``openssl``: Use implementation from OpenSSL's libcrypto
--    - ``nacl``: Use implementation from NaCl or libsodium
- 
-   * ``null``: No encryption (for authenticated-only methods using composed_gmac)
- 
-diff --git a/src/crypto/cipher/aes128_ctr/CMakeLists.txt b/src/crypto/cipher/aes128_ctr/CMakeLists.txt
-index 0588fed798e2..58e8c6b3371c 100644
---- a/src/crypto/cipher/aes128_ctr/CMakeLists.txt
-+++ b/src/crypto/cipher/aes128_ctr/CMakeLists.txt
-@@ -1,3 +1,2 @@
- fastd_cipher(aes128-ctr aes128_ctr.c)
- add_subdirectory(openssl)
--add_subdirectory(nacl)
-diff --git a/src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt b/src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt
-deleted file mode 100644
-index 676aa5d48ec4..000000000000
---- a/src/crypto/cipher/aes128_ctr/nacl/CMakeLists.txt
-+++ /dev/null
-@@ -1,6 +0,0 @@
--fastd_cipher_impl(aes128-ctr nacl
--  cipher_aes128_ctr_nacl.c
--)
--fastd_cipher_impl_include_directories(aes128-ctr nacl ${NACL_INCLUDE_DIRS})
--fastd_cipher_impl_link_libraries(aes128-ctr nacl ${NACL_LIBRARIES})
--fastd_cipher_impl_require(aes128-ctr nacl NACL)
-diff --git a/src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c b/src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c
-deleted file mode 100644
-index ead632640414..000000000000
---- a/src/crypto/cipher/aes128_ctr/nacl/cipher_aes128_ctr_nacl.c
-+++ /dev/null
-@@ -1,76 +0,0 @@
--/*
--  Copyright (c) 2012-2016, Matthias Schiffer <mschiffer@universe-factory.net>
--  All rights reserved.
--
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions are met:
--
--    1. Redistributions of source code must retain the above copyright notice,
--       this list of conditions and the following disclaimer.
--    2. Redistributions in binary form must reproduce the above copyright notice,
--       this list of conditions and the following disclaimer in the documentation
--       and/or other materials provided with the distribution.
--
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
--  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
--  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
--  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
--  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
--  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
--  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--*/
--
--/**
--   \file
--
--   The aes128-ctr implementation from NaCl
--*/
--
--
--#include "../../../../crypto.h"
--#include "../../../../alloc.h"
--
--#include <crypto_stream_aes128ctr.h>
--
--
--/** The cipher state */
--struct __attribute__((aligned(16))) fastd_cipher_state {
--	uint8_t d[crypto_stream_aes128ctr_BEFORENMBYTES] __attribute__((aligned(16))); /**< The unpacked AES key */
--};
--
--
--/** Initializes the cipher state */
--static fastd_cipher_state_t * aes128_ctr_init(const uint8_t *key) {
--	fastd_block128_t k;
--	memcpy(k.b, key, sizeof(fastd_block128_t));
--
--	fastd_cipher_state_t *state = fastd_new_aligned(fastd_cipher_state_t, 16);
--	crypto_stream_aes128ctr_beforenm(state->d, k.b);
--
--	return state;
--}
--
--/** XORs data with the aes128-ctr cipher stream */
--static bool aes128_ctr_crypt(const fastd_cipher_state_t *state, fastd_block128_t *out, const fastd_block128_t *in, size_t len, const uint8_t *iv) {
--	crypto_stream_aes128ctr_xor_afternm(out->b, in->b, len, iv, state->d);
--	return true;
--}
--
--/** Frees the cipher state */
--static void aes128_ctr_free(fastd_cipher_state_t *state) {
--	if (state) {
--		secure_memzero(state, sizeof(*state));
--		free(state);
--	}
--}
--
--
--/** The nacl aes128-ctr implementation */
--const fastd_cipher_t fastd_cipher_aes128_ctr_nacl = {
--	.init = aes128_ctr_init,
--	.crypt = aes128_ctr_crypt,
--	.free = aes128_ctr_free,
--};
--- 
-2.15.0
-
diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
index accdf087eb..2c75ea09e9 100644
--- a/package/fastd/fastd.hash
+++ b/package/fastd/fastd.hash
@@ -1,5 +1,3 @@
-# from https://projects.universe-factory.net/projects/fastd/files
-md5     e53236d3049f64f7955ad9556da099eb                                  fastd-18.tar.xz
 # computed locally
-sha256  714ff09d7bd75f79783f744f6f8c5af2fe456c8cf876feaa704c205a73e043c9  fastd-18.tar.xz
-sha256  c3095dd0adffc03eaeba9c7cd81f06962ef4797a836e49468b3dccc2802ff904  COPYRIGHT
+sha256  6054608e2103b634c9d19ecd1ae058d4ec694747047130719db180578729783a  fastd-19.tar.xz
+sha256  1f5acece57466eac89108f934a196be09b7676fa2d637e78d6657ee1a7d644ac  COPYRIGHT
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index e67acdbf18..b1261f0fa5 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FASTD_VERSION = 18
-FASTD_SITE = https://projects.universe-factory.net/attachments/download/86
+FASTD_VERSION = 19
+FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSION)
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
 FASTD_LICENSE_FILES = COPYRIGHT
