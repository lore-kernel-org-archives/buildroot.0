Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DF4C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 446764EC12;
	Mon, 20 Feb 2023 22:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 446764EC12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmZaCupFlNt0; Mon, 20 Feb 2023 22:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED00D4EF72;
	Mon, 20 Feb 2023 22:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED00D4EF72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1712E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 721A8416C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 721A8416C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPOpZFOF0bmE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9B57416AD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9B57416AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5B6286494; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:50:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f2da02b9e38a72ec3d18171e482a0791b5dd24b9
X-Git-Newrev: c4fc5e48521082d1b3cd9d96efc34979969d745b
X-Patchwork-Hint: ignore
Message-Id: <20230220205207.A5B6286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sscep: requires
 blowfish support in openssl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4fc5e48521082d1b3cd9d96efc34979969d745b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable blowfish in openssl to fix the following build failure raised
since the addition of the package in commit
72fa60dc102679f51b228336ec38f5af78ff7646:

src/sscep.c: In function 'get_cipher_alg':
src/sscep.c:123:24: warning: implicit declaration of function 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]
  123 |                 return EVP_bf_cbc();
      |                        ^~~~~~~~~~
      |                        EVP_sm4_cbc

Fixes:
 - http://autobuild.buildroot.org/results/55d2c481d8c148fb3bb61c1331340bcd71274553

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sscep/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sscep/Config.in b/package/sscep/Config.in
index 4b9039c9b2..2e5e29f7c8 100644
--- a/package/sscep/Config.in
+++ b/package/sscep/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SSCEP
 	bool "sscep"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  SSCEP is a client-only implementation of the SCEP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
