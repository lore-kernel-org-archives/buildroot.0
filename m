Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4243CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8460812D2;
	Fri, 16 Oct 2026 06:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2VcMwoZI2fO; Fri, 16 Oct 2026 06:41:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E288A81291
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792132914;
	b=jrlPq9+nR0nU4Ur12PR3uGsdqTWXfVfLxUctpEsWAJ9Q6TW1wP5kMK4XhVe4Vl7kTI1E
	 pS56g6gPYc2dTRNLCGVYrVFDC/hqtpOP6OF073X01nXuzljNrkcQyLabXZUiCEvYSh6gb
	 yyYRdzzPmTw2L1qy53HBdcOBrK4YFuSPSOhttsyhYXSSV0QqSXk0jMmrGJQI/i148It0D
	 ga4EhTm4qaDP7/tLnUSAqc5QeHLjIq8KEDGASsAk15qdoXQJ7vw0doAQZZXg4p1I5NrA6
	 spVxNm9Ditmn9yQGS06Wsg333jfNn/UvZt0iguKQNPbIZD9GWheHFSUFArtWrda5wHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792132914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZksiXnzL6UOwmjn+Sv1I4BVwHhX4xrjR0EGN2SR/gJA=;
	b=X0XHEOiDXF+qM6zDk8M9gd8L0KLA5/I/uIZT6j4pkKdaXuBJdDM6Q15quFsnfZeZKtpp
	 2OGA0dEZEkwfPbw7/gjiVG6LWf1lD8MP4D2nWxvxIhqbflgQmYumOdKpv6jVKQksL5AYP
	 1O9/MEr2IUQRJYI9nTf3cNG7CPt3fjSX22isPFC+Xo3tWMe1zR8kNRu3LS773dt9bYgj/
	 wtxAZq4kdDVfk6unT+CwD2Qy+jQyMBaIMmqgk5jcRFQ/Pp/MAJ2gpKqWZvPjcuLsVuRH4
	 Tkx0TusKNcbBinnyXDw7MxVqo+Bupebja5Aovc0S+/rFaiLg2Gd05Rd258GDidSwLsw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792132914;
	bh=ZksiXnzL6UOwmjn+Sv1I4BVwHhX4xrjR0EGN2SR/gJA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=snUpYIK+qDTiSLeFjsrWoUNZbY5LGA2zwv60Z5y8c6KiJa1SlOzi2w+cwKf3zJhZa
	 XyKx2QZJCUDo4QY142knytluOOji8POTb9wejj19VQseKPV+4MZXgt26n5JXVOsHS2
	 wSYIEozgtVQLHqcgjr8oPjJLA94wF5+iHLzRapWgRLJ4YY1ebDka58Wk/nKfTjoRFC
	 iwcf1dtv99EO12jvoGQTigd9EuRrDT8ZvAifwcJZzVzDqBxEAgZnUVfFi2zYoUbzP1
	 mI24ZqgN4Fmhx/WcqFGVS7EpkumqOlCQ6gQQx8ubj6em/RroWzWsk9g3REZoliMG0R
	 DH9UQW5fdi0Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E288A81291;
	Fri, 16 Oct 2026 06:41:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A94A51AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 06:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F612400DB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 06:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLeDsN9hNZnn for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 06:41:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F0A294009C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792132911;
 b=VGq2AsHSDP1hr7Z7Azt2aLDi6m+vEoDn6RLVseDYs9tZdoz9yPyX2SSN7DUG4Bo9tUVU
 Sy3KpsMXLKHbb/avkKw9T6G5g/t/Ss6njbj/0F/qY7AEGo9xwqDIxz2xrlkiWIb/HgmN7
 hXXdtyN4mn6aqqyppgUzleQMpL0OOya/nXH8R9uvew+xU9OSLslZlxWPwQ3It5/dgIHW4
 kQUf7xI21oIpzAROz6HHyoJcT3EJMnRQG6mCif8I0SC7hfGvUZu4MkMKAg7vgO5PxX47t
 2HK6aLcpH3glP8OwwhwKIYcR5dVFfHqDW/+kKLRuOFsSCn109kooiX/D7Le4YJkTF0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792132911;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1ZioP9ZXV3js0D6bXUFjJBL3vHm2GhQ1xiKa0og1r7s=;
 b=o+eZD4/9LmJDrq9h76rJOh8cKxWO4JVsveCwUDChm6HW1eMdbW1WahxqLsJi+Rdny2an
 4IvVKmPNhRzp/xrrrwXVdWgQl063spRQsBLzCZP4euH2RqrrTZLCVAmR8y+Fo2CSP6c2j
 6N6j6pASUc5ibd1OxvCuJC+DBu2h0RFScUQlySu9yp1RtsO6up5eRhoZzqQ7THx2K8puz
 YSSkIps6MIgdwTb9vXMHbkP8l60VRFKTStxRcdqbdMf/4LbCi0PCCWiNvVvLJ+OKtIAko
 ncid0znIVziI+cvKtSb0nOsumlAMFyCaSUxDAmKvOvwGn7Er+QrThNCVkAy0Wz5GKzA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aJIrU6IL; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0A294009C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 06:41:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 780484E41255;
 Fri, 16 Oct 2026 06:41:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 374EA6075D;
 Fri, 16 Oct 2026 06:41:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B38C10328BE6; 
 Fri, 16 Oct 2026 08:41:44 +0200 (CEST)
Date: Fri, 16 Oct 2026 08:41:43 +0200
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, stefanb@linux.ibm.com, 
 buildroot@buildroot.org
Message-ID: <atHGa6YY6iV9wQPy@windsurf>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
 <as_oRSUUVH8SQG-m@kernel.org>
 <b6a925a4-9eae-4193-b3aa-06f9755aeb89@gmx.de>
 <atBCTG3NFPdhhIDr@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atBCTG3NFPdhhIDr@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
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

Hello Jarkko,

On Thu, Oct 15, 2026 at 06:02:36AM +0300, Jarkko Sakkinen via buildroot wrote:

> It was unnoticeable because you did not write it to the commit message.
> 
> Honestly: I do not care what you think about Buildroot options because
> I do not have an opinion. Please stop framing me. Thank you.

I do understand why you are replying so impolitely to Fiona. She has
submitted some patches fixing issues in the packages you had
contributed. She has politely and calmly responded to your feedback
with relevant and valid answers, in what should be a totally normal
review and discussion process. There is absolutely no reason to reply
back so impolitely, and this is not the sort of interaction we want in
the Buildroot community. I would therefore kindly ask you to use a
different tone in your next interactions on this mailing list.

Thanks a lot for your understanding.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
