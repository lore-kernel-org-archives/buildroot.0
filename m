From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:48:08 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/mbedtls: security
 bump to version 2.16.7
Message-ID: <20200721204400.1533C87DAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ce81e38540ae066206e415f7440cee6593c65ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

- Fix a side channel vulnerability in modular exponentiation that could
  reveal an RSA private key used in a secure enclave.
- Fix side channel in mbedtls_ecp_check_pub_priv() and
  mbedtls_pk_parse_key() / mbedtls_pk_parse_keyfile() (when loading a
  private key that didn't include the uncompressed public key), as well
  as mbedtls_ecp_mul() / mbedtls_ecp_mul_restartable() when called with
  a NULL f_rng argument. An attacker with access to precise enough
  timing and memory access information (typically an untrusted operating
  system attacking a secure enclave) could fully recover the ECC private
  key.
- Fix issue in Lucky 13 counter-measure that could make it ineffective
  when hardware accelerators were used (using one of the
  MBEDTLS_SHAxxx_ALT macros). This would cause the original Lucky 13
  attack to be possible in those configurations, allowing an active
  network attacker to recover plaintext after repeated timing
  measurements under some conditions.

https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-07

Switch to github to get latest release

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7f79bb5cfdf371ef0d959f2e7fdc43dc1e6afffc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 4 +---
 package/mbedtls/mbedtls.mk   | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 17ac18bb25..b75a8fa80c 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,3 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.6-and-2.7.15-released
-sha1  3cb5b681597a5bd798d31038c129c0dc911d8a2c  mbedtls-2.16.6-apache.tgz
-sha256  66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770  mbedtls-2.16.6-apache.tgz
 # Locally calculated
+sha256  4786b7d1676f5e4d248f3a7f2d28446876d64962634f060ff21b92c690cfbe86  mbedtls-2.16.7.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 50121fa6c7..4ae8291c11 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.16.6
-MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
+MBEDTLS_VERSION = 2.16.7
+MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,mbedtls-$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
 	-DENABLE_TESTING=OFF
