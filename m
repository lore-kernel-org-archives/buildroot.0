Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89357C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:08:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D29161037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D29161037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCCB84322;
	Wed,  4 Aug 2021 00:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAflRb2orbmE; Wed,  4 Aug 2021 00:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A3184312;
	Wed,  4 Aug 2021 00:08:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6CD41BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BEA7404EE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C11F0s0TzQU4 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A70C54067B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 063DF87F55; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 21:47:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dfea4a915c88cea8907ee84dba72438d3c4474cf
X-Git-Newrev: 464fb90793516c8d8e5c25b6531773b33aa4d676
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.063DF87F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/seatd: disable -Werror
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=464fb90793516c8d8e5c25b6531773b33aa4d676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable -Werror to avoid the following build failure which is raised
since the addition of the package in commit
daae31149017cbf8b03634cfc56da132f7e1ad83

../seatd/seat.c: In function 'seat_activate_device':
../seatd/seat.c:374:48: error: unused parameter 'client' [-Werror=unused-parameter]
  374 | static int seat_activate_device(struct client *client, struct seat_device *seat_device) {
      |                                 ~~~~~~~~~~~~~~~^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0ec925aab23d83c52684f5fea7a4395c93a674c4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/seatd/seatd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 2abcefbfaa..bf582f0d1d 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -13,7 +13,8 @@ SEATD_INSTALL_STAGING = YES
 
 SEATD_CONF_OPTS += \
 	-Dman-pages=disabled \
-	-Dexamples=disabled
+	-Dexamples=disabled \
+	-Dwerror=false
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
 SEATD_CONF_OPTS += -Dlogind=enabled
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
