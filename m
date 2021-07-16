From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:22:25 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: fix build with wolfssl
Message-ID: <20210716204843.A1FA891163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=14e4f25483c56db94e7adcbcc2e3cac804d16073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with wolfssl is broken since bump to version 3.12.1 in commit
4d85defa7103aadc74223868fb83ed0bed144f4d:

/data/buildroot-autobuilder/instance-0/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
/data/buildroot-autobuilder/instance-0/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:180:32: error: 'SSL_OP_NO_SSLv3' undeclared (first use in this function); did you mean 'WOLFSSL_OP_NO_SSLv3'?
  180 |         SSL_CTX_set_options(c, SSL_OP_NO_SSLv3 | SSL_OP_NO_TLSv1 | SSL_OP_NO_TLSv1_1);
      |                                ^~~~~~~~~~~~~~~
      |                                WOLFSSL_OP_NO_SSLv3

This build failure is raised by
https://github.com/zhaojh329/libuhttpd/commit/0fb46935f0cd5f737c6f4e6053d62268aca793a7
as since this commit, libuhttpd expects that SSL_OP_NO_xxx are defined
by wolfssl

Fixes:
 - http://autobuild.buildroot.org/results/79e3fa697537f2e33863e490b74ec881993eae73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 1ab39c5878..9159341d89 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUHTTPD
 	bool "libuhttpd"
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
 	help
 	  A lightweight and fully asynchronous HTTP server
 	  library based on libev
