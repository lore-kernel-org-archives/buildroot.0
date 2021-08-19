Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249A5C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 22:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35BB60FDA
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 22:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D35BB60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F75280D06;
	Thu, 19 Aug 2021 22:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m04qu2rQ-CwZ; Thu, 19 Aug 2021 22:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C040D81819;
	Thu, 19 Aug 2021 22:13:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7A0B1BF866
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 22:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3FC242546
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 22:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3ZCyJkzyzyA for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 22:12:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B4E54253A
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 22:12:58 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q11so11202253wrr.9
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 15:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bJRXHXa4aqRQjg7sAnXaDbeQAls6wmqrD8kAu2a6Xbo=;
 b=pgs5oP78wiT+QbG1sbN/XpkaMYTiK+4x7wDImLW3VhtiVDTG3CzUjwZxkeLvPWKIIb
 RMBRfh86GEuiZJXLiup0kTrYpvlOW7O8LaD9azmjhEE6/qlff9PWjYNkQewqrQZQ3jQm
 pMmGp58sC0C+abVqLirJRAJNH7lps4Xx1eoCrK/bSCeWEdzoHhjmtfta4UMYOsszDGRQ
 5I5jDUwUzenYom14ND1q4gbtnVE9kbH1Euz0XmoJ7xluoIhl50NS0/2sdQDSL/J7WeFU
 LGILyKur40JuDu+e+1+YcvzwpkrSaC62uI9Tty2NxO185q2AqNgUybbXxQECwJQ/8+NB
 oujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bJRXHXa4aqRQjg7sAnXaDbeQAls6wmqrD8kAu2a6Xbo=;
 b=CIHlTv6u2r3eXrZTXjuT+N2lH3CQjW/fyf8B21gfhpRNZNmNoS2oz8qpZ/m7IEPFGm
 BJwVYztH1SntfzEsf+yqVRvsdmRMRMtf7gtMOrCnJsA00qHy4JjDt9yuwoHgu+SMrw1u
 3l7HvKgSd/bmU/gT9+XqqqRzH7VCejr5MpE6SPVoUAAhQWPyzrXr+APDM4iOipmTyuvS
 +yvHms+7M/m+f36R9HJKcYuyFlivRMSLnTeu0+IMVcmTvbiRQP92cEgaMC5+5ZVftu15
 1dZBcCcSoUXYFJxZLkTPAJvqRqIqlIEC6LdwwbqphRf6j9wUvtm1xAj7vNvds2EUYeA0
 KCfw==
X-Gm-Message-State: AOAM5334xlTIQxEYmSKAx7sGWmbgk2X9sKcFNQkmSQkU/VYOyFZmZCT/
 iyFk4d1s8RrUTK3tDKEYdz+05rtC1PwQHA==
X-Google-Smtp-Source: ABdhPJwVoNNGPtYw0/9Dfcy60msGsiaTjuzuA0mNFy1xgpfLcATDBIxuxAu5ncvDIpnwrJu5FgV77A==
X-Received: by 2002:a5d:4e0d:: with SMTP id p13mr6256688wrt.274.1629411176388; 
 Thu, 19 Aug 2021 15:12:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id h8sm8531591wmb.35.2021.08.19.15.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 15:12:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 00:12:54 +0200
Message-Id: <20210819221254.23336-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/mpv: vaapi-drm needs egl-drm
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build of vaapi-drm without egl-drm is broken since commit
6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174.

egl-drm has been added with commit
031df474c24f92757ac95ade572b90995ebdc6a2 and it is only available with
mesa3d because of the gbm dependency:
https://github.com/mpv-player/mpv/blob/0b56e1c00a57fdb767674462c299a5c973a9e373/wscript#L571

Indeed, at the moment, mesa3d is the only gbm provider in buildroot.

Fixes:
 - http://autobuild.buildroot.org/results/83d6dcbb77ab8754aefcdcf90baeaff9db2a1c81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update commit message

 package/mpv/mpv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d4d4d4811d..91e31dd150 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -181,7 +181,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
-ifeq ($(BR2_PACKAGE_LIBDRM),y)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 MPV_CONF_OPTS += --enable-vaapi-drm
 else
 MPV_CONF_OPTS += --disable-vaapi-drm
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
