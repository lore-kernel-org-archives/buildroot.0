Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A12BFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A59610BF;
	Tue, 28 Apr 2026 19:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-ihlo3CilAu; Tue, 28 Apr 2026 19:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91835610B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777403485;
	bh=3UZ2I37y3a8JAIVtsKmRo/pmBU7mVmNRVbvlIS45b/Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=duqWvV/2OeSgA0Ln+uqqdbnlzJlY5jxoB67w64j5j9jLBKshATVsAsNSqNiH2386j
	 XpSfOn7ApyhTAl/YxJhnRIUKUOGT+jkNylNb4lsYMhdSBdy0bRf47R8C65lVxIYva2
	 LlnkiqooX35rOvpv6/coveW80jD435SnqWZO3OGgSGf5KmAmQgo8F1DkNw4Owz2gek
	 YqZD/8W8C5sRMokyZfB8WAIB16CVN++ObdQooo0bbe3shRN87RZCdHz3GkTAjcfdJU
	 48fCPFlTDRVme9c2in3kAMwf97YhflWCag/MHAOo5N1vVzrZkt/aOjUB7kWzPOBZR9
	 Q6h+pbn9o/wkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91835610B8;
	Tue, 28 Apr 2026 19:11:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECA911B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC9E9610B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RofzgB8s4Z5U for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:11:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F36BB61073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36BB61073
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F36BB61073
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:11:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 35C7313F854;
 Tue, 28 Apr 2026 21:11:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:11:18 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:11:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Fabio Urquiza
 <fabiorush@gmail.com>
In-Reply-To: <20260427062233.471825-1-bernd@kuhls.net>
References: <20260427062233.471825-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ed65083b45bf3588d23c520b68e52c86@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777403482;
 bh=LUaJaKQR0YJtAbpUFvYrPTL2mN/YrViMrRGA4Rv8nBE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dk4plNxhrZxQF10quYYbGq13KgY+L9ErgZR5aEJ75i79hNXR+8EuAIr+vHQ3LIlEO
 RXAO7k1ql4Og6Jh9QXOAucNTnPC4wh9smr23JrRPcsoJBWGtdQxkUJz6S7M8zKZY+4
 zMeZ3rhAxnoW8rbMnjyA/AM12eFPbUBmPvVDi07HIu3qL6g78qU9H7pe1jykKQ33vk
 11xDdLzHP/rgqv6S5SSXNn82D/vcZ/0t2tWTKJiNGVbr6Boi7BJSrmG/DmHh8Pz7RF
 vX1mSLLS9Pdue016zxk9OyFuleeQiYUsNVikBmT41j6HWYy6VniHVSEf2u+xRHAGih
 55pvqoKqaYsgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dk4plNxh
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: bump version to 31.0
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

On 27/04/2026 08:22, Bernd Kuhls wrote:
> https://bitcoincore.org/en/releases/31.0/
> "The minimum supported GCC compiler version has been raised to 12.1"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
