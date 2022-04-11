Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F3BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 08:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73718410AA;
	Mon, 11 Apr 2022 08:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQI1WXkp6eHn; Mon, 11 Apr 2022 08:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA26E409F4;
	Mon, 11 Apr 2022 08:03:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42E831BF951
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 08:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EDAE40556
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 08:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QyFDYCJoN343 for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 08:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F2F04029B
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 08:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 03A6F82A38; Mon, 11 Apr 2022 07:53:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 09:45:56 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2abfc4ac716578d1584d670988ba66174762b1fe
X-Git-Newrev: e666b0d743cf55d233e4da04c05f084e8ee59b95
X-Patchwork-Hint: ignore
Message-Id: <20220411075311.03A6F82A38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lftp: fix build
 with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e666b0d743cf55d233e4da04c05f084e8ee59b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl > 2.7.0:

/nvmedata/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-musl/11.2.0/../../../../microblaze-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-21/output-1/host/microblaze-buildroot-linux-musl/sysroot/usr/lib/libcrypto.a(x509_lu.c.o): in function `X509_OBJECT_get0_X509_CRL':
(.text+0xc3c): multiple definition of `X509_OBJECT_get0_X509_CRL'; /nvmedata/autobuild/instance-21/output-1/build/lftp-4.9.2/src/.libs/liblftp-network.a(liblftp_network_la-lftp_ssl.o):(.text+0x894): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/7fd1dfd5bc750ae5a3278ca950c838ae90704b23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e8394943e80c847793f13555697e0b4c76483322)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch b/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
new file mode 100644
index 0000000000..4251a5e176
--- /dev/null
+++ b/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
@@ -0,0 +1,36 @@
+From 3ffa0132987bdde986c82c924bc51b13b37f8b54 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 6 Apr 2022 22:56:21 +0200
+Subject: [PATCH] src/lftp_ssl.c: fix build with libressl >= 2.7.0
+
+X509_OBJECT_get0_X509_CRL is provided by libressl since version 2.7.0
+and
+https://github.com/libressl-portable/openbsd/commit/9866ae34c0af718973475296bd9ef036d3aaa94e
+resulting in the following build failure:
+
+/nvmedata/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-musl/11.2.0/../../../../microblaze-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-21/output-1/host/microblaze-buildroot-linux-musl/sysroot/usr/lib/libcrypto.a(x509_lu.c.o): in function `X509_OBJECT_get0_X509_CRL':
+(.text+0xc3c): multiple definition of `X509_OBJECT_get0_X509_CRL'; /nvmedata/autobuild/instance-21/output-1/build/lftp-4.9.2/src/.libs/liblftp-network.a(liblftp_network_la-lftp_ssl.o):(.text+0x894): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7fd1dfd5bc750ae5a3278ca950c838ae90704b23
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/lavv17/lftp/commit/3ffa0132987bdde986c82c924bc51b13b37f8b54]
+---
+ src/lftp_ssl.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index 26e91e4b..a814543d 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -664,7 +664,7 @@ int gnutls_x509_crt_list_import(gnutls_x509_crt_t *certs, unsigned int* cert_max
+ #elif USE_OPENSSL
+ //static int lftp_ssl_passwd_callback(char *buf,int size,int rwflag,void *userdata);
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
+ // for compatibility with older versions
+ X509_OBJECT *X509_OBJECT_new()
+ {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
