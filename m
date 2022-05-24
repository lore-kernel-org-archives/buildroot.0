Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A13C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 13:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A900741A53;
	Tue, 24 May 2022 13:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZQemREfcdtH; Tue, 24 May 2022 13:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C6141A3D;
	Tue, 24 May 2022 13:50:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E05C61BF5B5
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCEBB410E3
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mN4hGaicQD9M for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 13:49:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C74BF4157D
 for <buildroot@buildroot.org>; Tue, 24 May 2022 13:49:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B2F48643E; Tue, 24 May 2022 13:38:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 15:47:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 801c2e1577f703c4e06b897aa2b0b155031658b2
X-Git-Newrev: ae9d3e6ca6f979313401af384f96ed04c2f3b6f4
X-Patchwork-Hint: ignore
Message-Id: <20220524133801.4B2F48643E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/keepalived: fix
 build with libressl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae9d3e6ca6f979313401af384f96ed04c2f3b6f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl:

/nvmedata/autobuild/instance-9/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: check/libcheck.a(check_ssl.o): in function `ssl_connect':
check_ssl.c:(.text+0x7da): undefined reference to `SSL_set0_wbio'

Fixes:
 - http://autobuild.buildroot.org/results/76f72a3c7350ea265e2277c89d68e5256410e94c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 90bdef4f17d46929c2c0e19110a11dbcc4ba851d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../keepalived/0003-fix-build-with-libressl.patch  | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/keepalived/0003-fix-build-with-libressl.patch b/package/keepalived/0003-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..090d35511c
--- /dev/null
+++ b/package/keepalived/0003-fix-build-with-libressl.patch
@@ -0,0 +1,50 @@
+From bbec15d4781670ac1be5e543cb04543f79200e69 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 12 Apr 2022 20:30:57 +0200
+Subject: [PATCH] fix build with libressl
+
+SSL_set0_rbio is provided by libressl since version 3.4.0 and
+https://github.com/libressl-portable/openbsd/commit/c99939f9665a9c3c648682b4987df46600b70efc
+but SSL_set0_wbio is not provided resulting in the following build
+failure:
+
+/nvmedata/autobuild/instance-9/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: check/libcheck.a(check_ssl.o): in function `ssl_connect':
+check_ssl.c:(.text+0x7da): undefined reference to `SSL_set0_wbio'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/76f72a3c7350ea265e2277c89d68e5256410e94c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/bbec15d4781670ac1be5e543cb04543f79200e69]
+---
+ configure.ac                 | 2 +-
+ keepalived/check/check_ssl.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5a2ea76ec..e8b5ccc41 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1327,7 +1327,7 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ AC_CHECK_FUNCS([SSL_CTX_set_verify_depth])
+ 
+ # SSL_set0_rbio(), SSL_set0_wbio() OPENSSL_init_crypto() and TLS_method() introduced OpenSSL v1.1.0
+-AC_CHECK_FUNCS([SSL_set0_rbio OPENSSL_init_crypto TLS_method])
++AC_CHECK_FUNCS([SSL_set0_wbio OPENSSL_init_crypto TLS_method])
+ 
+ # In OpenSSL v1.1.1 the call to SSL_CTX_new() fails if OPENSSL_init_crypto() has been called with
+ # OPENSSL_INIT_NO_LOAD_CONFIG. It does not fail in v1.1.0h and v1.1.1b.
+diff --git a/keepalived/check/check_ssl.c b/keepalived/check/check_ssl.c
+index 0155fce59..2cbedb8d3 100644
+--- a/keepalived/check/check_ssl.c
++++ b/keepalived/check/check_ssl.c
+@@ -234,7 +234,7 @@ ssl_connect(thread_ref_t thread, int new_req)
+ 		BIO_get_fd(req->bio, &bio_fd);
+ 		if (fcntl(bio_fd, F_SETFD, fcntl(bio_fd, F_GETFD) | FD_CLOEXEC) == -1)
+ 			log_message(LOG_INFO, "Setting CLOEXEC failed on ssl socket - errno %d", errno);
+-#ifdef HAVE_SSL_SET0_RBIO
++#ifdef HAVE_SSL_SET0_WBIO
+ 		BIO_up_ref(req->bio);
+ 		SSL_set0_rbio(req->ssl, req->bio);
+ 		SSL_set0_wbio(req->ssl, req->bio);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
