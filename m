Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE44C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:37:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90DC860F0F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90DC860F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568AC607B2;
	Mon, 26 Jul 2021 08:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAa7HqKObC0e; Mon, 26 Jul 2021 08:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2453607AF;
	Mon, 26 Jul 2021 08:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82DCC1BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E61E4040A
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTg2v846Dr8A for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:37:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADFED403F2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:37:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g15so10086974wrd.3
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDKwPO6zlOLykJl+0h9o2ND2exobmdakxDnucrOxJvg=;
 b=tDW7q+MeD5ExUG7mTRWdVj51wX/mjmkdr/nbh6Vf64hVE10P1u4VOtbavVoeFEt/hv
 frr1eRVPI/YfO6DO7UebYPz07GhxSBgmTjlTE1TSrodX2ON9kF2GHBGJg5F7qPgtNUUr
 SleESwm5uU71w2YPMo7sqpDGp8la85hO4dLr+x0WDzMnxoFdW2ZZnVE/fAeFi6uwNSHq
 C3Y5wBRQMXhcvFk/Ho/xGvzVe0DbKnGJxgITb4FNVNq8g21+rMuTTZSwRO88rpPo9qlE
 e65vbA3noFyg7AovW3gDeJiTQnOZgVsGJMD6HyCq1IzfXt7wL4Zf0UUFk7U2SaCl9xO3
 oMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDKwPO6zlOLykJl+0h9o2ND2exobmdakxDnucrOxJvg=;
 b=Eai2tyPXR0a5oF9aGNLISkK9BDszpcUgQPbeQjzGW7Mn5nyGZ2Lx2AprbbotrdFjWA
 2F9g6UFGwuXJ53obU+JXVGtDkG+di+2nVTZnDTyKltcv2EFAH9faxyN/JnXGFrzQRmPc
 9nLsgt90TWF1VTcawWF0DpBnAX/SFmcxQFO7IVgIp2BweSKe2UGbvcyXnrtpb2uS1Tab
 YXZtiSLgU0DPUUg/fmPyFfaFegwCm9KtWsqLTtlZyli5TGABGJ2RbrWUrgr8X5Yd5Ggj
 Dszctrk1bb+97KfM0k0eH70h5OMyGCO5JIZFlmWg8rYtOnLiZZpSJ4x9MuXSVgcnSVOm
 Wb1w==
X-Gm-Message-State: AOAM532prJbFbMvQQ6ePgAs7xe+ii+H3nNuShI9RWEkKZHXFeHjF3BZ7
 1SM6GRyXHYDQa6pIK1h1FgFdpXF9Wh6PRQ==
X-Google-Smtp-Source: ABdhPJxFZKdMtVJqpvzgLaiIP9DPquMlNmO4S4pMAYRu0qsq1a38aeGNcqX0B97f90q4KYxRpVJ/Kw==
X-Received: by 2002:a05:6000:548:: with SMTP id
 b8mr18325540wrf.159.1627288666597; 
 Mon, 26 Jul 2021 01:37:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id q17sm6485339wre.3.2021.07.26.01.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:37:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:37:40 +0200
Message-Id: <20210726083740.1707651-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ifplugd: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for ifplugd is added by the services/ifplugd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ifplugd/ifplugd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 06b0607414..6de7f17641 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -8,6 +8,7 @@ IFPLUGD_VERSION = 0.28
 IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd
 IFPLUGD_LICENSE = GPL-2.0+
 IFPLUGD_LICENSE_FILES = LICENSE
+IFPLUGD_SELINUX_MODULES = ifplugd
 IFPLUGD_AUTORECONF = YES
 
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
