Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432ECFF8867
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E9B46076A;
	Mon, 27 Apr 2026 20:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7vGhFqyOrCj; Mon, 27 Apr 2026 20:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 399DA60759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777322390;
	bh=MFQfCCDKF92qqAv2HdrTaRCYc8LdPkFO4QJi/Rl7K4Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sOmhLlhvPUB4cZd27WidpgNT7THbdUTTRvHtMT0+pXE4uzEzhwDC1/r6LBdk6NBCU
	 cD44b/Pg63uu7P2JH8DtYzbMpE+dAPrxBu0kVRFYoWqMKhz83G0vUsJxGCJ1/d4W5H
	 WDH7BOJgKO5ABBVUOCfOjTQU1c4YwnA9rMxiFdoD7nKHXWC+RuHkh0VnlRoVKigr83
	 0/yi6bBKQBv1E4x0b6H2bAv/alH/RBjOVBnv+vJmxMrqkqyns0tShsq99H/FXkClEq
	 7MkOxLBzPcGbbsR2eEL3jXqG/KHGfUcINbCpx7PXEFVBt9wsH5lB74K/uM6biTF6f3
	 nOklxRY3c/+YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 399DA60759;
	Mon, 27 Apr 2026 20:39:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16CDF1B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90AED80316
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lM4ccTRA_K5K for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6BD181302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BD181302
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6BD181302
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:39:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9F22D13F8A9;
 Mon, 27 Apr 2026 22:39:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Apr 2026 22:39:44 +0200
MIME-Version: 1.0
Date: Mon, 27 Apr 2026 22:39:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260427202921.197348-1-bernd@kuhls.net>
References: <20260427202921.197348-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <59113161472febaa29874a757ef2618c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777322385;
 bh=V653XTdn1cb24736gQSSV1oDbBnf424kB86egYB+epM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=btHZ4aar7uB9ZIzVP6AVuvZDVX1jXj7937o4KuZ/HwlklrAVf9d9eOAJJ8ntgBuYp
 wIsjy/B28XQfZnzHeUbcJ4DlZBXWQgfMyz+wq94jhNvcY6KkANvVTL0IHOHxaPpEXZ
 Jwd7029N6tnkOqbFKaVWomshV+TeUUzMmWrKhMuTJCI+wIx1iWTukyUxtM858tjS23
 Ysa/6FH1nPuw2VlPMAV/+hCB/hw1Zx+R4Ch5MI9SvgEnksBaBgd1tFkV4KA963HpSH
 f1N7Fj4tC2Wi4mt82EH3fH7LxB5EAHSJaCFzD2OI5kzGkkwv0OwHN7Phi69Tnw6TEE
 RMHGu/XJgd33w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=btHZ4aar
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 18}.x / 7.0.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 27/04/2026 22:29, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
