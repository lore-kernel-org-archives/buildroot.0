Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C979C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 21:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91EE983DC5;
	Tue, 30 Jan 2024 21:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91EE983DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOfK1zqp0Drb; Tue, 30 Jan 2024 21:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5486D83D7C;
	Tue, 30 Jan 2024 21:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5486D83D7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9F961BF263
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9238141E61
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9238141E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfr9MOqdn7iI for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 21:56:41 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 223E041E0F
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 21:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 223E041E0F
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51124d43943so80299e87.2
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 13:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706651798; x=1707256598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fImXB/WgLKyicsl2mKHHRNzsH1qdmQnnIsTY1NcxTlM=;
 b=ilFxACalfMWFHKlEQTgfCN6BLEhw0O5ucChyxz02FW3HbUCSF6sUz7vlU9cfpW2F6j
 V2dXkHhwXzOzTuqRsbnMyVoyk4XtKFZ4h1jd8JmHp43NuU3QCqIquGVO4A/pNaC6tSZv
 f7ugud6l9oZJpPKLIfbrn96bonnG1/y3RwNQt4MqU11jFzRoiSe2+9ekGkuwhPeI0acA
 F1A4adLn+Di+e5fGJDidZHRIJw21R7S3nkiVYxu6b6IBu4DGsDmb5bn+zxNW37ujescf
 uNbaT1IYsaBVEiiGniE58nEQlUHfdMxe+PMzqaAb74Hxy9gl6wa7qGEvdJSdF1lsiCJ7
 DlMQ==
X-Gm-Message-State: AOJu0YxHHaHWTRgKud7UuSNCts6QPDEcR1tv331sJqULQLukplHjpCTp
 P9/agc3e1+kabAIgt12H6f7V3oDonW+xER0httJDx73TKVWIwpzn0/jR+CPw
X-Google-Smtp-Source: AGHT+IHOJC3OchNMx2TKtpgxyXFkWBKuYNT1qDEPrs+HA45MRqXQ81E4WmeNnu15sa7nGtp8CXNDTQ==
X-Received: by 2002:ac2:4208:0:b0:510:293e:83b with SMTP id
 y8-20020ac24208000000b00510293e083bmr6071483lfh.18.1706651798187; 
 Tue, 30 Jan 2024 13:56:38 -0800 (PST)
Received: from luthien.lan ([2001:9b0:214:3500::c2e])
 by smtp.gmail.com with ESMTPSA id
 w28-20020ac2443c000000b0051121ce0ad8sm105435lfl.32.2024.01.30.13.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 13:56:37 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 22:56:23 +0100
Message-Id: <20240130215628.884512-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZbU68sY6d4uvT-M0@landeda>
References: 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706651798; x=1707256598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fImXB/WgLKyicsl2mKHHRNzsH1qdmQnnIsTY1NcxTlM=;
 b=Nu5wg2svliOwlcr5NbIsAFDddhGbi+VZHHQT+gMH1nMCyuwDCy56avBU9EahM1Emw8
 GoWLLha3R7ftBd4yS2fDP9WsRRTBGGGYQWqMfaYA3IQi24nrrtx2rO8r2dWQMQ1wRHXq
 nPB2S8pLbVPXL+AjsvoEEvOJrCd3RCISChpIYTRh006wP99KH1FNqWXmasV5eL1yl6tR
 MiRzENXb437ujlZSNKw4FjX+Lnah2v9LIIVLgRLfKjNvnDZdYuLb+peu4hZdTOARwhH+
 9L6k+OTiTTl/p4e3hnJBiFMOH4+gHrx0VKQY2L9Byk98IEMhaBeURM1EZQGx38PL6Wal
 PURg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nu5wg2sv
Subject: [Buildroot] [PATCH v2 0/2] package/watchdogd: slightly messy bump
 to v4.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Second take,

this patch set upgrades watchdogd to the latest version, a major upgrade
with lots of fixes and new features:

  https://github.com/troglobit/watchdogd/releases/tag/4.0

One messy change is the configure script change from --with-plugin=SEC
to just --with-plugin.  I almost got it right in v1 of this series and
with the help from Yann's review, this migration is now handled in the
same patch as the version bump, to gracefully migrate legacy options.

A couple of new optional system monitor plugins were introduce in the
new release, Config.in support for these are in a separate patch.

Best regards
 /Joachim

 Config.in.legacy                 | 58 ++++++++++++++++++++++++++++++++
 package/watchdogd/Config.in      | 46 ++++++++++++++-----------
 package/watchdogd/watchdogd.hash |  4 +--
 package/watchdogd/watchdogd.mk   | 30 ++++++++++++-----
 4 files changed, 107 insertions(+), 31 deletions(-)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
