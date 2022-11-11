Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34222C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C777F41825;
	Fri, 11 Nov 2022 22:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C777F41825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fv8MfLfjDHT; Fri, 11 Nov 2022 22:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27A74181F;
	Fri, 11 Nov 2022 22:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27A74181F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA491BF966
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A7A181842
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A7A181842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkQAjj-o43cl for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:49:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C5EB8183D
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C5EB8183D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77A7A82DF6; Fri, 11 Nov 2022 22:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 23:49:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4028ee71743a25af172809e098e4c8eb61bf55f4
X-Git-Newrev: ddcd8af91f78d9e1ebddd88564e6535d3c4d6f79
X-Patchwork-Hint: ignore
Message-Id: <20221111224937.77A7A82DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/socat: support OpenSSL
 only
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddcd8af91f78d9e1ebddd88564e6535d3c4d6f79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

socat is not compatible with libressl since version 1.7.4.4 which
includes upstream commit 15e38be2f52 ("Fixed SIGSEGV of OpenSSL on
exit()").

Fixes:
http://autobuild.buildroot.net/results/6f0204004c52f762d6e3cb3064238d7eb3646038/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/socat/socat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 28ea72e5a7..3074d777fc 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -31,7 +31,7 @@ SOCAT_DEPENDENCIES = host-autoconf
 # incompatibile license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
-ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL):$(BR2_STATIC_LIBS),y:)
 SOCAT_DEPENDENCIES += openssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
