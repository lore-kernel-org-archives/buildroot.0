Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DE6E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B8560859;
	Sun, 29 Dec 2024 19:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltemjLENxab4; Sun, 29 Dec 2024 19:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB0E60827
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB0E60827;
	Sun, 29 Dec 2024 19:55:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 797AFC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A96E80E44
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7H2hBg4hBEW0 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 19:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6201D80E42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6201D80E42
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6201D80E42
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:55:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A4318780316;
 Sun, 29 Dec 2024 20:55:51 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50514])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Dec 2024 20:55:51 +0100
MIME-Version: 1.0
Date: Sun, 29 Dec 2024 20:55:51 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a5e263137be7f68331820b7f6d23a424@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735502152;
 bh=ldxmulhqYQHrcMfUkRmOIV8WGMDlfWN904vqtySl8Eg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ysw7fU2RrEdmqLx3FQVtWRioYBxM1jtbJwRjcb6TXEz5r3kY8COzB8rmXmDingSJU
 D/pn3F0DPVQNamq6EWFFOxpXXKONeLrPHhL1KA1FHhvDhmIGfLSWzywcXJy1aHMjs4
 bScmpKylDMRHqQTzUsfXa9FfgjoEdBOWziulDTGsysgn8ykongcT7SVs4b5sxF2+0d
 E2T9dmaDC68K/Eu9jtg+1FoPIWJixKq9KEW7/umNFrgp8i2RN210i+2t5YwdgrLzYL
 nSWHEgP6aZvvxXqdNoMyURGxubHSk+G08MQnDU7xlIh2QFFYVG31+5qAtXf+HokwOu
 WdieLdI91xlaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ysw7fU2R
Subject: Re: [Buildroot] [PATCH 00/12] Remove DirectFB
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

Hi Thomas,

On 29/12/2024 15:55, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> This patch series proposes to remove DirectFB entirely.

I applied this series on master, thanks.

> Indeed, directfb.org has been down for many years: we are directly
> using sources.buildroot.net as the source for directfb and
> directfb-examples since 2022. The linux-fusion source code is still
> fetched from directfb.org, and therefore causes autobuilder failures
> [1].
> 
> A new directfb2 project at https://github.com/directfb2/ aims at
> reviving DirectFB, and there has been an attempt in July 2024 [2] to
> package it in Buildroot, but the quality level of the submission was
> not very high, and despite a detailed review, the submitter never came
> back with a v2.
> 
> Therefore, it is time to drop support for DirectFB entirely. In any
> case, if DirectFB 2 is to be added at some point in the future, we
> would have to revisit all users of DirectFB in Buildroot to verify
> that they still work, so having a tree cleaned-up from DirectFB
> support is in fact helping to get DirectFB 2 support added in the
> future.
> 
> Best regards,
> 
> Thomas
> 
> [1] 
> http://autobuild.buildroot.net/results/1b5b87883841b189bd9cd65853ca1e2fcd996365/
> [2] 
> https://lore.kernel.org/buildroot/20240705132544.351613-1-shengwen1997.tw@gmail.com/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
