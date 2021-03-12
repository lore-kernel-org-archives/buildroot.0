From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 22:45:18 +0100
Subject: [Buildroot] [git commit] package/mbedtls: security bump to version
 2.6.10
Message-ID: <20210312212357.150F388E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=694c7d3ecee92eae84e9781acca4e5630b92d427
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix a buffer overflow in mbedtls_mpi_sub_abs() when calculating
  |A| - |B| where |B| is larger than |A| and has more limbs (so the
  function should return MBEDTLS_ERR_MPI_NEGATIVE_VALUE). Only
  applications calling mbedtls_mpi_sub_abs() directly are affected:
  all calls inside the library were safe since this function is
  only called with |A| >= |B|.
- Fix an errorneous estimation for an internal buffer in
  mbedtls_pk_write_key_pem(). If MBEDTLS_MPI_MAX_SIZE is set to an odd
  value the function might fail to write a private RSA keys of the
  largest supported size.
- Fix a stack buffer overflow with mbedtls_net_poll() and
  mbedtls_net_recv_timeout() when given a file descriptor that is
  beyond FD_SETSIZE.
- Guard against strong local side channel attack against base64 tables
  by making access aceess to them use constant flow code.

https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: fix the hash after upstream mess-up]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 39df050609..d9912a50d9 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9:
-sha256  fc17ff7d8c11d08f23ae2800a18269408ad2c24ea6bb8b9363e41a01c2425697  mbedtls-2.16.9.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.10:
+sha256  96257bb03b30300b2f35f861ffe204ed957e9fd0329d80646fe57fc49f589b29  mbedtls-2.16.10.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 9e3e9f626d..8776fb9134 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.9
+MBEDTLS_VERSION = 2.16.10
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
