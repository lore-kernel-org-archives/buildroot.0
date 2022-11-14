Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF220C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 10:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 831834048F;
	Mon, 14 Nov 2022 10:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 831834048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYPf5_AMF9VZ; Mon, 14 Nov 2022 10:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EA00404BA;
	Mon, 14 Nov 2022 10:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EA00404BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68D441BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 445298174D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 445298174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTgIv6cTulHU for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 10:41:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7862C8148F
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 10:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7862C8148F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68CEA8257D; Mon, 14 Nov 2022 10:41:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 11:40:59 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 5c73598faa0bdf685692b2fac201242440c874b6
X-Git-Newrev: 779681a530da511589dc5f577ff825205c7dbf47
X-Patchwork-Hint: ignore
Message-Id: <20221114104115.68CEA8257D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libopenssl: don't
 build the afalg engine
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
Content-Type: multipart/mixed; boundary="===============4500945559387552648=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4500945559387552648==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=779681a530da511589dc5f577ff825205c7dbf47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The openssl configure script disables the afalg engine when it detects
cross-compilation, but the detection missfires because it is based on
the CROSS_COMPILE environment variable, which we do not set (as we pass
fully qualified CC et al.).

So, the afalg engine is built, but it is built for the host, not the
target, so it does not make sense to build and install it. Besides, it
leaks build host info.

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
[yann.morin.1998@free.fr: extend commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit adc1c5d8f14f69a62a2a4260465363ab120816ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c7a2d65cc4..50d41a6533 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -83,6 +83,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
+			no-afalgeng \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5),,no-rc5) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \

--===============4500945559387552648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4500945559387552648==--
