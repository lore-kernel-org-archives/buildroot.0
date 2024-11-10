Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88450D12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 18:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E4340219;
	Sun, 10 Nov 2024 18:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dy1YJtnR-VTC; Sun, 10 Nov 2024 18:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21A6140222
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A6140222;
	Sun, 10 Nov 2024 18:26:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B4BDDAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E10C760630
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwDfqPB24RuZ for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 18:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06F526066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06F526066B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06F526066B
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:26:12 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9E1DA5FFBA;
 Sun, 10 Nov 2024 19:26:08 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Sun, 10 Nov 2024 19:24:50 +0100
Message-ID: <20241110182451.49722-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731263169;
 bh=1l5Hl+OMf9QBbEH86LjUEV4FscKfmiPLDYaQfW9T8Gs=;
 h=From:To:Cc:Subject:Date:From;
 b=TW35UjUHLBJGisDrQi0AVpdfrFt0thx1Umv1AtK+h65yVKVqr9YuUb/jSlPYzyvd+
 qcTzfa1T+f/b9YcrA9N6NLiD/x3NaE3irD9y3i1XEHIsAb5zoK6BoK93Nb40vEx6Fr
 aMCIvyAITZrzF8oOpkApN6AYaH+c0p1H5TPseWtq22b3dQV4pY8HDXGCEQYElRxk1s
 b0t3hxvZkANqzc6VAPI68kxdwdi7q77Vqubw4fcfuLVX3g910F/b6gvxJlQ317YMub
 4/e4ibPNH+g54MtJSjsxOGF2CHmw5K04Vag3UhmaroPJNDDHe8wdYpjvzTpS+bYBUr
 2/gQvykuYshXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TW35UjUH
Subject: [Buildroot] [PATCH v1 0/1] Add mlx5ctl package
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

v1:
  - add a tool that can be used to debug the mlx5 (CX5, CX6, CX7) boards
  - it is valid for any mlx5 running on the host CPU or running on a BF3
    ARM board.

Vincent Jardin (1):
  package/mlx5ctl: new package

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/mlx5ctl/Config.in    |  9 +++++++++
 package/mlx5ctl/mlx5ctl.hash |  3 +++
 package/mlx5ctl/mlx5ctl.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/mlx5ctl/Config.in
 create mode 100644 package/mlx5ctl/mlx5ctl.hash
 create mode 100644 package/mlx5ctl/mlx5ctl.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
