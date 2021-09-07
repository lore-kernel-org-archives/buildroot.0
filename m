Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28FEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:24:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C1760EB7
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88C1760EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653EF406D5;
	Tue,  7 Sep 2021 12:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLytS840Hurn; Tue,  7 Sep 2021 12:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97724406D2;
	Tue,  7 Sep 2021 12:24:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA0931BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA89C40103
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PErW1MxVYOUu for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:23:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAF6240168
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:23:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 524CF887DC; Tue,  7 Sep 2021 12:22:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 12:07:04 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5d6673d4773550ee8e1a94207284795862e74d5e
X-Git-Newrev: 4735f45795c4e14f7c51a145b62f63785c6173ff
X-Patchwork-Hint: ignore
Message-Id: <20210907122202.524CF887DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/alsa-utils: Fix
 alsa-plugins compatibility
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4735f45795c4e14f7c51a145b62f63785c6173ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit 3454bc99242a1a0069ccdb61d9598dc2fe6a9aa5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
