Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1307C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3375140B60;
	Tue,  4 Oct 2022 11:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3375140B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUnVTwiRsGSm; Tue,  4 Oct 2022 11:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B1A9400D8;
	Tue,  4 Oct 2022 11:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B1A9400D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 834751BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CC19408A5
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CC19408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shGdKw9emkfK for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:04:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2220408A1
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2220408A1
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:04:31 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id z23so11312588ejw.12
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/rYj5N3ngUWAY8fXIxQ8zyz0rU78A4X4C8zqmLOfe5M=;
 b=Bc26BzlgB/mcZI+wiFUNW0PO1Rs3hZaIRyzzOdbNHoEhoiABtUwF8KIiKo0DEnau0p
 EeMU3fA6Afz3t+AjivkzW090aM/zi2i++D3bgZhVJmw7vNhLNVGH50XrErO3n+e2tEza
 Ok5bCUfHHKAZusPITAlS2tbLcBrCaoNdI0Uh7VHOrCLSAy0+qNf2N+nowk8ZjyVmE/qm
 bQPmWEpOf6bOBs2Kau+5qyUxAOeisd8Uouv7hWzbMdUBfbHzAAKPoxr2sCXE2w66ON9t
 aIaEGLQbcs8Rhw4eBTMv5TYwGRW5UbuSnu7J+imppACm4QyivMkIf+y1fGJP+H67hBxn
 BTCA==
X-Gm-Message-State: ACrzQf31+aFFg2EylluYEyBvLOLCzPWCveI9EAsbrrRHwumMuU1QeSG/
 bR8COy5og09Sib4j1aaH1SN2qjdA9LmYsQ==
X-Google-Smtp-Source: AMsMyM63rFNo0v2k5wtH/xUCobTd6sqwBsC6dviGxvUumrFTcfkdnkHhXIDlUththLTHD/OfC6MG5w==
X-Received: by 2002:a17:906:b08d:b0:782:d526:3e36 with SMTP id
 x13-20020a170906b08d00b00782d5263e36mr18874516ejy.358.1664881469713; 
 Tue, 04 Oct 2022 04:04:29 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 p24-20020aa7cc98000000b00456d2721d93sm1427714edt.64.2022.10.04.04.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:04:28 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 13:04:16 +0200
Message-Id: <20221004110421.137795-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/rYj5N3ngUWAY8fXIxQ8zyz0rU78A4X4C8zqmLOfe5M=;
 b=d9ajLk7UkmcR/Xq82cR//0zed0fafFifYZP4XLv+GWt9FruJTIGAeF4uIg218DPDSH
 csODIdKTkzZ61hC3tspAlnteNgjldTPUNLkV5rrtQSO5VYIY5dwxS4w/nmh6MraL21Tg
 0ThvVNE771RLaS8jJ2sax2Dj8AVSu+cRSJUT8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=d9ajLk7U
Subject: [Buildroot] [PATCH v4 0/5] Configure default wifi through kconfig
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
 system/Config.in                             | 15 +++++
 4 files changed, 100 insertions(+)
 create mode 100644 package/initscripts/init.d/S11modules

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
