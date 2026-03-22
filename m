Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B35FC72AD
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 14:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CBE541312;
	Sun, 22 Mar 2026 14:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKQx3EN33z8S; Sun, 22 Mar 2026 14:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D5E8412FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774189195;
	bh=pvBskt57ozVTClnwgyLqY3K+bRo8YdpYbWNpg4W5Eq4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJwCzEW0au0/Xt5E6OnDm060YHJHX83Ib0Y359gQLRTAY3R5/3+q1QL0UThblQElc
	 UaLm33xroQVQdh88m/dtKYUsyYBqvTRmbnWgKc/BNGzH7ZJLacrNPhkVkT9Jv27YAQ
	 ZZfsdiVVUZ+C2SImrIzDrYqmfzAUiLjl5SwYJ5iW+XrsHqfsZKfRaOK0iwG2VeuhWe
	 P9NTxdvuzLdsQRJuXuP1zAjmv5DkqAdz1+qhXVDyE+kyQ9kdhOcXMEKwc9uksjYU+n
	 hlZdsYIh9vXR95su0Xzor413qK8SFRh7RodL75XN3eJ4D4heHWxZi/co3/El8PBD3p
	 HRu3x1JMNgRqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D5E8412FE;
	Sun, 22 Mar 2026 14:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 903EF25C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A1C58408B
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAJj6GTQYM-i for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 14:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4601C8408A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4601C8408A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4601C8408A
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:19:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7180F5FFAA;
 Sun, 22 Mar 2026 15:19:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 15:19:48 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 15:19:48 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260322112123.3295134-1-giulio.benetti@benettiengineering.com>
References: <20260322112123.3295134-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <8be41ad5c1cb8c59c8c4ca8a5a0e1959@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774189189;
 bh=PXW7h+at1Na6iH4s9iAaF4gcMAgFezQtu/tWvcBYygY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TxJsXWpeUMe1s0sOapCdpGHpB5Tojs2Yj2/PVijcYMpxApPMcc2aWAYRtPYSmkeMG
 l51q4zGBRP8J+VBqccpUQNF7VjIQyJF5aS7iZAMOvCN0TChpKH7k3K+63dBPYRmdjJ
 kvMJqis1/Zqs3EFOOw8F/8suWFccClXsW22H+B0Ck9tPm3FPrFyCmC5QcF2VySeE4p
 cv4H6Px0txR8NJdpMSzDMqSQGwH+FA9r3lFHfjGR4yq5BEPuZovTrijarJ+i34MfRA
 Y2N3Vbie4vhcN9ZNtC4rrVG4l0/VyCh/S5yeU8gV1sl7GxXQvytPPIUnQqDWjx7T6Q
 EdNTdFvKQOKJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TxJsXWpe
Subject: Re: [Buildroot] [PATCH v2] package/dash: bump to version 0.5.13.2
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

On 22/03/2026 12:21, Giulio Benetti wrote:
> For change log, see:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=b308564a1ff6530f9fd3e7dd7b19aabae32ed375
> 
> Let's also drop useless comment in hash file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
