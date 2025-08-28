Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFACFCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A918350A;
	Thu, 28 Aug 2025 13:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8TaOtujdIUT; Thu, 28 Aug 2025 13:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC808835C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC808835C6;
	Thu, 28 Aug 2025 13:17:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE2E0B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A060840DA5
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QneGprK_fT3k for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD77F40D89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD77F40D89
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD77F40D89
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:17:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09C34B9783E0; Thu, 28 Aug 2025 15:17:36 +0200 (CEST)
Message-ID: <9b2eb91d-2c10-4a75-bf42-b0756d9b45b9@rnout.be>
Date: Thu, 28 Aug 2025 15:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Nicholas Sielicki <sielicki@yandex.com>
References: <20250819075213.3286769-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819075213.3286769-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=UesLgzse+qSJ0TLTrGoxquGgPNIlGgmkbkH78haTPHk=;
 b=dD++BDNJOFV7qs4rY3kNA0lVvsKqpsSDB2M3/yD1f3H3asZ+FjfVpnZLsSxQhWL9bx2NsR
 kxleT9eC1T2Z2PQ6r57ObFpjmo5xLAnhLEwm/4rm0eVL/NZDsnK3uGGhgGJeWM2d8dfJlX
 xYuX7ygg+IHcovnovIhHaD0uJitaR5CxLph6HdmxfNklqXYdyE586zyX2vyG7sVLNqv+qv
 C2ubk48YVgcKtpJpVXQiN+gwn1OpWDi7D4Qa4xygU6qvQ6F7O6gzzw7A9tOoehZduRP6Cp
 mDlgzr3l5ME7t/sMAh7tE0cAgOUAQ2G4pFv/OvQzJS+jpCAqWRoGTbeRVeInmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dD++BDNJ
Subject: Re: [Buildroot] [PATCH] configs/galileo: remove defconfig, broken
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/08/2025 09:52, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273310
> 
> It started to break not long ago, about 1 month ago, most likely due a
> toolchain update:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dgalileo&kind=BUILD
> 
> However, it is build a very old 3.14, which is anyway unmaintained,
> and issues with newer toolchains are going to get worse and worse.
> 
> Unless a fix is provided, this defconfig is going to be removed.
> 
> Cc: Nicholas Sielicki <sielicki@yandex.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
