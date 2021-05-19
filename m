From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 22:14:18 +0200
Subject: [Buildroot] [git commit branch/next] package/postgresql: select
 mandatory libopenssl features
Message-ID: <20210519194531.0C22581356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beada77a7355c07cae7865afec41d67af6db4485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Select mandatory libopenssl features (which are selectable since
commit a83d41867c8d69a77d5cd0a665aa216af5340359):

- BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
- BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST
- BR2_PACKAGE_LIBOPENSSL_ENABLE_DES

Fixes:

  - http://autobuild.buildroot.net/results/7fdcaa337a7369673ac4580ff7a2bbccc895dca2

  openssl.c:449:35: warning: implicit declaration of function 'EVP_bf_ecb'; did you mean 'EVP_sm4_ecb'? [-Wimplicit-function-declaration]
    449 |  if (!EVP_EncryptInit_ex(evp_ctx, EVP_bf_ecb(), NULL, NULL, NULL))
        |                                   ^~~~~~~~~~
        |                                   EVP_sm4_ecb
  openssl.c:449:35: warning: passing argument 2 of 'EVP_EncryptInit_ex' makes pointer from integer without a cast [-Wint-conversion]
    449 |  if (!EVP_EncryptInit_ex(evp_ctx, EVP_bf_ecb(), NULL, NULL, NULL))
        |                                   ^~~~~~~~~~~~
        |                                   |
        |                                   int
  In file included from openssl.c:34:
  .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/openssl/evp.h:583:53: note: expected 'const EVP_CIPHER *' {aka 'const struct evp_cipher_st *'} but argument is of type 'int'
    583 |                                   const EVP_CIPHER *cipher, ENGINE *impl,
        |                                   ~~~~~~~~~~~~~~~~~~^~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/postgresql/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 2debdc24d7..b42b219558 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_POSTGRESQL
 	# postgresql is unlikely to be used in a pure statically
 	# linked environment.
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
