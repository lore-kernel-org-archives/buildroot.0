Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D87C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB6C64049B;
	Mon, 17 Feb 2025 20:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aog7xl9sdHJ; Mon, 17 Feb 2025 20:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEEF94092E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEEF94092E;
	Mon, 17 Feb 2025 20:12:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8B1472
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC82160E65
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VExYslJ9u-t5 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:12:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B58660858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B58660858
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B58660858
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:12:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E7950B0053D;
 Mon, 17 Feb 2025 21:11:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Feb 2025 21:11:58 +0100
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 21:11:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>
In-Reply-To: <20250217143459.1870672-1-fancp2007@gmail.com>
References: <20250217143459.1870672-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6467c6f132b6149685cad7559192585a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739823121;
 bh=cTZ9tMSZ8sRtuSAsYQZtpPdNk3rgQk15KYMrvaMx60g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xbw44frj12Qj3LbKSa+vjn3cGzqRdeb5RixqnlvP3rekQvFM6wzVEm8XOK8rev406
 85DlhigECYsqvs6OBaRcnbPPkrCaCLVfATLpvAWNDvzbgyJF3UF5iwEdE5a8Yf3Wua
 voFUBmmyabzMCdMmxLo2/rtLd/3d8sgDLyUtr0txf90aW9a22Wald3fIclPHbanMrh
 YWVEAo5iJ3PDOUt4BrSrMjpMOgAAIu7NGKtjY/VfoiMQJRlz/HcMRJQZZrsGna0JVm
 I32GTv8L6KnXwiQn4KKM6aVQ8PgXjYV+gLTQWUnZJxoDzVPV6zcVfZKIVTlrxpQxUl
 hxaG059ZKw+wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xbw44frj
Subject: Re: [Buildroot] [PATCH] configs/cubieboard2: bump Linux to 6.12.14
 and U-Boot to 2025.01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/02/2025 15:34, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
