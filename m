Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81575CA601F
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 20:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378ED81498;
	Fri,  9 Oct 2026 20:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6SWcLtJghYa; Fri,  9 Oct 2026 20:04:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D1D081499
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791576248;
	b=saNz9X3SogsLb569YdXTJgLmqXbc3gEzHvNRqjze+f4EvERmZNI+QA+GKdr+SZGaSIAX
	 tYQpdPDQVv5mk6sXk/uZDgVR81mIUELxeWz+9d+D2e7RkTcfeX6ajF4H8lLzwAfxOXKKQ
	 IwcU845lDuUIT9Xf8q7Hrfys4ThSIqa3oyj90FvfITRt5FTrUZFTMRxHEfB68QtmPbL6g
	 nNxf62Ic3FIPsZKhm8kCMq/94hIeJLS++Y7Zeqcu2vsWQpXNwc3XkZTvGsVEWFTjX8h/4
	 nJ7kAYofKEYYWSOlWtwAxCbS46FE5y0c5b9rtXAV2FGj29zBxew7kKSFLUPP+cCENzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791576248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kLNxtKhhuA+OB4u5cT7UulhgUiGx1a+LnEyzmzxSREw=;
	b=jHBC2tKRGtGnv47eo8ELW2NCHXvbFAMWVkjZikAG/WkI4Jvl2QJ7ADW4pNLyTE/bVyo8
	 r8Hp8dtWdNgIPwVrP1rjHQ7V/lSlakOXB4jGLSkDJa+58POSNarqHNTy0moS+PXO/QzXT
	 iMWSP2b52t4CrWmcvnvbOd6C8nV5SZCo7tix0WpO5hazu82A5irjICT5xA2AelDdqZLlc
	 SNyWcR0cMx4TFMqcfppRNeGjT9GBRBB3/01qneIuUMT9ehnRJv7YbSkApTuFOjoPPgStP
	 4htiFTVVkutHZoqImWrK6HJoZlZp/GSn1f9Eg9Zhlwyg/YwK7apzLYtH9zShfVFp/iQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791576248;
	bh=kLNxtKhhuA+OB4u5cT7UulhgUiGx1a+LnEyzmzxSREw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mNY0y096uaXWkxd3C6uJDoEVvVMDrMRbFTQMw19wpmrLrhvXtxkH/H8ODhBCQBs0t
	 sG7iDrmhM9PD9lRQKt12gKkoZOTjhy+MonPllRpx58MvR5pAiG2o0Z+ab/81p/3Pau
	 7KNy7CzhCIh2j4luTfzt1HL54L737a/3RikaG+xT1Kr2cYYPpOE2PfoCewI5g4YOl8
	 UAoE9J5WKRbwJkGnNBAowHMGtaheDKYRlFGT30I+RB69lGlglJ+Pm7pzQY5zVsRYia
	 lnC+FIN9n7pLPHxYUtNYTaENx/ewxIspHfqNBmf+RSxOrtaS7xsQ8d6sH/DKoykGvs
	 I02lg4eEXbRkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D1D081499;
	Fri,  9 Oct 2026 20:04:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2061317
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6F08606F8
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ty2hc22b7eWg for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 20:04:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9533E6067C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791576245;
 b=EC2ULLXv6KFoqvoLdotHkHSxJ/PEQ0KXU8evtnZR1vq61g2BYcK3No39ekfvk4OUNj//
 2FXV2uU9MfazrzZdqnMO30D4FY9Znb3EK3TWYbjM50WUrC1HZJ1wj3w0ia2EXGFmL6k6M
 ANMmszM0/Zgm7qIKzBjmtxKwTcliDCEfPXJOdKrMkLi9gsGtSl3eMpZqHswHGH3gKwU/8
 2UWui5NGzkvs7E2F+XUMxyOYjJqSuwjOUMKtak2FoNP14JH39rmrrCrSW7DPU7uGwk5iA
 pdbNi3dUWoi1S7oesmvIjfkaGsrJd/pVo69XP1Ep+FQnZBnEaZ9dslsNJZRUNHxx2Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791576245;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=UqJJqqm2E97AgcIwt4U8wHB0Atli/zt/guwnWPexzms=;
 b=flhv50VSi/xjS8byV5Am0ait7gvY0udnLBMy+DpS3w/nV1h9Ev1v9/9Ke2ViPjIB4cma
 dt1zd9ZCzYJ7O237XxOSsnCtSegWto226o9re47rp8EGiE3nr5Kg3126F8gBcVepXT4ud
 fN6Dhr1Q02qxN6z8H9uELP+iVZx65czVd/HD2W7zO1yMJrulDAVvSdcKXFeEH7W1z2iPC
 z2XYesHxQU3hTlj1AN2wdGfFJ01CxPz1V+s8L4tpSAjtIZTWRzJF/74gzCgKWUlYrsyKK
 gGeaZi9kGUKTg2MMLy0z6lUl+ZLZIu1cE8kxDEyYCKHzGatt+m+7ePRXUxMd79PGsig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ogALFqxd; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9533E6067C
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:04:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4C1A1B0053D;
 Fri,  9 Oct 2026 22:04:00 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:55114])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 22:04:00 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 22:04:00 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261008132337.3883254-2-giulio.benetti@benettiengineering.com>
References: <20261008132337.3883254-1-giulio.benetti@benettiengineering.com>
 <20261008132337.3883254-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <e5284c921bc7eb220f8d31cfe4c8adc0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.6.0
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

On 08/10/2026 15:23, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/14.6.0/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
