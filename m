Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D2CE87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA5380CB1;
	Tue,  3 Feb 2026 14:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYThayYNtWja; Tue,  3 Feb 2026 14:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6335180CDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128392;
	bh=NG2f6pGprXHNzTVGGWbYcQhGfrODUr2ULLwbgueMMwQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RD5P+kp1NmFYCRw1LXFmgyJf21cDq1NwWbvIOivYmsLYbFJOF2QZgmD5FQjpoVTFQ
	 kQvrUnMEPxxu6bodxVfbgSm18L3NCLQMhyo5ob9EMuZrBLEHdmM6ze8IUjKDFbHE2a
	 AtLEtoT7E/JGpfVr44Db+Tk3eUdxOWjinydF9cCieJ4eoZWy7I6b2amHpIBDnkrwCA
	 d7YQEF4A1SnoWEhu+MpXcznfYTh7eGXgGRr/8NpRMSDaovMAga9Clk0CclLnDanmP5
	 YrpCuMzVpIvHN26tsNNDvfU7e3rnu1s0A9y6m328hUpb14h5g+ixt/isqfvhAToXi6
	 cdk2zfB6ZuwHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6335180CDA;
	Tue,  3 Feb 2026 14:19:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D46FAF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5ABF80CDA
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaspOn4bggjh for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:19:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBDAB80CB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDAB80CB1
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBDAB80CB1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:19:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 52E4E1A2BC1;
 Tue,  3 Feb 2026 14:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16CED60728;
 Tue,  3 Feb 2026 14:19:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A9BE119A8888; Tue,  3 Feb 2026 15:19:44 +0100 (CET)
Date: Tue, 3 Feb 2026 15:19:43 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabio Urquiza <fabiorush@gmail.com>, Dick Olsson <hi@senzilla.io>
Message-ID: <aYID76cMX9JBTZfa@windsurf>
References: <20260203130610.1891941-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203130610.1891941-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770128386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Nf4LkJZFjpPTeLJj5cQ4mHuQ0PKg96p2oe4oUxV2CwQ=;
 b=fHAiPUq+UX0HuUklenPzLz4w7f1YxHKQCSOPBTNcuERyKQ10ka2tQnsieZmi7EPPEYD/Ps
 +LyltxjBTumYyryN6FJZXtU/mf1gn8/aAr355oqwbhO/7UimvZ1z4k9ODitf6Qnw7saMgs
 k66nf3qSLIbZJtIpsdJga9iFFVC/y/DOr0KbhilxkJqTpybhkb1VfDemAjG2XxCw2/7FBc
 6hEL6KvlLvENZ1ITY2FI7TCcMRKGWTOVEAzXMU2bP1zkrfQFVBiXqslmzsfHIXje5/mYlK
 JYj5EqNJ/qWAqc4WmmrKd7Hh6NmZ3qe/s1d5XPY4RorqowIKOyjCot5NNekDDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fHAiPUq+
Subject: Re: [Buildroot] [PATCH] package/bitcoin: drop dependencies on Boost
 Libraries
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

On Tue, Feb 03, 2026 at 02:06:08PM +0100, Michael Nosthoff via buildroot wrote:
> The dependencies on Boost.System, Boost.Filesystem were removed in
> v23.0 [0][1] and Boost.Thread in v21.99 [2].
> 
> This was never reflected in the Buildroot package so do it now.
> 
> [0] https://github.com/bitcoin/bitcoin/commit/07269321f38e46e9e02f16d7cd135ea90692638d
> [1] https://github.com/bitcoin/bitcoin/commit/b87f9c5edf3895df9650131fcf8551c3ad1d7301
> [2] https://github.com/bitcoin/bitcoin/commit/06e1d7d81d5a56d136c6fc88f09a2b0654a164f9
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
