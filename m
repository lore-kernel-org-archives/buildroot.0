Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4714C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A7D360EBA
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A7D360EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7306942637;
	Thu, 26 Aug 2021 22:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzcYhTq-NdZq; Thu, 26 Aug 2021 22:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC5D42687;
	Thu, 26 Aug 2021 22:37:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 209121BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7552340767
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFPkh1xhMDDI for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8693B407DA
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E908D8DC52; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 22:12:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5eace9d35c4a671c1ac175ab1240d2403e3d7290
X-Git-Newrev: 3454bc99242a1a0069ccdb61d9598dc2fe6a9aa5
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.E908D8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/alsa-utils: Fix
 alsa-plugins compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=3454bc99242a1a0069ccdb61d9598dc2fe6a9aa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Previously, alsa-plugins would not work if alsa-utils was installed
after it. This happened because:

1. alsa-plugins copies some files $(TARGET_DIR)/usr/share/alsa/alsa.conf.d
2. alsa-utils removes these files during installation ( rm -rf $(TARGET_DIR)/usr/share/alsa/;)

The `rm -rf` command was originally added as part of the fix for
https://bugs.buildroot.org/show_bug.cgi?id=1573 11 years ago.

The intention might have been to allow for unconfiguring some options
and then rebuilding alsa-utils. However, this is a scenario that does
not work anyway.

The simplest fix for the `alsa-plugins` compatibility issue appears to
be to remove the `rm -rf` command.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/alsa-utils/alsa-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 2658c827a0..427280c1e6 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -77,7 +77,6 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/; \
-		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
 		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
 	fi
 endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
