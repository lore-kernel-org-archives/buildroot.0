Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB5DC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5409B61110;
	Tue, 21 Feb 2023 00:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5409B61110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPXUDbXeOTH7; Tue, 21 Feb 2023 00:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0BF61143;
	Tue, 21 Feb 2023 00:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D0BF61143
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1662D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F00CE6FAEC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F00CE6FAEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vB0zm7hrLjc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B5546FB90
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B5546FB90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BDE3828C8; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:16:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8eef1e1488bce0732dbce137baa4f506a29dd13f
X-Git-Newrev: af8200a4c3543403ca653f4064f6649a052440e1
X-Patchwork-Hint: ignore
Message-Id: <20230220205236.2BDE3828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sscep: requires des
 support in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=af8200a4c3543403ca653f4064f6649a052440e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable des in openssl to fix the following build failure raised
since the addition of the package in commit
72fa60dc102679f51b228336ec38f5af78ff7646:

src/sscep.c: In function 'get_cipher_alg':
src/sscep.c:119:32: warning: implicit declaration of function 'EVP_des_ede3_cbc'; did you mean 'NID_des_ede3_cbc'? [-Wimplicit-function-declaration]
  119 |                         return EVP_des_ede3_cbc();
      |                                ^~~~~~~~~~~~~~~~
      |                                NID_des_ede3_cbc

Fixes:
 - http://autobuild.buildroot.net/results/34bd76e8e5e7df0db31918d610a0dadf531f369d

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sscep/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sscep/Config.in b/package/sscep/Config.in
index 2e5e29f7c8..549c65274b 100644
--- a/package/sscep/Config.in
+++ b/package/sscep/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SSCEP
 	bool "sscep"
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  SSCEP is a client-only implementation of the SCEP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
