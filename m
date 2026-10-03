Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384F6CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C2381311;
	Sat,  3 Oct 2026 12:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtyukAVh1Zco; Sat,  3 Oct 2026 12:37:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 252168124F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031029;
	b=NS83o5PI0dysg3CTT5yu13bYGnPVjzSjzhmJnyrppDBSPV79xCV1aJ8Pi1Tp3OnFKmP9
	 Rn0Umlx4+wkuelpC8LLDZqDcZB0/GDlE+XV/1M4Corjrv6WknvxH1KKL8B+x4CV9/m+3U
	 D5Ifju0+afbMdF8BT9y4ypYiVDbSVPA1wwOrkh4D4rc6W6DpC9BAzgtAY7fWLqSuwsbWT
	 2N/B9lv6KtyF6yoqVUlbwD/VNEvmA40DXOgEgZCuPS5x5UHKHh4D/YRAN0sirjm+V10CH
	 rR47PA1VNJTa/UtR2FlfUGmegXPHSlj+PYTjw7wgeIsrBSprGtzpffdEGpmS4txXIMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031029;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WyKJoGmlbtM+Bu6AzG/zGtZ/xzWos+fV6ZKBDwehsT8=;
	b=ZkNe7ciNEbciVbKmjI2JgTlsV3/S4OtjXk8e3GoJKwdBxRWpAn+8xm1KBg0t2LzTNP4f
	 NQUsg9EHQ+Y7jCqfu8EZx5Uqp7baYpaIVfYHyHPkpV49r02bY7qrlz6tjBf6REdZXiKm0
	 1bFmM/0MQBRJfSYQ14SHJMJ1Pc/zC7sYbtCrxuAMQyElZiief5/JrIhohCg7XxzBJ3ZvA
	 anSrSSGb+Fnk3Sj7dljUY/9b2Bl3JrUmVZB/QaksGAhzksYTlmrGrRMWUfk1xpW8C8DP2
	 e7ZckOQsbzacO4C82Eg3ko7fANUKSpqOfw2AvGw1cXU4DVoWg0nAf/auLXPVL1u/j+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031029;
	bh=WyKJoGmlbtM+Bu6AzG/zGtZ/xzWos+fV6ZKBDwehsT8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WINEJcH338tutzZYZsnrzaSYkZM3eIr9hTuVKtg12TQ933E6/CObaKSz+zszVQYWe
	 PddDXw7kMumuDcxzeyulIjLHOyGbXhrvdA1+jBIqCDoR52LyI1ZqiFmw99qKCA7CTJ
	 AAfdLiZROj3Vtboen9Kwdd3ij7qH5iUnYJw09yR++Dxdp2nBy/QRpkVHOo4TVkzNhY
	 H10neMnyqTGAqN/LeAr/qi4SIbQ5O0fjSmwIYJFjOJYNonvLzK+uKejyO1/YNRT3X4
	 +9528YtLHVnJIvd5FaQ/qg4/gCYp6XChSMzHgpZWUKvpNUw0SU251KPskHr6DpMmrB
	 98PGlKXwI4qNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 252168124F;
	Sat,  3 Oct 2026 12:37:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F34032E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E56DE8124F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzs_fcVvag_L for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:37:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 24DEE80F7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791031024;
 b=k9YgovaCnjOYJT+VUYTD4QEabjiEqY7S77kXM/a7IJI0BpIL25n0+3x4qXgHPM/cVdD5
 rmA8+JTBaAHZ4Vsb5J+uaJnXjq9f9KmxIU1kCsQwX7gInUjKR9MOSL/FEfHXgq9dJ320f
 WdcpKoQeEHQz9dQHkGClfTZ3Um8CGmClEd6xcek82qAUTv527+cM/RWxCVRdrxZgj2lmX
 csas+CdV1gHrf2rj3r1cYuo/VNpmTuVyt7lXQJY3mM0vpQ5xz/TG1e4Qj2XpMP4+WnCGz
 L40dWV63O+uksYY+/l4P9vm601Icw9fmBSgej2eprlsUZ4F0cShAZrZe7aMp3i+VAVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791031024;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=waaeV57zqGFZMV3K0OQWgKHSMXUuoLlxnla/OHHb9wA=;
 b=RgGjtZkmb07l0g4/kP+XkqM+c1Ph+JKUJBjhA4rlH3tN/SpJIOFeyShZNU4rp1xbFL+h
 yXD0CsSW3U95xDj5xor3beG+vPcBwW6xjZQtILfUCjeAC16f9DJxKLc7k5w17lKKv5g9l
 NruG2eyiLOMvWSBh34s75y3slsGCdq/8IdJ7cEk3kSk5mklKsIcSQIooEaNr/GnKEExOw
 G+vvbnbaVHEGZXuo6dVJs3U8tmDov79r3VIKC/V8JkXCBQPGRjwypL9tJqwShqi6614qJ
 LnLY81kloblp7MojduI0aNukgAIJAqP4yEiCJmJ0NVU2AP+7oNOekc3ILBPcD5mxznw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0SqFqf9b; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24DEE80F7A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8DFA81A10FC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 63F10604FF;
 Sat,  3 Oct 2026 12:37:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 90FFA10328318; 
 Sat,  3 Oct 2026 14:36:59 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:36:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD259clfrRJ52Kh@windsurf>
References: <20261003084453.545653-19-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-19-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-mpmath: bump to version
 1.4.1
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

On Sat, Oct 03, 2026 at 02:44:04AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/mpmath/mpmath/commit/ffda440b4d90bfb6c0b78db9f9e4a0171b2e77bb
> 
> Add the host-python-setuptools-scm build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
