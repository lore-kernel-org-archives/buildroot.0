Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15A8D66B9A
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B3FE60A57;
	Wed, 17 Dec 2025 20:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TBXtlr4FIFb; Wed, 17 Dec 2025 20:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 382C160AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766001852;
	bh=kyjIJQA4uWAgymWUZ5K+rhJP7JdnN9kDrJiQEWJKtLQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lEWyEpu4yew5R9hzIkA/jY5ASrysM1S4gV5CEbfv5vKkrqxiLxDXuJdo23Yi6jGpM
	 3tuW6/mwaKGVnZsmGxkwHWLHxuLM0nwPyWi251rsFSS5HErF6IQaaIBYEUDOwozjK6
	 /uFdtL++J6cV5yNkh5DvBKll/hEicKRW1PYqQTdyflyFiE5zKH+E1D6QS4noljM9pC
	 UrsvIV7wS62hqQOUPTmDv7l88rPdTBXb+pwnLQBGubfcwiiAud3qa+xNWJFczJceJX
	 Sk/u7viE3fYjfQNYAZINDI2qL5JmSFIxp7G7G7IyN/22fZ2tLX/MScJwvf8VMuyeUc
	 erIk1JLluzJmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 382C160AB4;
	Wed, 17 Dec 2025 20:04:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 800AB361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71D884041F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4bBMH_X1qJX for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F02340401
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F02340401
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F02340401
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:04:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E3D0019F5B2;
 Wed, 17 Dec 2025 21:04:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 21:04:03 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 21:04:03 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
References: <20251215225837.1257574-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e3344bb3e6906c838077115c384edfd0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766001847;
 bh=XmzBIp0bgf1qikuz9osZy/+rLsDWuhnDaPo38hTzjQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A2I38lFlE/IGHgCHeeQu1bKptcstAvXc25NpW20mcOYr1DRnCvfgJ4Y1b419Skwas
 ezy7FEpHj3S8EuzW7RTZVWZ+Wn+p4U4XGLrrxhcCB6FabDPXNf9eCWp6DPdr4yUPH9
 w1mzkXPymi7kXw/KGvdf9NwTILIyz3r/2qjsDU2sjhhkOW/5Ia34ka6/q3yowG2iYY
 o6PZjzFwXJOoJqEEDBf8hubCrIyJ16ZrcFOY6LZCyQCy58e4u5Mc4X/noqwJdDoR+Q
 xDwqhirhM098d03nfAl/kp1xLl9+E848fJ09RnbO829ZeCpwElmpmQxB5ejriAg1OJ
 f3L4KyA1txEJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A2I38lFl
Subject: Re: [Buildroot] [PATCH 1/2] package/cage: properly propagate
 wlroots dependencies
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

On 15/12/2025 23:58, Thomas Petazzoni via buildroot wrote:
> Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
> libgbm dependency, but forgot to propagate it to package/cage.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/dc185c3d4886e9cfd9e6f46b50b864e5b2f28605/
> 
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
