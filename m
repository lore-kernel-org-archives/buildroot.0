Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBFBD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA1480F6F;
	Wed,  7 Jan 2026 17:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJ4hgMuU6UCf; Wed,  7 Jan 2026 17:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C32D80D17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808426;
	bh=qCTsjA4Wkitt5K4gKot1SuDP8bk0P9gRxbe4qW6HEGA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Q00Yp0E7yYmcMRa/JBS0ae8D3DSg1/NWYhemiEGUIGWKD1kqcbau+HxCtlwZtns8/
	 CHE+ZJTqtqQDaEVIXMiGW+xY6Abn4rXDki9FGGuypgzTNE0H6U7P/dv7vj0tHp4OJw
	 bDQ9XrR7Vov9p50Fh/zVcJjExGhxcWIDK7z5xa47q4zY4rgtQp9/p6BC8lj2zDWlYF
	 38EihvanwwlFeMEl8bTi4gkMXuv/VTMjpuwRDqI1Spg9Frj5jWKjbkY5uyhwT525Yb
	 X7nddC1F/LDWsEY4/rNJVRPJ3BYoleNNdc3qsMVPYocX8DduNlUisEH8tXJWAbf3MZ
	 SQpW3Gizpr6Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C32D80D17;
	Wed,  7 Jan 2026 17:53:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5F5D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D482460667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbWS8bMdjT3A for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FB5560661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB5560661
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FB5560661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:53:43 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0688013F88D;
 Wed,  7 Jan 2026 18:53:40 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 18:53:38 +0100
Message-ID: <20260107175339.2469977-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808422;
 bh=hvlKUlJaVuOE+7uzoNQRDl2HOnjmLjWuFd90WLgw/UE=;
 h=From:To:Cc:Subject:Date:From;
 b=QZjemhdOE8BXnQjXqhHtdpk+2yBHCOT5yz7PNQ4xMzkdsJ1vavYIYEOwG4szlFqLV
 uNhZIi5c7aHuESC1x53Hivded2OPCY22RWjGp8svbDGIDM6cYILD/xHJqaME5Xc4fw
 RdOrx059zFf2j8MIPPxV+8Xjj6O7/e+AvFL/HT1XyP9nduGq6iEtrviHEESQNgQmND
 XHM/kaxVXrAtel0cL5Od4Q/WReuHlOAdKcjYv2UAlbQAS/8LlZDjNFBT058/de1beU
 FvfbQrq6810cXMCgMy6LPTBuLh+YNBSPdjA9c6Wo9AgvUGUZkci8g2OtRsvu02zQIw
 8BnFO8B9NsE5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QZjemhdO
Subject: [Buildroot] [PATCH v1 0/1] package/dot1ag-utils: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds dot1ag-utils, which provides tools for IEEE 802.1ag
Connectivity Fault Management (CFM) protocol testing and debugging.

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2249786419

Vincent Jardin (1):
  package/dot1ag-utils: new package

 DEVELOPERS                                                  |  1 +
 package/Config.in                                           |  1 +
 package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch | 60 +++++
 package/dot1ag-utils/Config.in                              |  9 +
 package/dot1ag-utils/dot1ag-utils.hash                      |  3 +
 package/dot1ag-utils/dot1ag-utils.mk                        | 19 ++
 6 files changed, 93 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
