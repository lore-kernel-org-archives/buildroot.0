Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C67C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F505605A6;
	Mon,  3 Feb 2025 18:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wBr8UOLT_I5; Mon,  3 Feb 2025 18:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F561605B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F561605B3;
	Mon,  3 Feb 2025 18:00:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3450185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0B19605D2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1585izUrxPG for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42C68605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C68605A6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42C68605A6
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:00:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [212.166.21.66])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D35F42003F7;
 Mon,  3 Feb 2025 19:00:26 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Vincent Jardin <vjardin@free.fr>
Date: Mon,  3 Feb 2025 19:00:23 +0100
Message-ID: <20250203180024.56197-1-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <19e3c144a337497a75f5b1a552c386c5@free.fr>
References: <19e3c144a337497a75f5b1a552c386c5@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738605629;
 bh=fCf/+K8Qtuxt7aC75Ke/NoMhiuPp/EBFmJE1QIWJlCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q6Cw9507rcaXXTe+pKvkjOT8n4p9Q8kcbU3miK8PoOpcM9jVOCTqLgxaPhfEWM12p
 1lDdsMreogG/+ynLg44ULMI6hlOckk2+wqtzpOpSqGVcyaR33uPFCDEM6BTN4/Sn6n
 yBsUndPBu6MSvDNcozena/yK4jGIi+LPxLtTXqjGny1gNcS4CINfpVnsNpJdhwQwPy
 H8mhUk5GDSj7MRrpuFKg1+iS1SFgjvP62tjaLRsniBAAFHFnBNmCJcbq/9AMbRwnx8
 MZifREBxYTmL2R+sjGx51rRkErR++cF26syf5fl/x7g71SVScQoJq1XzqbU58/4YFT
 VbqdgbfKv02rA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q6Cw9507
Subject: [Buildroot] [PATCH v3 0/1] nvidia/bf3 - fix eth names
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

v3:
  - fix shellcheck, make check-package
  - align defconfig using:
     make nvidia_bf3_defconfig
     make savedefconfig

v2:
  - explain the root of the default names from the docs
    and the running Ubuntu environment on this board.

v1:
  - set the eth names
  - include iproute2 needed to support property settings

Vincent Jardin (1):
  board/nvidia/bf3: set eth names according to doc

 .../bf3/rootfs_overlay/etc/init.d/S04ifnames  | 66 +++++++++++++++++++
 configs/nvidia_bf3_defconfig                  |  3 +
 2 files changed, 69 insertions(+)
 create mode 100755 board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
