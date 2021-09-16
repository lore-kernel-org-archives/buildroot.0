Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863EBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 16:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3DF63230
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 16:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB3DF63230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FDBB605D9;
	Thu, 16 Sep 2021 16:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMJqCzoV_kFK; Thu, 16 Sep 2021 16:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA81D605E3;
	Thu, 16 Sep 2021 16:48:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85F2A1BF3E5
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 16:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75EF983EB9
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 16:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IePxE8pocaJy for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 16:48:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E21583E60
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 16:48:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t8so3544205wri.1
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 09:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iylVU85jrTXUWAt4R8PW/afdrg1dRmia5t4fUCKTNNo=;
 b=fhN+05l9BPbccLmG+3qzC6pVthqtSL5N7ypFs9rz+GiVlXQdGMw6MHXAYiOi+ocWfN
 VUUE3QPb3/R+kxI+S+7p/WYunv9dJjgZtEXe8mYZIdZGZpPkQ30KB7bJK0m/4XF48ooE
 ryvTwE6d5d5ULtlcyj2usF8eoaCt+ki/MI44fdNkhz/CoxUHzdLUA/n7gODG/EKpcn+R
 W+J5onZvD10OQx/4pASDY050r3RBwYGHWcGpq2QV5yWx9vB1qYvRdzE9i5/WrMDPbqqN
 IjmZBs9ip7E0v83/dtHEnrY1EF869MozDjuGFjrYtqBsXxL0eeSGsHceyXtZU5nw2UzD
 5B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iylVU85jrTXUWAt4R8PW/afdrg1dRmia5t4fUCKTNNo=;
 b=LH1c8ZW0s6FGt2Q953Gbyxb48iS6m57komcZ1VJf+j5I1ge6EOCva6DLFaDWvLghES
 GTgDnlBOlW8hvTwmraKH42+PEscVFCY6Ifo0IWEDMsGbUZXkYc8Yy7frHL59NPy82Yh9
 x3CSaqBSI6BSyuOONAjnoHNfWeXHsuiYcLDcudJ01ECI1c5udstIq5wEtlIYET3YOJRf
 SMh/sEuNRAlMSl/BLGNBq0SOF99qdlDEvcjtViHF/9vQeVbtZM61JOZmYubtt2TcI9NC
 xBZNeF77mZuQ8VRop+KisBcWcVBdyLfb+KcmR99Bt5BqhGMJOTpK6f8f9ZiFN/ODLbMO
 hPqQ==
X-Gm-Message-State: AOAM532erHmCRC7Jtl2CUgTJSvd4Ur+Q7Bx+FlebUaqYgqr4kFImWTep
 7RD5eJpnBRaPOc2swnU5lkGfxMpSBo0=
X-Google-Smtp-Source: ABdhPJwziedI9Kq6862nJXBkHWmj/uGh+bPnJg3pUKvfWRq90wOG4mxiwZx4ETGp3jrLV0bPX30eKQ==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr7333862wrs.60.1631810924329; 
 Thu, 16 Sep 2021 09:48:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id j21sm3995916wrd.48.2021.09.16.09.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 09:48:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 18:48:21 +0200
Message-Id: <20210916164821.1940365-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://discuss.linuxcontainers.org/t/lxc-4-0-10-has-been-released/11618
https://discuss.linuxcontainers.org/t/lxc-4-0-9-lts-has-been-released/10999

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 85cdecceb2..efd7a8e42c 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  9165dabc0bb6ef7f2fda2009aee90b20fbefe77ed8008347e9f06048eba1e463  lxc-4.0.6.tar.gz
+sha256  a10c518056d2e497bd600e4ffac2853bdeab1e835bf455a6d87cc8df128bfae9  lxc-4.0.10.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 24a1f3c588..93f6d2535f 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.6
+LXC_VERSION = 4.0.10
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
