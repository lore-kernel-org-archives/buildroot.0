Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A9FCA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E8C40743;
	Wed,  7 Oct 2026 08:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pW5jBCgpghh; Wed,  7 Oct 2026 08:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DADA4406D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791360540;
	b=qS5Oujmq7JRPrIbL/UW2sNAjKXkrxo97C2CHj21Yq83LHJBicofRogit8sCvWdT3gKrJ
	 iYfKjhp9ks6WkY8hXJxUnKumpe3qJ5lHtatfE1cz3/+I/8xdsCQ+qpzCjHzhaXUrB9Ber
	 tM18wTOxFVnwrCbzXNFTS47PZ25hyGThfugFte8dOElw/uQ/VDHZwJdqB1m1f4W4h/mlx
	 5honf9xH4WmPsMAqHRDc8m+E9fuxeSZkEUly9vug8vMu0x8pmtTJPRYJzwgq7L/d8brQp
	 xqiojiMSUW/ykbfKcDhSqnecEBXbMGFhXhDatMRvLW0yhWwNj+ZMFMqYTVLucB9ovUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791360540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BYk0llFYgVaxgwaG8qsD1yHsC0yMDSjHUCzuCSUJXBg=;
	b=RE4nyvgqhEenulblDGifTmXCVC/ZyH3gKDbG5McsRBfUW8rxYe18j+r+qt/s5KmydRps
	 9HeTw76A5zOgLE+V1mU+7FWxUyn55d5fJU6YJqB9lVB1YMw1Gpp1dTUpfEUzvckig+8SI
	 +6E9/JsXC896im0KzHmZTLRBuvHB90nH8wo/tGVmEwQwxR9ZVB8nAo0JEscWQn9q1MMYp
	 iZE+XI+JRo2WF1fVqAp/EWLwkSmBgfyaNWCSLshnRoOjafQxNFot8jAONn3gtQGLokYPi
	 Sfj4bRsHP0M/8rB55DWjDY8qh8jImw4fxxxrMGarxZGJ7JkfFbd0VauJVjG44wbZZ8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791360539;
	bh=BYk0llFYgVaxgwaG8qsD1yHsC0yMDSjHUCzuCSUJXBg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OKJRGYYi1b3PopcH22xaZ8IOeA7GjpEQ2If62Obt1IfBwPHnXfvKMsyIWsauWtgIb
	 h2VGnTxcqGhVBCl6v80pNINvpNmKu4K1SklhatsL2BUYW5Zg415TJk7bLPFdI8aZOg
	 WFw9MY+x6a6IUWLAayN+3U5EbXX1JJ/uCZXNytMsHRJ6MuX1RAIJKi1bOJE+K5l56w
	 kqbgFVun+GYeOTRV8T5mEdh4bYiYqvbjwS8Y8WOFpTWHCyUir1IAU+KVxNO2R7nyTU
	 aLvv1QVSC3Ew1bgf2Okj+NHrD0DUqXHABT4kZD/kcumRMM3Op0rcNk/uAh+iVh6+oy
	 9bACHwgtrCNTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DADA4406D1;
	Wed,  7 Oct 2026 08:08:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9273F1D2
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F5B400E5
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exInSrr8aDys for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 08:00:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DC45640070
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791360045;
 b=s67QKQOIvpFAGssl09hhJy10h9+QeDpLPSHLIflT1zohg61sQqFwBlDltuk27IGQfm2R
 EVTeGZu6OEDovrYaGwnLuUnTSijrRP3SEjGY3qOElspAIunxtBM9wZK6p3bkKOnKNpqT+
 473qchKM5N83Ri1KRnsKMPQxcnmPHA6aLd6VmHg6SuzSqgP4REHX0slkJcVuWb8uN3xk/
 mPlBPoX35TQ6TiCN0h9vwYjPvPxsR1QkY6GBwj0QXlvxoCP/9pr7JZWkxxgAKgY4/GjOO
 5a47cG5mYej5DxR3XEn2QtM9MRDUlfV5ii3xaxFblSnuA3M+/AMKutO5pgqKYAs4Bag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791360045;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=g8UGNi+H/grO+mpxkOOZ+/j39BV+7j51ZdmLxKYRAVU=;
 b=rXvoZTa3WpRX6vjvkUB3zj5oq1X8XCSw4/Y5SXnrPWO5WOIAlE3y7k/YGLWRiZ7CbesO
 h3Lq6zpLP4XgyVN9PZyxSIt7q0vbAWWui5eXCFXCCE34H0kyj7Hn5xLfnUpbhwt23G4+L
 RRB9HMbHBgGOcTvI1tpVsjZ9XpZL7U4q/lOLCpVzQxrRkyrKhC/tSioebAxz7VpotemT8
 aH+Tj+aIq4G4DCz0dJzMRrPeTkuvq2aRZsybNDPbf/VV+fUU9MEc2Ps+SaRxv3apBpOlW
 k1kTicR7WT6l3loFC6EB3MuGdd3iHLnAQsgaRnccc8wdlKlicGaGM5CetEaJPtjHYSg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=A69KbBFk; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC45640070
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:00:43 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EBEB84E411AB
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:00:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A287E60761;
 Wed,  7 Oct 2026 08:00:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B6DB41033395B; 
 Wed,  7 Oct 2026 10:00:19 +0200 (CEST)
Date: Wed, 7 Oct 2026 10:00:18 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <asX702U1MaEA4kVo@windsurf>
References: <20261002075640.2350126-2-buildroot@heine.tech>
 <20261002075640.2350126-3-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002075640.2350126-3-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/4] package/sqlitecpp: disable
 stack_protection
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 02, 2026 at 09:56:31AM +0200, Michael Nosthoff via buildroot wrote:
> SQLiteCpp has an internal setting for stack protection which
> defaults to "on".
> Since Buildroot passes this options itself this is not needed.
> 
> Fixes:
> br-test-pkg/bootlin-x86-i686-musl
> https://gitlab.com/heinemml/buildroot/-/jobs/16865965418
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks for the patch. Since this is a fix, we need to know which
commit introduced the issue, so that we can figure out whether it
needs to be backported to our LTS branches or not. Which version bump
of sqlitecpp unconditionally enabled stack protection support causing
this issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
