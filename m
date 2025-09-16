Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D0DCAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAAD541217;
	Tue, 16 Sep 2025 20:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNm8mpDOuuPa; Tue, 16 Sep 2025 20:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3A9441209
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3A9441209;
	Tue, 16 Sep 2025 20:19:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9362C199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 854FB400F9
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvGMQoduv5lZ for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C053241756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C053241756
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C053241756
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:19:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1591C13F8AE;
 Tue, 16 Sep 2025 22:19:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 22:19:15 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 22:19:15 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915143543.3523471-1-kazemi.ms@gmail.com>
References: <20250915143543.3523471-1-kazemi.ms@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b84d1b96f69e2d9a062bad9083656f11@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758053957;
 bh=4ikHY2boiTCQPVVJrqktGFlIoCHZZD5/gSah+pb7dhg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XG8F8tkzKIeq/gXl/fbrEMWF86/5waRxch6Ws9/qB9kJvsZsy4NZjH/V4bynLNvQV
 JkFHg5r/suyHO/xx+SLuYm29oJQHX8n5O7UJH5vO55Fq99HKQ+Inx8JutTZG+/F8Mp
 3uDTkviFiWXTvYV8HjRn9W1Q42yWByx8z6GT1CyivYwxDQR7FFgxxzljSzewadpCoI
 jIqBse8ZxYlkgjd3ARAHBULLcl9fwE1Jz/giand/YbtIacJ/ExaglrVXjeSHZgCPCB
 3X71gB3YuRRtcnIKgCpTDN/KIyMic5emfUo15MryBYxs9qK+i/0qTyVFwo1nPzctaB
 negAGhfvCDngA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XG8F8tkz
Subject: Re: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.10
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

On 15/09/2025 16:35, Saeed Kazemi wrote:
> Release notes:
> https://github.com/dalance/procs/releases/tag/v0.14.10
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
