Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DFCCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3AE581393;
	Sat,  3 Oct 2026 12:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSUkO-EaMj5t; Sat,  3 Oct 2026 12:54:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C0FB781366
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032064;
	b=IiCDmcMoTnTDB1pn0Lc2pWTgAetd1WkgQEI3Saai76oLrY9OQr4Gei9vvAEaybaaJMEd
	 1If2tV5PugDmPgN6MwJ3YIp1TYM73vWRNNw8rf1iC+eamDYOw7fLBmPerENcm1SMYnYUw
	 hSeCcE9vQbNxbeoq8ACPZ6FoevcGbx6zKgeSRxnfAaPr7xMaP0ZVT8fuy20RuTH1opIz5
	 fD3r+Q7qjXJm82UDrsI5EK/n7ON9P0tOwlIMsejSgE/xHrSmOsuHHmvxRG5HxOSvmyvWS
	 3z9DOzfhoP7YzVOsHyXOVOIAoZBu8aIQzzw4Wc1b+9JulhZNjeskRJfErg1+rGZeGPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=grdqsehJMvI0tlC/Qvt9m3ot5hr5eD4nCLUAVJW3618=;
	b=Qv3G6dJWVJMHopXoVpjDjxaQZHcOxd36wNO32p6Z9EJyXoCFnTFijltHYvRItucBKF64
	 WspcAvSS07WWe2KRO7cZ+PYiFdTZzuL3d7kM23e8cMs5ew5VYdcUu4PRIAPqx4t7NRI0o
	 3OStTKJb+VzTGepPpe9+k7kKGl3Uk3AWg5b53UHSyQGDKYgQL8SS7OKz7jpsjWvsAOJ+4
	 uSgKQ39aY4Fhf7AytNUlXAp+sm9x4w0AEbx/N0Gzu2CsyVOUVQ6WwGEkWgqGD6OB+5Zca
	 5W+A2UDF2ELSN+bQEXScem8iZ0XL9yX62qMRddwnEDX7tEJ/5xIiNy0Pp7rN6HU1xtg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032064;
	bh=grdqsehJMvI0tlC/Qvt9m3ot5hr5eD4nCLUAVJW3618=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RdmtdKBJCX/BZpny0mR1UnDrikWkWMGxaDLWlA0qQLn7mEh87SzqHCuluzE22wlDF
	 6sSrT2JeJJPNgfr4cPjrj2Twwm8+vvwaunN0ujWdxX/Lu7VqXz55zMnCNBpHzvcfj+
	 u1RfOuC5aswbGFx6Te2yot4D/J1kafd/Itz1ynvXkEl6uTT9B0GqHxUaFJl+vgYdp8
	 Pm4vSRol5Bj4MMfQ7ftUAlhlXSKpR89sepTWmN0hhplDcmoLAnrxtR0oqiccVQ1Z4j
	 J1Rq6JIV2EHdPkPLhLEQvgbRj7i6pNOdd+dQXF+MPNmxkvjTMqwOhrFEiFA6Lp7+k7
	 xoTrhoHHFdD5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FB781366;
	Sat,  3 Oct 2026 12:54:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 572EC1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D12081366
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 385HqJG-_Kxn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:54:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4DE808133B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032062;
 b=J1kcOnIQocrNICAERwfuGPFsngIawN/LbnRqLHX7xGuN3svJy+G47SLHX1D/FQ3Aunf1
 I8c9fm8+QdVGQzhj3Xda57QUGk83yg4nE1BG89WrWOQmwWRdKIG441pJGehZfp3ss2El9
 jJoBUGV5gc5uB/KNH28M0IChVrPQsdoPCi6b1Il9ZnrpT/8TsWzcc1B5dbKhqiuyzC+sJ
 Bvq67FmeMv/oZbVTgtexGerVS/yIPHa9K+KHw+e1ZA2lBnOzuVcILo+w6Lt4vvMAu8You
 Llxb39HwDIF73nlaQeedjS2KPd1aXSNveKAc+2wgWUMpj+QweEVZxWgjps2ofKU4HkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032062;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=UKvWpmCF+crIgKQRkjQOaDrva2xD1dZdOo/Y5Ky5AT4=;
 b=JOHiWXBG7sL61Y92Pym/XCpXa1PFfYCeHUH3pNDVXH20h9HKs+3+SNltzZNkBZ1jw96w
 9YLbShli/1Enq0WcTAO+VhPrRdSCLbzEqwUHzhZmYTCMaTFEyZCuWbN5p1VlKdBbmqEHX
 vEgAJPPA8JNFvmtYxsWZw/iq8LXthKppcyRvRf+hkWeLYR1X+kkc9DRBl/eoBVo0ypDZA
 JGx01tamFpmUrdd9PeG8nyVFLQWo3TgWOaN6U+rrXjpMKGQCxibWg9B89FWMt0BBN25Xp
 oZY4wZpQyyFLJB+M4ocXdO8uP+1nVL67Eb6LiTz+5CrIAgeVmU+kEHDgpluc0n+EsTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AUxemIIp; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DE808133B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 63A831A10FC;
 Sat,  3 Oct 2026 12:54:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 39193604FF;
 Sat,  3 Oct 2026 12:54:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10DFD10328318; 
 Sat,  3 Oct 2026 14:54:17 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:54:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <asD69TbsOG2sSZqW@windsurf>
References: <20261003084453.545653-31-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-31-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uvloop: bump to version
 0.23.0
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

On Sat, Oct 03, 2026 at 02:44:16AM -0600, James Hilliard wrote:
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
