Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815BCC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 07:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3EC581384;
	Tue,  5 Jul 2022 07:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3EC581384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E06eWtZezRIC; Tue,  5 Jul 2022 07:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D74EB81353;
	Tue,  5 Jul 2022 07:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D74EB81353
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD1D01BF2B3
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B1F41763
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B1F41763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OATb9TcRr31E for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 07:32:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990C14175E
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 990C14175E
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 07:32:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z41so14172478ede.1
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 00:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71V61QhG7F3UM1NvfJIx4CexReh9mQN89EAK+KTwV0c=;
 b=VBDBrI980CSlfZ7gV7LO5FG9D7cc6KXCFZ1irBilD/XdJw2Yo4KIdA4tEMuenI8bGD
 ozJems0U/sEzUYYyYF8wLIlAj2gcOnkWJfuwSEijeItO21GdbR09IobeCL4PTM8MnAOP
 enTTJMhnSnFME6nyLMUYO+E91N4Uhx7pPiFfMphhkFypUogIOQgeLVMgPw9FErqAxCc5
 OuIufldLC3H8DqHcgjabc9AuG+GzHpmRlb3e4XczwrH4yooyIuq1Om+4KNNASnkwvzd7
 ZdmwvLxeDw1bLMBBK8pzXXeIUc5mZQhNsiFje4lpWlD3b7iLTDH0gE4rXVZYPd9lHSwS
 srLw==
X-Gm-Message-State: AJIora+/lwLOpqwdgpUBbTgDBdTvmOQjo6uRTs4az9JQcyeeCcDPzkzn
 E5v/YfDknpaUED9wR3eP2M3uZp3dOLnw2A==
X-Google-Smtp-Source: AGRyM1vxQkVzx8cFdMzmm6Cb2abClat15oMvazh99GIVeDrtvV//0ffRB+0Etd/eRY1iBvheT5qq1A==
X-Received: by 2002:a50:e613:0:b0:439:fd34:32db with SMTP id
 y19-20020a50e613000000b00439fd3432dbmr20519078edm.291.1657006333430; 
 Tue, 05 Jul 2022 00:32:13 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 t27-20020a17090616db00b0071cbc7487e1sm15274562ejd.69.2022.07.05.00.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 00:32:12 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 09:32:01 +0200
Message-Id: <20220705073206.1442280-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71V61QhG7F3UM1NvfJIx4CexReh9mQN89EAK+KTwV0c=;
 b=YyZzyMWeSZvdqY4MwZTQFASflVz5ldX23ScIt9j5MZMlEnP2lm+oY/ysGFEcAM9LMW
 s0reEMzGDfiD+jQNWqg4UcyweJ5TEau7p85fIYBplFqiY9MneL+Qru+O32Hk6WIB/Ppt
 JP525kBSI9kDha49M2t05K+0/s8d6/ngBR/q8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YyZzyMWe
Subject: [Buildroot] [PATCH v3 0/5] Configure default wifi through kconfig
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
Cc: br015@umbiko.net, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series was born while adding support for a board and feeling the
necessity to have the networking options available in .config.
I understand that something like that could be done by adding an
overlay, but it requires a lot of boilerplate only to be able to connect
to a wifi network.

Angelo Compagnucci (5):
  system: adding options for configuring wifi
  package/wpa_supplicant: configure wifi on systemv when enabled
  package/wpa_supplicant: configure wifi on systemd when enabled
  package/ifupdown-scripts: add wifi configuration when enabled
  package/initscripts: add service to load kernel modules at boot

 package/ifupdown-scripts/ifupdown-scripts.mk |  2 +
 package/initscripts/init.d/S11modules        | 59 ++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk     | 24 ++++++++
 system/Config.in                             | 16 ++++++
 4 files changed, 101 insertions(+)
 create mode 100644 package/initscripts/init.d/S11modules

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
