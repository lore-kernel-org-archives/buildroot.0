From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 10:03:50 +0200
Subject: [Buildroot] [git commit] strongswan: bump to version 5.6.3
Message-ID: <20180623080216.73CAE813E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d759195b44342c981175de6ddde6a71b7ce47b27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-af_alg-fix-crypt-definition-conflict.patch | 55 ----------------------
 ...trongswan-add-missing-include-of-stdint.h.patch | 32 -------------
 package/strongswan/strongswan.hash                 |  9 ++--
 package/strongswan/strongswan.mk                   |  6 +--
 4 files changed, 4 insertions(+), 98 deletions(-)

diff --git a/package/strongswan/0001-af_alg-fix-crypt-definition-conflict.patch b/package/strongswan/0001-af_alg-fix-crypt-definition-conflict.patch
deleted file mode 100644
index 442e53eb9e..0000000000
--- a/package/strongswan/0001-af_alg-fix-crypt-definition-conflict.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 0b906cb025a506be1b73e5b485179585d1a90be2 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 11 May 2017 14:04:47 +0300
-Subject: [PATCH] af_alg: fix crypt() definition conflict
-
-Rename the crypt() method to avoid conflict with POSIX crypt(). Fixes the
-following build failure with musl libc:
-
-In file included from ../../../../src/libstrongswan/utils/utils.h:53:0,
-                 from ../../../../src/libstrongswan/library.h:101,
-                 from af_alg_ops.h:24,
-                 from af_alg_ops.c:16:
-af_alg_ops.c:110:22: error: conflicting types for 'crypt'
- METHOD(af_alg_ops_t, crypt, bool,
-                      ^
-../../../../src/libstrongswan/utils/utils/object.h:99:13: note: in definition of macro 'METHOD'
-  static ret name(union {iface *_public; this;} \
-             ^
-In file included from af_alg_ops.c:18:0:
-.../host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/unistd.h:144:7: note: previous declaration of 'crypt' was here
- char *crypt(const char *, const char *);
-       ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/strongswan/strongswan/pull/72
-
- src/libstrongswan/plugins/af_alg/af_alg_ops.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libstrongswan/plugins/af_alg/af_alg_ops.c b/src/libstrongswan/plugins/af_alg/af_alg_ops.c
-index 331d1e8010aa..452cd1ac30c9 100644
---- a/src/libstrongswan/plugins/af_alg/af_alg_ops.c
-+++ b/src/libstrongswan/plugins/af_alg/af_alg_ops.c
-@@ -107,7 +107,7 @@ METHOD(af_alg_ops_t, hash, bool,
- 	return TRUE;
- }
- 
--METHOD(af_alg_ops_t, crypt, bool,
-+METHOD(af_alg_ops_t, crypt_, bool,
- 	private_af_alg_ops_t *this, u_int32_t type, chunk_t iv, chunk_t data,
- 	char *out)
- {
-@@ -224,7 +224,7 @@ af_alg_ops_t *af_alg_ops_create(char *type, char *alg)
- 		.public = {
- 			.hash = _hash,
- 			.reset = _reset,
--			.crypt = _crypt,
-+			.crypt = _crypt_,
- 			.set_key = _set_key,
- 			.destroy = _destroy,
- 		},
--- 
-2.11.0
-
diff --git a/package/strongswan/0002-strongswan-add-missing-include-of-stdint.h.patch b/package/strongswan/0002-strongswan-add-missing-include-of-stdint.h.patch
deleted file mode 100644
index d5ca690b2d..0000000000
--- a/package/strongswan/0002-strongswan-add-missing-include-of-stdint.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a8fd708ce89d5ffb64a5e8873d49a55094dde898 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Mon, 2 Oct 2017 10:16:36 -0500
-Subject: [PATCH] strongswan: add missing include of stdint.h
-
-Recent releases of glibc don't include the full stdint.h
-header in some network headers included by utils.h.
-Upstream is targetting a 5.6.1 release of the fix.
-
-Ustream: https://wiki.strongswan.org/issues/2425
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/libstrongswan/utils/utils/memory.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/libstrongswan/utils/utils/memory.h b/src/libstrongswan/utils/utils/memory.h
-index aef318f..c11624d 100644
---- a/src/libstrongswan/utils/utils/memory.h
-+++ b/src/libstrongswan/utils/utils/memory.h
-@@ -14,6 +14,8 @@
-  * for more details.
-  */
- 
-+#include <stdint.h> /* for uintptr_t */
-+
- /**
-  * @defgroup memory_i memory
-  * @{ @ingroup utils_i
--- 
-1.9.1
-
diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 820c712843..9a800572d7 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,10 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.4.0.tar.bz2.md5
-md5	9d7c77b0da9b69f859624897e5e9ebbf	strongswan-5.4.0.tar.bz2
+# From http://download.strongswan.org/strongswan-5.6.3.tar.bz2.md5
+md5	a6a28eeb22aa58080a7581771a5b63f9	strongswan-5.6.3.tar.bz2
 # Calculated based on the hash above
-sha256	f8288faaea6a9cd8a7d413c0b76b7922be5da3dfcd01fd05cb30d2c55d3bbe89	strongswan-5.4.0.tar.bz2
+sha256	c3c7dc8201f40625bba92ffd32eb602a8909210d8b3fac4d214c737ce079bf24	strongswan-5.6.3.tar.bz2
 # Locally calculated
-sha256	f5ba7f46cf7ae81dd81bc86f9e4cfa0c5c7c6987149b3bc9c0b8bf08598a1063  strongswan-4.4.0-5.5.2_gmp_mpz_powm_sec.patch
-sha256	03db8c7a4133e877e8992e155c046dd27ec4810d50f239abf55595f0280caf31  strongswan-5.0.0-5.5.2_asn1_choice.patch
-sha256	c80e02c9a5eeaf10f0a8bdde3be6375dd2833e515af03dad3a700e93c4fd041a  strongswan-4.4.0-5.5.3_gmp_mpz_export.patch
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256	2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 65618af33b..5c597d572a 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,13 +4,9 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.4.0
+STRONGSWAN_VERSION = 5.6.3
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
-STRONGSWAN_PATCH = \
-	$(STRONGSWAN_SITE)/patches/21_gmp_mpz_powm_sec_patch/strongswan-4.4.0-5.5.2_gmp_mpz_powm_sec.patch \
-	$(STRONGSWAN_SITE)/patches/22_asn1_choice_patch/strongswan-5.0.0-5.5.2_asn1_choice.patch \
-	$(STRONGSWAN_SITE)/patches/23_gmp_mpz_export_patch/strongswan-4.4.0-5.5.3_gmp_mpz_export.patch
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
