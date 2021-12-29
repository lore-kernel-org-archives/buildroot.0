Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260E7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 22:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0DED40447;
	Wed, 29 Dec 2021 22:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWd6PnZca5Uw; Wed, 29 Dec 2021 22:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E417403FD;
	Wed, 29 Dec 2021 22:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7741BF30B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B31960B6A
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 22:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Egy9XIZQPqnt for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 22:54:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEC2F606EB
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 22:54:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3A2FA82BCD; Wed, 29 Dec 2021 22:48:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 23:54:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8af91d6c0cdbbe3038abeb8e93993186de2308f6
X-Git-Newrev: 0b012574b2274d7804dbd6e86758e5225c1febc8
X-Patchwork-Hint: ignore
Message-Id: <20211229224833.3A2FA82BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpdf: requires RC4 support in
 openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b012574b2274d7804dbd6e86758e5225c1febc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 10.5.0 in
commit b5352c2177011ca389cbb7c68e78447549cbdaaa:

libqpdf/QPDFCrypto_openssl.cc: In constructor 'QPDFCrypto_openssl::QPDFCrypto_openssl()':
libqpdf/QPDFCrypto_openssl.cc:46:9: error: 'EVP_rc4' was not declared in this scope
   46 |     rc4(EVP_rc4()),
      |         ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3b7f19ecb3303c9c9eb89c493c7e0d8a47b4be95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qpdf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index eadfc5ea92..047c4c8a75 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QPDF
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  QPDF is a command-line program that does structural,
 	  content- preserving transformations on PDF files. It could
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
