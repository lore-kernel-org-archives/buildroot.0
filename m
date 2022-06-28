Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD00AC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE1E405B9;
	Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE1E405B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPTDo6IbdZan; Tue, 28 Jun 2022 10:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EDDB40598;
	Tue, 28 Jun 2022 10:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EDDB40598
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87C341BF599
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70E4682B97
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E4682B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbdbVvlmBVG5 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 10:14:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7394882C04
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7394882C04
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 10:14:11 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u15so24696585ejc.10
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 03:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71V61QhG7F3UM1NvfJIx4CexReh9mQN89EAK+KTwV0c=;
 b=XS2k8R8VLrg9BIYJXqYbmAGTAcs5txV6da8uLXXSs80QvXzC9C8Bl1/f6ywXa2U1p3
 cB8lxQ5zTlqpw8ekqFgrIfEtK/NerOkqIfwW8w6VIQxUDR7hSQYIUzMSIVy3SE4VcZD3
 yQAKyS3sYJLGVOhhZu67vg7MOGmllHpcwSwgaB5y44KytDnWx87+IAT3ooBwQfJ+7Hkw
 CC7f9qxKahRUUxjzsE/GCO2lPnnQpSUf1HtWoMsmBgCSwk06bNErgd/4KQo1QQkz1dod
 8tTt6B/3OyV9KkMTV2atvL6VaKge9ogDXVdKP5IQDxApGHIGN8nHvm3Pxf/VMPpRC4xH
 1keg==
X-Gm-Message-State: AJIora9BBSanXW9KW1P1WzdOAVN62Gb4+j02Iw8flV9HybLKPh3t/9Q/
 t/8Lv0wEU/rAEyWAk3LVMGFo2+9ZhSVTvw==
X-Google-Smtp-Source: AGRyM1uulZV5ztYeFggCy/fSQ5Aw6jgHFFgxzYQpcn7YRG7MjT81HvEEy3bbMKHz1oLTazNcgKxH0w==
X-Received: by 2002:a17:906:1998:b0:726:a78c:2a2f with SMTP id
 g24-20020a170906199800b00726a78c2a2fmr8636579ejd.463.1656411249522; 
 Tue, 28 Jun 2022 03:14:09 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm9308401edb.56.2022.06.28.03.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:14:09 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 12:13:47 +0200
Message-Id: <20220628101352.1786434-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71V61QhG7F3UM1NvfJIx4CexReh9mQN89EAK+KTwV0c=;
 b=ZRkMFbRRxUur2zt0QSUMgmXASHnDb+QkBFRcgZQ1wiD4H55v0ZgoCJNHWxlBAr07l6
 s6ft8o1gPWoicz8VBZPkAL4HhiMQT1TAQEZoKnkB5/PMI5+ce+/K8pbB5xercWEBVAyL
 U4a1rEW/Gp0sW3cfx61ERUc9SjXqtHgG35M7Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZRkMFbRR
Subject: [Buildroot] [PATCH v2 0/5] Configure default wifi through kconfig
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
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
