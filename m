Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B852D59D99
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A74408B3;
	Mon, 15 Dec 2025 11:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24oz5Kox2onv; Mon, 15 Dec 2025 11:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C6B408C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765798995;
	bh=4bope3RW2HItyW24KQr+pjrUcLoVu+63pLtYDW+J920=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmtELs0WE8df1qFUw6NVDfRSInziEGJqk59yjXkc0bVLPJun43p3yHA9RLaRqbOEm
	 et675UTirORy+SNwL5mN7UWOWK/C6wE/3LZW46NCRzcigiU11ZuO80lPZq3eDFWZER
	 7giGKMIF7lnqu0ldl1Jx3RGO3GJ80QrbUK84Fo0CgZMMFJydMdmaEqJw9g3hiECN1c
	 TNdySKjvWJYqSr5Zt/J+4vXZl0m2++v4K3FzLbQR1LIveVVAPYl47ffMsZQ6+jxGg1
	 bugqaiBBqUPdWHf6p8H2fKuCWTfdbWDl4X8fRwdx4hjW1IoFOrmCgRGDEqt92OtV8A
	 15vLh5OWO98+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C6B408C2;
	Mon, 15 Dec 2025 11:43:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0840B118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE502605E6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umclwAL45xcu for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3A74605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A74605C9
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3A74605C9
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so1456468f8f.0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798992; x=1766403792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxjdneFO7DU87BiBHyTHqdAGg/2VljC94s1wQ4zDcpk=;
 b=SV17KZwAdY5v9mDs5armsz8GOBMd2XJifdhlvpm9/ELuUIEvYl/JRhGjFmQaJuQea1
 oPUcuIRuSU/7Q0u1kpyYx2NXr+bcNcg5fCP9fsY03ikvTsUjJoLzVXkYjJnh85y0D3TA
 VXmLgcpl041BJsuo6BXUDl7UUZIeMEJgRFBNFsdUaSsKuAVpv4075dkRvDKrMbTeHtyg
 yTVx7s4EsfHV604VtpH3l1QBwI1qkQewjxwcAs1KNk8sLm5YLzLn0NysH5oMNwbsPvZG
 pktmap0EPt7Em7M/Xlo88xC7lA+am0ON/dWx/obuH9lX7jzIx1t1/nhn65hlDlTQFS/Z
 48Ug==
X-Gm-Message-State: AOJu0YxedwifTBWjGHUZzT7YieMF0XwKd82ZKNdZdS9Rx/G8Nr8BkRKT
 9Y4005qFkrQftR+SfRFuhyFUxtvnIzkPXq6V+aPKJbhmOllnElAb4l6daKmyTQ==
X-Gm-Gg: AY/fxX7+JZGBWmxyBDNaWODcQAx1RZCMjLBSHJ8BN/Qo5MCcdHLQ5M3ywwOxsQMR3PH
 ZM99ZfClDl/Dl47/LRIVkorX4T+P08MC9XexbejnA1zqu2DbB16E0Bo7BOdutwbzkoLK/NiDCiN
 Fqxy/2nsN9xhrxME36ZZXmx07nNhFOvI9QpZ2S692GIoIN9nxnn84PSo3wnIKMGT0f02DU/Qmi8
 8muxdaETVqkw6FYT7CE/+usjUbfe6QUMCDey+e6gfa+Dae6vjXxCCnzS1PMWgx6hPny0mCyNpGp
 GflOqZOccQynoR9CwhIcMbIDzsL8877zF/AGSU9J1sIFxLkY7UmrjaAtcMGpXZ659NWA2hpG10A
 qFtAjPS2cDyhH1/GSgG2G/OWBvWUKKaR/j5QXiQfobpHg09TNcn8GiHDc/4t47lKHTjU9+9++s3
 a0V0rCxTGHewMDxw==
X-Google-Smtp-Source: AGHT+IHoq6LOE23VPaXgmWkVcJE2mzSbtXfYzblAln5PJyp7Kyf1qc85tn830aVBpGLeienNZoUJ/g==
X-Received: by 2002:a05:6000:22c8:b0:431:16d:63d1 with SMTP id
 ffacd0b85a97d-431016d6854mr1663143f8f.44.1765798991320; 
 Mon, 15 Dec 2025 03:43:11 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:10 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:42:55 +0100
Message-ID: <20251215114302.32596-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798992; x=1766403792; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxjdneFO7DU87BiBHyTHqdAGg/2VljC94s1wQ4zDcpk=;
 b=Rs18VBDYpbs9say+iiXfaaFslWzZEGJF7Ewp4pZrvINLigUZqphoH5aWX/ZgFF0oAf
 Qqp9cFUm5h+X7kEpZd4cQu7hZcfMwIaERpoBSR96Flc25rKuhKbb616wNNKPIeX6dUJW
 neDD9gkgbYS0k14ln76RRPE7Z4wF7vW5G7puYEdrxHnUjd1fNUMBpPA0Hy3zon8pe0LO
 nuoZiMQVtl5SkKTtcQUNJKqbc05LOFSyCWSelzIgj26GdA1D+ReYVyRWZuSZXNhkufbK
 FWCez+qmAUxra70m7yAyE3vjrMzaEOjwVkTlgvx4NqJfYU3GI/1b6wt68VzmA8NFU9LD
 Ceow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Rs18VBDY
Subject: [Buildroot] [PATCH v2 0/7]  Bump DPDK and Grout package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series updates both the DPDK and Grout packages in Buildroot:
 - DPDK is bumped to 25.11, including multiple packaging improvements:
   - Drivers, libraries, and applications can now be selected individually to reduce footprint and build time.
   - Option added to disable target installation (useful when DPDK app is linked in static to DPDK libs).

 - Grout is bumped to 0.14.2 and Grout is now linked against static DPDK libraries.

All changes have been tested in GitLab CI:

 DPDK 25.11 compilation has been tested here:
 - https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2195912020

 DPDK compilation with options has been tested here:
 - with libs: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194482682
 - with apps: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194508748
 - with drivers: https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2194482682

 DPDK functional tests has been tested here:
  - https://gitlab.com/maxime-leroy/buildroot/-/jobs/12292248212

 Grout compilations has been tested here
 - https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2214870377

Changes in v2:
   - package/grout: bump to 0.14.2
   - package/grout: select kernel options for VRF support (NET_L3_MASTER / VRF)

Maxime Leroy (7):
  package/dpdk: bump to 25.11 version
  package/dpdk: make drivers selectable
  package/dpdk: make libraries selectable
  package/dpdk: make apps selectable
  package/grout: bump to 0.14.2 version
  package/grout: link against DPDK static libraries
  package/dpdk: add option to disable target installation

 package/dpdk/Config.in   | 76 ++++++++++++++++++++++++++++++++++++++++
 package/dpdk/dpdk.hash   |  4 +--
 package/dpdk/dpdk.mk     | 35 +++++++++++++++++-
 package/grout/Config.in  |  1 +
 package/grout/grout.hash |  2 +-
 package/grout/grout.mk   |  7 +++-
 6 files changed, 120 insertions(+), 5 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
