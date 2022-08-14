Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9475C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6006583ED7;
	Sun, 14 Aug 2022 23:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6006583ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VutVKqIFNpsd; Sun, 14 Aug 2022 23:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 967D183ED0;
	Sun, 14 Aug 2022 23:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967D183ED0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92E6B1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B8E240364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8E240364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYMjonzTOF16 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7240400E4
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7240400E4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:56 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id 5so2349718uay.5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OrgdDj+6V8lVOTHepTJgvKqHE+e1gEwkV0YtlkLeOdw=;
 b=UZXbD/IDMBX/iDai6ygz4aCqU4MbeveyivqMPiKjaGiuijtL8wannkdpbpGgFLDbiZ
 Zw6p+CwlwXm8frPxG+k8WRDbe4sQnc4JEgaDN6ACTur0cE0OyW8xBJymvE3U6ldIWXH9
 +B0gJYmwuzG2SCGy+7K/UZuEpCkq9D8KU/V9PmOtWZ2mJ34SSTx4FEalYrC4KP+I4enL
 9V7jXWMvIfkk1O3BwfJF8TbcCwDUY1Q8TouY3XP4LfQm50zH4OKtKgofAIC4g/2uieLM
 cbgXBRUo6ZBkMiMi3bgWRochN7NxY+47zTPofxNP1/uCrjbWmEp/z4hAs8z3F5v9fljT
 IEJA==
X-Gm-Message-State: ACgBeo0vfP9s1AnPni2E5LvqpTRScxohYeKppkn9+H+HO5jzpmqpNxFn
 RVFz6T/gHoDi/7lP1z2oGIEt8gz7w+4=
X-Google-Smtp-Source: AA6agR4940oWm5Z6gUefjpfl46t7Di2Vwn8s9uHW8De4/7URPvlAM3yNlS+HwvNugrvdJHG9PojXlA==
X-Received: by 2002:a05:6130:90:b0:362:891c:edef with SMTP id
 x16-20020a056130009000b00362891cedefmr5623353uaf.106.1660520395638; 
 Sun, 14 Aug 2022 16:39:55 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:54 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:27 -0300
Message-Id: <20220814233845.2247022-16-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OrgdDj+6V8lVOTHepTJgvKqHE+e1gEwkV0YtlkLeOdw=;
 b=YcTIkUGqLe6D3X31M6r+5Xtl2CiEuYq3IDouQN3+cXh31gGmB6SjXSX6mN1UCy++kG
 4f07GLMGhqM5mg+WVRv0oEmk1RNjATZ1LjardnfPQT8sxsu4DLG632K/Z9rcmajArZR/
 pBeIW5Qebby68YXyz4a4gxGF3lThvv1dA2wJRJXZQVs8lJbGypXyq2KWo7HoJX7coXqK
 bCeqv42nQ2E1SeC6webK+tOI1rXzs0RQS1Kvm51p8AbX+U2sXYmk4OBDkjgVV0SMGxKB
 6ispPXLTDAnpVpBaN94IokbJV2/sV2qs4IXoRNeQvBSOg4d9y4wEVZlde2IdtxU8T+ry
 kOHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YcTIkUGq
Subject: [Buildroot] [PATCH 15/33] package/wolftpm: fix typo on
 BR2_PACKAGE_WOLFTPM_NUVOTON
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
Cc: Dimitar Tomov <dimi@tpm.dev>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added by commit 'd0dcc62c4b package/wolftpm: Add config
options for TPM 2.0 extra capabilities'

Cc: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/wolftpm/wolftpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index d3f693a62e..7e8a108585 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -41,7 +41,7 @@ else
 WOLFTPM_CONF_OPTS += --disable-st33
 endif
 
-ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
+ifeq ($(BR2_PACKAGE_WOLFTPM_NUVOTON),y)
 WOLFTPM_CONF_OPTS += --enable-nuvoton
 else
 WOLFTPM_CONF_OPTS += --disable-nuvoton
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
