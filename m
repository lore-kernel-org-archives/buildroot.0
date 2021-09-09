Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E85AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 15:18:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 851B26054F
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 15:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 851B26054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 193E8402FB;
	Thu,  9 Sep 2021 15:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMJjSpenOgXC; Thu,  9 Sep 2021 15:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD2640330;
	Thu,  9 Sep 2021 15:18:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 291491BF377
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 15:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25777606BE
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 15:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SrgqSSOv6bO for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 15:18:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC7436067E
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 15:18:04 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s25so3204786edw.0
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uy8kKYEnq17Mz4h1BoqNz7aqGmQH2+QgmJaUwVJ7C/Y=;
 b=S+pr1S+7Qi+/sWqKVuzts5tZzfIBZpFDO20HbPco6rZuM5r0KaMZc6TL8Hgl2hjLzs
 SH9Ypx4Q8JnKgN0qDSXtEA92f1z/ZmyNasJg8JxHeZzrSl26dHLSzCJ2vwehyQ29cv97
 uOvveG2IVIKNbv2CzI92aRR3cOeNwznxsthHRPdac/N8RnLR77LTa2zpsODHgDKeAxY5
 G2PtjvrHvcPFlp3CimFowsft11RL17QhG97HraYkjP1tiSfn1Hbxi0ZN8JuIc7rhc/91
 3eELpVqZGcGCzeCBDkFM8lUCIGS3EEquF9Q4y1gy2w2KqJ4IljI9XPDa1oDQMhsU/UMx
 5p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uy8kKYEnq17Mz4h1BoqNz7aqGmQH2+QgmJaUwVJ7C/Y=;
 b=bKmfW4IvV/6cHIsa0EveFq7aJZ6ZaZnzJYiwSxD+SDpealW9sWH1UH8PNeaPaE0mmj
 yzNgYPQSGuu3AHEEkFdpcR/5Tv/NT8OOHRa08ft902d1oI2mcez/7t6zu1KjApn0SffR
 eEhL+iCN307JnFN6LVR5L7jP+nFXFYE7LToY1Fxv81dFUMNZM+bp89XhwVdBwsxqAnd1
 w/WJOCXjfawxSWnkh9ss6bEyrN9CZiujp26IpMpETLp2CHCIwPBxOTnw/xkNf40DPY4u
 6yZSVxtG1RW30+Wzb46JULEmjHLSpCKoYHmypPdYdh4Ja9D1/fXoUymvjjogxVWw3iAH
 Mu7g==
X-Gm-Message-State: AOAM530trEwtZIN4eY7xMZT0GsC7NeKo0ArIkdEGEQjrdQj4ljG4AOWn
 Pfypc+SFk/dnGRbBKA0KHXOmNYJD58BukMeg
X-Google-Smtp-Source: ABdhPJzhbsAZDRDXffNR8ysMC7sfiRS+lgWxvEYuB9xS8tT9tuvpGnX53FFoLnY/ReRnaB/acruXIg==
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr3706106edc.235.1631200682630; 
 Thu, 09 Sep 2021 08:18:02 -0700 (PDT)
Received: from illias-PC.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id d11sm966678ejw.8.2021.09.09.08.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 08:18:01 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 17:17:38 +0200
Message-Id: <20210909151740.1097665-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] fix for alsa-lib support for python
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Illia Bitkov <illia.bitkov@mind.be>,
 Adam Dusketta <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello.
First patch adding module smixer-python to build when option "Python support for alsa-lib" is active.
Currently this option doesn't influence a build at all.
Also smixer-python is the only component that depends on python and also supports python3.
So second patch removes dependancy to python2.

In v2 made commits cleaner

Illia Bitkov (2):
  package/alsa-lib: add smixer-python module for alsa-lib python config
  package/alsa-lib: always use python3

 package/alsa-lib/Config.in   | 2 +-
 package/alsa-lib/alsa-lib.mk | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
