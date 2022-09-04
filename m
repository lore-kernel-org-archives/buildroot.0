Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0453AECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1D760F41;
	Sun,  4 Sep 2022 20:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1D760F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0pQ9cTe4rhF; Sun,  4 Sep 2022 20:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0AFB60F45;
	Sun,  4 Sep 2022 20:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0AFB60F45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 135511BF38B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E211C40116
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E211C40116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANpM19XqGb-H for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:14:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1366340101
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1366340101
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:14:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id v26so10495121lfd.10
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NasWVjQio41GglJYHlQfoSWAJP7oNmhgIWTbG+8PB24=;
 b=qF2cPwHN28YXNyRtWPDfmNUV1Auows0rrW6OHkfIaGT9J3b70egWHpo9K9g5ojQ4vg
 85Xmyq5OuvSZXvinMpah2Y+R7YeWuDB9kjea/NuL0A/P5KUXr1KtGViLPPpFl52rNnoP
 HCS2KVSh5COpLWT05HYfGmFVIwF09opIcbYwxMeG+9Wk44rkz1augbBYskM8/o8lDcv2
 aqyHh6RX7penU2VYldqeNYluaRLv/By9ARlbgzNTSmmouT0n+Zw3Pg9pckqtc+TmZ4dE
 5IbxYmyiAdQRimRtccV3IyDJKtxQ1sG2Gsr3mIfE/1+LLEd2jCEm4SXwsl/9EqbLJVqF
 8Jew==
X-Gm-Message-State: ACgBeo3m+7WednFxfgyJSHQLT9bfCTyQVgAlwpTMJg/FCOlTphd0auXj
 HuDUWl9uRey5Zc+pFrcLhT3v/2/SL7U=
X-Google-Smtp-Source: AA6agR41Tr/Pp7bAsugbakgCBbQErIFgI5klo5hXQdbpCHikanlMph4V3PUrRFuH/sVYHjdlzV9fdQ==
X-Received: by 2002:a05:6512:1ce:b0:494:81fc:e755 with SMTP id
 f14-20020a05651201ce00b0049481fce755mr7504577lfp.106.1662322474379; 
 Sun, 04 Sep 2022 13:14:34 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020a056512071600b004945c1c5cccsm1004179lfs.268.2022.09.04.13.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:14:33 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 23:14:27 +0300
Message-Id: <20220904201429.1480971-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NasWVjQio41GglJYHlQfoSWAJP7oNmhgIWTbG+8PB24=;
 b=bnf8fC67SVHdG43O7TRUSnmtLIkl4eNskkotyux3OPRlqDGb4u69waiouoA9hBd6NC
 r3+uT73AhNX+w9scwWoILBDFdYZIbt1UBUgIK3lpiolMeFmJCCt4A6TG9DeJVC31oqrG
 9EFQ5yBwjKzIicIehqNCCbgsvtjD0F9/bsZP5LIvOrsU6QOew/f6r0YinmHchyxzfFWQ
 o7/xhO3jI/yGRepcwCZDMWo2ecQzj47St2ySUpLU2mjsfIeLaBGyovoe2tHrQvc729hU
 AdnN6hWozHGiV46cktGvFaWybgNPFw8k0++ZKVPvGmlNlIe4QXhHEM+jgT5Whwde+8m3
 2sQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bnf8fC67
Subject: [Buildroot] [PATCH 0/2] hostapd/wpa_s: disable build with static
 zlib-ng
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Both zlib-ng and hostapd/wpa_supplicant utils define functions with the
same name 'crc32'. For now do not allow to select zlib-ng as zlib
provider for hostapd or wpa_supplicant in the case of BR2_STATIC_LIBS
is selected. This change can be reverted if either project rename
that function.

Regards,
Sergey

Sergey Matyukevich (2):
  package/hostapd: disable build with static zlib-ng
  package/wpa_supplicant: disable build with static zlib-ng

 package/hostapd/Config.in        | 4 ++++
 package/wpa_supplicant/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
