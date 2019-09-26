From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 12:36:34 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mbedtls: security
 bump to version 2.7.12
Message-ID: <20190926103433.9631D8F859@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b7c1f9d85cf712a933a12767d4749948fee98c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security vulnerabilities:

2.7.12:

- Fix a missing error detection in ECJPAKE.  This could have caused a
  predictable shared secret if a hardware accelerator failed and the other
  side of the key exchange had a similar bug.

- When writing a private EC key, use a constant size for the private value,
  as specified in RFC 5915.  Previously, the value was written as an ASN.1
  INTEGER, which caused the size of the key to leak about 1 bit of
  information on average and could cause the value to be 1 byte too large
  for the output buffer.

- The deterministic ECDSA calculation reused the scheme's HMAC-DRBG to
  implement blinding.  Because of this for the same key and message the same
  blinding value was generated.  This reduced the effectiveness of the
  countermeasure and leaked information about the private key through side
  channels.  Reported by Jack Lloyd.

2.7.11:

- Make mbedtls_ecdh_get_params return an error if the second key belongs to
  a different group from the first.  Before, if an application passed keys
  that belonged to different group, the first key's data was interpreted
  according to the second group, which could lead to either an error or a
  meaningless output from mbedtls_ecdh_get_params.  In the latter case, this
  could expose at most 5 bits of the private key.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 57a5aeffcb..84fe820c5c 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.0-2.7.9-and-2.1.18-released
-sha1	70dc65f3f6f6b2392b821163be7f1f634f0012c8	mbedtls-2.7.9-apache.tgz
-sha256	18e57260b46579245744adb79c2924194dad36aac38c2d0be9e749b9181c706f	mbedtls-2.7.9-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.3-and-2.7.12-released
+sha1	ce1af75d497cc03fe5c8e8e15fbf583d9dfbacd1	mbedtls-2.7.12-apache.tgz
+sha256	d3a36dbc9f607747daa6875c1ab2e41f49eff5fc99d3436b4f3ac90c89f3c143	mbedtls-2.7.12-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 4a5a731d42..427b2acb55 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.9
+MBEDTLS_VERSION = 2.7.12
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
