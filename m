Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4204C79F89
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 06:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DB426066B;
	Mon,  7 Sep 2026 06:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KAWI0j2RiZn; Mon,  7 Sep 2026 06:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 72FD86061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788762205;
	b=A/UIhmnv4XgG5qVR2k/3HNnmxP6QOjTvDYhZjFyaqDslnlYREVpN3oEj7q+vJuLwsICl
	 MPqZCnLun6v4YzAxCInKo+TEPFaYi99K3CxherVPJ+Ew3vMQwrbYnrKcVXiFWZv8arpsd
	 onYnh2t79Zj/UUUE5ZexCtItCytHNksIXg3jrVe/6ChQByJQED/epXuXmNvC3Xqd/WzsU
	 o9QIB6VYAV5N7k7RKFdgqAimTriLDErl/IlVxxjS7fvhYqR3Jc4YB2GCDQTrNy1ikTMLX
	 iMgMAeqNFq6Kfs4ZfXwSWiKNZiMhFtAQqbT9Vhsv0sVr310lVsfuEr7f3UuejBh+0yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788762205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c7aDDdIv/CYloJoBOa/vXPKmNmhYZ/cj/QNqiVJSTZY=;
	b=tBP/KGEmH4RfSW9XQPX2LwfgHsPfH/NlAZB6Z3NI4A4bGTNWFEHvEYPBHhDNeVnSu72y
	 3CxDY6xej+bq5MVlQqahAb5t4qzcH4w+DVjE+UHiCIpTrU65Xv0yVUKDi6uvLT9ENKLeO
	 hGzcqjJeakmyXQkUxkYHrAgUx7uSKe2buWtrrskNlinCVnc8vieG4AYX0UrWIqwU6+VxT
	 47Rj55TniraZAX46DJPVJ8cj/jTXCQYiJlTGFJZjQGLDjjXhXY78kfVtCnlWqOjAnXExx
	 xBq82KtgMtnHmisks9ktK5L2JUor2BqE7M5QJDWQgBWbTHlPumox9JmZft10p4eFC/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788762205;
	bh=c7aDDdIv/CYloJoBOa/vXPKmNmhYZ/cj/QNqiVJSTZY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KKg7V+YM5SOiJl9WfME9lvsF1Y+S0jpZFqjQfCFrI7uulXKvs8rQijjzvM6S/MjiX
	 7HACpytQCfTGjXJhaqSqknLsjr4Dzq5F3RcSlaiJfkj2X9sK0NwRsWitZq3k8XmaFw
	 c2zXWCYotQ7gmNjgX4eaNt9EFVsFjnAZYtgWKpiez9+bzXRkw0NYvhXHKY+nTFmb6A
	 fRhSqgSuy2gXu0y+rAib020qNxLDEmfCFY2ScfMDOUPHuOp8Xf57CqFiXGcO4gACW1
	 mzBZFjsfTnTjCpil0QcMM3aA/P1WqsDtGMY7IkdVe9cUEbSvkJbts7caHsFtVPk7ve
	 0cLsBjQEpKyUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72FD86061C;
	Mon,  7 Sep 2026 06:23:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DA4229B
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AFC980ACC
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XP7I2zTWhnKd for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 06:23:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 77ABF80A9B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788762202;
 b=E2+Z3F8swxC1IxKy3nl5bMPQWRI22XKSiThgKzdi3FqwKIR4Ncr3gnvBCBau6h5ZfjUu
 23Ah3bnE+fD22iI6p1y0bybpj9cFP6g2ekpi/Zo9fnpvgjVTLgLjwrBqEjHlaX7iumGXY
 ZmZyyIlcaDtii4GnX1Oe4F2ueJq+2yeaLiaTZp0o39NbIhyYhlnCjHKh30t+BItPrCfIH
 ZIh0oqtZYMYf47mmfFJPDlwjst5++fAXlUiQgEDa/hrhS8UP0oJjFMCE/huMDzEDZyxta
 k1jGSMVgDeY6E3MbVacLKdZOf7Pq1TrxFrrAE5SYNI4ipDCFTkwPpFq3h8Kvb7RGIpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788762202;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=X+psxNRkwr4k+o/zKt3FaCBqDvoEiBJE3xEYwAEv8R0=;
 b=bAZiE+vsHj6tdEVY8nPQaDuiqwPqTftZHuPfLO+XirzTyUpVgFmFhfRZ7XxQqx4XEfvY
 TaXLLj0/TTCcI5K4TMikPBpohRrtivHl0sZrxxIdzN5Mx14JWWUFdnkzIWKqTH5T2oh9x
 B+5ME563SZkHUdz/cKo6aoPSBl+aMiHkJygJW8BoLDFHU1DVX92d4BLWy2oT6x5m0QKsV
 C7zVJ9Ka5xYl4JcgQnJU3mJt0XEPzBKlsGCh2ffQ5fTmSDSq9pDoHDjmUDCh/DfSzVyYQ
 /pmJxX1Y7Uf7j3v6kNz1uM1fgXH9+Yi4VJsE3UeAuvrzQmReILircy/QjE4OCaivrtQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ErSyWY+U; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77ABF80A9B
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:23:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 164EC4E41559
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:23:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DED0060383
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:23:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C82511C79FF0; 
 Mon,  7 Sep 2026 08:23:18 +0200 (CEST)
Date: Mon, 7 Sep 2026 08:23:17 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <ap5WKkAd5WBJhAsj@windsurf>
References: <20260905093953.62996-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905093953.62996-1-maxime.chevallier@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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

Hello Maxime,

On Sat, Sep 05, 2026 at 11:39:51AM +0200, Maxime Chevallier via buildroot wrote:
> Since v6.7 [1], the KHDR_DIR variable isn't used anymore  by the kernel
> selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
> is used to specify their location.

But then doesn't that mean that the build would be broken for people
who build Linux < 6.7 ? Keep in mind that the Linux kernel version in
Buildroot is configurable, so not everyone is building the latest and
greatest.

If that's the case, then maybe we need to keep both?

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
